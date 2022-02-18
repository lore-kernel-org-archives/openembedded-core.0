Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 753A9C433F5
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 10:06:28 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.9077.1645178787362845226
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:06:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TgE/Rd8C;
 spf=pass (domain: gmail.com, ip: 209.85.221.53,
 mailfrom: rybczynska@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id i14so13610496wrc.10
        for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=k4JOUxZY34gIFTUXLfmNjZSRDRXLHRR2NZPNObTT/fs=;
        b=TgE/Rd8CfE+b7VctuzR5YOHwWR8G4fjcuR5wvGWBx94jFX739R+KfnufunKRY6BZKB
         n/Xh3ZXG4HB6sVFU2sjLPaz74hb0QFFwQtunj766icXIrKg7lGBLpRHdlCeWVbh0Qk0y
         FbcYUyUMeLqk0R79OAs5YnpLpYJ/ZEE9KijtQbdmR8e2mcsPTvrPq45VrbqT0bWWxNxr
         hcHuFHlvCHJER653dOTtl55phb/n6rhwHEzOHmp+q8reqd/Xw018elqw5jnEBHCMbWku
         AO/kXT5Gp1mtDAld43qEEswGLLFo/HtVFxpuhHoMJL8KPAC2EUiTuvaihsJ1zqpG6HIH
         YVtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k4JOUxZY34gIFTUXLfmNjZSRDRXLHRR2NZPNObTT/fs=;
        b=WDwxXmyDmKzvWqLxhvQBvmJM02iYdXi3yUTG6SBszBT0dsSWnHwS7mOrEKfHdfR1D4
         9UM22D4nNHcG9FSeJccnzitY1RoUUFI9Gr3FU9N51DIjYaKMH5wym8VxqdMb5x+nJU8a
         yDFsBUmw+KSz5r1EyERLERRY30/qv79Qq49koOJistbzWXetflkVXBWB9F/wEFH/H9nL
         HMfvPBCEHCtxr/cmgVVIU330tTZFPLDOg2kCv1bH8aeDMtqVYAtVzXgRx2P9Vu2Ngupg
         o9RWTqFjzZ6zVnd1MeSJDy/u1rT8Ji2Wv72UxvkkIIejLAVDz2UgG+5Usw6uInFrZBsS
         8fZg==
X-Gm-Message-State: AOAM530NIKWQu2NbcQlVRUF/BYkukjMa6YgpQgG4m3u1UMGhmq8rGPWC
	eSBJo/dbGVooBM9Wy10nb44=
X-Google-Smtp-Source: 
 ABdhPJw+Nk2DyCoxnhO9PvJN95brMT5vlU14oRPe6RiZdmmrWDrcxGqZMs0jANEpbhulp52/pICX8Q==
X-Received: by 2002:a5d:548f:0:b0:1e3:3a93:1324 with SMTP id
 h15-20020a5d548f000000b001e33a931324mr5501250wrv.252.1645178785878;
        Fri, 18 Feb 2022 02:06:25 -0800 (PST)
Received: from localhost.localdomain ([80.215.178.41])
        by smtp.gmail.com with ESMTPSA id
 z5sm4808494wmp.10.2022.02.18.02.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 02:06:25 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
To: anuj.mittal@intel.com,
	openembedded-core@lists.openembedded.org,
	steve@sakoman.com
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Subject: [PATCH 09/46][dunfell] grub: fix an unitialized token in gnulib
Date: Fri, 18 Feb 2022 11:05:17 +0100
Message-Id: <20220218100554.1315511-10-rybczynska@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220218100554.1315511-1-rybczynska@gmail.com>
References: <20220218100554.1315511-1-rybczynska@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Feb 2022 10:06:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161897

This change adds a fix for an unitialized token structure in gnulib.
It is a part of a security series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
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
2.33.0


