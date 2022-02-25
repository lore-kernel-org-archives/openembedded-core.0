Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 774C4C433EF
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 14:27:25 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web09.6934.1645799245121720969
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:27:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=6F1NBSRO;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id 75so4804414pgb.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:27:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=cx2b/ieFMl1it9QL1AQQ4QyMzEqpI+3IBXcbQporKXk=;
        b=6F1NBSRO7pYeHeJAfCifs7pCEEwFT7HX7UWcG/3h0RygJhTUEJWWHdQ/Itaewtf7RK
         Fyw8s8Yi9h4MAvtSnqC5zHC4wLM7jUTdsH/o5RcOY14wdbBb43UkNqrjSkPSq+ekqpTg
         PS38CBh3xDIwdl0R7P2Fw/Uva4koWhwyuHh7YJFowpAknL1okn16/zrMjUDiyN9Hz9hH
         IimgBnSVItgDl85UPvP789UQhKtJxw/cGe2AR2GD16AFGAkmaBYVxLZmKmHdOT4Hby1m
         2bgNyPryOs+YBUx0UgadbRY48DXZ/wDPXB5DmuXVbmfza53g1iQ6xh8ulSH2VJgIGyp8
         LOHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cx2b/ieFMl1it9QL1AQQ4QyMzEqpI+3IBXcbQporKXk=;
        b=n32/a90fSzjPuUHmIpoy1Ebjb49OMU6Udm5/sIoZvl5js8IoOyTq2edBmxm+rkrHKD
         ob//g1lXlOCkiNHo9vRyrdLOmMcmmW1Ovv1FFvSgSLvUmJdZlkMMxFfyBJS01iSkZ8NF
         +2cSqb3rXKQ8LXBPbFFRPTOkmkqmnvh7ygfs3pATzn68EIPNCoVmlnKBHAkzgUoe1irS
         iLRUH0ubinmTOYKkVRzG+q+m5/69s7dVJdnGHKFqV56MMeL2Rjz9S2ew+5WE66GjMEJh
         X54og6KSo089GHFTLHpkzZvZMKRFBN1C0RwTuZIeci8WErg0PseeTV3q1p3jL+jeqFWK
         pxuQ==
X-Gm-Message-State: AOAM5306Vf0OVezZh+yr7VZj3m0gqOY/oEBg45OjqRnf1nKOpQPz77RR
	YZ2bvgCux8i7Bl25codI1pnsZHF/p+wIo2C3
X-Google-Smtp-Source: 
 ABdhPJwyrGIe6Zi1M+g6znkwoaBmy2VxGvhrFXdeWt0+NfGnLC5mMjzeQxdZi0Y8rjCvKXMd/LGGZQ==
X-Received: by 2002:a63:7e44:0:b0:378:5645:90f6 with SMTP id
 o4-20020a637e44000000b00378564590f6mr615404pgn.505.1645799244100;
        Fri, 25 Feb 2022 06:27:24 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h17-20020a63df51000000b0036b9776ae5bsm2864538pgj.85.2022.02.25.06.27.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 06:27:23 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 16/50] grub: fix an unitialized re_token in gnulib
Date: Fri, 25 Feb 2022 04:25:56 -1000
Message-Id: 
 <0ce9c21b776ef6bfeaef665829324d7a04c22ce9.1645798648.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645798648.git.steve@sakoman.com>
References: <cover.1645798648.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Feb 2022 14:27:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162362

From: Marta Rybczynska <rybczynska@gmail.com>

This patch adds a fix for an unitialized re_token in grub's gnulib.
It is a part of a security series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...b-regcomp-Fix-uninitialized-re_token.patch | 55 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0012-gnulib-regcomp-Fix-uninitialized-re_token.patch

diff --git a/meta/recipes-bsp/grub/files/0012-gnulib-regcomp-Fix-uninitialized-re_token.patch b/meta/recipes-bsp/grub/files/0012-gnulib-regcomp-Fix-uninitialized-re_token.patch
new file mode 100644
index 0000000000..0507e0cd66
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0012-gnulib-regcomp-Fix-uninitialized-re_token.patch
@@ -0,0 +1,55 @@
+From 512b6bb380a77233b88c84b7a712896c70281d2f Mon Sep 17 00:00:00 2001
+From: Darren Kenny <darren.kenny@oracle.com>
+Date: Tue, 24 Nov 2020 18:04:22 +0000
+Subject: [PATCH] gnulib/regcomp: Fix uninitialized re_token
+
+This issue has been fixed in the latest version of gnulib, so to
+maintain consistency, I've backported that change rather than doing
+something different.
+
+Fixes: CID 73828
+
+Signed-off-by: Darren Kenny <darren.kenny@oracle.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=03477085f9a33789ba6cca7cd49ab9326a1baa0e]
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ conf/Makefile.extra-dist                          |  1 +
+ .../gnulib-patches/fix-regcomp-uninit-token.patch | 15 +++++++++++++++
+ 2 files changed, 16 insertions(+)
+ create mode 100644 grub-core/lib/gnulib-patches/fix-regcomp-uninit-token.patch
+
+diff --git a/conf/Makefile.extra-dist b/conf/Makefile.extra-dist
+index d27d3a9..ffe6829 100644
+--- a/conf/Makefile.extra-dist
++++ b/conf/Makefile.extra-dist
+@@ -30,6 +30,7 @@ EXTRA_DIST += grub-core/genemuinitheader.sh
+ 
+ EXTRA_DIST += grub-core/lib/gnulib-patches/fix-null-deref.patch
+ EXTRA_DIST += grub-core/lib/gnulib-patches/fix-null-state-deref.patch
++EXTRA_DIST += grub-core/lib/gnulib-patches/fix-regcomp-uninit-token.patch
+ EXTRA_DIST += grub-core/lib/gnulib-patches/fix-regexec-null-deref.patch
+ EXTRA_DIST += grub-core/lib/gnulib-patches/fix-uninit-structure.patch
+ EXTRA_DIST += grub-core/lib/gnulib-patches/fix-unused-value.patch
+diff --git a/grub-core/lib/gnulib-patches/fix-regcomp-uninit-token.patch b/grub-core/lib/gnulib-patches/fix-regcomp-uninit-token.patch
+new file mode 100644
+index 0000000..02e0631
+--- /dev/null
++++ b/grub-core/lib/gnulib-patches/fix-regcomp-uninit-token.patch
+@@ -0,0 +1,15 @@
++--- a/lib/regcomp.c	2020-11-24 17:06:08.159223858 +0000
+++++ b/lib/regcomp.c	2020-11-24 17:06:15.630253923 +0000
++@@ -3808,11 +3808,7 @@
++ create_tree (re_dfa_t *dfa, bin_tree_t *left, bin_tree_t *right,
++ 	     re_token_type_t type)
++ {
++-  re_token_t t;
++-#if defined GCC_LINT || defined lint
++-  memset (&t, 0, sizeof t);
++-#endif
++-  t.type = type;
+++  re_token_t t = { .type = type };
++   return create_token_tree (dfa, left, right, &t);
++ }
++ 
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index e7168e75ea..4ddb9fc4f1 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -58,6 +58,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0009-gnulib-regcomp-Fix-uninitialized-token-structure.patch \
            file://0010-gnulib-argp-help-Fix-dereference-of-a-possibly-NULL-.patch \
            file://0011-gnulib-regexec-Fix-possible-null-dereference.patch \
+           file://0012-gnulib-regcomp-Fix-uninitialized-re_token.patch \
            "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.25.1


