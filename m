Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE7D1F3C991
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:41:13 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21847.1771944068395919792
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:41:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=nsV6louT;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4375d4fb4d4so3590540f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771944066; x=1772548866; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EXOTLuGTlkU3C+b2lplBCc6iV3Az6hrv3VyLd8UqJe0=;
        b=nsV6louTKMP1jqu71ffb2TPM1cRy8Q01MqEkOsuMOCdVoFWyvt4jAymNcbL2zTj2zA
         uoYYjZEhCk3MVn9DVc/701dyWT2T+kUkJpQ9uVq6ZhB3+XnakwaSk35kdYnMSjZMbCGg
         nzIJRb4pDVKW0zC22CaJSDRnTsFST9gjb+3Dc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771944066; x=1772548866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EXOTLuGTlkU3C+b2lplBCc6iV3Az6hrv3VyLd8UqJe0=;
        b=JFJ3AqyHZZoKfWN4opUlHCPIK0LyAMkREARWYUijZQ2rhwL0Do2WXCkNPc23SlTA65
         RZjmV/CJh4t3pK2VLiIMECUs5P1xo9iS3hcYpTLm9hkDQBuHvmJU76sqkMiiyEWNo4iq
         bDbTiNo8Hgij7iKruAjrjDbmJ0c6WC0GiSM7wKRVbNb4+WVTFOxTXznddsoULH8Q+3QI
         Bw0Rv1an2xOYkVf5SPuk7X1EiaCXy2ha0xdp5WzXXzS4LoeyUg6mYtJIMzS5fau0i6ZW
         MrR0ezU+myLdmC/2TPkUuoxXo//AxUDvqH4CufnWj6yJhxog7GMd3+o+lkLYtOlKC4rP
         tdGQ==
X-Gm-Message-State: AOJu0YyKCCL7D7Z5GcoEuixAQdaefoEERkS8Ve2hMuKomtC6/+drhSEM
	TrEuUsWGcf65nty277jgdXqfzxy1Ae53LyCdp816wfX4GcXxWAXciVU5fD3HBnSktSyvIVytEE/
	n8C5e
X-Gm-Gg: ATEYQzxpc6mmFnkBacGBI69jslJnunZXaBE+nezuTkkyvDoZ/einXWqq6JvszX+BXJh
	kTpyA+fAtsXNPv5cl7cvfbbUKkPiMuJs4ffWZp1kV/QDt/2QeGzl7sa9/ZTNIEywlag/CaWx2IH
	YXaZjm59+qJmm23N80xvjFpiECh9GkkIIixkae9ZG/+RwnbaO5q4ay8Fc7Dn+WS/gBqjFCyXwak
	zi+uJVeQe/WIuIM7TTm4Lf8a3EepapB46KEJLxfb8vm6GyzSLwPPo/JJ15nJiDRFgQ3y+FoU9Je
	/eHxxi4LLoWigVij852xshV7iaQM6Us7gDub6UwGMx/1yne26X9a4tmr/gjclDGbq4S2o+iGQg5
	rTpjA3QKyBon0xiHDi+bdI2/qw6CJmLzJ2YleQ07XvN6g+DscBC/r+EdMMIovVoctfK0WcReT3a
	XMRQ7FxlXSRhgN50r+DXE6oThG+0cyVxnXqMsDgoGSSeI1o+5JoHxQu9+iQLsICXb5LXa+Zv5CV
	0tAkeb35k3qNoXoGSw=
X-Received: by 2002:a05:6000:2002:b0:435:95ce:84cd with SMTP id ffacd0b85a97d-4396f188017mr21959267f8f.54.1771944066136;
        Tue, 24 Feb 2026 06:41:06 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d3ff6dsm28711195f8f.25.2026.02.24.06.41.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:41:05 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 1/9] pseudo: Update to include a fix for systems with kernel <5.6
Date: Tue, 24 Feb 2026 15:40:54 +0100
Message-ID: <527babecf00982686e8bebb1419b197395de9824.1771943829.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771943829.git.yoann.congal@smile.fr>
References: <cover.1771943829.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:41:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231853

From: Yoann Congal <yoann.congal@smile.fr>

 $ git log --oneline --no-decorate  9ab513512d8b5180a430ae4fa738cb531154cdef..43cbd8fb4914328094ccdb4bb827d74b1bac2046
43cbd8f ports/linux: define __NR_openat2 if missing

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 2dc5eabf2cb..a26a205a160 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -12,7 +12,7 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "9ab513512d8b5180a430ae4fa738cb531154cdef"
+SRCREV = "43cbd8fb4914328094ccdb4bb827d74b1bac2046"
 PV = "1.9.3+git"
 
 # largefile and 64bit time_t support adds these macros via compiler flags globally

