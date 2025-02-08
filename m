Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EE45C021A1
	for <webhook@archiver.kernel.org>; Sat,  8 Feb 2025 14:05:12 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.9239.1739023508438267579
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Feb 2025 06:05:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=RaoofFSI;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2f42992f608so4554409a91.0
        for <openembedded-core@lists.openembedded.org>; Sat, 08 Feb 2025 06:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1739023508; x=1739628308; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+YGpttadJm9iXtlyJ03HL56qhcGXRy85sQ1vUaAGLPk=;
        b=RaoofFSIGeImryziANEKCzLX3dpviI5dR4dlNbWo0RS8gYt/4+WUkZ0EfRoJcmMmGE
         AMjObAuS9cL6TWhenlOV1Wa+/bQOx1VDswR2Z0BE0gFMoCU5xenHkwruDGf2eawMPLJX
         tK1yFUey0G206EzKrA+SyZsv1vtNsOhShVmUDZ1IcIO73PIjGBYYUxfblHaUSVxDzA/1
         1go0DDGWJY+AorTqchgURvvrQNdnYm5g96MCijIyCNY2sy/DAEHs3ElrWEQss00caU1z
         EVxHlLuI64McyZi/xy2jRKfFbAHidNjKGO/jVGzx0MclTC+2jdFVX0By+Y9PGsiixZXb
         oNjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739023508; x=1739628308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+YGpttadJm9iXtlyJ03HL56qhcGXRy85sQ1vUaAGLPk=;
        b=HuD0XKqrRd/XuF4ECwpJu4rXhrV7r6qVvGADAEdeGzS5LAncgwaXNq54DJEOY30Rup
         puLHj+95zzcrcpBL5WQjSDyPuqXGX8Vo7+KQtDOTnfU9F0tTOEmKhh2Fdeq0aTnuiUni
         Nu3GhgJM7NvNYsTUragNXtrrUPu2WwFR3qvyM3cjULEaAoP2P3RB1WGEDgpTzsyuLeKp
         wYT+OjTjK4bVX1euR7JHCGdwCXItHriWqtE+9xr+1eI36kFTodLVyVz0ZyUE5dCCptIH
         B2imA2sJDc/C9qqYehdsc3P2XeWNoNn87/8xNox9dfUI6U+KVz4u5g7i/RTHGp6Ngqen
         wK/Q==
X-Gm-Message-State: AOJu0YwYRJyHD8RbS3fhFlZLdiXZrLBglASH+1U5yRPSRHY2XT1d+V4/
	KjSGdkSQzaZR9TRAwXyD9Z1BMQk5/MuzBrY1zV48DeD5SEf8ebTnyWN/S2etFNuvdOjcI90kLHx
	P
X-Gm-Gg: ASbGnctrBc4oylcdzCDnPzHPPJQNN1bV0yVSG16mGbRsSUC0THKWarNA+ePMb/4BnNI
	COyvKhCg8W6g4GXDfZV/0Kv0Xza1IpPMenWqJK8ndBoXCWe+YOsT8xN7r5Naq5WfAWYbAs4Lft3
	5sFIXbm9O3KaHKpQdZIhHnr0fech2r9sqeIhFvnR/dE91EyFmpGOj1BmQPtdl2136KRPL/gEH94
	3sn29txYAw3r/4Mv7zkg67giO88JJO0+qgFDCEJG/xjOUaffI8wLDRY1afECtkAMy97W2r4/mWw
	C8GW
X-Google-Smtp-Source: AGHT+IGtc9Zb+RcA94R8saJimZ7IEWM+3S+jUrm08Hh8zus3HfnhuVwOGT0br4l5arVbTC9/BKqNtg==
X-Received: by 2002:a17:90b:510e:b0:2ee:d186:fe48 with SMTP id 98e67ed59e1d1-2fa242d93ccmr9801709a91.28.1739023507555;
        Sat, 08 Feb 2025 06:05:07 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687c820sm47278345ad.173.2025.02.08.06.05.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 06:05:07 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 02/13] glibc: stable 2.39 branch updates
Date: Sat,  8 Feb 2025 06:04:49 -0800
Message-ID: <54181d6ca63a720dcebb241892e76e9cdd75260c.1739023409.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1739023409.git.steve@sakoman.com>
References: <cover.1739023409.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Feb 2025 14:05:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211022

From: Peter Marko <peter.marko@siemens.com>

Solves CVE-2025-0395

git log:
662516aca8 stdlib: Test using setenv with updated environ [BZ #32588]
1432850ad8 malloc: obscure calloc use in tst-calloc
c1f7bfbe08 Hide all malloc functions from compiler [BZ #32366]
808a84a8b8 Fix underallocation of abort_msg_s struct (CVE-2025-0395)
994b129a35 x86/string: Fixup alignment of main loop in str{n}cmp-evex [BZ #32212]
61daaa7639 x86: Improve large memset perf with non-temporal stores [RHEL-29312]
2c8a7f14fa x86: Avoid integer truncation with large cache sizes (bug 32470)
2c882bf9c1 math: Exclude internal math symbols for tests [BZ #32414]
51da74a97e malloc: add indirection for malloc(-like) functions in tests [BZ #32366]
aa8768999e Pass -nostdlib -nostartfiles together with -r [BZ #31753]
350db28393 nptl: initialize cpu_id_start prior to rseq registration
9a0e174a39 nptl: initialize rseq area prior to registration

test results:
            Before After  Diff
FAIL           208   210    +2
PASS          4906  4905    -1
UNSUPPORTED    230   230     0
XFAIL           16    16     0
XPASS            4     4     0

failed test changes:
- nptl/tst-mutexpi8-static
- stdlib/tst-qsort4
+ malloc/tst-dynarray-fail-mem
+ malloc/tst-malloc_info
+ malloc/tst-malloc_info-malloc-check
+ malloc/tst-malloc_info-malloc-hugetlb2

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 meta/recipes-core/glibc/glibc_2.39.bb     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index b3b21bd07d..da9227ccca 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.39/master"
 PV = "2.39+git"
-SRCREV_glibc ?= "dcaf51b41e259387602774829c45222d0507f90a"
+SRCREV_glibc ?= "662516aca8b6bf6aa6555f471055d5eb512b1ddc"
 SRCREV_localedef ?= "fab74f31b3811df543e24b6de47efdf45b538abc"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
diff --git a/meta/recipes-core/glibc/glibc_2.39.bb b/meta/recipes-core/glibc/glibc_2.39.bb
index 2484ae1cd9..8373db2c4f 100644
--- a/meta/recipes-core/glibc/glibc_2.39.bb
+++ b/meta/recipes-core/glibc/glibc_2.39.bb
@@ -17,7 +17,7 @@ Allows for ASLR bypass so can bypass some hardening, not an exploit in itself, m
 easier access for another. 'ASLR bypass itself is not a vulnerability.'"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_STABLE_BACKPORTS"
-CVE_STATUS_STABLE_BACKPORTS = "CVE-2024-2961 CVE-2024-33599 CVE-2024-33600 CVE-2024-33601 CVE-2024-33602"
+CVE_STATUS_STABLE_BACKPORTS = "CVE-2024-2961 CVE-2024-33599 CVE-2024-33600 CVE-2024-33601 CVE-2024-33602 CVE-2025-0395"
 CVE_STATUS_STABLE_BACKPORTS[status] = "cpe-stable-backport: fix available in used git hash"
 
 DEPENDS += "gperf-native bison-native"
-- 
2.43.0


