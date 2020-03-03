Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 18B2560F93
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Mar 2020 13:05:05 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id a132so3096279wme.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Mar 2020 05:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=MXIvfTCJ41Mqkfiy6VHhZM/2H6af4eXOJwUrs2LBB7Y=;
	b=atHt7PAQ90eQiRg2qZzUccPDorGlMAqh3mp5ZWBfG9jDaHOFH7ARskPypNUE99BT6e
	EfUr8LzDf133TjnkGPdd+wwfougC4WKf6LrLi7xgM9yxlgpY+uyLP5G1yFZbv6ipa0/j
	vntlR2aDdWk2AdhxQjI01iXLL1TgydU/xbN/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=MXIvfTCJ41Mqkfiy6VHhZM/2H6af4eXOJwUrs2LBB7Y=;
	b=G6rofcHKnnGzjj3+kuLOd78UHf/cCyeHl/IqSjxcS+KVD1kbWk4XSx218x4sl7OGi4
	tL2eT7u78VRciyHYFlF1zXpYXLiApdq48LlsQgNCstistrL/BNH7w0IYpKxYE080GWUl
	eoMBCLCq6taeY4IC38xORB/YajfCooAR98MW+nVvnYRXy7H/oNN7EmbMLqFlsg8UuAyX
	D4CblDxQ2QKUgyL5PAoTNFEJjoARED7/BBWgWUaAdnNKvFd6fAQs8EopC0zRMsYwNgnm
	XNXVtZNPjKe6V4JJtMRYcLZB5z6YtH3fbUSaPB1tJxAT0U5+/3XhCW37cK09Pt6863WN
	2ywg==
X-Gm-Message-State: ANhLgQ1JVeMLvbNa+sVaI8RaQdLf/zGfUQ1ib1o+/2f6cnVc97rv5mv0
	oDglLmbbx4xeRrb5GT5cec4cusOPfgA=
X-Google-Smtp-Source: ADFU+vvvzbtYD1dtedcqsC9yy2nug3soBXrlS/7XbppA3XCVk4NXXik9bJD/i/abhiy3JytAR4VgQw==
X-Received: by 2002:a7b:ce16:: with SMTP id m22mr4236536wmc.139.1583240706376; 
	Tue, 03 Mar 2020 05:05:06 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	f127sm3825800wma.4.2020.03.03.05.05.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 03 Mar 2020 05:05:05 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Mar 2020 13:05:04 +0000
Message-Id: <20200303130504.714554-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH] systemd: Fix service file for race issues
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Mar 2020 13:05:06 -0000
Content-Transfer-Encoding: 8bit

It seems this service needs both Requires: and After: according to the definitions
in the systemd docs, else we see boot race failures.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/psplash/files/psplash-systemd.service | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/psplash/files/psplash-systemd.service b/meta/recipes-core/psplash/files/psplash-systemd.service
index 249aa540394..4e18980bb27 100644
--- a/meta/recipes-core/psplash/files/psplash-systemd.service
+++ b/meta/recipes-core/psplash/files/psplash-systemd.service
@@ -2,6 +2,7 @@
 Description=Start psplash-systemd progress communication helper
 DefaultDependencies=no
 After=systemd-start.service
+After=psplash-start.service
 Requires=psplash-start.service
 RequiresMountsFor=/run
 
-- 
2.25.0


