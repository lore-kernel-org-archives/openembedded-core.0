Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24D2EC7EE30
	for <webhook@archiver.kernel.org>; Sat, 21 Jun 2025 14:23:34 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.8199.1750515808095636383
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Jun 2025 07:23:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=W0WJWY53;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-747ef5996edso2168441b3a.0
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Jun 2025 07:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750515807; x=1751120607; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VxgVsBz0+DKN4Z/gnnZ18Xkffa9FqB0hE44Jag+2hc8=;
        b=W0WJWY539pTXL5v74umyECRoKP6+2iR1xNZf2MdF6ylve/WSqNeCVQumRnIcA7nZir
         04iG3rGv28zrNhNK7Om8Ogc8/mJ0BmYCGogiq+OE6LvKft/ZXHYNlu6lUIeVTY74xhh3
         LJtCAZnKpYc0PYorfHOxwBuijJEDoWrYbMVgfa0CTzfQt8A2/qL/h1hWoHLet9s4xueD
         IGMSVYKOfw3n/qpeMQJGjQKiLLO9mAkAsoZwGVbbH65/04/ZH/uBj5477utEwVERCs2v
         Pa7xZ+dPMJ6m0C40MdoBODClnYNroWb0fRgAq9YnLgYW3cGMYm4zmlh/3Dz2F5lOlCzI
         3w1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750515807; x=1751120607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VxgVsBz0+DKN4Z/gnnZ18Xkffa9FqB0hE44Jag+2hc8=;
        b=d3VwR6bbe/J3HA9UZOSCjAlGvzPzcfDUIHaZPF/zVndziqfCYcIAECNL6g3uPBOaxJ
         d9PemuTaH7/7ZUHF+Q2uKWwkdBXIJiejh+XkFZhzGbqlDZ1EHU+K0HaaMw5muV14v2j7
         HjHXryJOFZrm3hINZ7fmAosZAr3ThXrYz4/jeSQVjq7lihgQ2j49CDk6AoQ5+VXfFlv3
         XvZ6Z+RViBJy3+qxUl+5rhHP0KhFrjcMpi0uljx+pYqwhpF/LOuYLSSZdI3C481kgFit
         B2PEK9NujLsedytPWZOegqTWKZ50dVxxzv0lcGd9Skesr2cjUCdSIi8w1JXuuoc3IFFc
         5nhQ==
X-Gm-Message-State: AOJu0Yybr6StYVOIwgDKD153Kl8N3Dk+2e392hXUFnQHKCVIc/QS7Vqe
	PuMKN0EaNuu6qYgRRDPATUvsOkca9FgjaUmQ/Esq6e2fL66QXHhIMZ2iDBDMY1ljdL3rAMv8hkK
	UcPHX
X-Gm-Gg: ASbGnctgmGbhycjk/ZmayUJKbugsJgUYqWyiu5PYEhGXvU43JSUNivZNbb4ArYt0gpI
	WwAYtXYSQI9QvXTmDmzXW/H7RgumLVtghcWftb5py+gomkoFOKbk5haYH+kJJnJAMInmyiKpQz1
	e2nmgxztE346aZz2KQquYtFq6bmlTQ6eQf/3PfFG8y1HUYqzNdMxlJB5qW2wxlCuutVA0pACFgw
	9/6g9OhdM/v6/3YlY0mS+8AXqzM+GDeNaN7hzqieEW47nU8p4QpXzVPNHZqnak+sEoavLe+zvjC
	RL9+iIAUr/qra9tHBsdG7DWTHRcJFDaoEXKj/EMjs7t1pQl/wLH+fA==
X-Google-Smtp-Source: AGHT+IHOXRdjPMHqWG6/JHssGUVxANSnv0ubXCZdMYsdZXSfKKlDHqfhf0NXCcHHbUze/tYsl944IQ==
X-Received: by 2002:a17:90b:1dcf:b0:312:ec:412f with SMTP id 98e67ed59e1d1-3159d64a4d2mr12457608a91.14.1750515807328;
        Sat, 21 Jun 2025 07:23:27 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5bf1:320c:7400:5bfc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3158a23e6efsm6596807a91.16.2025.06.21.07.23.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 07:23:27 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 2/7] glibc: stable 2.41 branch updates
Date: Sat, 21 Jun 2025 07:23:12 -0700
Message-ID: <a55f79b46b3a3f9228d2ed69f82bec2e4f2e6880.1750515680.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750515680.git.steve@sakoman.com>
References: <cover.1750515680.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Jun 2025 14:23:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219160

From: Peter Marko <peter.marko@siemens.com>

$ git log --oneline 5b4c4617016d28569106549dff6f9fec73eed5ce..0c76c951620f9e12df2a89b2c684878b55bb6795
0c76c95162 ppc64le: Revert "powerpc: Optimized strcmp for power10" (CVE-2025-5702)
b48d7ab036 ppc64le: Revert "powerpc : Add optimized memchr for POWER10" (Bug 33059)
55cdcadf73 ppc64le: Revert "powerpc: Fix performance issues of strcmp power10" (CVE-2025-5702)
84bdbf8a6f ppc64le: Revert "powerpc: Optimized strncmp for power10" (CVE-2025-5745)
d952c6efaa sparc: Fix argument passing to __libc_start_main (BZ 32981)
515d4166f4 elf: Fix subprocess status handling for tst-dlopen-sgid (bug 32987)
899dd3ab2f x86_64: Fix typo in ifunc-impl-list.c.
624285af3b elf: Test case for bug 32976 (CVE-2025-4802)
2ca34d7627 support: Use const char * argument in support_capture_subprogram_self_sgid
dab44a3b2b elf: Keep using minimal malloc after early DTV resize (bug 32412)
5cf17ebc65 hurd: Fix tst-stack2 test build on Hurd

test results:
            Before After  Diff
FAIL           140   142    +2
PASS          5846  5846     0
UNSUPPORTED    243   243     0
XFAIL           16    16     0
XPASS            4     4     0

failed test changes:
-elf/tst-audit21
+elf/tst-audit-tlsdesc-dlopen2
+elf/tst-dlopen-sgid
-malloc/tst-free-errno-malloc-hugetlb1
+malloc/tst-free-errno
+malloc/tst-malloc-tcache-leak
-nptl/tst-mutex10
+nptl/tst-mutexpi8-static

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glibc/glibc-version.inc                       | 2 +-
 ...3-tests-Skip-2-qemu-tests-that-can-hang-in-oe-selftest.patch | 2 +-
 meta/recipes-core/glibc/glibc_2.41.bb                           | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index d84106fb95..2d31131e03 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.41/master"
 PV = "2.41+git"
-SRCREV_glibc ?= "5b4c4617016d28569106549dff6f9fec73eed5ce"
+SRCREV_glibc ?= "0c76c951620f9e12df2a89b2c684878b55bb6795"
 SRCREV_localedef ?= "fab74f31b3811df543e24b6de47efdf45b538abc"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
diff --git a/meta/recipes-core/glibc/glibc/0023-tests-Skip-2-qemu-tests-that-can-hang-in-oe-selftest.patch b/meta/recipes-core/glibc/glibc/0023-tests-Skip-2-qemu-tests-that-can-hang-in-oe-selftest.patch
index 71777d3f2c..50d80ed577 100644
--- a/meta/recipes-core/glibc/glibc/0023-tests-Skip-2-qemu-tests-that-can-hang-in-oe-selftest.patch
+++ b/meta/recipes-core/glibc/glibc/0023-tests-Skip-2-qemu-tests-that-can-hang-in-oe-selftest.patch
@@ -40,7 +40,7 @@ index 8a755293b3..22dafcaad1 100644
    # tests
  
  # process_madvise requires CAP_SYS_ADMIN.
-@@ -277,9 +278,10 @@ tests-time64 += \
+@@ -282,9 +283,10 @@ tests-time64 += \
    tst-ntp_gettimex-time64 \
    tst-ppoll-time64 \
    tst-prctl-time64 \
diff --git a/meta/recipes-core/glibc/glibc_2.41.bb b/meta/recipes-core/glibc/glibc_2.41.bb
index d707e1a677..7ddf7f9127 100644
--- a/meta/recipes-core/glibc/glibc_2.41.bb
+++ b/meta/recipes-core/glibc/glibc_2.41.bb
@@ -17,7 +17,7 @@ Allows for ASLR bypass so can bypass some hardening, not an exploit in itself, m
 easier access for another. 'ASLR bypass itself is not a vulnerability.'"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_STABLE_BACKPORTS"
-CVE_STATUS_STABLE_BACKPORTS = ""
+CVE_STATUS_STABLE_BACKPORTS = "CVE-2025-4802 CVE-2025-5702 CVE-2025-5745"
 CVE_STATUS_STABLE_BACKPORTS[status] = "cpe-stable-backport: fix available in used git hash"
 
 DEPENDS += "gperf-native bison-native"
-- 
2.43.0


