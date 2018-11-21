Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id A88896C513
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Nov 2018 13:57:41 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id c14so164356wrr.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Nov 2018 05:57:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=OLh7SsXydpkoVtj4Uo2ZQUMxZOpiJLa130K89COO3ug=;
	b=SrjrH96RPUkOHMOIg15HwA3RyX0QPXOtM2VgjA9BBdIN8wN/EQ4jXFWh2FnpYPTbIQ
	P4SKXc52GB5iLbdbGO8n3aM9FsPV3xVLT7N5JesXdwf6M3MaD2P/oajHgpUySkHBl4mq
	WNE9g8u/4naCNEYB8iy8Yy7eSsJG9T7Yv9OkoB6UpyJfESimKBZfAdAIA6CffP0oIB6J
	4u92NTrGPDhAitDql7SHigQ4La9GEvYxogYyaRFXdstKiuV5f1zqq99IYwW3q+L5neOX
	p4kVKbICshoxdwoXstzvBzxNpd2nErWOJhhV6uuzV4F36Q1TVPFsCEnLmFJleU9pbNdM
	NFJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=OLh7SsXydpkoVtj4Uo2ZQUMxZOpiJLa130K89COO3ug=;
	b=Gf/vaA64Nrs5MgGtw8qUmusJwafx4kosxhPfGIrGOwaN+uzQEzzV8gLzL9t4fPKtsH
	nqBGFGrc7aeku+z2vsgX4rv2ewSfOsI1HQDVE2ZsGmAoiUVwSlj/9EfzmSh94R/L0djT
	ENJCNBf5azxknW3msPYMl9oDB0rDli3Ji1x8balbMns7PBqM8o4Ekz3eE/E7yJ4FSLQS
	XdpXxrpxiyzlBCdFHPGBPtqMr+mzxt4peRPG1SnpGXR4gOfUYG2RHzlRGgPalo+vkbM8
	0FhfGTYuzq8GDCRG3MBy4zW7EoFqr4G8GQgPuAQMeGZnq1vRmal5qjsXCRuNw52T9KTP
	Z3TA==
X-Gm-Message-State: AA+aEWaf83/rLGEQBYSx72CbRGZbvyxu4zz/jCrmCgAE7RoWJFSxLLBt
	OmZqW56vOU7Xun07E/HZMHwfQAm6
X-Google-Smtp-Source: AFSGD/WEYEzbPA9lOHVZjYksQjwO2Bq21CLdDUdKwFO5XK1gY4s5EyTZcCeVIpaMxtPiK4VcmmcwYg==
X-Received: by 2002:adf:c189:: with SMTP id
	x9-v6mr6157432wre.233.1542808662097; 
	Wed, 21 Nov 2018 05:57:42 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	o8sm11203560wrx.15.2018.11.21.05.57.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Nov 2018 05:57:41 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Nov 2018 14:57:26 +0100
Message-Id: <20181121135727.115509-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181121135727.115509-1-alex.kanavin@gmail.com>
References: <20181121135727.115509-1-alex.kanavin@gmail.com>
Subject: [PATCH 6/7] libcomps: add a patch to fix the missing crc32 symbol error under musl
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Nov 2018 13:57:42 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../0001-Add-crc32.c-to-sources-list.patch    | 47 +++++++++++++++++++
 .../recipes-devtools/libcomps/libcomps_git.bb |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-devtools/libcomps/libcomps/0001-Add-crc32.c-to-sources-list.patch

diff --git a/meta/recipes-devtools/libcomps/libcomps/0001-Add-crc32.c-to-sources-list.patch b/meta/recipes-devtools/libcomps/libcomps/0001-Add-crc32.c-to-sources-list.patch
new file mode 100644
index 00000000000..ff90269a230
--- /dev/null
+++ b/meta/recipes-devtools/libcomps/libcomps/0001-Add-crc32.c-to-sources-list.patch
@@ -0,0 +1,47 @@
+From 83407aa50e06d967d0a1095a140bd7b0e5d51d27 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Wed, 21 Nov 2018 13:09:05 +0100
+Subject: [PATCH] Add crc32.c to sources list
+
+Otherwise, there is a missing symbol runtime error under musl C library.
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ libcomps/src/python/src/CMakeLists.txt | 4 ++--
+ libcomps/src/python/src/crc32.c        | 2 +-
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/libcomps/src/python/src/CMakeLists.txt b/libcomps/src/python/src/CMakeLists.txt
+index 6ed25bb..c15c8b2 100644
+--- a/libcomps/src/python/src/CMakeLists.txt
++++ b/libcomps/src/python/src/CMakeLists.txt
+@@ -9,13 +9,13 @@ set (pycomps_SRCDIR ${CMAKE_CURRENT_SOURCE_DIR})
+ set (pycomps_SRC pycomps.c pycomps_sequence.c
+      pycomps_envs.c pycomps_categories.c pycomps_groups.c
+      pycomps_gids.c pycomps_utils.c pycomps_dict.c pycomps_mdict.c
+-     pycomps_hash.c pycomps_exc.c pycomps_lbw.c)
++     pycomps_hash.c pycomps_exc.c pycomps_lbw.c crc32.c)
+ 
+ set (pycomps_HEADERS pycomps_23macros.h pycomps_sequence.h
+      pycomps_envs.h pycomps_categories.h pycomps_groups.h
+      pycomps_gids.h pycomps_utils.h pycomps_dict.h pycomps_mdict.h
+      pycomps_hash.h pycomps_exc.h pycomps_lbw.h
+-     pycomps_types.h)
++     pycomps_types.h crc32.h)
+ 
+ #set(TEST_FILES ../__init__.py __test.py test_merge_comps.py test_libcomps.py
+ #               utest.py)
+diff --git a/libcomps/src/python/src/crc32.c b/libcomps/src/python/src/crc32.c
+index d8f5e34..f266067 100644
+--- a/libcomps/src/python/src/crc32.c
++++ b/libcomps/src/python/src/crc32.c
+@@ -41,7 +41,7 @@
+  */
+ 
+ #include <sys/param.h>
+-#include <sys/systm.h>
++#include <stdint.h>
+ 
+ static uint32_t crc32_tab[] = {
+ 	0x00000000, 0x77073096, 0xee0e612c, 0x990951ba, 0x076dc419, 0x706af48f,
diff --git a/meta/recipes-devtools/libcomps/libcomps_git.bb b/meta/recipes-devtools/libcomps/libcomps_git.bb
index e69bf67729d..a0b6767b3df 100644
--- a/meta/recipes-devtools/libcomps/libcomps_git.bb
+++ b/meta/recipes-devtools/libcomps/libcomps_git.bb
@@ -6,6 +6,7 @@ SRC_URI = "git://github.com/rpm-software-management/libcomps.git \
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            file://0002-Set-library-installation-path-correctly.patch \
            file://0001-Make-__comps_objmrtree_all-static-inline.patch \
+           file://0001-Add-crc32.c-to-sources-list.patch \
            "
 
 PV = "0.1.8+git${SRCPV}"
-- 
2.17.1


