Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 748BDC433EF
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 10:06:31 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.9080.1645178790298493207
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:06:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OLQsh04I;
 spf=pass (domain: gmail.com, ip: 209.85.128.41,
 mailfrom: rybczynska@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id
 az26-20020a05600c601a00b0037c078db59cso5984345wmb.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=G89MIHEA8eqQI5S55oLwMESBfN2hPesgJs0QaBdlbMw=;
        b=OLQsh04IQHhvRdJOpkGqvxa/oRdp1C4ayyqg1s3xFxD/ZB9p2TBNVfxK+/o9S4aGWW
         4YexCrIxMGJh5AjrpgLxhcOcfmopba6xGrx4bgX6rA1tU4bFteAGWk+zuwiDHukxlxJe
         WEHGM0wagmQWGWWVqXjKClBNAwaPXsh+RgKAHa8t79VbYsecAa8B8QRlgI1hj3ef65K+
         89t36484/a4IDzf3TgZcWijufDeF9d7rPyt9qfJWWXV1zAf4R4owVQvtWwfTHrEUqsXs
         jj1ZbLdOvUMm5iEqHQnKK/NLJ/kAHpuM6UUQsSY07pYNHH3yNNWR645c4+09/j+msAQu
         qllw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=G89MIHEA8eqQI5S55oLwMESBfN2hPesgJs0QaBdlbMw=;
        b=eZ7JiCiSlfwgHN8LwTj47nK9QwZ0hp9CU5iyjJ2PvC7sO9tYMoss8MvKTc0T1PLpFz
         //T7p/Zht2Nnp8d7IsW7RRCkKZjJtJWyj2KszUNVHIAV8DFMyVOo2KtqyJyoSjlWYzSW
         C7O2f4eo1lmdej/HwAeeGLkYhKLZ3z7qXgSgk6X3rt2qiCVmGTEZWGUEhA0gbPYbkwfN
         /lAg8aLR0Z/ms36U0b+vDKGy0Tu7VYnTRqXpRgldV7ddYoiTHm30WP2eDiJVncW6B+os
         fKPZSJjivd1n2So4GWGdo7KCqVMxK1yskswj8fQGNx00ieTzaBia3gLco32+s2Nlho3y
         q+8A==
X-Gm-Message-State: AOAM533cJCK8MqrrVw1Z8Nb5ovuxyGj/Zpbr6lBXdj9e4ghwbReSgGOs
	VQSmrdlMoixTZZiOmYRd4yMJWbogwxE=
X-Google-Smtp-Source: 
 ABdhPJy7d2SdrqK++pNFi4FCzxwT4Xv09dgfkdtEJ22U0l4wMo1Y4sgMHGrrNTZzrkA0h3nlqmtPIA==
X-Received: by 2002:a05:600c:1e24:b0:37e:cd3d:feba with SMTP id
 ay36-20020a05600c1e2400b0037ecd3dfebamr1772756wmb.50.1645178788821;
        Fri, 18 Feb 2022 02:06:28 -0800 (PST)
Received: from localhost.localdomain ([80.215.178.41])
        by smtp.gmail.com with ESMTPSA id
 z5sm4808494wmp.10.2022.02.18.02.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 02:06:28 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
To: anuj.mittal@intel.com,
	openembedded-core@lists.openembedded.org,
	steve@sakoman.com
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Subject: [PATCH 12/46][dunfell] grub: fix an unitialized re_token in gnulib
Date: Fri, 18 Feb 2022 11:05:20 +0100
Message-Id: <20220218100554.1315511-13-rybczynska@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220218100554.1315511-1-rybczynska@gmail.com>
References: <20220218100554.1315511-1-rybczynska@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Feb 2022 10:06:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161900

This patch adds a fix for an unitialized re_token in grub's gnulib.
It is a part of a security series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
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
2.33.0


