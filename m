Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2D28560AE2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Feb 2020 14:02:00 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id a6so4860260wme.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Feb 2020 06:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=xSgLGRbmMEBk77RXgHJBHOu4yWa6CWF66/aC/sRYuy0=;
	b=FFL1EW2r43CjMN5FP9CLPACxYeWETbG87ejKO0MTnbKJ2L1Qnpyfx4G96cZgA6RCaG
	IT3O7nLYoZcEVDTnB+d9rcTsMx5nkz5srK4rTmZnU9dfeLiaSfD2Vb3Yq0L8NmYTtSyo
	5ltKzyUfXHVlk8oZuX+iMdkhdY4W5QQGk4Okw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=xSgLGRbmMEBk77RXgHJBHOu4yWa6CWF66/aC/sRYuy0=;
	b=pcEOiGhR6Ze4ZOlmvgwy0P0z5bLOIU/RSILLzh3ksXS72x6vl9sKBb6QbSlXOsfevb
	rmGXzGF0Idh7pGMZbJkNuo6kZdX/Q4qWqEf6wCdSLmPDh7QUDg0HOsmQ1rSOvhgbcsx5
	ca58XpPF4QUFJ9pDATMrzFQriNovuYUeGwUATymT7n8GWdkOQb+Y7yvPim0NZg7/O6K3
	vQfBlcBDKgu4Ttf+ACdv4Mt1WeIKU2a9Pe6jUi8getkmf9L9tTkQvsG/hgSErl8U2Ude
	fUp5yp0HSOzZZlYfAWy1mbHomWv0hZ7K78Pca7rXYZKGBxFpm/d+X2mqzUu1KjFBVPyD
	bscA==
X-Gm-Message-State: APjAAAVfhFWoQQ458OV8Wbex+faIWsbh3DT0gfmg8ofWnfu9NoExVuRE
	9jSkmysfh7HoSWTwVPt7cmR6W4DUAfQ=
X-Google-Smtp-Source: APXvYqzgFFEeWF7DYf3dsuzoqCYpP6uO7ru6Q0dN2FpqIwWAXXzEuNtEeaXh4VayeQIcfXETyICh6Q==
X-Received: by 2002:a1c:8095:: with SMTP id b143mr10277100wmd.7.1582380120616; 
	Sat, 22 Feb 2020 06:02:00 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	m68sm8554036wme.48.2020.02.22.06.01.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 22 Feb 2020 06:02:00 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sat, 22 Feb 2020 14:01:57 +0000
Message-Id: <20200222140157.253097-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200222140157.253097-1-richard.purdie@linuxfoundation.org>
References: <20200222140157.253097-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 2/2] psplash: Add missing dependency to systemd service
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
X-List-Received-Date: Sat, 22 Feb 2020 14:02:00 -0000
Content-Transfer-Encoding: 8bit

Avoid:
qemux86-64 psplash-systemd[135]: Error unable to open fifo

by adding the missing dependency on /run/ where the fifo resides.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/psplash/files/psplash-systemd.service | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/psplash/files/psplash-systemd.service b/meta/recipes-core/psplash/files/psplash-systemd.service
index e14f42032d8..e6de450882f 100644
--- a/meta/recipes-core/psplash/files/psplash-systemd.service
+++ b/meta/recipes-core/psplash/files/psplash-systemd.service
@@ -2,6 +2,7 @@
 Description=Start psplash-systemd progress communication helper
 DefaultDependencies=no
 After=systemd-start.service
+RequiresMountsFor=/run
 
 [Service]
 ExecStart=/usr/bin/psplash-systemd
-- 
2.25.0


