Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.1751.1599498160305013543
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2020 10:02:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=zN8OsmBo;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id k13so2741365plk.3
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2020 10:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=7LRIa9/kPoZXkvlIaEaHcelAyfFxXtu9bOSpMjClhu8=;
        b=zN8OsmBoEQXVcKnIH6ihBp6WRamWbfLsUO2+Wbd6D/KaUxiae/73DRS/NM+7E8upNB
         Jnggz8TrW7vF2gmmHSKRv06fz1TdEbgLabmPp5v6A8GQwAGN6rdNOAwcCItRLP3Ib990
         8pctAUmxhGgdd+E1d4kntE8B2+Gj715UMw54o0A6qRZ7FbWEBHBVJPRoz14cAQ+ysOUJ
         LxTgIiWu351QKoLIl5xv5zicwLGzgeH48DCFk8N7xDNsGCmCKe3rhjapnSlET+pXhYKY
         HvPe2eT4fyZQvTNRVGGhAk5mtKQzrlQOUBKbyaUg5Ccau8rKmzMnTHLH3N45dD9uMUQ0
         mMQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=7LRIa9/kPoZXkvlIaEaHcelAyfFxXtu9bOSpMjClhu8=;
        b=Lx0451JgCxqzyqExIjUUzMyKApCt73k0JQOQ/8GdfM2xiM6cNEXMK6tjLUsDpHoazE
         wKEAZZEXRJep2G1h4a47WTWLLw0UElOL8byTLCme6+B/6oGE2mhRn0uFtKJcvU+thi6b
         hJJc/EUu8BxuszXzPk/aNNJwuHsB2sjaguCqamhpgOEWsY6f5pXVeuXiEhpZ1/jJtl++
         LiR2pLps+rKWudD5w5a15sz68oNsiL0hIszrvT6T1poHUsgiPADvmwEn6oiekwCitp/X
         E629x2mzdxHW9SQFNOgF8utJxwQD7+0cEdmnVrjIQZCPAawI26f2vKVkIPKYI8bbB18u
         BJzw==
X-Gm-Message-State: AOAM532Sxbfz9RNnwR6YizmOqDF/ehKSLghKH+IJJ+012qFosSMf69QP
	6JqCazv7KrlVx2WGtVX5PyqdhjCMaE2XigGp
X-Google-Smtp-Source: ABdhPJyYGwyP0ybek3aU7na+luplCypkpldXxjJAgxzOjbIZasr/CSVpshOUJwmoIcyNhR+b2R8sww==
X-Received: by 2002:a17:902:7404:: with SMTP id g4mr20862218pll.176.1599498159399;
        Mon, 07 Sep 2020 10:02:39 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id s8sm16525902pfm.180.2020.09.07.10.02.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 10:02:38 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/18] cml1: Move find_cfgs() helper to cml1.bbclass
Date: Mon,  7 Sep 2020 07:02:04 -1000
Message-Id: <b0fb7f18f9091db50204ef1ebd5248739ddcd6c2.1599495862.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1599495862.git.steve@sakoman.com>
References: <cover.1599495862.git.steve@sakoman.com>

From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>

u-boot.inc and busybox.inc contain identical copies of this little
helper. They both inherit the cml1 class and use cml1_do_configure
right after having used this helper, and other recipes that want to
write similar logic for doing Kconfig via fragments will also need it
or something equivalent.

Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit af687c9137a3e8efe48afa6fd12866cf656ae913)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/cml1.bbclass             | 10 ++++++++++
 meta/recipes-bsp/u-boot/u-boot.inc    | 10 ----------
 meta/recipes-core/busybox/busybox.inc | 10 ----------
 3 files changed, 10 insertions(+), 20 deletions(-)

diff --git a/meta/classes/cml1.bbclass b/meta/classes/cml1.bbclass
index c7f6723cb3..8ab240589a 100644
--- a/meta/classes/cml1.bbclass
+++ b/meta/classes/cml1.bbclass
@@ -1,3 +1,13 @@
+# returns all the elements from the src uri that are .cfg files
+def find_cfgs(d):
+    sources=src_patches(d, True)
+    sources_list=[]
+    for s in sources:
+        if s.endswith('.cfg'):
+            sources_list.append(s)
+
+    return sources_list
+
 cml1_do_configure() {
 	set -e
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 23cc795cab..a88a7a1120 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -70,16 +70,6 @@ UBOOT_EXTLINUX_INSTALL_DIR ?= "/boot/extlinux"
 UBOOT_EXTLINUX_CONF_NAME ?= "extlinux.conf"
 UBOOT_EXTLINUX_SYMLINK ?= "${UBOOT_EXTLINUX_CONF_NAME}-${MACHINE}-${PR}"
 
-# returns all the elements from the src uri that are .cfg files
-def find_cfgs(d):
-    sources=src_patches(d, True)
-    sources_list=[]
-    for s in sources:
-        if s.endswith('.cfg'):
-            sources_list.append(s)
-
-    return sources_list
-
 do_configure () {
     if [ -n "${UBOOT_CONFIG}" ]; then
         unset i j
diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 6cfdcd7344..45aaa2b41c 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -133,16 +133,6 @@ do_prepare_config () {
 	fi
 }
 
-# returns all the elements from the src uri that are .cfg files
-def find_cfgs(d):
-    sources=src_patches(d, True)
-    sources_list=[]
-    for s in sources:
-        if s.endswith('.cfg'):
-            sources_list.append(s)
-
-    return sources_list
-
 do_configure () {
 	set -x
 	do_prepare_config
-- 
2.17.1

