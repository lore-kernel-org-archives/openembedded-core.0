Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by mail.openembedded.org (Postfix) with ESMTP id 405AA7ED59
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2019 22:30:37 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id 207so352973wma.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Jul 2019 15:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=abOQ17XM75rkJku4hFgysa25GzfIBMouzuFMBZzD4kU=;
	b=LoD+5av389xgYxzuHPNWmBtJrPIBdgSL7Rj7uzqMOdIRjlSWdrrCi4US72zwp5dmOG
	frqwHmXPLZXY2LF9r2Z73Js7SixRZlGOUMqEj7gf2gt5quLN+fTnDc58G9n/qtPw5qXQ
	XBZBmc9igtgoqrIxM9QxRyfFSyTDkpy+jtPq0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=abOQ17XM75rkJku4hFgysa25GzfIBMouzuFMBZzD4kU=;
	b=PMidIx8dhHObXYHSRSjDZ6CAuH1TtyX1D8NYA0PY86IB8iE/fymv5M7pHW4gNHI9vj
	WwLSmQKfaYIRm2A9DHTNBJ+RpxjgOFwqltIySq22AD/KDQhzL94SuEELIkKxwrr8VH9O
	ZJpM4dKYraF2fiUEwUvusg/mFwrAw1vBk/AqZi5eXKKzj9bdr/AIdLOWi4uqU0xm8lrd
	yhGXwE5H7bNWEcU+OmglYOUVG2RMuXdbeOjMt2iZn3OTV6ixTApmiBY7aPGlXWyrcUVe
	ZKjoPvOng177qwcbDegHG+he1iirt8y8krkg5gv9hgL5BFvhM7EBtxoGVcWYkgwmG0A4
	hrUw==
X-Gm-Message-State: APjAAAUXAfxrFpwko01EG1HrJBtXsohuWDx5YLh+7CHR3W6o3PW6Pdmx
	vkhyKhxENGfj2p7/3s8aAZmPqqGe3s8=
X-Google-Smtp-Source: APXvYqw0VaYrWPRIuVpZT+OoRX/JzvwQW69AR+MiImBEFQWazkMSgB3D53WZCpmo2xwInpP150nFiQ==
X-Received: by 2002:a7b:c933:: with SMTP id h19mr1719467wml.52.1562711437699; 
	Tue, 09 Jul 2019 15:30:37 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	a81sm286272wmh.3.2019.07.09.15.30.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 09 Jul 2019 15:30:36 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Jul 2019 23:30:34 +0100
Message-Id: <20190709223035.14911-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/2] core-image-sato-sdk-ptest: Reduce image padding size due to bootimg 4GB limit
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
X-List-Received-Date: Tue, 09 Jul 2019 22:30:37 -0000
Content-Transfer-Encoding: 8bit

This image continues to run out of space on the autobuilder, tweak it a bit
further now the image space requirements were reduced after various ptest
fixes to avoid the error.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-sato/images/core-image-sato-sdk-ptest.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb b/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
index e84beda6ce1..ff297fe324c 100644
--- a/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
+++ b/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
@@ -12,10 +12,10 @@ IMAGE_INSTALL += "${PTESTS_FAST} ${PTESTS_SLOW}"
 
 # This image is sufficiently large (~1.8GB) that we need to be careful that it fits in a live
 # image (which has a 4GB limit), so nullify the overhead factor (1.3x out of the
-# box) and explicitly add just 1200MB.
+# box) and explicitly add just 1100MB.
 # strace-ptest in particular needs more than 500MB
 IMAGE_OVERHEAD_FACTOR = "1.0"
-IMAGE_ROOTFS_EXTRA_SPACE = "1224288"
+IMAGE_ROOTFS_EXTRA_SPACE = "1124288"
 
 # ptests need more memory than standard to avoid the OOM killer
 QB_MEM = "-m 1024"
-- 
2.20.1


