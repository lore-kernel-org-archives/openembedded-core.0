Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EE03C77B60
	for <webhook@archiver.kernel.org>; Sat, 29 Apr 2023 17:21:26 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.51341.1682788877347445374
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Apr 2023 10:21:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=EQ6z/HKP;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-528dd896165so134017a12.2
        for <openembedded-core@lists.openembedded.org>; Sat, 29 Apr 2023 10:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1682788876; x=1685380876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GlqTgzvsG/s5IXGT3MWVifvG8bNBEFL6d10I71SyQK4=;
        b=EQ6z/HKP+LhDebSnwgewznurYBaPsNp8JuCyuBYsXNOq4qRS1A9U4sWPLLVA4pcRyS
         BI7S0dLTWm5JxmbRkJ6HPu+0qyS3rdksYCcmnUTPvxJ7RKqgO7W6Ll/1jXiBbKjM0+FK
         QCa2wSxByhxs5GargL9xVxVucmiGzvneGyU/q4F5ajAzYc4MD+4FEDZaVrS7GFvOsNoq
         vdfXQuHTbIPuIpsbCyqatHfK41ZsQD6irfDKWCltmBjVmWpkHEMGBBESn/lMTmliSHl7
         wcwmBoJhOJDgC35Km2FdsdPPrrBJL3h2H2OxzM+kPPXgBGEA821YaFti8xcY+vtW1CQX
         hBrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682788876; x=1685380876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GlqTgzvsG/s5IXGT3MWVifvG8bNBEFL6d10I71SyQK4=;
        b=LutF2NV8uRCL6Y9+wNpbXiIpWKTtFIUtdFmFWrynFs0kge6c8+H5XhxYRA9Vg+xqZQ
         0yxxsad3i+QL9rd4s2a6nr8vveSj2dESPlRDO/Ec21ROA5vzfzpQt/tzEpZlyUsPX2N4
         O480L03qTDr81oXgHZ15vKuxPGYweQ4KR1xOlwi3FShfVCxOZ7kxk8fwSqVq8Jj0X9a2
         +OasyALnmV5NjCRR6NwexzdeqlKvvk28SWXM2FhBxk3b/bNFhf37NdWSDi3bCdlURp5n
         +xVRDWMtodFwG5V0OrjNY9XyCQSnOhMUD8TWKuGJnm/NJChA8d2oMk8JvMnyZCmN9kPz
         5A3g==
X-Gm-Message-State: AC+VfDzAlpnB5BubAR4gBo5pgrpbNwY5aER6aRJJpUTPOvqXR2a863Q5
	DFZFna8RLwO9npcGv1oc2kdgtvp8B2jkIhJu+RQ=
X-Google-Smtp-Source: ACHHUZ4Epj6lEXOKaIV3GH9i6eNjnqT1RXQpliyQIRKgCZ3J+f2pz+SHui6t3eD9scso60/RB7Li2w==
X-Received: by 2002:a17:902:a50f:b0:19a:9880:175f with SMTP id s15-20020a170902a50f00b0019a9880175fmr8318362plq.51.1682788876399;
        Sat, 29 Apr 2023 10:21:16 -0700 (PDT)
Received: from hexa.lan (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id c3-20020a170902d90300b001a6b9c42dbasm15156041plz.88.2023.04.29.10.21.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Apr 2023 10:21:16 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 13/13] glibc: stable 2.35 branch updates.
Date: Sat, 29 Apr 2023 07:20:33 -1000
Message-Id: <2d67702bdfc64358d364dd6484ae41842ee7c52f.1682788726.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1682788726.git.steve@sakoman.com>
References: <cover.1682788726.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Apr 2023 17:21:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180556

From: Deepthi Hemraj <deepadeepthi98@gmail.com>

Below commits on glibc-2.35 stable branch are updated.
1c7f51c75a x86_64: Fix asm constraints in feraiseexcept (bug 30305)
8d07e65d15 gshadow: Matching sgetsgent, sgetsgent_r ERANGE handling (bug 30151)
b7cc55a24e x86: Check minimum/maximum of non_temporal_threshold [BZ #29953]
3f63f9dfe1 stdlib: Undo post review change to 16adc58e73f3 [BZ #27749]
757d9a6306 elf: Smoke-test ldconfig -p against system /etc/ld.so.cache
416bd20b3f Use 64-bit time_t interfaces in strftime and strptime (bug 30053)
ae045ed16b cdefs: Limit definition of fortification macros
6bcd5d8e36 x86: Prevent SIGSEGV in memcmp-sse2 when data is concurrently modified [BZ #29863]
82663d3c03 time: Set daylight to 1 for matching DST/offset change (bug 29951)
d9923235f0 elf/tst-tlsopt-powerpc fails when compiled with -mcpu=power10 (BZ# 29776)

Signed-off-by: Deepthi Hemraj <deepadeepthi98@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index d36da0ce3f..4d8d96cefb 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.35/master"
 PV = "2.35"
-SRCREV_glibc ?= "293211b6fddf60fc407d21fcba0326dd2148f76b"
+SRCREV_glibc ?= "1c7f51c75ae300fe52ccb636e71b8e28cb20824c"
 SRCREV_localedef ?= "794da69788cbf9bf57b59a852f9f11307663fa87"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
-- 
2.34.1


