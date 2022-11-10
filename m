Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E581AC4332F
	for <webhook@archiver.kernel.org>; Thu, 10 Nov 2022 18:13:05 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.7.1668103982787486239
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Nov 2022 10:13:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KzHoZVmq;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id h9so3511964wrt.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 10:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oKTXlh3znZ5QUfyP/brlqFsUWBkvMxKgNg/1fB2mHO8=;
        b=KzHoZVmqzfpPP6QdEZuJhTpNdBB5E4YTxmzgKL4EDqk+rEW1/k5eePOXq4iULjz0eB
         VU6ijvc1k7AyA+DSKxiIpRumKv2eMU7VHrvW3Hqk39z36rAcleesAuGy5ecV/Qj0kiuI
         7p3Nzsyo7aIWohuzgUCtLAjE0BgLP0XP9u00k5hW3c7ZFBzjZmphR00OnNm4Gxd4nKj0
         emgZZrY3lX0yHkwlZ44tKW8kNIUQWFpZMcCjRbTNQo1QwlfpBp2NUhM4/6S9gBdixtza
         dzStn2Gmqy04sbvuSdG5e8ns1PuF9pSaUE3BRmSOeXhZTf5ZSy+liLciLX6XOhGmuOlQ
         M1ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oKTXlh3znZ5QUfyP/brlqFsUWBkvMxKgNg/1fB2mHO8=;
        b=j1XL7S5nu5Okn69xuEpJ/PfMW9q0I9/AripXT6v/KdsB+jLWhKE3OjZHMJkxxHRkgV
         jiiYTYgr+Rh4bQ0/HXg3O9nYpqAu9KE1arU3RGYGj2X+lF+7gfHDe3hlrKpEgU80/Tgr
         +TXJXFDIPNK5eCmFNiMizz1cUcUOLeRF+a6/2gZQlJo1lpUFDYzssYFdQjYSXbKmv0i8
         GDs3CLmr7KJBRTlR0nnp4O1rDCnGFPTn7x1+Dm/9NvzsCLi6xHTFUjBMciH8yC0JyAQK
         EodZaiWlaZdIv/r+ZAR4D66r8nRF7ir/lqBaWIGZyL+k8ft7ZKEfHTf75NKK2XVqFO5F
         P5XQ==
X-Gm-Message-State: ACrzQf0hTIgC6ljFlbKzqDGQ4r8gIQbaZm8wnckuITVerH9dUG90Zma0
	6fNIe9h70fTQ0UYC9dAcsf6q9704j9c=
X-Google-Smtp-Source: AMsMyM5M95WiafNb5vCQM6hYrQhBjgd8VSmSM5yRNvnUjHIwMQbVP17VhC5An62TnqQUH2/AqQC44g==
X-Received: by 2002:a5d:4804:0:b0:236:94d4:5472 with SMTP id l4-20020a5d4804000000b0023694d45472mr41870394wrq.286.1668103980948;
        Thu, 10 Nov 2022 10:13:00 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m3-20020a05600c3b0300b003b4ff30e566sm8400477wms.3.2022.11.10.10.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 10:13:00 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 01/19] pango: replace a recipe fix with an upstream submitted patch
Date: Thu, 10 Nov 2022 19:12:31 +0100
Message-Id: <20221110181249.1240200-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 18:13:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173084

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
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
2.30.2


