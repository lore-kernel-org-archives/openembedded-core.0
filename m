Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DA3AC6FA86
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 14:21:05 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web12.8360.1662560460579591170
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 07:21:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=4VxIVyQd;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id
 z9-20020a17090a468900b001ffff693b27so13544127pjf.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 07:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=y3e65OGs6a5Oe/+FbzZqn7AdlzjOYMw3Pn9uv+2CoyU=;
        b=4VxIVyQdiwz6mGMO73tH2h8WludSXL/0FriU8N7CXfZSfZHoEPIK+PCsfuMrJjrZth
         tsqP3j2MZiwQQhLcRIKx4xa14cmhVa00sAf4w7Yv1pxEWtc1FuUCvTvaKxPLTZDtQeQ5
         y7iLMfQZ898/5yAuxxCHwhp4OGR+1Lq6/D4htQZAoC2PVe46PzArm2CoQpALe1Z7tZmc
         1sVgTJZ2U3vlzkOe1in44ocOI8Jwokm8QqMFcrCA1fY4bi/Whk+Sqncn9XnC6JzGv+7T
         fOU7hIjwJYfol0WVmBmkxWByJDyVMUmoZKtbf6HS+HfWgamTwYseLToB56dQxMTKlq1E
         o+7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=y3e65OGs6a5Oe/+FbzZqn7AdlzjOYMw3Pn9uv+2CoyU=;
        b=rlXCSLEW1aQC2Tk49Bo/AHTApInl2ApsdCovKTfL7X7QiTcbemPyUflT/RDRsd/KZ9
         DW8ZXSvxHuCv7SHIzt9pJzSo6SlT+uCNaeVlFBj1na94/5sXKt/bfOwckJCHKCYFWI9c
         /ucpxOAt11X3CQAUPXB1WzFlzUYG0TC7GdxBSTlivPjRo6A/o0YL6Xm6D+APLpvGIH8q
         AZXNV5G9zEkej+AUKcRjhilRKGcbvqAtUE6nmfq3cJAuIxjvvFmkl/5crgcQtRB2e1UB
         NZaQ/4V5j08SPX9OlRPXZzJcmxW9fciDBH8cD4ahaoFG4DCHNJUQAgzbzD7mOXt2H0Rr
         pxKg==
X-Gm-Message-State: ACgBeo3mOnmMrG98TvX+cFDSg3VQYgay0EbURGIJ4S8VWU72Cnrqx/6w
	bsJfi4P8NKi+WU0vbF2kEKNTC242k1sNq4hJ
X-Google-Smtp-Source: 
 AA6agR5MCq6g64hSaIgl6svxcOnsB0N+VK6r0Caxc/q53iP/xl51NePAOOpg8WbRYCqR8XPbw7LUuw==
X-Received: by 2002:a17:902:a418:b0:174:6711:92c1 with SMTP id
 p24-20020a170902a41800b00174671192c1mr4156013plq.146.1662560459577;
        Wed, 07 Sep 2022 07:20:59 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 x13-20020a17090a1f8d00b001f510175984sm14776198pja.41.2022.09.07.07.20.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 07:20:58 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/24] libatomic-ops: upgrade 7.6.12 -> 7.6.14
Date: Wed,  7 Sep 2022 04:20:11 -1000
Message-Id: 
 <8bcf5d5885abbc405f17a56027aa19f826dcdb71.1662559557.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662559557.git.steve@sakoman.com>
References: <cover.1662559557.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Sep 2022 14:21:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170405

From: wangmy <wangmy@fujitsu.com>

License-Update:  Adjust/reformat content of LICENSING.txt
=========================================================
 "libatomic_ops_gpl.a" changed to "libatomic_ops_gpl.a file"
 "sysdeps" changed to "atomic_ops/sysdeps"
 "This applies only to test code, sample applications," changed to
 "This applies only to the test code"

Changelog:
==========
 Add note to README that AO malloc code has same license as AO stack
 Adjust/reformat content of LICENSING.txt
 Avoid AO_stack_t to cross CPU cache line boundary
 Do not assume 'ordered except earlier write' for UWP/arm64
 Do not name GCC intrinsics as C11 ones in ChangeLog and configure
 Eliminate '-pedantic is not option that controls warnings' GCC-6.3 message
 Ensure result of AO_test_and_set is always AO_TS_CLEAR or AO_TS_SET
 Fix 'AO_malloc redefinition' MS VC warning caused by attributes mismatch
 Fix 'use of undeclared SIG_BLOCK' Clang error if -std=c89 on Cygwin
 Fix AO_compare_and_swap_full asm code for clang on sparc
 Fix a typo in comment of AO_stack_push_explicit_aux_release
 Fix code indentation in main() of test_stack.c
 Refine AO_UNIPROCESSOR macro description in configure
 Remove outdated comment about unsupported Win64 in atomic_ops_stack.h
 Repeat black list check on CAS fail in stack_push_explicit_aux_release

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit a0f177ef7f52bab06d8fff752ba8390defd71ed5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{libatomic-ops_7.6.12.bb => libatomic-ops_7.6.14.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libatomic-ops/{libatomic-ops_7.6.12.bb => libatomic-ops_7.6.14.bb} (80%)

diff --git a/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb b/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb
similarity index 80%
rename from meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb
rename to meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb
index 8ea8436977..fad92df507 100644
--- a/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb
+++ b/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb
@@ -5,13 +5,13 @@ SECTION = "optional"
 PROVIDES += "libatomics-ops"
 LICENSE = "GPL-2.0-only & MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://doc/LICENSING.txt;md5=e00dd5c8ac03a14c5ae5225a4525fa2d \
+                    file://doc/LICENSING.txt;md5=dfc50c7cea7b66935844587a0f7389e7 \
                     "
 
 SRC_URI = "https://github.com/ivmai/libatomic_ops/releases/download/v${PV}/libatomic_ops-${PV}.tar.gz"
 UPSTREAM_CHECK_URI = "https://github.com/ivmai/libatomic_ops/releases"
 
-SRC_URI[sha256sum] = "f0ab566e25fce08b560e1feab6a3db01db4a38e5bc687804334ef3920c549f3e"
+SRC_URI[sha256sum] = "390f244d424714735b7050d056567615b3b8f29008a663c262fb548f1802d292"
 
 S = "${WORKDIR}/libatomic_ops-${PV}"
 
-- 
2.25.1


