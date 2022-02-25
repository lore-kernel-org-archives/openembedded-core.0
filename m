Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ECD4C433EF
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 14:27:19 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.7061.1645799238667436858
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:27:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=f20GhceC;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id y5so4832221pfe.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=lxtISXHm76OZQFnAhhah9LGIb6TDQVF2VitEPH4B3bc=;
        b=f20GhceCH3BxRYefOysDf7lBd7pZaME0WXVR3xOgF1CVxii8zymEBzG4+6HTMnrJM1
         TS5B/GpzhQJZ+tUodlkChErCvBZU/DpDUQdxb6+ng0hibzpXXKZF5xX1aVnlWR7oqYDV
         TU8BEIVoNZlGlUBX25ODwCvPjzzTwJ3ZEUmpDu7RwIkKJPcSRvqACUUcTO0TuhdBhWBP
         7m2pNJz1NgSTVsSAgeHeXxWX+1ZKiU8bngkO3OhG23G4CSEzcedJjALuwjIuAJsF5XtX
         fauH/2Myp8pV1U3qgZleqDGIrlkqlR3nxUY9RnGp2GP9TzDG4g/XXF23IlkaH8/G/YfL
         j+cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lxtISXHm76OZQFnAhhah9LGIb6TDQVF2VitEPH4B3bc=;
        b=G8fJ7Y0Ox3u0lq8K2pj0QL0XBrG3+P+Wc6NMaYw5eG8zp+gTiAf2fZvjT8KrJqu1um
         w9QQgEzN7XrZpyuuT7wSsJ+OOKWuZMA2pR3PXLrMFaHsy3zNEWQI2q6wN3Hc+q2sAhBy
         zQFKeYi92zVpAvbiVQ29bI72AAvhdH080G1iSRZRorQk0doTSYayWlIyL/lwHu9QntSp
         O31b62DoYnzt3n14dvhGX/EfqdsPoZnROTNE1YjDPMo0D0FVaIFZbxN7r36L6EESsB4x
         kPoVGQAyOnwHl8pDWAHX+PACKJpDwR6lvpZ9CzcpZJ+2LVKyyyDlMgy+RX+PnfetdVh/
         rjyQ==
X-Gm-Message-State: AOAM532gRNZV1PtsnEjDbPrUF153eDuDqGH8rPCt5FR2zaw8+lDlPiSs
	NX3uWC05DQrt1iIDBm9RE58dWZkheUmYYpFm
X-Google-Smtp-Source: 
 ABdhPJxcGr/OmLdUqoLXpvwEgXi0BoVKKSThkxapz/AetA2kHbhAGHm57xFsueZIFSJ6gejNwDw3Og==
X-Received: by 2002:a63:5323:0:b0:375:9c2b:9716 with SMTP id
 h35-20020a635323000000b003759c2b9716mr4953847pgb.150.1645799237649;
        Fri, 25 Feb 2022 06:27:17 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h17-20020a63df51000000b0036b9776ae5bsm2864538pgj.85.2022.02.25.06.27.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 06:27:17 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 13/50] grub: fix an unitialized token in gnulib
Date: Fri, 25 Feb 2022 04:25:53 -1000
Message-Id: 
 <301e2ff664409011d5650339ef22225cd2028041.1645798648.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645798648.git.steve@sakoman.com>
References: <cover.1645798648.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Feb 2022 14:27:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162359

From: Marta Rybczynska <rybczynska@gmail.com>

This change adds a fix for an unitialized token structure in gnulib.
It is a part of a security series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...mp-Fix-uninitialized-token-structure.patch | 53 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0009-gnulib-regcomp-Fix-uninitialized-token-structure.patch

diff --git a/meta/recipes-bsp/grub/files/0009-gnulib-regcomp-Fix-uninitialized-token-structure.patch b/meta/recipes-bsp/grub/files/0009-gnulib-regcomp-Fix-uninitialized-token-structure.patch
new file mode 100644
index 0000000000..b6e3c7edbe
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0009-gnulib-regcomp-Fix-uninitialized-token-structure.patch
@@ -0,0 +1,53 @@
+From 2af8df02cca7fd4b584575eac304cd03fa23f5cc Mon Sep 17 00:00:00 2001
+From: Darren Kenny <darren.kenny@oracle.com>
+Date: Thu, 22 Oct 2020 13:54:06 +0000
+Subject: [PATCH] gnulib/regcomp: Fix uninitialized token structure
+
+The code is assuming that the value of br_token.constraint was
+initialized to zero when it wasn't.
+
+While some compilers will ensure that, not all do, so it is better to
+fix this explicitly than leave it to chance.
+
+Fixes: CID 73749
+
+Signed-off-by: Darren Kenny <darren.kenny@oracle.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=75c3d3cec4f408848f575d6d5e30a95bd6313db0]
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ conf/Makefile.extra-dist                              |  1 +
+ .../lib/gnulib-patches/fix-uninit-structure.patch     | 11 +++++++++++
+ 2 files changed, 12 insertions(+)
+ create mode 100644 grub-core/lib/gnulib-patches/fix-uninit-structure.patch
+
+diff --git a/conf/Makefile.extra-dist b/conf/Makefile.extra-dist
+index 9b01152..9e55458 100644
+--- a/conf/Makefile.extra-dist
++++ b/conf/Makefile.extra-dist
+@@ -29,6 +29,7 @@ EXTRA_DIST += grub-core/genemuinit.sh
+ EXTRA_DIST += grub-core/genemuinitheader.sh
+ 
+ EXTRA_DIST += grub-core/lib/gnulib-patches/fix-null-deref.patch
++EXTRA_DIST += grub-core/lib/gnulib-patches/fix-uninit-structure.patch
+ EXTRA_DIST += grub-core/lib/gnulib-patches/fix-unused-value.patch
+ EXTRA_DIST += grub-core/lib/gnulib-patches/fix-width.patch
+ EXTRA_DIST += grub-core/lib/gnulib-patches/no-abort.patch
+diff --git a/grub-core/lib/gnulib-patches/fix-uninit-structure.patch b/grub-core/lib/gnulib-patches/fix-uninit-structure.patch
+new file mode 100644
+index 0000000..7b4d9f6
+--- /dev/null
++++ b/grub-core/lib/gnulib-patches/fix-uninit-structure.patch
+@@ -0,0 +1,11 @@
++--- a/lib/regcomp.c	2020-10-22 13:49:06.770168928 +0000
+++++ b/lib/regcomp.c	2020-10-22 13:50:37.026528298 +0000
++@@ -3662,7 +3662,7 @@
++   Idx alloc = 0;
++ #endif /* not RE_ENABLE_I18N */
++   reg_errcode_t ret;
++-  re_token_t br_token;
+++  re_token_t br_token = {0};
++   bin_tree_t *tree;
++ 
++   sbcset = (re_bitset_ptr_t) calloc (sizeof (bitset_t), 1);
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index d2a1502d56..df2c8b8a16 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -55,6 +55,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0006-kern-efi-Fix-memory-leak-on-failure.patch \
            file://0007-kern-efi-mm-Fix-possible-NULL-pointer-dereference.patch \
            file://0008-gnulib-regexec-Resolve-unused-variable.patch \
+           file://0009-gnulib-regcomp-Fix-uninitialized-token-structure.patch \
            "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.25.1


