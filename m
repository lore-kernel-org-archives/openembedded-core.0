Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E18FC52D72
	for <webhook@archiver.kernel.org>; Sun,  4 Aug 2024 17:09:52 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.30101.1722791386465211093
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Aug 2024 10:09:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=xVBN/3iV;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-70eb73a9f14so7354205b3a.2
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Aug 2024 10:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1722791386; x=1723396186; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PNUjt54xMXglhu8Z4gxmLK10xc3H5JLwhcBiTbt0/4o=;
        b=xVBN/3iVLxaLuo+8oR8wN7U5NMHx0uA2Ra9NrVvqnmiY6GZ80QqAcgpX0/GPDQ+NPc
         inxw2GARha/2hJF5VbrYatHIfJH8NVCLdgI9uCKi3wzMLUuU+luw6de6ftiqIV0+tvPt
         1CMWzTDgV/I3JBL5cgC8cdRwSqqAmPYzJRjt2TgWoUcF9XQUFnZLymUEfiZLvNQ4VRip
         6/hPEjJc4NHcIHS9YoCcQwuUSmJ8EKF8Y4O+Y0xj4YUKnrULFeeAyC/YLmVuTyxQsxDq
         /sefrJ0eueO9DBiRxQ4vUzjdEgJZWcGn1hbKoxrazzlPRGIv8r0c1R8HeWOizG5MlZLg
         NAAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722791386; x=1723396186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PNUjt54xMXglhu8Z4gxmLK10xc3H5JLwhcBiTbt0/4o=;
        b=Hn1Ejm9KzhgUDKWRFgNOHYNSRTt2YFM/lwPu5snTcHb6pm7gKqpn6pAeSKXLnLQ7ZL
         RmP6gYJjwAqxh27coSzA6Hfe6rW27n6SaRAq2D7ZmgyIIvwzMDnsgmuZFJ/R+GCIEm8N
         tyrhOLWz9AE5sHi14kvUfv+As8/AaulWGvDfX3S/6osu+9TgwHms/C7aiwhNsOsQWDic
         flNqLacoYhU/dASjB2DW92AUn92dYiJ0LgO9BXiUG+kz/fyz8VWOS+qytS12wO1fPX68
         LH/DtJBtJe3a6gDi6D4Qtswfyd4Tfb8O9+187RTKhUKgYYDqxZvzuO2uGclLdJu9c2t+
         LtCw==
X-Gm-Message-State: AOJu0Yx44mrQI5u3d41IGp7xPFXyRzMGhJZHmFlChUga89KnuwlfNYBA
	Q+WENVZkCLNhq6puOeVlhTEqgDtElTt6z027tkUh7zDAodCiZ2CcL6J3avNMdzzCCEx4V1zzYOA
	NJ/jPsA==
X-Google-Smtp-Source: AGHT+IHyFbvcjcIqVWMKOPO7afcovqirpk4RnhIfkHX/GzQ86eRh4f3HD9ZZy3LMBpqOo1qM+uee+g==
X-Received: by 2002:a05:6a00:2e9e:b0:706:6af8:e08a with SMTP id d2e1a72fcca58-7106cf93002mr12931359b3a.2.1722791385755;
        Sun, 04 Aug 2024 10:09:45 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7106ec269d2sm4293225b3a.17.2024.08.04.10.09.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Aug 2024 10:09:45 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 14/18] iptables: fix memory corruption when parsing nft rules
Date: Sun,  4 Aug 2024 10:09:17 -0700
Message-Id: <fa3873cfcda862d8aad564966070af216e4903c6.1722790925.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722790925.git.steve@sakoman.com>
References: <cover.1722790925.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Aug 2024 17:09:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202973

From: Christian Taedcke <christian.taedcke@weidmueller.com>

This commit fixes a memory corruption issue when iptables (with
enabled PACKAGECONFIG libnftnl) is used to access rules created by
nft.

To reproduce the issue:
nft add chain ip filter TESTCHAIN { meta mark set 123 \;}
iptables -t filter -n -L TESTCHAIN

This produced the following output:
Chain TESTCHAIN (0 references)
target prot opt source     destination
MARK   0    --  0.0.0.0/0  0.0.0.0/0     MARK set 0x7b
malloc(): corrupted top size
Aborted (core dumped)

This commit fixes this issue.

Signed-off-by: Christian Taedcke <christian.taedcke@weidmueller.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...se-Add-missing-braces-around-ternary.patch | 37 +++++++++++++++++++
 .../iptables/iptables_1.8.10.bb               |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-extended/iptables/iptables/0005-nft-ruleparse-Add-missing-braces-around-ternary.patch

diff --git a/meta/recipes-extended/iptables/iptables/0005-nft-ruleparse-Add-missing-braces-around-ternary.patch b/meta/recipes-extended/iptables/iptables/0005-nft-ruleparse-Add-missing-braces-around-ternary.patch
new file mode 100644
index 0000000000..4cbc8bdaf4
--- /dev/null
+++ b/meta/recipes-extended/iptables/iptables/0005-nft-ruleparse-Add-missing-braces-around-ternary.patch
@@ -0,0 +1,37 @@
+From 2026b08bce7fe87b5964f7912e1eef30f04922c1 Mon Sep 17 00:00:00 2001
+From: Phil Sutter <phil@nwl.cc>
+Date: Fri, 26 Jan 2024 18:43:10 +0100
+Subject: [PATCH] nft: ruleparse: Add missing braces around ternary
+
+The expression evaluated the sum before the ternay, consequently not
+adding target->size if tgsize was zero.
+
+Identified by ASAN for a simple rule using standard target:
+| # ebtables -A INPUT -s de:ad:be:ef:0:00 -j RETURN
+| # ebtables -D INPUT -s de:ad:be:ef:0:00 -j RETURN
+| =================================================================
+| ==18925==ERROR: AddressSanitizer: heap-buffer-overflow on address 0x603000000120 at pc 0x7f627a4c75c5 bp 0x7ffe882b5180 sp 0x7ffe882b4928
+| READ of size 8 at 0x603000000120 thread T0
+| [...]
+
+Upstream-Status: Backport [2026b08bce7fe87b5964f7912e1eef30f04922c1]
+
+Fixes: 2a6eee89083c8 ("nft-ruleparse: Introduce nft_create_target()")
+Signed-off-by: Phil Sutter <phil@nwl.cc>
+---
+ iptables/nft-ruleparse.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/iptables/nft-ruleparse.c b/iptables/nft-ruleparse.c
+index 0bbdf44faf..3b1cbe4fa1 100644
+--- a/iptables/nft-ruleparse.c
++++ b/iptables/nft-ruleparse.c
+@@ -94,7 +94,7 @@ __nft_create_target(struct nft_xt_ctx *ctx, const char *name, size_t tgsize)
+ 	if (!target)
+ 		return NULL;
+ 
+-	size = XT_ALIGN(sizeof(*target->t)) + tgsize ?: target->size;
++	size = XT_ALIGN(sizeof(*target->t)) + (tgsize ?: target->size);
+ 
+ 	target->t = xtables_calloc(1, size);
+ 	target->t->u.target_size = size;
diff --git a/meta/recipes-extended/iptables/iptables_1.8.10.bb b/meta/recipes-extended/iptables/iptables_1.8.10.bb
index 0070264844..f1ee1efe28 100644
--- a/meta/recipes-extended/iptables/iptables_1.8.10.bb
+++ b/meta/recipes-extended/iptables/iptables_1.8.10.bb
@@ -16,6 +16,7 @@ SRC_URI = "http://netfilter.org/projects/iptables/files/iptables-${PV}.tar.xz \
            file://0001-configure-Add-option-to-enable-disable-libnfnetlink.patch \
            file://0002-iptables-xshared.h-add-missing-sys.types.h-include.patch \
            file://0004-configure.ac-only-check-conntrack-when-libnfnetlink-.patch \
+           file://0005-nft-ruleparse-Add-missing-braces-around-ternary.patch \
            "
 SRC_URI[sha256sum] = "5cc255c189356e317d070755ce9371eb63a1b783c34498fb8c30264f3cc59c9c"
 
-- 
2.34.1


