Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E9FDC433FE
	for <webhook@archiver.kernel.org>; Fri, 20 May 2022 19:58:19 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.1972.1653076697788613126
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 May 2022 12:58:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=B92pZhPP;
 spf=pass (domain: gmail.com, ip: 209.85.218.51,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id gi33so9001509ejc.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 20 May 2022 12:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IAUzc5sUjXwMjAXWkxU/IJcs+b1Nv+583haoK36VOPI=;
        b=B92pZhPPbqqRcn9OALcxbuMgE7Yp+CqLlmNKVXNmSbJ7wABSoVA80fd7DOfA6odMcS
         Escgvw7w43YYgDDsZlisQEJpwDGNRtRCwKNE34SU7Xv3or86sF1y1mccNtcwZHAaqfKX
         47em7OLdbIapVV12v9zV8u8T3UxuzTLXLG2NM5CEWpPqNLUPP29pfi4RjPzaEL6cFAOp
         dXiLGlWDM1HN8bZYGUvAqOuUT8+0iZxQF8ZZhtuDqDXhXWwmqGcsdlxskINAr7I2Z/EF
         vbu1yNlnSXvzHD38uNWGf29BIxnSSMp1jcUNk4FPxLOshXaf55h+Qq3Ehet0AA4IVW/w
         HahQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IAUzc5sUjXwMjAXWkxU/IJcs+b1Nv+583haoK36VOPI=;
        b=4C21OUl6e00IxBVhLEyrIhUnlKaXtqfC975ljNPnyRDJFWx0nBRyoGPCX/vnNkY1gN
         UYikajOjMi0HFCe/5eu9tZGCePTn3UPwsFXKtZ180hD9Obono0jv/VI3nWMjUnw9aatR
         FtphnSja89H4e7Q3JSMYuI0dLVL/CTs2C+7yenEHqBu3XrH2B58Q6zRyp3aGlQ2ia9+X
         anLUMYT7lzeSsHq+8Ylw/kWRFXdynNNINlEsY77mk9R3k9E1K87XgBwBurX7nYQRt/h+
         hSW+DamsvEkUlp7OrjaVyfdAXbMKJmQPfVkTscSvlVSfkHvlK57EXtmn3eq20U4CsUOz
         UWbA==
X-Gm-Message-State: AOAM531jM9qqfJPU6ynK01fLD1BAc0+fsWhKr9bmdrtKD4M7ypj962Vf
	qRtPTHhHUXofy0wSHRk7rEtS4PLRyJg=
X-Google-Smtp-Source: 
 ABdhPJwFH1+C1+SNXwFVx/kiXmx6QR3QANQY0ABa28tYAP5Y4AvQ87a5YhL3czewZfLiUj0dNiV7jg==
X-Received: by 2002:a17:907:c0c:b0:6fe:af28:7304 with SMTP id
 ga12-20020a1709070c0c00b006feaf287304mr3965601ejc.242.1653076695923;
        Fri, 20 May 2022 12:58:15 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
 [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id
 gx5-20020a1709068a4500b006f3ef214de6sm3448448ejc.76.2022.05.20.12.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 May 2022 12:58:15 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>,
	Alex Kiernan <alexk@zuma.ai>
Subject: [OE-Core][PATCH v3 3/3] eudev: Use PACKAGE_BEFORE_PN/${PN},
 clean up spaces
Date: Fri, 20 May 2022 20:58:09 +0100
Message-Id: <20220520195809.4855-3-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220520195809.4855-1-alex.kiernan@gmail.com>
References: <20220520195809.4855-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 May 2022 19:58:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165952

Use PACKAGE_BEFORE_PN for packages which need to capture files early,
switch to idiomatic ${PN} for additional packages. Swap spaces for tabs
in shell functions.

Signed-off-by: Alex Kiernan <alexk@zuma.ai>
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 meta/recipes-core/udev/eudev_3.2.11.bb | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-core/udev/eudev_3.2.11.bb b/meta/recipes-core/udev/eudev_3.2.11.bb
index 1b6705ba3058..2d4c44b1dd7f 100644
--- a/meta/recipes-core/udev/eudev_3.2.11.bb
+++ b/meta/recipes-core/udev/eudev_3.2.11.bb
@@ -62,27 +62,26 @@ do_install:prepend:class-target () {
 INITSCRIPT_NAME = "udev"
 INITSCRIPT_PARAMS = "start 04 S ."
 
-PACKAGES =+ "libudev"
-PACKAGES =+ "eudev-hwdb"
+PACKAGE_BEFORE_PN = "libudev ${PN}-hwdb"
 
 FILES:${PN} += "${nonarch_base_libdir}/udev"
 FILES:libudev = "${base_libdir}/libudev.so.*"
-FILES:eudev-hwdb = "${sysconfdir}/udev/hwdb.d"
+FILES:${PN}-hwdb = "${sysconfdir}/udev/hwdb.d"
 
-RDEPENDS:eudev-hwdb += "eudev"
+RDEPENDS:${PN}-hwdb += "${PN}"
 
 RPROVIDES:${PN} = "hotplug udev"
-RPROVIDES:eudev-hwdb += "udev-hwdb"
+RPROVIDES:${PN}-hwdb += "udev-hwdb"
 
 PACKAGE_WRITE_DEPS += "qemu-native"
-pkg_postinst:eudev-hwdb () {
-    if test -n "$D"; then
-        $INTERCEPT_DIR/postinst_intercept update_udev_hwdb ${PKG} mlprefix=${MLPREFIX} binprefix=${MLPREFIX}
-    else
-        udevadm hwdb --update
-    fi
+pkg_postinst:${PN}-hwdb () {
+	if test -n "$D"; then
+		$INTERCEPT_DIR/postinst_intercept update_udev_hwdb ${PKG} mlprefix=${MLPREFIX} binprefix=${MLPREFIX}
+	else
+		udevadm hwdb --update
+	fi
 }
 
-pkg_prerm:eudev-hwdb () {
-        rm -f $D${sysconfdir}/udev/hwdb.bin
+pkg_prerm:${PN}-hwdb () {
+	rm -f $D${sysconfdir}/udev/hwdb.bin
 }
-- 
2.35.1


