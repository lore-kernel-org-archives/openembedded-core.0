Return-Path: <sveyret@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B12D7C83F12
	for <webhook@archiver.kernel.org>; Mon, 28 Aug 2023 17:53:25 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.1062.1693245195503013608
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Aug 2023 10:53:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=rNSenM4b;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: sveyret@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-31c49de7a41so398704f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Aug 2023 10:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693245194; x=1693849994;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NfLNsP1g0niHnOHjHIdmDlLhxIGWF7i/dfednHnG4RE=;
        b=rNSenM4b6tnGqr03H0ObPbJ6hBR4C+LTwito0DpYegRtaCJLoVHBe+YItF5+Uc5xGW
         FfpKUZBL6Klrgk76XYvbLHmxwN6MNtn69iyFhqToA836wu2OZpilo0WGgdUwvXiAZqkz
         o9hvNSGE1HCVyex+x+EsavSMEHRpj/WAn+a/7Ljn4yN1uexNufoxkdyrS/HfBrpjHB+R
         fWjid3/r1pxme+YvNeND5nO3V0F5+WRuXoLC7siunUAKVU8x4DC+WM1+6TgsTtHItr5v
         vxYDNCkB7VKHZxfkCVuSyBELLYoT5jwvZ2cmI/SO4zorMKCJPEw8Kx295sWgdcy3yoRH
         rK+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693245194; x=1693849994;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NfLNsP1g0niHnOHjHIdmDlLhxIGWF7i/dfednHnG4RE=;
        b=Far66aQosCy7AaUN7clAUsOVtVtGzO1qoDlD865re6ukvWnrJWo3fCGFuuWkWPVkJU
         LCLOCy/wTFH2cni2gd9PkYOaXYeAYbG+d23SeXPDtVaXnPrrkewcjKkwQvo0Iexw0yph
         ZYo6kU8qT/VMQtFIwCzxSA6ImuQa2kU6dMK/HOFRwx0sBy0iZplzoEn1iVnOsprqdOwH
         QoQc0QDGC5XVP6y/vpsaf+Y7OweQYuLkvwQ2YeN38mBzoZrRMELPbM8fIxQDFjeFCO0I
         fH5oVV2NYg5NfiQFaYAyaYuIMPpzk6HpZbA4/KhvFs+aZkkvAdcK+f/hr/mlQujuLJNI
         R0gw==
X-Gm-Message-State: AOJu0YxjWR6r1ZwI78GqzS6ejZbbPRefrMZlFh6aBs1tBvakYa/gnqDS
	524MSCW6AKAlZ8HOrvpgcsmtmmXALPU=
X-Google-Smtp-Source: AGHT+IFTwzjrrnC0qm+3AKQNFYCSTEWXlF1tthmKuE+J/KpwVPfsVm8ZUKRGwNeaNdx8EQ1bj88FRg==
X-Received: by 2002:adf:f892:0:b0:317:5f08:32a3 with SMTP id u18-20020adff892000000b003175f0832a3mr18371320wrp.6.1693245193650;
        Mon, 28 Aug 2023 10:53:13 -0700 (PDT)
Received: from buffy.int.neptura.org ([2a01:e0a:3ed:3de1:ef11:32d0:af22:f04f])
        by smtp.googlemail.com with ESMTPSA id v8-20020a5d6108000000b0031434c08bb7sm11097688wrt.105.2023.08.28.10.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 10:53:12 -0700 (PDT)
From: =?UTF-8?q?St=C3=A9phane=20Veyret?= <sveyret@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?St=C3=A9phane=20Veyret?= <sveyret@gmail.com>
Subject: [meta-oe][PATCH v2] volatile-binds: Calculate the name of the /var/lib service
Date: Mon, 28 Aug 2023 19:52:56 +0200
Message-ID: <20230828175255.18811-2-sveyret@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Aug 2023 17:53:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186843

By default, /var/lib is bind mounted on /var/volatile/lib. If this is
the case, the recipe adds conditions on systemd-random-seed in the
service file mounting it. But as the VOLATILE_BINDS may be modified,
/var/lib may be mounted elsewhere, for example in /persistent/var/lib.
In this case, the conditions are not set because the service file name
does not match expected one.
This patch automatically records the name of the service mounting
/var/lib, if any, in order to set the condition in the appropriate file.

Signed-off-by: Stéphane Veyret <sveyret@gmail.com>
---
 .../volatile-binds/volatile-binds.bb           | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-core/volatile-binds/volatile-binds.bb b/meta/recipes-core/volatile-binds/volatile-binds.bb
index 3fefa9abde..cca8a65fb4 100644
--- a/meta/recipes-core/volatile-binds/volatile-binds.bb
+++ b/meta/recipes-core/volatile-binds/volatile-binds.bb
@@ -16,10 +16,10 @@ inherit allarch systemd features_check
 REQUIRED_DISTRO_FEATURES = "systemd"
 
 VOLATILE_BINDS ?= "\
-    /var/volatile/lib /var/lib\n\
-    /var/volatile/cache /var/cache\n\
-    /var/volatile/spool /var/spool\n\
-    /var/volatile/srv /srv\n\
+    ${localstatedir}/volatile/lib ${localstatedir}/lib\n\
+    ${localstatedir}/volatile/cache ${localstatedir}/cache\n\
+    ${localstatedir}/volatile/spool ${localstatedir}/spool\n\
+    ${localstatedir}/volatile/srv /srv\n\
 "
 VOLATILE_BINDS[type] = "list"
 VOLATILE_BINDS[separator] = "\n"
@@ -46,8 +46,8 @@ do_compile () {
             continue
         fi
 
-        servicefile="${spec#/}"
-        servicefile="$(echo "$servicefile" | tr / -).service"
+        servicefile="$(echo "${spec#/}" | tr / -).service"
+        [ "$mountpoint" != ${localstatedir}/lib ] || var_lib_servicefile=$servicefile
         sed -e "s#@what@#$spec#g; s#@where@#$mountpoint#g" \
             -e "s#@whatparent@#${spec%/*}#g; s#@whereparent@#${mountpoint%/*}#g" \
             -e "s#@avoid_overlayfs@#${@d.getVar('AVOID_OVERLAYFS')}#g" \
@@ -56,12 +56,12 @@ do_compile () {
 ${@d.getVar('VOLATILE_BINDS').replace("\\n", "\n")}
 END
 
-    if [ -e var-volatile-lib.service ]; then
+    if [ -e "$var_lib_servicefile" ]; then
         # As the seed is stored under /var/lib, ensure that this service runs
         # after the volatile /var/lib is mounted.
         sed -i -e "/^Before=/s/\$/ systemd-random-seed.service/" \
                -e "/^WantedBy=/s/\$/ systemd-random-seed.service/" \
-               var-volatile-lib.service
+               "$var_lib_servicefile"
     fi
 }
 do_compile[dirs] = "${WORKDIR}"
@@ -78,7 +78,7 @@ do_install () {
 
     # Suppress attempts to process some tmpfiles that are not temporary.
     #
-    install -d ${D}${sysconfdir}/tmpfiles.d ${D}/var/cache
+    install -d ${D}${sysconfdir}/tmpfiles.d ${D}${localstatedir}/cache
     ln -s /dev/null ${D}${sysconfdir}/tmpfiles.d/etc.conf
     ln -s /dev/null ${D}${sysconfdir}/tmpfiles.d/home.conf
 }
-- 
2.41.0


