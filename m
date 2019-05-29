Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8675B7E313
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 11:51:52 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id x4so1554503wrt.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 04:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=kvZruZBGtydvyhpa2UBxpuCBaii45atKm3Uw3RUGuNs=;
	b=ZwoIcEXyRv6+Wtci4+J5xkWNgWcZXKHBVguQr6k7xcYYzQzBCKOFYtz8971IuuKPHY
	/kC4LRBplghmFjRRosy6/40KXNktz1uJSGcK2X+Q8zPQa4ECq54+8qHsMLasXiM8+ewQ
	7yPbjOcdzFLwf9dyJlyLe/HzmMSJXdZ2DTp2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=kvZruZBGtydvyhpa2UBxpuCBaii45atKm3Uw3RUGuNs=;
	b=aesWXA1MxCk+9p1lN1TxfdSfBkE1dTCUqtPf2fCmRgz78rVnSFjuJcvyp1h2jiuyl/
	mvqi/7E7UeOl3JIqhF/G7AXxqVzBhrzCEiddffdoIR6cjkD6MHU4TeVzSBqkxnaOMDR8
	byDZGUZtkMv4Zr9jNvUosjahkd0jTl24CuW8px3AeKZ3lej6fA0iAq1wTLEE5gn00O5j
	pjnwHRarEhzeHr52WNy3RMQCtOJBNIEfx82iO51w9qREe8aaj743R2b9EvyevvWkOTfr
	VUnfmu+zw6Dqh5Qvx9QVCwHh8l9mXI1r/JiP8u8Y9yhiOpYIBK7BKHZvzjn/iGWa4VGk
	/RrQ==
X-Gm-Message-State: APjAAAXmyk3PcunC7DpXXaoq/Psp4UeUO9hmDQncxJr9RJX6LhczjZIa
	TOPJ48pATJGlVzQXKI+/SFHVr5RqMxA=
X-Google-Smtp-Source: APXvYqz97L/nYTdn2Y+xK9/x3OOBt77ti1U/B9kXjcD3DiQ6BULtakpGSUZ74IY1KnsfLSQe+Fns6w==
X-Received: by 2002:adf:fe90:: with SMTP id l16mr1592399wrr.221.1559130713015; 
	Wed, 29 May 2019 04:51:53 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	l18sm17924492wrv.38.2019.05.29.04.51.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 May 2019 04:51:52 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 May 2019 12:51:48 +0100
Message-Id: <20190529115148.28833-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190529115148.28833-1-richard.purdie@linuxfoundation.org>
References: <20190529115148.28833-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 3/3] uninative-tarball: Use xz compression and SDK_ARCHIVE_CMD
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
X-List-Received-Date: Wed, 29 May 2019 11:51:52 -0000
Content-Transfer-Encoding: 8bit

Switch uninative to use xz compression instead of bzip2. We can then directly
use the SDK_ARCHIVE_CMD.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/meta/uninative-tarball.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/uninative-tarball.bb b/meta/recipes-core/meta/uninative-tarball.bb
index 34d53f9ec87..25635fc2f50 100644
--- a/meta/recipes-core/meta/uninative-tarball.bb
+++ b/meta/recipes-core/meta/uninative-tarball.bb
@@ -65,5 +65,5 @@ fakeroot archive_sdk() {
 	rm sysroots -rf
 	patchelf --set-interpreter ${@''.join('a' for n in range(1024))} $DEST/usr/bin/patchelf
 	mv $DEST/usr/bin/patchelf $DEST/usr/bin/patchelf-uninative
-	tar ${SDKTAROPTS} -c -j --file=${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.tar.bz2 .
+	${SDK_ARCHIVE_CMD}
 }
-- 
2.20.1


