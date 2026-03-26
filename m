Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA65810A1E63
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 18:15:01 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.55230.1774548899297928875
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 11:14:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=fh69Nrp3;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-486b96760easo13814705e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 11:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774548898; x=1775153698; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JSKRONQ1ZFPvDeLodXZucLUwWnA9LuB5PJyIIZmfppE=;
        b=fh69Nrp30dCiUN74oVMI4ABaYPKOyIHLI2iLQ1FZRqCE3OQwDvBqr03exnFTWqjYZc
         Hgl2RKtu4Y4EYLAF/Om9llaa4i7FGWp0x8qt9ykVK0hLqGzG4R6uMl6SoynBT+5JM/pd
         XjsQEXtS+FilNyE76R2qNYZ5cRyOBsxuf7TrU256Pgl/98LPPOCWlsu8AacdTyluPA6s
         8xbzncPqwhenmV82L/t1SBptan2J25D8EmumFjg2qASHP/qZrfVD5jSL0gpkrlQVyMDi
         Lf45tBPmXMYIg6kNPpPXWGyh6w/vN5hJYwj2F1yhg89MshS2ZQ0ORtpUL+4aZAE7lqK/
         JiAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774548898; x=1775153698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JSKRONQ1ZFPvDeLodXZucLUwWnA9LuB5PJyIIZmfppE=;
        b=cymKHh2AC/04Mo6EDtPj+tml2l6+fodc8GSgIqxzhSOJaiVgC0MSYexdbsY0v+JSyL
         l/3D4FgEsTUI7wruuxT+qwxHYS6+NP41mQPkjOEGKU7bxnmOgXgmhvwjDkD/6tsYRWv7
         /Cin7TbCVFRYarxFZjnAHEz2/EsZF4pVCsrHAFbrWSIHEhlmKV5j2XQQvc6wmOuYYi8g
         97jMcnMAfvSELBNwpM26hwVySC1bvWC/Obe3HlCc8++4TCxoHBwixCjP+5ij64xNOrol
         unv2k/6Rc3MNoCwBopaIH/zVwB3B+AmGay5C2i0vHHTTbv0EV+g3soTkjrC4N/n+zV48
         v3mg==
X-Gm-Message-State: AOJu0YwrJ8Sh92LYEz+qpZoGvAdjhFFEQJOteOyRa95zJU17SP0kiYkp
	bFX+ewY3F4htRxq3UwZq/IjDKTxXzO2LVoSixMTb1Buuvy/SAr1X5GXmUYQ2UVl1
X-Gm-Gg: ATEYQzwbglmV4nQtWX9N5xZIuVR8yzQSsFa0COxWssHgNKHZnnY6W6p/iQRwkw7feQV
	F2KtRJDhlPs4DG01IBATEpMe4pnC3L9p/5cSAs0nLK23z5/4UpWJsqDJbAtWvbPpTj3aOmWkfYu
	RdiZgiJ/3BhRuBq6pP1kJyhHKeHAugxvTlXcgRDiDMCbzzZuyWaRUBULYV8mZ54E4fMiLhsPp27
	neqsLM4TSBmvXeuPeFUfMcXJLOa2q8l4QSk+QLXAd/PBRxu+fh6tcqabD8Xj5g02mxrD5e2lAU+
	H9AidltkO/Sx9dxO7gGot1cmLCEw8mWfejuEpon3Het+HyXeaT3D5NzvH/uld3vyKG94wIh3Z7h
	LaDHkQg9T5RGGxWGSaHmu0jdbKRj7cxB1eGpSUZlqkcBtlszXELYbCmYS0q8QePeiywOHpC1vnn
	Adou6WHgtnxNyHn5F9axVIWFpXAw==
X-Received: by 2002:a05:600c:8b2a:b0:486:f634:ef3 with SMTP id 5b1f17b1804b1-48716099531mr126928965e9.32.1774548897525;
        Thu, 26 Mar 2026 11:14:57 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c9134fsm63528005e9.9.2026.03.26.11.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 11:14:57 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Halstead <mhalstead@linuxfoundation.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH 3/6] meta/conf/distro/include/yocto-uninative.inc
Date: Thu, 26 Mar 2026 19:14:47 +0100
Message-ID: <20260326181450.1262870-3-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326181450.1262870-1-martin.jansa@gmail.com>
References: <20260326181450.1262870-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 18:15:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234037

From: Michael Halstead <mhalstead@linuxfoundation.org>

yocto-uninative: Update to 5.0 for needed patchelf updates

Solves some segfaults on relocated qemu-img binaries.

[YOCTO #16003]

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/yocto-uninative.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 3ced03d477..e9dc6c8640 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -7,9 +7,9 @@
 #
 
 UNINATIVE_MAXGLIBCVERSION = "2.42"
-UNINATIVE_VERSION = "4.9"
+UNINATIVE_VERSION = "5.0"
 
 UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
-UNINATIVE_CHECKSUM[aarch64] ?= "812045d826b7fda88944055e8526b95a5a9440bfef608d5b53fd52faab49bf85"
-UNINATIVE_CHECKSUM[i686] ?= "5cc28efd0c15a75de4bcb147c6cce65f1c1c9d442173a220f08427f40a3ffa09"
-UNINATIVE_CHECKSUM[x86_64] ?= "4c03d1ed2b7b4e823aca4a1a23d8f2e322f1770fc10e859adcede5777aff4f3a"
+UNINATIVE_CHECKSUM[aarch64] ?= "a25f2174d0cefcb22af005e9bc72ac01ae83b011c5b6d6d5bf00dac979877f76"
+UNINATIVE_CHECKSUM[i686] ?= "959cc2539b692f9b9862825c7324a0fe4d061fca742f6c259f67f581c59af956"
+UNINATIVE_CHECKSUM[x86_64] ?= "96045e8b1e242c8a849426a8506c7043f354b39f2bc0035192780e8205e23e9d"

