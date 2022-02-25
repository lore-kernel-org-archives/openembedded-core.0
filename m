Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77ABDC433F5
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 14:27:23 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.6917.1645799243030317555
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:27:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=MDmc11ny;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id s1so4923273plg.12
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:27:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=sAn8Dvn5II+QBF41imp4j/CupvLugcgNLRbyYfIGWXg=;
        b=MDmc11nyJX8Xw6IrlVLwqyuCuYETfXeJPsBNO/5oJGKIEe45lFr7XHnpPuARrlR+k2
         aEIX0pq3HuMzT5KADRF7bRKaqIOi1132ny30M1+vSMnprCAxEIsi/hKF/EkAog3jxSUM
         pWprQf1X5ejhnke3cmuKV5gjw1xMyrV6k8hHLZpZkrDANTlSLuvuwajqFw7MdAWFoY1q
         PnQki9rKds+jHbG2dT0tNAgqBxHgV9zjsSvQwJrYmQ/0qGUWH2/P8csz1BTJbBxKfb4d
         IrbeXybSW5QEYk2p6bWdkocGpS0oA4+h0fUMP9T5ZmbSYE3qNQRJYg3OCg5Fk04C9AVX
         fvqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sAn8Dvn5II+QBF41imp4j/CupvLugcgNLRbyYfIGWXg=;
        b=Q4IkRyUBzwDtSs/dRoysJSmEkaZFCM8cV4gSK0d0ORTrez6LU+rb7OrF6O4yefbKnH
         PWS7nrFRZDtAD+Zy7wj6m/5VFSv/FWiHeyFjxtIuh0i+qq/+VXJGnx9Yrn4pfOqsofld
         ySfhvkgHzZA7J88Vx5Jwfgt/VtKFTgS7G0m4YLpRIHWS4J4CbxAVPcYbnZz/O3AKnctj
         slp3kQZLfDIcLODP0StaSbuPBT4eUtvs9X0J6yWNjEY9/sbo//H21YQS3Mn0nUvJffy+
         6uCiw13EYZUZLA/DhGaR3VsbMdu+q15uxX4M7qLGz1lM/zESvAkokrWXxFrEFb19aIr+
         MWZg==
X-Gm-Message-State: AOAM530uSiI7cdf9ILINkHBEpw7Hja1+M/nfVVEDoPDV7gfyGYZWQzTF
	2SOnIuUAegAZvzsNNh8mCsq4rxyVPIclaBK/
X-Google-Smtp-Source: 
 ABdhPJyBGzfvGN2yW2BrDprRjVjw6CbbGkSIzcM8vtBNz3FAxIPvgFBNcFxmAG2xBjoJGcQWtZRgvg==
X-Received: by 2002:a17:90a:a887:b0:1bc:388a:329f with SMTP id
 h7-20020a17090aa88700b001bc388a329fmr3429915pjq.17.1645799242090;
        Fri, 25 Feb 2022 06:27:22 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h17-20020a63df51000000b0036b9776ae5bsm2864538pgj.85.2022.02.25.06.27.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 06:27:21 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 15/50] grub: add a fix for NULL pointer dereference
Date: Fri, 25 Feb 2022 04:25:55 -1000
Message-Id: 
 <133759837a226d70b77f9bc7757c293664c3a018.1645798648.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645798648.git.steve@sakoman.com>
References: <cover.1645798648.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Feb 2022 14:27:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162361

From: Marta Rybczynska <rybczynska@gmail.com>

Add a fix for gnulib's regexec NULL pointer dereference. This patch
a part of a security series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


