Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13952C433EF
	for <webhook@archiver.kernel.org>; Wed, 10 Nov 2021 19:40:01 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web12.337.1636573199920922954
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 11:40:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=O52h+IUk;
 spf=pass (domain: gmail.com, ip: 209.85.128.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id o29so3202777wms.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 11:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vXpN8SV819iQB8p+4Ai2U+TKGfi4pCVx0L3aBH+QjaE=;
        b=O52h+IUkZ0tOVf/QKUMWzKZSI7pnJNDd7XKIV31exEQLaDX+C/O6Hdyun3XorTTpcB
         IsczSASYUgSrEi61/+GMXINzwb/8n0tkzBzawvoEPIBEIbcl5bLqovF+ZOJeNpgs+jo0
         njeFMYRLUOuWGVDADtpTHG+Ywo246BN5/0jQ6n8q9o60noNWhRDdHErjMUKEwNtRfvTL
         7jnCL7hOriwIKB4/ItTSLIlHEBw8n5jvMKUrdJEQSX82P88PlV7uL/SDGvhaCXbqHWkZ
         J2t+LiiaYHsQVjseq6Nkz/vHX/xfpg5Kvpvjlx6nZqqpAbGOtDnljWfyIHsr3HV+CZtN
         5Uog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vXpN8SV819iQB8p+4Ai2U+TKGfi4pCVx0L3aBH+QjaE=;
        b=ko8fAeYnDVWIY8hZDQjENw2NxTq4nfGAiZV8iwuPHe3igbuJiG/kwLMUn4dFodLMow
         mdYH9UogxSVsFqG+phgOBpF5SIdTmKA013P0KSn99bcI9D8lG9R/XOdYE6FCs0GDCvXc
         UiLXIiNWvtekkblSPbZX7N4VK5z+JBwO/zBogNM5yz5XQ1jKbQdqLITFeJ5i2uuFL0xj
         lYXuVhjMbfpAT6SW712v9xuYEABUZojGvtXMDRfxIfrutrs98dIdlkj/v5qJ4t/TCetx
         ZWZq1qlKG+VHLjghd2XWiO2euK9yXUlB8dQ+QnVaIanu4IgTkYUIrOAxOlkdQ9YCPP14
         6HDg==
X-Gm-Message-State: AOAM533j24vDeLUv9zvKOq4RxS6Z0Zh/+eeiiE/POkETC9LjzAlrHdcb
	MJ8P1BE84mz3M4Rjjf3G4yUsGANKOJg=
X-Google-Smtp-Source: 
 ABdhPJxDH8UzfT1ENG3azBY5IKpWJZB0BDVgza7ul3Z659IAEd7WoKqP2SKsHLg4lvbeBPbwMbElnw==
X-Received: by 2002:a7b:c764:: with SMTP id x4mr19773336wmk.78.1636573198527;
        Wed, 10 Nov 2021 11:39:58 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 q18sm6865124wmc.7.2021.11.10.11.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 11:39:58 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 22/24] shared-mime-info: fix meson 0.60 builds
Date: Wed, 10 Nov 2021 20:39:35 +0100
Message-Id: <20211110193937.2606747-22-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211110193937.2606747-1-alex@linutronix.de>
References: <20211110193937.2606747-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Nov 2021 19:40:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158106

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...tom-itstool-to-builtin-msgfmt-for-cr.patch | 70 +++++++++++++++++++
 .../shared-mime-info/shared-mime-info_git.bb  |  4 +-
 2 files changed, 73 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/shared-mime-info/files/0001-migrate-from-custom-itstool-to-builtin-msgfmt-for-cr.patch

diff --git a/meta/recipes-support/shared-mime-info/files/0001-migrate-from-custom-itstool-to-builtin-msgfmt-for-cr.patch b/meta/recipes-support/shared-mime-info/files/0001-migrate-from-custom-itstool-to-builtin-msgfmt-for-cr.patch
new file mode 100644
index 0000000000..d09013bb3c
--- /dev/null
+++ b/meta/recipes-support/shared-mime-info/files/0001-migrate-from-custom-itstool-to-builtin-msgfmt-for-cr.patch
@@ -0,0 +1,70 @@
+From 5ca815cb79f64fab9cbb428b95a861fc0c30c116 Mon Sep 17 00:00:00 2001
+From: Eli Schwartz <eschwartz@archlinux.org>
+Date: Mon, 8 Nov 2021 18:22:47 -0500
+Subject: [PATCH] migrate from custom itstool to builtin msgfmt for creating
+ translated XML
+
+gettext upstream has supported this for a very long time, and using it
+means we don't need to jump through hoops to run ninja inside ninja in
+order to generate the .mo files for itstool.
+
+Although meson 0.60.0 added support for real targets for the built .mo
+files, this changed the rules for output filenames, breaking the script.
+But msgfmt does not care, and anyways comes with builtin meson functions
+for convenient use.
+
+Fixes #170
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/xdg/shared-mime-info/-/merge_requests/162]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ data/freedesktop_generate.sh | 12 ------------
+ data/meson.build             | 16 +++++-----------
+ 2 files changed, 5 insertions(+), 23 deletions(-)
+ delete mode 100755 data/freedesktop_generate.sh
+
+diff --git a/data/freedesktop_generate.sh b/data/freedesktop_generate.sh
+deleted file mode 100755
+index ff13e75..0000000
+--- a/data/freedesktop_generate.sh
++++ /dev/null
+@@ -1,12 +0,0 @@
+-#!/bin/sh -e
+-
+-src_root="$1"
+-build_root="$2"
+-
+-ninja -C "${build_root}" shared-mime-info-gmo
+-
+-itstool \
+-    --its "${src_root}/data/its/shared-mime-info.its" \
+-    --join "${src_root}/data/freedesktop.org.xml.in" \
+-    -o "${build_root}/data/freedesktop.org.xml" \
+-    "${build_root}/po/"*".gmo"
+diff --git a/data/meson.build b/data/meson.build
+index 263567d..c5696f2 100644
+--- a/data/meson.build
++++ b/data/meson.build
+@@ -1,18 +1,12 @@
+ 
+ install_man('update-mime-database.1')
+ 
+-freedesktop_org_xml = custom_target('freedesktop.org.xml',
+-    input : files(
+-        'freedesktop.org.xml.in',
+-        'its/shared-mime-info.its',
+-        'its/shared-mime-info.loc',
+-    ),
++freedesktop_org_xml = i18n.merge_file(
++    input: 'freedesktop.org.xml.in',
+     output: 'freedesktop.org.xml',
+-    command: [
+-        find_program('freedesktop_generate.sh'),
+-        meson.source_root(),
+-        meson.build_root()
+-    ],
++    data_dirs: '.',
++    po_dir: '../po',
++    type: 'xml',
+     install: true,
+     install_dir: get_option('datadir') / 'mime' / 'packages',
+ )
diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb b/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb
index 2dca36a7df..69f147ebce 100644
--- a/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb
@@ -8,7 +8,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS = "libxml2 itstool-native glib-2.0 shared-mime-info-native xmlto-native"
 
-SRC_URI = "git://gitlab.freedesktop.org/xdg/shared-mime-info.git;protocol=https;branch=master"
+SRC_URI = "git://gitlab.freedesktop.org/xdg/shared-mime-info.git;protocol=https;branch=master \
+           file://0001-migrate-from-custom-itstool-to-builtin-msgfmt-for-cr.patch \
+           "
 SRCREV = "18e558fa1c8b90b86757ade09a4ba4d6a6cf8f70"
 PV = "2.1"
 S = "${WORKDIR}/git"
-- 
2.20.1


