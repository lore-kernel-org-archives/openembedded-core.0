Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E16BC61DB3
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:06:11 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.9362.1672830357307718609
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:06:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jDmybmhn;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id h16so32517274wrz.12
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 03:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yn3rI7kIgPM/1wjJYYWMYGo7DYBCumAELyF4mq05kp8=;
        b=jDmybmhnKym8pVsntcldBLsIdXMbVt2DIsE2xbluTj3oCyb0Q/GWaGaangPDgTcgP2
         t955qO+XHs4i+fQAh6giMp1T/vMmys+lQPiKZCfz+CodouBuoHk+h6IjgDqNpafYQiTn
         2MLS0TTfRxBQoqJvW6hEyZ0BdViBfajWfibXVnYZt+2whwelR3JuS1kIc72wmr74LIGx
         e8lC9vQE4z25zPLJ+RJQxLyu4F3AS/oBNzdxWhCYEqgIXUaDIM02JyGSNom/h81qk/n3
         Ncp2j0QMQvhyKGjGG6sOhjgf+/hsez/n/LeiFTRs9B3CCjOLe7AU91SC1/Qe3tUfsGuW
         DGEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yn3rI7kIgPM/1wjJYYWMYGo7DYBCumAELyF4mq05kp8=;
        b=CDULuOlYRDu88ESm2sejqwwHKxdjYCqmiwhjjdPORrt80RF65p8gyH6CCFUSgJDW/P
         33xv6gSyGq8JYUo9iy9jbT1eU1IHXdxOrnruyZAW3mPE7a3KnHOzpCVC2nd6bLsDyk9u
         sxXDsMb3XOpV2fgWWpz66n/McOaTVbFldvq1GOk3LWOwJECmLVwlpQy35AZrChY9G2Z7
         QpdM5dh5ZUNJO6T8oiR4Rn4ZGb/A05I0LTsxbWkGDccYdohyb2Bm8MR6cHqrNue9sagA
         6vgee8HGbU0FKDq92DvDP7RNjVvJ3lvbcFPxah5qKpNHqt7VT1vluO/6MrFFr8ywgb51
         yZbw==
X-Gm-Message-State: AFqh2krkyp1klQRxsyMyH9DzGDfJcl6KZTcamwy6py7PBJ3zbgXzdE/R
	4b5QBYfTBn92rJiOddy6YgpczFEU+9c=
X-Google-Smtp-Source: AMrXdXstPufUMv2M9rApDPsU7DQAgfPQZLCszFQUVc0arbe/lRvUweIntaQ6k/2o0sHmEr5Uoj2QBQ==
X-Received: by 2002:adf:fc51:0:b0:27d:ddaa:8bd8 with SMTP id e17-20020adffc51000000b0027dddaa8bd8mr21483963wrs.13.1672830363042;
        Wed, 04 Jan 2023 03:06:03 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h15-20020adfaa8f000000b002421888a011sm34102161wrc.69.2023.01.04.03.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 03:06:02 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 13/77] pango: upgrade 1.50.11 -> 1.50.12
Date: Wed,  4 Jan 2023 12:04:44 +0100
Message-Id: <20230104110548.2537259-13-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104110548.2537259-1-alex@linutronix.de>
References: <20230104110548.2537259-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:06:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175397

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
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
2.30.2


