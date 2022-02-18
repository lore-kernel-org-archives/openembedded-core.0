Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 748A0C433F5
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 10:06:30 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.9179.1645178789292917357
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:06:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VQe2Ne8Q;
 spf=pass (domain: gmail.com, ip: 209.85.128.51,
 mailfrom: rybczynska@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id k41so4906118wms.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GfP3tltqbaLUURhXMUtUbEmn6mPMTlKv9BwNoP0YGSk=;
        b=VQe2Ne8Q7P6k5RfpUGtvFkTMU/J5J0imVgvgfz06JcNQCxY6B5CNffcgRCfcibfyqn
         kO8nXZ2Ui6f/XZzQ8GxRuSP4H/Rbv6dPaIt1yjS8b/yZ6wcaxrZ7zqaesNEk355KVJim
         PbMdioCAylSKrgKXS7gkD67BQ+j0jObX8/Um1UWifxdABUFswTCrsu10x3T1gOOLrFyY
         myRkqee04MrOEbKFvEBozPFuIFzIpBi88MKqbtWJtyc419b5gFzs/WHmMgN/hi5m2M30
         AzmX/ZRkuZlLcabzUVjA8vvgFudGl5s/TlaH4n9oStdUVCuT5VrqaOQl0YebTgH4xB6W
         5YtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GfP3tltqbaLUURhXMUtUbEmn6mPMTlKv9BwNoP0YGSk=;
        b=ICkjiANSIcIBucJg4Ic0e+dhObOOFy5SrAd1fbdr/hh0D7SbxluDwMlPvhJX/SBNdm
         gHJrNNdQyCLB6WjvAex688a6zbXrb2FqVVZcHJxUaxi7sOlznkr1C6uRVSJdos/hfvIe
         l6qKSgdQLSiGw/eGvimWGKpLgojJi45iAKxwoxudp7AU1oQEcdAeSGOuD70dYzc/2mIZ
         BBu9R9PYMAXgl7l9M61M0auSbau47MatWnQztHFT+y5HaRTjqKTu5hqWsIYxvhaLMP93
         QCze7lAAGZAmHRleoyvtg/rhhoKpcZ4bPWvpaPNxEo9yPMwuD+sj4eR4f8VRY73M+ExP
         u5Uw==
X-Gm-Message-State: AOAM53048orasZRM7SOhgqIIhpUAaMdzCLXJ6l4znncmC98m4t3lApgh
	0K5OteAoqr2srhO22OWfEZU=
X-Google-Smtp-Source: 
 ABdhPJy7O3znEhWb5Wmx/k2dflwCLMBpv+RtHNzThcXG4a3VTz9Ku+baDQUqFGPhWUJ3t1N6LrHFkg==
X-Received: by 2002:a05:600c:4e8a:b0:37d:1c28:20fc with SMTP id
 f10-20020a05600c4e8a00b0037d1c2820fcmr6361529wmq.166.1645178787871;
        Fri, 18 Feb 2022 02:06:27 -0800 (PST)
Received: from localhost.localdomain ([80.215.178.41])
        by smtp.gmail.com with ESMTPSA id
 z5sm4808494wmp.10.2022.02.18.02.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 02:06:27 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
To: anuj.mittal@intel.com,
	openembedded-core@lists.openembedded.org,
	steve@sakoman.com
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Subject: [PATCH 11/46][dunfell] grub: add a fix for NULL pointer dereference
Date: Fri, 18 Feb 2022 11:05:19 +0100
Message-Id: <20220218100554.1315511-12-rybczynska@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220218100554.1315511-1-rybczynska@gmail.com>
References: <20220218100554.1315511-1-rybczynska@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Feb 2022 10:06:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161899

Add a fix for gnulib's regexec NULL pointer dereference. This patch
a part of a security series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
---
 ...egexec-Fix-possible-null-dereference.patch | 53 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0011-gnulib-regexec-Fix-possible-null-dereference.patch

diff --git a/meta/recipes-bsp/grub/files/0011-gnulib-regexec-Fix-possible-null-dereference.patch b/meta/recipes-bsp/grub/files/0011-gnulib-regexec-Fix-possible-null-dereference.patch
new file mode 100644
index 0000000000..4f43fcf7d5
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0011-gnulib-regexec-Fix-possible-null-dereference.patch
@@ -0,0 +1,53 @@
+From 244dc2b1f518635069a556c424b2e7627f0cf036 Mon Sep 17 00:00:00 2001
+From: Darren Kenny <darren.kenny@oracle.com>
+Date: Thu, 5 Nov 2020 10:57:14 +0000
+Subject: [PATCH] gnulib/regexec: Fix possible null-dereference
+
+It appears to be possible that the mctx->state_log field may be NULL,
+and the name of this function, clean_state_log_if_needed(), suggests
+that it should be checking that it is valid to be cleaned before
+assuming that it does.
+
+Fixes: CID 86720
+
+Signed-off-by: Darren Kenny <darren.kenny@oracle.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=0b7f347638153e403ee2dd518af3ce26f4f99647]
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ conf/Makefile.extra-dist                             |  1 +
+ .../lib/gnulib-patches/fix-regexec-null-deref.patch  | 12 ++++++++++++
+ 2 files changed, 13 insertions(+)
+ create mode 100644 grub-core/lib/gnulib-patches/fix-regexec-null-deref.patch
+
+diff --git a/conf/Makefile.extra-dist b/conf/Makefile.extra-dist
+index 96d7e69..d27d3a9 100644
+--- a/conf/Makefile.extra-dist
++++ b/conf/Makefile.extra-dist
+@@ -30,6 +30,7 @@ EXTRA_DIST += grub-core/genemuinitheader.sh
+ 
+ EXTRA_DIST += grub-core/lib/gnulib-patches/fix-null-deref.patch
+ EXTRA_DIST += grub-core/lib/gnulib-patches/fix-null-state-deref.patch
++EXTRA_DIST += grub-core/lib/gnulib-patches/fix-regexec-null-deref.patch
+ EXTRA_DIST += grub-core/lib/gnulib-patches/fix-uninit-structure.patch
+ EXTRA_DIST += grub-core/lib/gnulib-patches/fix-unused-value.patch
+ EXTRA_DIST += grub-core/lib/gnulib-patches/fix-width.patch
+diff --git a/grub-core/lib/gnulib-patches/fix-regexec-null-deref.patch b/grub-core/lib/gnulib-patches/fix-regexec-null-deref.patch
+new file mode 100644
+index 0000000..db6dac9
+--- /dev/null
++++ b/grub-core/lib/gnulib-patches/fix-regexec-null-deref.patch
+@@ -0,0 +1,12 @@
++--- a/lib/regexec.c	2020-10-21 14:25:35.310195912 +0000
+++++ b/lib/regexec.c	2020-11-05 10:55:09.621542984 +0000
++@@ -1692,6 +1692,9 @@
++ {
++   Idx top = mctx->state_log_top;
++
+++  if (mctx->state_log == NULL)
+++    return REG_NOERROR;
+++
++   if ((next_state_log_idx >= mctx->input.bufs_len
++        && mctx->input.bufs_len < mctx->input.len)
++       || (next_state_log_idx >= mctx->input.valid_len
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 94873475c1..e7168e75ea 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -57,6 +57,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0008-gnulib-regexec-Resolve-unused-variable.patch \
            file://0009-gnulib-regcomp-Fix-uninitialized-token-structure.patch \
            file://0010-gnulib-argp-help-Fix-dereference-of-a-possibly-NULL-.patch \
+           file://0011-gnulib-regexec-Fix-possible-null-dereference.patch \
            "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.33.0


