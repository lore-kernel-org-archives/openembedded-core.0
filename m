Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F964C54EE9
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 12:31:04 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.6941.1662553857960859884
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 05:30:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Rovs5exf;
 spf=pass (domain: gmail.com, ip: 209.85.218.52,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id gb36so29952574ejc.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 05:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=jKNP5j85Z5CEq6Dcl/SxdLeFUJgupYKzTGK8ROso86g=;
        b=Rovs5exfuTvp08dAuZISnhQGFCqnR5wVVMydihikdKttb8BpGL9AgT37iCvhYT86cP
         K5GXHvp6cJf4IXdDGxexINMvNRNWfM9NOsuNRu+IGqP0c7Z3WuRfRuCz3NlteP8ukvob
         dj2vT5GctAxDj3A57CXBkCRx73YtlLAuUX+9i2FlULOtUfPOqzsJ+jUwg6OwZ3gphXg2
         YZ8/0rfnW2AQBTKGgusT65bf3tKyBSB5kc52Mc/bTsp4r26XqPbbV29GuY2/udhxGJXR
         6QgRH3+di4h3858Z5hQiTNSZ3igcA8yiYHebIHRdGjQqJ890KjDy/pc5KcC2lUFiL+0B
         K8xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=jKNP5j85Z5CEq6Dcl/SxdLeFUJgupYKzTGK8ROso86g=;
        b=i+WaZic+brUwMsbDUMM/+Yb6JI/YjEL8aQFurXCcZognyaO53NQ8cGxBtVr3vnT4Yp
         XL7VZI20z/SMIEIxz96O3W33PsJrTlWZvVbqWJnzMnVdlap5cF8NNIjXSC0+Okx7Pp05
         ULWj29Yvdpb0ZC3vzPKCT98FoSnQUorZ3PbYYlnAlkYSe6f7XRpH+7AOxkmlzK1inwl2
         O9U3OxVUs6wiuTNFZz1Y1I+VIHxHt8utDtDTSVscAubFHA+sp/aOfxCZWLv2/XfKKWbv
         dL2BAu364Elfin6qjVF+rlSbF08v7eh5Jtr0rkVgT7shcKhtEQ/6lk8l8oRIcP0nqaOw
         lFvQ==
X-Gm-Message-State: ACgBeo2pa+cWMfJVDFi2A44DxOrwM1ot4gE4fe6MolU2cgniMwci6YsS
	q95f/t/5+A7KTsem/NYBgpuiqTHecpI=
X-Google-Smtp-Source: 
 AA6agR5dAh+TZ8S62438ufDqQs7Y/SN7eClOYzTRNCI91WAszcXi2kHppS+xhvBECT4EW1T/2q0j1g==
X-Received: by 2002:a17:907:9603:b0:742:9ed3:3af2 with SMTP id
 gb3-20020a170907960300b007429ed33af2mr2156279ejc.510.1662553856319;
        Wed, 07 Sep 2022 05:30:56 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 b9-20020a1709063ca900b0073dbfd33a8dsm8394208ejh.21.2022.09.07.05.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 05:30:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH 1/2] webkitgtk: fix gstreamer include paths
Date: Wed,  7 Sep 2022 14:30:51 +0200
Message-Id: <20220907123052.1234483-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Sep 2022 12:31:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170387

* fixes:
  http://errors.yoctoproject.org/Errors/Details/671441/

  cc1plus: error: include location "/usr/include/gstreamer-1.0" is unsafe for cross-compilation [-Werror=poison-system-directories]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../fix-gstreamer-include-paths.patch         | 51 +++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.36.7.bb  |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/fix-gstreamer-include-paths.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/fix-gstreamer-include-paths.patch b/meta/recipes-sato/webkit/webkitgtk/fix-gstreamer-include-paths.patch
new file mode 100644
index 0000000000..2c6be87902
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/fix-gstreamer-include-paths.patch
@@ -0,0 +1,51 @@
+From 25efd1478b48b5406fdab3b7b9c1f7e0ef95a7ed Mon Sep 17 00:00:00 2001
+From: Pablo Saavedra <psaavedra@igalia.com>
+Date: Mon, 27 Jun 2022 16:56:04 -0700
+Subject: [PATCH] Fix include gstreamer path on cross compiler toolchains
+ https://bugs.webkit.org/show_bug.cgi?id=241483
+
+Reviewed by Adrian Perez de Castro.
+
+Set the include paths for the gstreamer components to the full path
+using the find_path(). This function relies in CMAKE_FIND_ROOT_PATH to
+find the right place where the includes they are. This fixes possible
+warnings/errors on cross toolchains using -Wpoison-system-directories
+and -Werror=poison-system-directories.
+
+* Source/cmake/FindGStreamer.cmake:
+
+Canonical link: https://commits.webkit.org/251895@main
+
+Upstream-Status: Backport [2.37.1 https://github.com/WebKit/WebKit/commit/25efd1478b48b5406fdab3b7b9c1f7e0ef95a7ed]
+---
+ Source/cmake/FindGStreamer.cmake | 14 +++++++++++---
+ 1 file changed, 11 insertions(+), 3 deletions(-)
+
+diff --git a/Source/cmake/FindGStreamer.cmake b/Source/cmake/FindGStreamer.cmake
+index 3216f6974b53..b65a11f30871 100644
+--- a/Source/cmake/FindGStreamer.cmake
++++ b/Source/cmake/FindGStreamer.cmake
+@@ -75,12 +75,20 @@ macro(FIND_GSTREAMER_COMPONENT _component_prefix _pkgconfig_name _library)
+     # ${includedir}/gstreamer-1.0 which remains correct. The issue here is that
+     # we don't rely on the `Cflags`, cmake fails to generate a proper
+     # `.._INCLUDE_DIRS` variable in this case. So we need to do it here...
++
++    # Populate the list initially from the _INCLUDE_DIRS result variable.
++    set(${_component_prefix}_INCLUDE_DIRS ${PC_${_component_prefix}_INCLUDE_DIRS})
++
+     set(_include_dir "${PC_${_component_prefix}_INCLUDEDIR}")
+     string(REGEX MATCH "(.*)/gstreamer-1.0" _dummy "${_include_dir}")
++
+     if ("${CMAKE_MATCH_1}" STREQUAL "")
+-        set(${_component_prefix}_INCLUDE_DIRS "${_include_dir}/gstreamer-1.0;${PC_${_component_prefix}_INCLUDE_DIRS}")
+-    else ()
+-        set(${_component_prefix}_INCLUDE_DIRS "${PC_${_component_prefix}_INCLUDE_DIRS}")
++        find_path(${_component_prefix}_RESOLVED_INCLUDEDIR NAMES "${_include_dir}/gstreamer-1.0")
++        # Only add the resolved path from `_INCLUDEDIR` if found.
++        if (${_component_prefix}_RESOLVED_INCLUDEDIR)
++            list(APPEND ${_component_prefix}_INCLUDE_DIRS
++                 "${${_component_prefix}_RESOLVED_INCLUDEDIR}")
++        endif ()
+     endif ()
+ 
+     find_library(${_component_prefix}_LIBRARIES
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.36.7.bb b/meta/recipes-sato/webkit/webkitgtk_2.36.7.bb
index 026e24ae39..47e52e25da 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.36.7.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.36.7.bb
@@ -15,6 +15,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-Fix-build-without-opengl-or-es.patch \
            file://reproducibility.patch \
            file://0001-When-building-introspection-files-do-not-quote-CFLAG.patch \
+           file://fix-gstreamer-include-paths.patch \
            "
 SRC_URI[sha256sum] = "0c260cf2b32f0481d017670dfed1b61e554967cd067195606c9f9eb5fe731743"
 
-- 
2.37.3


