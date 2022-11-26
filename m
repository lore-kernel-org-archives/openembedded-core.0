Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F403C47088
	for <webhook@archiver.kernel.org>; Sat, 26 Nov 2022 14:15:36 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.70833.1669472134030623300
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Nov 2022 06:15:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=Al/382od;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id b21so6293815plc.9
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Nov 2022 06:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XjCNP+h+rcgkffWaj266wKE3hygw04vTSK7+NIO1A4w=;
        b=Al/382odVz3CBGNoQ1ZDC+MDI0uyhKpaoKEW6HPRmW1HDU4QIJyg+3mmbucmC5OvAB
         K17SZZ+xegJJmRXl4Nlye/7E49Z9O219n/EmGKbmqCP1z6XxrzlX+Z/uu6Q7+v96LbkQ
         9L/cqsoopXqjM7WWgoWCyarmm6nPBMhdSQtxe6KHoLhSFJgsxZcUvVpE+N62u1gTe4PI
         ibkDKmBKh3k56dTxnCblEJNSjXCm/IJZT/QKuMbSIV3Ax138LJqHCyHnkd8WbTk2VvKm
         WeEOqpHMTwXtntZBhfnQJtDjAKm/k+1YMLE+Bqfqfgvz1abp6+7MICLzANMJHMiRiUsH
         2png==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XjCNP+h+rcgkffWaj266wKE3hygw04vTSK7+NIO1A4w=;
        b=r51xM1ld7emw9HBmnfNjGKxnu9fSA+cLiSYXUT55nje60jF5aN85CsB1UNn9S1NGUN
         P59wNgcx2cUmwuM3TeLih4PseRdg9bOnw3HtS683xTOCN38BqPQDyfOWoZbqWA1opbg6
         6+23rkrfzu4hf7zR8jKA4d49fJ0jSHBxeOT10ixRqj1Q2gKVxR8bWvWB3kO+On0SXXW0
         8ZYfuUAzQT3qIeRDdc6eu7fwfPLX1x2j/4JE7E+oGXAnVuT8rfmmjuEXCzGFwBjzvCH0
         1LBYz43Rv7qDIjM94KfPh9z9ZTacPl0ptObgz9KBPhewyK/XnAFQX4p6mteHlolCHq2p
         SLeg==
X-Gm-Message-State: ANoB5pm2jfWGjrMAGHAq0hrUPNiWI+JDgPvOjYnyWrJ98f9EwE8RZ9nE
	Eb4Q5UFAgHrBPlu5nnhwOdlAVDpw+VkQ3PsHy6M=
X-Google-Smtp-Source: AA0mqf5EMcHu1XMLxO39rGF3u/ZsM07eidtQzhbSixzOwnw5zZUhrkisTG2Lqh0V9xXaTDLaFG1ziw==
X-Received: by 2002:a17:902:e48b:b0:17f:799b:297d with SMTP id i11-20020a170902e48b00b0017f799b297dmr22905681ple.72.1669472133026;
        Sat, 26 Nov 2022 06:15:33 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id im22-20020a170902bb1600b001895f7c8a71sm4649177plb.97.2022.11.26.06.15.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Nov 2022 06:15:32 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 12/37] pango: replace a recipe fix with an upstream submitted patch
Date: Sat, 26 Nov 2022 04:14:16 -1000
Message-Id: <e8258f174fb124f87051eae60195638f625afd67.1669471990.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669471990.git.steve@sakoman.com>
References: <cover.1669471990.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Nov 2022 14:15:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173805

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit f444e01e0230904510f50d1b093d75253faf1bca)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...d-install-nofonts-fonts.conf-as-it-i.patch | 35 +++++++++++++++++++
 meta/recipes-graphics/pango/pango_1.50.11.bb  | 13 ++-----
 2 files changed, 38 insertions(+), 10 deletions(-)
 create mode 100644 meta/recipes-graphics/pango/pango/0001-tests-meson.build-install-nofonts-fonts.conf-as-it-i.patch

diff --git a/meta/recipes-graphics/pango/pango/0001-tests-meson.build-install-nofonts-fonts.conf-as-it-i.patch b/meta/recipes-graphics/pango/pango/0001-tests-meson.build-install-nofonts-fonts.conf-as-it-i.patch
new file mode 100644
index 0000000000..8dacd62138
--- /dev/null
+++ b/meta/recipes-graphics/pango/pango/0001-tests-meson.build-install-nofonts-fonts.conf-as-it-i.patch
@@ -0,0 +1,35 @@
+From 13f8ba5d5b699df1f88eeea859406daba6d6941f Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Tue, 8 Nov 2022 18:08:51 +0100
+Subject: [PATCH] tests/meson.build: install nofonts/fonts.conf as it is
+ required by tests
+
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/pango/-/merge_requests/654]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ tests/meson.build | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/tests/meson.build b/tests/meson.build
+index 8b4bfa38..6c1c461b 100644
+--- a/tests/meson.build
++++ b/tests/meson.build
+@@ -250,6 +250,10 @@ foreach d: test_items_data
+   installed_test_items_data += d + '.expected'
+ endforeach
+ 
++installed_test_nofonts_data = [
++  'nofonts/fonts.conf',
++]
++
+ installed_test_datadir = join_paths(pango_datadir, 'installed-tests', 'pango')
+ installed_test_bindir = join_paths(pango_libexecdir, 'installed-tests', 'pango')
+ 
+@@ -261,6 +265,7 @@ if get_option('install-tests')
+   install_data(installed_test_breaks_data, install_dir: join_paths(installed_test_bindir, 'breaks'))
+   install_data(installed_test_items_data, install_dir: join_paths(installed_test_bindir, 'itemize'))
+   install_data(installed_test_fontsets_data, install_dir: join_paths(installed_test_bindir, 'fontsets'))
++  install_data(installed_test_nofonts_data, install_dir: join_paths(installed_test_bindir, 'nofonts'))
+ endif
+ 
+ gen_installed_test = files([ 'gen-installed-test.py' ])
diff --git a/meta/recipes-graphics/pango/pango_1.50.11.bb b/meta/recipes-graphics/pango/pango_1.50.11.bb
index f982d9a65b..6f599f5b78 100644
--- a/meta/recipes-graphics/pango/pango_1.50.11.bb
+++ b/meta/recipes-graphics/pango/pango_1.50.11.bb
@@ -21,8 +21,9 @@ GIR_MESON_ENABLE_FLAG = "enabled"
 GIR_MESON_DISABLE_FLAG = "disabled"
 
 SRC_URI += "file://run-ptest \
-            file://0001-Skip-running-test-layout-test.patch \
-"
+           file://0001-Skip-running-test-layout-test.patch \
+           file://0001-tests-meson.build-install-nofonts-fonts.conf-as-it-i.patch \
+           "
 
 SRC_URI[archive.sha256sum] = "8800f812d89ee61388188703203f3a7878963c22f8695aaf1fa0a1a1428d17ae"
 
@@ -41,14 +42,6 @@ do_configure:prepend() {
 	chmod +x ${S}/tests/*.py
 }
 
-# https://gitlab.gnome.org/GNOME/pango/-/issues/713
-do_install:append() {
-	if [ "${@bb.utils.filter('PACKAGECONFIG', 'tests', d)}" ]; then
-		mkdir -p ${D}${libexecdir}/installed-tests/pango/nofonts
-		install ${S}/tests/nofonts/fonts.conf ${D}${libexecdir}/installed-tests/pango/nofonts
-	fi
-}
-
 LEAD_SONAME = "libpango-1.0*"
 
 FILES:${PN} = "${bindir}/* ${libdir}/libpango*${SOLIBS}"
-- 
2.25.1


