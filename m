Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10278C38141
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 18:11:20 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.82150.1674238275798686670
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jan 2023 10:11:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=IA7RBKNT;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d3so6009232plr.10
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 10:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gMrcHRju3OAHSeNs15lyK/pHCRdxDGAHYlsjfaVNCbM=;
        b=IA7RBKNT6SnvOXaEWNlmNMmU59U5iqgEtybdWD94o+vOLxYR18U91Z74UZcaDszVdV
         zDldPzKUmGoHo+Qcz779psh4h2/t7+EjUwgTKGyP7FZ9C4TgGVSfbLoG47tw2ZIQNzm1
         /nm2HGCOaoHdeHRNBRk7HzdjSVW9JGqxwAJyZ4fOEeIsXc4pO6f7Xpn+PD846PrqwfJ+
         NMjrVrEpZOCV2W5pisJd3Ns56GpKNjSYlgBLpxL5B3kI5CUSEST/Y+t1yWfebLhDw3AN
         KvqKfotGGnpVFVw5/pPgP5zioNG+G71w3neybWPyuXIesDebTCpnJIJL3Ney3fxSP62Y
         BSYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gMrcHRju3OAHSeNs15lyK/pHCRdxDGAHYlsjfaVNCbM=;
        b=SRd1ovp3P53yyAViYUje6XZMUZ+a+QCAY53i2pa1BToTSYAlMPEwh/D5YLEV9pTIJI
         5YMjj2N41V1g2iX78xCY4tY9f5VD764uZak6dlIrKrWOs6ZAI56CoM1XJL6j/T7wY1PS
         atA+uJjs42dHcdw2lTGFNqFt1fU+TVt7seYkD6CzD5JSfELtqSVQTWBWviSAGMMSS/Sb
         lkyfQSNzHhOvzyqSV2bULER+zLwZUk5o2e3uMz93A0/bOAtTtrDmS1mefhvSGPGOUM5z
         WFdA0w6DSrn3A6cIj4Kw7I70l4D6dGAd2gOZIrwcfkNFCUXirgDIMEhkTsSQiYsaVI7p
         Bfvg==
X-Gm-Message-State: AFqh2konRrzZlz3kMCJ1wj1oWRluD5czZtZ2g5jaWFSZi3B6ZSIfXpAl
	QI0tLT6AVjCid0NWmwyND/LgZ7yqq1/Sur9mWe0=
X-Google-Smtp-Source: AMrXdXuslUiQTdfctkbh3DXrpQvhPccNqKEFeZpM0mam7l50xoZfY1WdD92xwgoCkB5IfkB85cfT6g==
X-Received: by 2002:a05:6a20:6f09:b0:a4:efdd:a9b9 with SMTP id gt9-20020a056a206f0900b000a4efdda9b9mr16135274pzb.44.1674238274844;
        Fri, 20 Jan 2023 10:11:14 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id i128-20020a626d86000000b0058db8f8bce8sm8990396pfc.166.2023.01.20.10.11.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 10:11:14 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 06/41] pango: upgrade 1.50.11 -> 1.50.12
Date: Fri, 20 Jan 2023 08:10:23 -1000
Message-Id: <032a2a1abf19954c59d50fcacafb2293ac5a9351.1674238148.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674238148.git.steve@sakoman.com>
References: <cover.1674238148.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 18:11:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176212

From: Ross Burton <ross.burton@arm.com>

Overview of changes in 1.50.12, 18-11-2022
==========================================
- Fix weight conversion on MacOS
- Update to Unicode 15
- Some introspection annotation fixes
- Improve PangoAttrList serialization
- Fix char offset calculatiosn in multi-paragraph
  layouts

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 35fc61a1dd63a0555b67da899418010d595b545c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...d-install-nofonts-fonts.conf-as-it-i.patch | 35 -------------------
 .../{pango_1.50.11.bb => pango_1.50.12.bb}    |  3 +-
 2 files changed, 1 insertion(+), 37 deletions(-)
 delete mode 100644 meta/recipes-graphics/pango/pango/0001-tests-meson.build-install-nofonts-fonts.conf-as-it-i.patch
 rename meta/recipes-graphics/pango/{pango_1.50.11.bb => pango_1.50.12.bb} (90%)

diff --git a/meta/recipes-graphics/pango/pango/0001-tests-meson.build-install-nofonts-fonts.conf-as-it-i.patch b/meta/recipes-graphics/pango/pango/0001-tests-meson.build-install-nofonts-fonts.conf-as-it-i.patch
deleted file mode 100644
index 8dacd62138..0000000000
--- a/meta/recipes-graphics/pango/pango/0001-tests-meson.build-install-nofonts-fonts.conf-as-it-i.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 13f8ba5d5b699df1f88eeea859406daba6d6941f Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Tue, 8 Nov 2022 18:08:51 +0100
-Subject: [PATCH] tests/meson.build: install nofonts/fonts.conf as it is
- required by tests
-
-Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/pango/-/merge_requests/654]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- tests/meson.build | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/tests/meson.build b/tests/meson.build
-index 8b4bfa38..6c1c461b 100644
---- a/tests/meson.build
-+++ b/tests/meson.build
-@@ -250,6 +250,10 @@ foreach d: test_items_data
-   installed_test_items_data += d + '.expected'
- endforeach
- 
-+installed_test_nofonts_data = [
-+  'nofonts/fonts.conf',
-+]
-+
- installed_test_datadir = join_paths(pango_datadir, 'installed-tests', 'pango')
- installed_test_bindir = join_paths(pango_libexecdir, 'installed-tests', 'pango')
- 
-@@ -261,6 +265,7 @@ if get_option('install-tests')
-   install_data(installed_test_breaks_data, install_dir: join_paths(installed_test_bindir, 'breaks'))
-   install_data(installed_test_items_data, install_dir: join_paths(installed_test_bindir, 'itemize'))
-   install_data(installed_test_fontsets_data, install_dir: join_paths(installed_test_bindir, 'fontsets'))
-+  install_data(installed_test_nofonts_data, install_dir: join_paths(installed_test_bindir, 'nofonts'))
- endif
- 
- gen_installed_test = files([ 'gen-installed-test.py' ])
diff --git a/meta/recipes-graphics/pango/pango_1.50.11.bb b/meta/recipes-graphics/pango/pango_1.50.12.bb
similarity index 90%
rename from meta/recipes-graphics/pango/pango_1.50.11.bb
rename to meta/recipes-graphics/pango/pango_1.50.12.bb
index 6f599f5b78..6779f39c4f 100644
--- a/meta/recipes-graphics/pango/pango_1.50.11.bb
+++ b/meta/recipes-graphics/pango/pango_1.50.12.bb
@@ -22,10 +22,9 @@ GIR_MESON_DISABLE_FLAG = "disabled"
 
 SRC_URI += "file://run-ptest \
            file://0001-Skip-running-test-layout-test.patch \
-           file://0001-tests-meson.build-install-nofonts-fonts.conf-as-it-i.patch \
            "
 
-SRC_URI[archive.sha256sum] = "8800f812d89ee61388188703203f3a7878963c22f8695aaf1fa0a1a1428d17ae"
+SRC_URI[archive.sha256sum] = "caef96d27bbe792a6be92727c73468d832b13da57c8071ef79b9df69ee058fe3"
 
 DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi"
 
-- 
2.25.1


