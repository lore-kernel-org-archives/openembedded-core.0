Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC6C9C3A5A1
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 16:52:00 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web12.6426.1650618430629040711
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Apr 2022 02:07:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ho/dhBxO;
 spf=pass (domain: gmail.com, ip: 209.85.221.49,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id x18so10139418wrc.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Apr 2022 02:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jey+zUjEvUWbT9hVnMEZbfmyXNF7rbox78Eqck5WVSE=;
        b=ho/dhBxOIyRHMLrwmpRJqv8SyfdrL6BI/++svnY9JazDlyMYDj2df8479TV3bCjlY/
         iZJWIQNUXWlD6SiXMVgXpyDKTr4aecNZh4SvKmsdxw3JGUEMivqLve4z2Dc5IivtLM8d
         5dj3w/3XNiSLJjRZ0qG0FkJ2F0CVjJ3yp6gux3JeTkjznBO8D37UBv3F3pdTu+E5DMco
         YfLHPxYlzYw0JlUGJS0LL4zfcyGAjDxfQTLsLVayfF647a4Pfa7r/R3bkgxfsgv9WeNh
         ZyMoaG4rYtxyZKkr4ITRTLpoS9u9PgPUZJQ+8BmeL8ZYeBf5GS/sB3p4fzZ6Tq+1FwxD
         +yJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jey+zUjEvUWbT9hVnMEZbfmyXNF7rbox78Eqck5WVSE=;
        b=StC34hL+VaSCERvlNH/WZu4ZHGmZ0ndL9izufDb3T73wyOb4YcN7c+qkcPxfoXteJi
         atLZtaPhihaxZ9Wwnn5ImyfDaEcwVRCVXajKNgAjLlMKnhTKspcLwpX7xtzNUTjcilPP
         +owxsh15WZtiR0cevV0xqiSjsJajqV9Gp/SR1whTvKd32EIiEi0FQZdUElrnTgskCZAD
         yhkGGa2hFsyFmcGFgKByJiKC3SuBzFMwCHsi/5TlJh7v/S/DJpzAttlYMCs8TC+K2xiy
         EsXO7vKCpA8aYoKc3cZ/Nhppg+4kqMW+zTv4WxDjtiThRF0Ono+bA1IrwKEGP81s3TIt
         45rA==
X-Gm-Message-State: AOAM5317C2E45vo7KW4e9edvtsFVD6jGwJmv73oD1mTTG39h+VWDZ5jo
	LONL2R9LSu4XVgLgtq6qnP/0We6RX28=
X-Google-Smtp-Source: 
 ABdhPJy5dD6K2FI++TCBsc7z56hDIgvX74BtHBDcd3ZX1NDLxj8TYl2Qq/kjpoUR3IotP15IW2LOLA==
X-Received: by 2002:a05:6000:15ce:b0:20a:85e7:f8b9 with SMTP id
 y14-20020a05600015ce00b0020a85e7f8b9mr3019550wry.68.1650618428878;
        Fri, 22 Apr 2022 02:07:08 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
 [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id
 f4-20020a7bc8c4000000b0038ebbe10c5esm4006484wml.25.2022.04.22.02.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Apr 2022 02:07:08 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
X-Google-Original-From: Alex Kiernan <alexk@zuma.ai>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alexk@zuma.ai>,
	Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-core][PATCH 1/2] wpa-supplicant: Install wpa_passphrase when not
 disabled
Date: Fri, 22 Apr 2022 10:07:00 +0100
Message-Id: <20220422090701.25095-1-alexk@zuma.ai>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Apr 2022 16:52:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164778

As part of fixing CONFIG_NO_WPA_PASSPHRASE, whilst wpa_passphrase gets
built, its not installed during `make install`.

Signed-off-by: Alex Kiernan <alexk@zuma.ai>
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 ...all-wpa_passphrase-when-not-disabled.patch | 33 +++++++++++++++++++
 .../wpa-supplicant/wpa-supplicant_2.10.bb     |  3 +-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-Install-wpa_passphrase-when-not-disabled.patch

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-Install-wpa_passphrase-when-not-disabled.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-Install-wpa_passphrase-when-not-disabled.patch
new file mode 100644
index 000000000000..c04c608bde8e
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-Install-wpa_passphrase-when-not-disabled.patch
@@ -0,0 +1,33 @@
+From 57b12a1e43605f71239a21488cb9b541f0751dda Mon Sep 17 00:00:00 2001
+From: Alex Kiernan <alexk@zuma.ai>
+Date: Thu, 21 Apr 2022 10:15:29 +0100
+Subject: [PATCH] Install wpa_passphrase when not disabled
+
+As part of fixing CONFIG_NO_WPA_PASSPHRASE, whilst wpa_passphrase gets
+built, its not installed during `make install`.
+
+Fixes: cb41c214b78d ("build: Re-enable options for libwpa_client.so and wpa_passphrase")
+Signed-off-by: Alex Kiernan <alexk@zuma.ai>
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+Upstream-Status: Submitted [http://lists.infradead.org/pipermail/hostap/2022-April/040448.html]
+---
+ wpa_supplicant/Makefile | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/wpa_supplicant/Makefile b/wpa_supplicant/Makefile
+index 0bab313f2355..12787c0c7d0f 100644
+--- a/wpa_supplicant/Makefile
++++ b/wpa_supplicant/Makefile
+@@ -73,6 +73,9 @@ $(DESTDIR)$(BINDIR)/%: %
+ 
+ install: $(addprefix $(DESTDIR)$(BINDIR)/,$(BINALL))
+ 	$(MAKE) -C ../src install
++ifndef CONFIG_NO_WPA_PASSPHRASE
++	install -D wpa_passphrase $(DESTDIR)/$(BINDIR)/wpa_passphrase
++endif
+ ifdef CONFIG_BUILD_WPA_CLIENT_SO
+ 	install -m 0644 -D libwpa_client.so $(DESTDIR)/$(LIBDIR)/libwpa_client.so
+ 	install -m 0644 -D ../src/common/wpa_ctrl.h $(DESTDIR)/$(INCDIR)/wpa_ctrl.h
+-- 
+2.35.1
+
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
index e83aef70d554..97cd68d86338 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
@@ -17,6 +17,7 @@ SRC_URI = "http://w1.fi/releases/wpa_supplicant-${PV}.tar.gz \
            file://99_wpa_supplicant \
            file://0001-build-Re-enable-options-for-libwpa_client.so-and-wpa.patch \
            file://0002-Fix-removal-of-wpa_passphrase-on-make-clean.patch \
+           file://0001-Install-wpa_passphrase-when-not-disabled.patch \
            "
 SRC_URI[sha256sum] = "20df7ae5154b3830355f8ab4269123a87affdea59fe74fe9292a91d0d7e17b2f"
 
@@ -104,7 +105,7 @@ ALLOW_EMPTY:${PN}-plugins = "1"
 PACKAGES_DYNAMIC += "^${PN}-plugin-.*$"
 NOAUTOPACKAGEDEBUG = "1"
 
-FILES:${PN}-passphrase = "${bindir}/wpa_passphrase"
+FILES:${PN}-passphrase = "${sbindir}/wpa_passphrase"
 FILES:${PN}-cli = "${sbindir}/wpa_cli"
 FILES:${PN} += "${datadir}/dbus-1/system-services/* ${systemd_system_unitdir}/*"
 FILES:${PN}-dbg += "${sbindir}/.debug"
-- 
2.35.1


