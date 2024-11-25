Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18AB7D58094
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 12:02:04 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.17240.1732536117242304093
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 04:01:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UdtwL9D5;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4314c4cb752so39653075e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 04:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732536115; x=1733140915; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5qgL1HHuAjkQguEW0yLFpcclOAsHqqGO7D38Cq14lSA=;
        b=UdtwL9D5sIAWnWtvF0SkiAxZKne76VRBakaqJOH/JxDVHJmane9IcQdpHj++tmO9di
         SOkXZgqnEPTNZfbkcMZ/AupiKedJ7EKulx1nQRJsbkQePoPj3X/RQx8Hg+iwnPg/F6Ft
         dPnjG/nOTHTmVfgnnW8SpbzHOG5AmHm3BXjaqVz9M+KN7YL8ES3O/s4nfsn7U+1LE9j2
         LSP50qpO646DpXVjI/qZtkCejYdSfqehZUSx5ZKRomFLl+6ifICEMAKB9zYu6eJMVX2N
         nLqh40gDWevjbQ3KmIa09OBYHlAzWL8d0p8VkDXwhMhTDIFUk2yJqB4fUIJbJaZCgIE5
         PgTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732536115; x=1733140915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5qgL1HHuAjkQguEW0yLFpcclOAsHqqGO7D38Cq14lSA=;
        b=U9VDZJNcwyBsGfrwQyDZ2kSpPdxvBD+/+P78rDPyp6AlphH0674+EJUY3L4lwoGAbi
         8hrZt52m1lWoyXhP1A2jEXC19NGHSi+hM+Hza65NJZSDDDmcHhnePZ8ZF8ZTFaJOfbkF
         pIDbmqZUMw7Euzoyo2IRKg8tg5ezDtiXvEINk/tc3y7dXT7a9CaI86RyP5nX8fqtSHg5
         0fOTXBbZU763TCRj2LR/+TZJw6K387+N7ninHCleT8Kq7OuOY987Fx8+kQka5OAxkd4E
         NDTRgwKlkhf0oz/ntQoxJvB63IvYJZq8XO/LqXpgz+EejCjyNFRNUwpWHFa+DKVBXMid
         ZMOw==
X-Gm-Message-State: AOJu0Yxky7ebOcEG0YRdHf5jRVsD/GdvlduOcqfgPHAQ4xRttvT+dfBR
	vca6JxJY22kTNNQdMfaJy6KGLUUhtQmcsPxWuOY+q00+uzdj6TcIzmsv3A==
X-Gm-Gg: ASbGncuuQe1YmmlVrtl5B+pkguRLNwwhqyitb8zxhvUlyMqgtckTmSxgAIt8ctLOH9Y
	4M6/1LgEm5zuXty2fETPvgMInbPxX75QJBzmyhhXY4LEQJnLK+HWmELV8kL8lglbqPFhJmJH69F
	ztmDs52QS7EVfUsu4n7rBzEdoTQaZZdO15AnXq9kmAAItIsbP/K8zav4e5VAxfOIcI5r8POkyGj
	JITX2uB7tu+AMhgePNWCBgEm7rWwmEHb6oKLXfc9PqKBN5QpaCT5PFmGHiatfh2AupXGpjwM7YW
	/0Oi9n7Iy74=
X-Google-Smtp-Source: AGHT+IFvrSb3+f3QP14KOcdbb631N1PbxHI06RtVcsIzLagyiGvd78Ghi78L/HX85zp17XXnn8YiOQ==
X-Received: by 2002:a7b:cd87:0:b0:434:9f0d:3839 with SMTP id 5b1f17b1804b1-4349f0d39bamr32563645e9.8.1732536113861;
        Mon, 25 Nov 2024 04:01:53 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4349e80e51esm44881115e9.33.2024.11.25.04.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 04:01:53 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 31/35] vulkan: upgrade 1.3.290.0 -> 1.3.296.0
Date: Mon, 25 Nov 2024 13:01:23 +0100
Message-Id: <20241125120127.2205232-31-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241125120127.2205232-1-alex.kanavin@gmail.com>
References: <20241125120127.2205232-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 12:02:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207780

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ....3.290.0.bb => spirv-headers_1.3.296.0.bb} |  2 +-
 ...sion.py-support-an-envvar-to-force-t.patch | 43 -------------------
 ..._1.3.290.0.bb => spirv-tools_1.3.296.0.bb} |  3 +-
 ...3.290.0.bb => vulkan-headers_1.3.296.0.bb} |  2 +-
 ....3.290.0.bb => vulkan-loader_1.3.296.0.bb} |  4 +-
 ...1.3.290.0.bb => vulkan-tools_1.3.296.0.bb} |  4 +-
 ... => vulkan-utility-libraries_1.3.296.0.bb} |  2 +-
 ... => vulkan-validation-layers_1.3.296.0.bb} |  4 +-
 ..._1.3.290.0.bb => vulkan-volk_1.3.296.0.bb} |  2 +-
 9 files changed, 11 insertions(+), 55 deletions(-)
 rename meta/recipes-graphics/spir/{spirv-headers_1.3.290.0.bb => spirv-headers_1.3.296.0.bb} (93%)
 delete mode 100644 meta/recipes-graphics/spir/spirv-tools/0001-update_build_version.py-support-an-envvar-to-force-t.patch
 rename meta/recipes-graphics/spir/{spirv-tools_1.3.290.0.bb => spirv-tools_1.3.296.0.bb} (93%)
 rename meta/recipes-graphics/vulkan/{vulkan-headers_1.3.290.0.bb => vulkan-headers_1.3.296.0.bb} (95%)
 rename meta/recipes-graphics/vulkan/{vulkan-loader_1.3.290.0.bb => vulkan-loader_1.3.296.0.bb} (95%)
 rename meta/recipes-graphics/vulkan/{vulkan-tools_1.3.290.0.bb => vulkan-tools_1.3.296.0.bb} (94%)
 rename meta/recipes-graphics/vulkan/{vulkan-utility-libraries_1.3.290.0.bb => vulkan-utility-libraries_1.3.296.0.bb} (95%)
 rename meta/recipes-graphics/vulkan/{vulkan-validation-layers_1.3.290.0.bb => vulkan-validation-layers_1.3.296.0.bb} (95%)
 rename meta/recipes-graphics/vulkan/{vulkan-volk_1.3.290.0.bb => vulkan-volk_1.3.296.0.bb} (95%)

diff --git a/meta/recipes-graphics/spir/spirv-headers_1.3.290.0.bb b/meta/recipes-graphics/spir/spirv-headers_1.3.296.0.bb
similarity index 93%
rename from meta/recipes-graphics/spir/spirv-headers_1.3.290.0.bb
rename to meta/recipes-graphics/spir/spirv-headers_1.3.296.0.bb
index 30280a5b5ec..bf7190379d1 100644
--- a/meta/recipes-graphics/spir/spirv-headers_1.3.290.0.bb
+++ b/meta/recipes-graphics/spir/spirv-headers_1.3.296.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://www.khronos.org/registry/spir-v"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d14ee3b13f42e9c9674acc5925c3d741"
 
-SRCREV = "2acb319af38d43be3ea76bfabf3998e5281d8d12"
+SRCREV = "2a9b6f951c7d6b04b6c21fe1bf3f475b68b84801"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=main"
 PE = "1"
 # These recipes need to be updated in lockstep with each other:
diff --git a/meta/recipes-graphics/spir/spirv-tools/0001-update_build_version.py-support-an-envvar-to-force-t.patch b/meta/recipes-graphics/spir/spirv-tools/0001-update_build_version.py-support-an-envvar-to-force-t.patch
deleted file mode 100644
index c596a3679a5..00000000000
--- a/meta/recipes-graphics/spir/spirv-tools/0001-update_build_version.py-support-an-envvar-to-force-t.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 39b6385454d705128e684ed779ba9620e2ead1e2 Mon Sep 17 00:00:00 2001
-From: Yoann Congal <yoann.congal@smile.fr>
-Date: Thu, 1 Aug 2024 18:58:04 +0200
-Subject: [PATCH] update_build_version.py: support an envvar to force the
- description
-
-FORCED_BUILD_VERSION_DESCRIPTION envvar can be used to force a version
-description instead of resorting to git describe which can change for a
-given commit if multiple lightweight commits point ot it.
-
-Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
-Upstream-Status: Backport [https://github.com/KhronosGroup/SPIRV-Tools/commit/bc4060ed274ad9749c20daced96d6f0518d6418e]
----
- utils/update_build_version.py | 9 +++++----
- 1 file changed, 5 insertions(+), 4 deletions(-)
-
-diff --git a/utils/update_build_version.py b/utils/update_build_version.py
-index bb66e18a..9115cab1 100755
---- a/utils/update_build_version.py
-+++ b/utils/update_build_version.py
-@@ -24,9 +24,10 @@
- #  - The software version deduced from the given CHANGES file.
- #  - A longer string with the project name, the software version number, and
- #    git commit information for the CHANGES file's directory.  The commit
--#    information is the output of "git describe" if that succeeds, or "git
--#    rev-parse HEAD" if that succeeds, or otherwise a message containing the
--#    phrase "unknown hash".
-+#    information is the content of the FORCED_BUILD_VERSION_DESCRIPTION
-+#    environement variable is it exists, else the output of "git describe" if
-+#    that succeeds, or "git rev-parse HEAD" if that succeeds, or otherwise a
-+#    message containing the phrase "unknown hash".
- # The string contents are escaped as necessary.
- 
- import datetime
-@@ -150,7 +151,7 @@ def main():
-       sys.exit(1)
- 
-     repo_path = os.path.dirname(changes_file_path)
--    description = describe(repo_path)
-+    description = os.getenv("FORCED_BUILD_VERSION_DESCRIPTION", describe(repo_path))
-     content = OUTPUT_FORMAT.format(version_tag=version, description=description)
- 
-     # Escape file content.
diff --git a/meta/recipes-graphics/spir/spirv-tools_1.3.290.0.bb b/meta/recipes-graphics/spir/spirv-tools_1.3.296.0.bb
similarity index 93%
rename from meta/recipes-graphics/spir/spirv-tools_1.3.290.0.bb
rename to meta/recipes-graphics/spir/spirv-tools_1.3.296.0.bb
index d0f1c387f1c..dd393cae309 100644
--- a/meta/recipes-graphics/spir/spirv-tools_1.3.290.0.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_1.3.296.0.bb
@@ -7,9 +7,8 @@ SECTION = "graphics"
 LICENSE  = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRCREV = "0cfe9e7219148716dfd30b37f4d21753f098707a"
+SRCREV = "6dcc7e350a0b9871a825414d42329e44b0eb8109"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=main;protocol=https \
-           file://0001-update_build_version.py-support-an-envvar-to-force-t.patch \
            "
 PE = "1"
 # These recipes need to be updated in lockstep with each other:
diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.3.290.0.bb b/meta/recipes-graphics/vulkan/vulkan-headers_1.3.296.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-headers_1.3.290.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-headers_1.3.296.0.bb
index 9f17ddc525c..68f8f5b0a1e 100644
--- a/meta/recipes-graphics/vulkan/vulkan-headers_1.3.290.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-headers_1.3.296.0.bb
@@ -11,7 +11,7 @@ LICENSE = "Apache-2.0 & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=1bc355d8c4196f774c8b87ed1a8dd625"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=main;protocol=https"
 
-SRCREV = "b379292b2ab6df5771ba9870d53cf8b2c9295daf"
+SRCREV = "29f979ee5aa58b7b005f805ea8df7a855c39ff37"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-loader_1.3.290.0.bb b/meta/recipes-graphics/vulkan/vulkan-loader_1.3.296.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-loader_1.3.290.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-loader_1.3.296.0.bb
index c5b25be9ef1..92ed18c2999 100644
--- a/meta/recipes-graphics/vulkan/vulkan-loader_1.3.290.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-loader_1.3.296.0.bb
@@ -9,8 +9,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7dbefed23242760aa3475ee42801c5ac"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=main;protocol=https"
-SRCREV = "40b8e6eeead809a62c708cb48fdd9f8f2eab3f15"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=vulkan-sdk-1.3.296;protocol=https"
+SRCREV = "7aeb5e4324957b6f60dac5c8cedb955df4fecbfb"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.3.290.0.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.3.296.0.bb
similarity index 94%
rename from meta/recipes-graphics/vulkan/vulkan-tools_1.3.290.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-tools_1.3.296.0.bb
index 9ef7d4daeaa..5f83f4f2467 100644
--- a/meta/recipes-graphics/vulkan/vulkan-tools_1.3.290.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-tools_1.3.296.0.bb
@@ -6,8 +6,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=main;protocol=https"
-SRCREV = "53a6ba7c235cbe0b0f3e85e3de6d9070bcfec710"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=vulkan-sdk-1.3.296;protocol=https"
+SRCREV = "74dd90abd69f813220b572e1d89c17bc7784972d"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.290.0.bb b/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.296.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.290.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.296.0.bb
index 475386069f0..3ea50ff832c 100644
--- a/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.290.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.296.0.bb
@@ -10,7 +10,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=4ca2d6799091aaa98a8520f1b793939b"
 
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Utility-Libraries.git;branch=main;protocol=https"
-SRCREV = "5f26cf65a18bc89a8e3d6569c14314b6fdac8d4d"
+SRCREV = "0a786ee3e4fd3602f68ff0ffd9fdcb12e0efb646"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.290.0.bb b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.296.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.290.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.296.0.bb
index cfb8954f873..a5f93bc3f14 100644
--- a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.290.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.296.0.bb
@@ -8,8 +8,8 @@ SECTION = "libs"
 LICENSE = "Apache-2.0 & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=cd3c0bc366cd9b6a906e22f0bcb5910f"
 
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;branch=vulkan-sdk-1.3.290;protocol=https"
-SRCREV = "a92629196a4fed15e59c74aa965dd47bd5ece3b7"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;branch=vulkan-sdk-1.3.296;protocol=https"
+SRCREV = "9935cdd6f9524b1da1e140393fa69a0a1b72125d"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-volk_1.3.290.0.bb b/meta/recipes-graphics/vulkan/vulkan-volk_1.3.296.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-volk_1.3.290.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-volk_1.3.296.0.bb
index e1bad6a96d7..bed42934902 100644
--- a/meta/recipes-graphics/vulkan/vulkan-volk_1.3.290.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-volk_1.3.296.0.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=12e6af3a0e2a5e5dbf7796aa82b64626"
 
 SRC_URI = "git://github.com/zeux/volk.git;branch=master;protocol=https"
-SRCREV = "466085407d5d2f50583fd663c1d65f93a7709d3e"
+SRCREV = "59d26900f53c7621a8ba8ab0e3f18d3bd883fa9a"
 
 S = "${WORKDIR}/git"
 
-- 
2.39.5


