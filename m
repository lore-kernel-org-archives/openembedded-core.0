Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7641EC433EF
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 14:27:30 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web12.6895.1645799249330348663
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:27:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=JqhifpZk;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id z15so4816704pfe.7
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=11y0IcI9MD5WAvmDLwpnpqXhhyIRvIkiEgulKl5kXo0=;
        b=JqhifpZkDEqZ39nspPBgQ8i6zHVNLTp1bhMkzSb5EI2ZNrbj2bZipyxuiPl9rKhpTv
         I3bOoKddHxSUNVBNJSajJhbC5guUaOuzEao32A8qZIVkgbj045cakwsYsL6qH/jQIjXq
         +GWdly+6T6y2xEsbN8DdiOxp3ST20lb/+m4RfONUOA8d9cOrjIUP4kWPA+7R9Rn81S8b
         qoFUdI2MLkVW3aSPiD3LLlD/3y/YLz7dcliORUwuUa0TVfHXRqyEOhpF+h+B82wLC3X9
         VEDcP5UNFBkUumPy7r8pFaJ+68R/hV7CpiD8y/eSDakgrZPcHwSUoTss+zqKp45BYRa+
         SqiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=11y0IcI9MD5WAvmDLwpnpqXhhyIRvIkiEgulKl5kXo0=;
        b=ZqHaiBXo8Qm3G/95PfWhyyos1diybs/n70SEs7cHBtgNVp6nzLdsFZQx1MYbbpRotS
         rMHVjITfhJv4s+tMPwctGU2uFsJH58jOvoN89zI5f6U3WepiKOs8nLXwk7btPShl0g4t
         8agj5dNBv85HnFsAPyPasKoZxO8fBra8Zzq2sYFvsnGp3jwkoxN/WsyYYPEa6mSabKxD
         1Qhg8x5bLQK0eBLNpUSJYsZQl4f++ZyQhQwkHSxuYQdiig2j4Fu6E3eoy6NZIp+t8rS5
         Gyl4wtHgrLf6d9bj4L9bJ5wSwI299MzS2kJJRPn7qQ/FbId/lZF1pSHYGOlmmOXl6O7h
         FPlg==
X-Gm-Message-State: AOAM530+PXtIlcGdOP/J120RoXE7cT5BqxVdecm/0KXUWsyQOqR9WTfk
	femXjIeg1T3DMccgNujbFY2BSvlGpP9MLIvO
X-Google-Smtp-Source: 
 ABdhPJyi1Yg8iZcMqPZ9Z7yQBdKRk/ft0nD2XA5V8pzGeVbWcctdvuenViG4zJBORHhijnvYcWlkPg==
X-Received: by 2002:a62:aa19:0:b0:4f1:1cff:faa8 with SMTP id
 e25-20020a62aa19000000b004f11cfffaa8mr7851080pff.25.1645799248355;
        Fri, 25 Feb 2022 06:27:28 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h17-20020a63df51000000b0036b9776ae5bsm2864538pgj.85.2022.02.25.06.27.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 06:27:27 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 18/50] grub: add structure initialization in zstd
Date: Fri, 25 Feb 2022 04:25:58 -1000
Message-Id: 
 <370ea660d476bda0d4f45520815396036648d87a.1645798648.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645798648.git.steve@sakoman.com>
References: <cover.1645798648.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Feb 2022 14:27:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162364

From: Marta Rybczynska <rybczynska@gmail.com>

This patch adds initialization of a structure in grub's zstd, which
might be left uninitialized by the compiler. It is a part of a security
series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...std-Initialize-seq_t-structure-fully.patch | 34 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0014-zstd-Initialize-seq_t-structure-fully.patch

diff --git a/meta/recipes-bsp/grub/files/0014-zstd-Initialize-seq_t-structure-fully.patch b/meta/recipes-bsp/grub/files/0014-zstd-Initialize-seq_t-structure-fully.patch
new file mode 100644
index 0000000000..19d881c1ca
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0014-zstd-Initialize-seq_t-structure-fully.patch
@@ -0,0 +1,34 @@
+From f55ffe6bd8b844a8cd9956702f42ac2eb96ad56f Mon Sep 17 00:00:00 2001
+From: Darren Kenny <darren.kenny@oracle.com>
+Date: Thu, 5 Nov 2020 10:29:59 +0000
+Subject: [PATCH] zstd: Initialize seq_t structure fully
+
+While many compilers will initialize this to zero, not all will, so it
+is better to be sure that fields not being explicitly set are at known
+values, and there is code that checks this fields value elsewhere in the
+code.
+
+Fixes: CID 292440
+
+Signed-off-by: Darren Kenny <darren.kenny@oracle.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=2777cf4466719921dbe4b30af358a75e7d76f217]
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ grub-core/lib/zstd/zstd_decompress.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/grub-core/lib/zstd/zstd_decompress.c b/grub-core/lib/zstd/zstd_decompress.c
+index 711b5b6..e4b5670 100644
+--- a/grub-core/lib/zstd/zstd_decompress.c
++++ b/grub-core/lib/zstd/zstd_decompress.c
+@@ -1325,7 +1325,7 @@ typedef enum { ZSTD_lo_isRegularOffset, ZSTD_lo_isLongOffset=1 } ZSTD_longOffset
+ FORCE_INLINE_TEMPLATE seq_t
+ ZSTD_decodeSequence(seqState_t* seqState, const ZSTD_longOffset_e longOffsets)
+ {
+-    seq_t seq;
++    seq_t seq = {0};
+     U32 const llBits = seqState->stateLL.table[seqState->stateLL.state].nbAdditionalBits;
+     U32 const mlBits = seqState->stateML.table[seqState->stateML.state].nbAdditionalBits;
+     U32 const ofBits = seqState->stateOffb.table[seqState->stateOffb.state].nbAdditionalBits;
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 1906a28f30..7cf4d64149 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -60,6 +60,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0011-gnulib-regexec-Fix-possible-null-dereference.patch \
            file://0012-gnulib-regcomp-Fix-uninitialized-re_token.patch \
            file://0013-io-lzopio-Resolve-unnecessary-self-assignment-errors.patch \
+           file://0014-zstd-Initialize-seq_t-structure-fully.patch \
            "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.25.1


