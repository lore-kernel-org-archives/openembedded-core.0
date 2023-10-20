Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2A8BC001DF
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 15:52:19 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.57881.1697817137544542773
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Oct 2023 08:52:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ccI156TW;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1c9e06f058bso16058965ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 08:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697817137; x=1698421937; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i14spCegnkOaystV7bFcD7sRd0gvihmgOEpT61Fa6QM=;
        b=ccI156TWIUFR0wIoVhgMGtlamNbH41cZXURytNK9gQPsdaCGvg+zCkojhbW3H0mTsl
         xa8idVc/htBIl77cgVIcwiOyPC+GSwr6ljwA/Ypj/2KKzF++J5wYT7tixoI+4T+4KcSw
         B1tVkauUfIhPmCoAQpDeTOyf+dntLDEU13YRS4g14tJ26Qo//WQTTlBMk9Gs77Us10dz
         wuTthLgH/UYEvScGtqYhnVzVG76umK+loxtw9rRnDEx+t7Mw4SmZw8UK92m/+wPPmnld
         OKxgByJRxtSG6kZw9ccxWETtanATLkurqvvkvVp/zG8PGw5gucU9Zu5HH+TybWDGGW4R
         357g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697817137; x=1698421937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i14spCegnkOaystV7bFcD7sRd0gvihmgOEpT61Fa6QM=;
        b=pry6c1YmjqGWpm3/wUy+P3sJ5MSFDjQPcze/J0kz0+2wnCLrp0VwZZi2FexVMt4Y0T
         V12ASUkFUk4iEJSRnB07h6Xr4Xhba6rt4lTp8WOwUVJg/9nHhkdO1ZnZ9QngpAgG1rRN
         RIOYPfasqB89p9rm6m/Ediu92g5wa9+wKDAzjgfBiwMpkZIomb0XqLUmkmru2Fbo+vr6
         iJZpm8QA4Kj0NutGmVKAiyaKzmpDPjb934xrhJIZ/VeOq+cxmJeJiGOz6cZXMfFgWSKI
         bo/hVkrxMtOe0YBLFvesFjfHug8kHcbkyaKM8Lmz3bDM3EsACyPQaWSu9stGpl4g5tqE
         8Azw==
X-Gm-Message-State: AOJu0YwQxKfIAw0jLyNz0Zif/gt4aITh8L0Z9+Q9DkiWQ4wuuR/1RqW0
	P8aVDgpcef0Im1pVjZVx9mwt2T725w2x52D2xeE=
X-Google-Smtp-Source: AGHT+IEqOmmHulh5aNKL3vqSkLBDfTY2IFj9QMjyTeolW5h2+hIlFMAkmtcEm+pFP9ijqqJqPK+MFA==
X-Received: by 2002:a17:902:dac5:b0:1c0:cbaf:6954 with SMTP id q5-20020a170902dac500b001c0cbaf6954mr3798241plx.25.1697817136717;
        Fri, 20 Oct 2023 08:52:16 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id q12-20020a170902dacc00b001c71ec1866fsm1679244plx.258.2023.10.20.08.52.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 08:52:16 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 23/24] packages.bbclass: Correct the check for conflicts with renamed packages
Date: Fri, 20 Oct 2023 05:51:25 -1000
Message-Id: <3fc3e55933716ce9cfa8b2e8e4cc8fa2e94a0061.1697816789.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697816789.git.steve@sakoman.com>
References: <cover.1697816789.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 15:52:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189568

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

The original solution replaced all overrides with the package name that
was being checked. This can have unforseen consequences where some
variable involved in defining the value for the PKG:<package> variable
may rely on some override which is not set as expected. It also meant
that any PKG variable set using an override would not be caught, e.g.,
PKG:${PN}:${MACHINE} = "${PN}-dev" (made up example that would always
fail with the old code).

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit de62d538dbfe6caf123ff366643f893077175583)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-global/package.bbclass | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/package.bbclass
index e8055a9cdc..08eb56dc3d 100644
--- a/meta/classes-global/package.bbclass
+++ b/meta/classes-global/package.bbclass
@@ -499,11 +499,9 @@ python do_package () {
     # Check for conflict between renamed packages and existing ones
     # for each package in PACKAGES, check if it will be renamed to an existing one
     for p in packages:
-        localdata = bb.data.createCopy(d)
-        localdata.setVar('OVERRIDES', p)
-        rename = localdata.getVar('PKG')
-        if (rename != None) and rename in packages:
-            bb.fatal('package "%s" is renamed to "%s" using PKG:%s, but package name already exists'%(p,rename,p))
+        rename = d.getVar('PKG:%s' % p)
+        if rename and rename in packages:
+            bb.fatal('package "%s" is renamed to "%s" using PKG:%s, but package name already exists' % (p, rename, p))
 
     ###########################################################################
     # Optimisations
-- 
2.34.1


