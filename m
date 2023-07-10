Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AB6BEB64DA
	for <webhook@archiver.kernel.org>; Mon, 10 Jul 2023 19:12:42 +0000 (UTC)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
 by mx.groups.io with SMTP id smtpd.web11.48800.1689016354016166901
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jul 2023 12:12:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=vmvq1UPl;
 spf=pass (domain: baylibre.com, ip: 209.85.222.41, mailfrom: tgamblin@baylibre.com)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-784f7f7deddso1477251241.3
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 12:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689016352; x=1691608352;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=fUKK+jNYK8KwRscJTYPwRDj7edlSPuZM5uOp36X61uA=;
        b=vmvq1UPl579RcyMwLYmDwbb1mXzkZICvbkP/Z4MesK+tKeIo3vDwXa+KcCkuWRB+j4
         F3DUBkbrK0U5UlhKJoOLDmckdt/tHG790HzuJQrb0l25V5cVb0JFr/Ef4n+WNTdVqL9P
         6fW+y3PE7/8E1cd5MANN4hDe5IGGQ7Y22LYrfeIFCAc7IgDWDIwkgjzgVeTlAuixxDBv
         3grmNThNNWq2KXul3n4hbBM7ycquYfP3EDdM+r+FjolgOLNd+zyqQNSU5vPf5OGEjYU+
         fzO4tg4EyN9YIVgJzXvP63aoZk8OeTUx9ZCmZYc5CF7l/eVdsgAX3KVu6OPW3vz0X3w7
         lc1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689016352; x=1691608352;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fUKK+jNYK8KwRscJTYPwRDj7edlSPuZM5uOp36X61uA=;
        b=lqmoJL6ELgj/5sH8Y8VIhhgRwOrG2sM/pUpWherwxF4Pu6ZlA6QZmhQ3aiUHleVyQJ
         +MhVyoIt1H9Ay9JlwouBqlb4NCK9RVj7vRWok+FC+XNU1cpmpUI07c9LhL5V+IiXrkzv
         /qUZvaDftjJMnwl3OezFcREhyqRAfENEUOTu2Un2KsQElk9a7htfOnc6X62MG+vz5X/p
         oe6fyeAKUX2XnvaMfLUlhpswceUp3Pjs7+CL+9fryZqA923ic4bGb1raodYGybIi8srE
         m/HYE9tfZ8qHOnErJvL0JRSuoCbD/H+qrSiTbPycxEDTDm9g3kgzFK9AKWmlM1drUi1/
         bUXg==
X-Gm-Message-State: ABy/qLYJqfidiCln3EDuq3juJp3lTNwnwf6Xj5tbEMsvFUQcR029Wae/
	yMX0B+H5T38/6dd3dREe7hdxARQV30jlW/Nckkw=
X-Google-Smtp-Source: APBJJlFfSrmN/qiLmBOSPRBE1o9hNSmV/x8sAlrMOyI0efbb/Ik7WOjHJ4jvH8Z5xmIjrl6r8cD9Aw==
X-Received: by 2002:a67:e290:0:b0:443:6e00:d32 with SMTP id g16-20020a67e290000000b004436e000d32mr6659361vsf.8.1689016352513;
        Mon, 10 Jul 2023 12:12:32 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id f1-20020a0ccc81000000b0062df95d7ef6sm120441qvl.115.2023.07.10.12.12.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 12:12:32 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] python3-setuptools: upgrade 67.6.1 -> 68.0.0
Date: Mon, 10 Jul 2023 15:12:31 -0400
Message-ID: <20230710191231.170744-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 19:12:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184094

AUH upgrade failed because the LICENSE checksum no longer matched. This
is because the attribution in the file was removed upstream in v67.8.0.
Patch fuzz also needed to be upgraded for
0001-conditionally-do-not-fetch-code-by-easy_install.patch.

Changelog: https://setuptools.pypa.io/en/stable/history.html

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...itionally-do-not-fetch-code-by-easy_install.patch | 12 +++++++-----
 ...ptools_67.6.1.bb => python3-setuptools_68.0.0.bb} |  4 ++--
 2 files changed, 9 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_67.6.1.bb => python3-setuptools_68.0.0.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
index 4d56dc89ba..1e5ab498a4 100644
--- a/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
@@ -1,4 +1,4 @@
-From 2b06ca797d3ccc5b195aaa04a085c44bf61d4de3 Mon Sep 17 00:00:00 2001
+From 5e603da9c01ccb828a03ea3e82d15599971f794f Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 17 Jul 2018 10:13:38 +0800
 Subject: [PATCH] conditionally do not fetch code by easy_install
@@ -9,17 +9,16 @@ internet by easy_install.
 Upstream-Status: Inappropriate [oe specific]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
 ---
  setuptools/command/easy_install.py | 5 +++++
  1 file changed, 5 insertions(+)
 
 diff --git a/setuptools/command/easy_install.py b/setuptools/command/easy_install.py
-index 444d3b3..61e445a 100644
+index 0b8d1159..93308060 100644
 --- a/setuptools/command/easy_install.py
 +++ b/setuptools/command/easy_install.py
-@@ -648,6 +648,11 @@ class easy_install(Command):
-             os.path.exists(tmpdir) and rmtree(tmpdir)
+@@ -644,6 +644,11 @@ class easy_install(Command):
+             os.path.exists(tmpdir) and _rmtree(tmpdir)
  
      def easy_install(self, spec, deps=False):
 +        if os.environ.get('NO_FETCH_BUILD', None):
@@ -30,3 +29,6 @@ index 444d3b3..61e445a 100644
          with self._tmpdir() as tmpdir:
              if not isinstance(spec, Requirement):
                  if URL_SCHEME(spec):
+-- 
+2.41.0
+
diff --git a/meta/recipes-devtools/python/python3-setuptools_67.6.1.bb b/meta/recipes-devtools/python/python3-setuptools_68.0.0.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-setuptools_67.6.1.bb
rename to meta/recipes-devtools/python/python3-setuptools_68.0.0.bb
index ad0d7cc527..4ac789d18c 100644
--- a/meta/recipes-devtools/python/python3-setuptools_67.6.1.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_68.0.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "Download, build, install, upgrade, and uninstall Python packages"
 HOMEPAGE = "https://pypi.org/project/setuptools"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;beginline=1;endline=19;md5=7a7126e068206290f3fe9f8d6c713ea6"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=141643e11c48898150daa83802dbc65f"
 
 inherit pypi python_setuptools_build_meta
 
@@ -11,7 +11,7 @@ SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 SRC_URI += " \
             file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
 
-SRC_URI[sha256sum] = "257de92a9d50a60b8e22abfcbb771571fde0dbf3ec234463212027a4eeecbe9a"
+SRC_URI[sha256sum] = "baf1fdb41c6da4cd2eae722e135500da913332ab3f2f5c7d33af9b492acb5235"
 
 DEPENDS += "${PYTHON_PN}"
 
-- 
2.41.0


