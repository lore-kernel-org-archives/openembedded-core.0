Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B0ABF88069
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 06:48:42 +0000 (UTC)
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7585.1776322119011047567
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 23:48:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=0jgiuYRw;
 spf=pass (domain: smile.fr, ip: 209.85.221.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-43cf7683a28so5119549f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 23:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776322117; x=1776926917; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kK7I/Dj6jEptH08CVaYYpmC8ZWnGsKlnT4Wcpctu+Ww=;
        b=0jgiuYRwGVMy8zrjNlsZLKCsv2otxDgOycuLh35DPvcXMqWOvWYk9sgYPvmngOJgAr
         6/Pa0cb2A/0RpO2WtAOjKZBv7BI7GMnBXnBr4jVXCtbToXLj8yfLkvVuXQ4NeltibL6L
         SZFRrWtml2tgEHne70L0yjACTj16+eHDGpnDY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776322117; x=1776926917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kK7I/Dj6jEptH08CVaYYpmC8ZWnGsKlnT4Wcpctu+Ww=;
        b=pWnFfjdDolVcISUp7NKJQLpHd/LYLPY+kg4b6z+PSieR/hFg8HVfQiQiu6RTWXBFAx
         VqbPkp1XORc4grTrR2B0uoe/KixEXmeWUI54qTY/IKZQqkRBvOMingfNT1KX01wFYzpR
         vM2vNc/rFmJeLkKMU/oll+MkvSDfLEUZzpYrbjGVhqPMUVIIXeEyyHOvIi98HftswGQg
         XYK1PCyXAO0TIQBKnvosFPuAlS8rmVurn4GBXwv7154boWrkJmUb1iQzRNtKJn4/9Eej
         e+cw0MmokNEcpRbwEP4Tc2tEio6shJwsHye5xMMZoenpK9kK61XdJIIEbakaIHRpwB9X
         7FWA==
X-Gm-Message-State: AOJu0Yyf1SiZck539ydO4xDNJrNZYM9cqVqVkXK6FF814W4HAPKGMDz4
	+NOJon3wp3fE0yIQvaxCzfrHx6J5xlFwdsvI5rZv15uvzoiS0oIP+bYBE0d01Qw4H2gtYGQ27tq
	OjSAJUNQniEYi
X-Gm-Gg: AeBDievH2zboYKC2O7VJM35TofJa0Bf3IRgSTv0UqLBWOh0TauiNie3ExHEebK1Q3aX
	O4xyM7VXsHiUSvzbqA2uFPj3kpGDkLKsT9+1QYVFya8hbOO4UAAHnQ7fcGig4qBma/LqyY3/Mjb
	YQTieKS5DPOApJysVKlsLLTLH8H/Jv4uX1Dzmmp21hBZleh6KIvlFNhEBzyUkSuvqBRqFUcbjRN
	pegYesm+RTS8AHFuMkIngo3o831bUa1j5BhwPnMz7SqMav6VYr4imzEH7tTEwRfEKt7ShgAhQRu
	OxXa6QBSLrflApcACBVQ0PxpuMApWwdrURY8ZtJ708EujWA7KWwkaSCkW60WkplwQc2gPnHPvIF
	C3dRGZZDjI141FkFUDIfJ6YMkeejXqNRa2vcckQXX0VL97BTzVO4fF769BZ6Gb3AAisU7NFfRES
	uA+hv09KJ6bAUdNTPqCduxzJ0ZqhFDTPOXhctkKe4cUWQHUl5yalH8v+0qRVrDFe+aA+p1wLqBU
	Jy7N1C0ViA6wxouo7G1RZ2u++/JyU27dhOjmg==
X-Received: by 2002:a05:6000:2211:b0:43d:1deb:a5df with SMTP id ffacd0b85a97d-43d641eb44cmr37394367f8f.0.1776322116955;
        Wed, 15 Apr 2026 23:48:36 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead3d5ea9sm11200017f8f.21.2026.04.15.23.48.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 23:48:36 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 29/47] glibc: stable 2.42 branch updates
Date: Thu, 16 Apr 2026 08:47:30 +0200
Message-ID: <6261f1fb32d248ab3b242642674b913039d01758.1776321810.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776321810.git.yoann.congal@smile.fr>
References: <cover.1776321810.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 06:48:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235371

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

$ git log --oneline 912d89a766847649a3857985a3b5e6065c51bfd4..a56a2943d2ce541102c630142c2eae0fbfc5886b

a56a2943d2 tests: fix tst-rseq with Linux 7.0
68099ccc94 elf: parse /proc/self/maps as the last resort to find the gap for tst-link-map-contiguous-ldso
426378547e resolv: Check hostname for validity (CVE-2026-4438)
8e863fb1c9 resolv: Count records correctly (CVE-2026-4437)
1a19d5a507 posix: Run tst-wordexp-reuse-mem test
9cd9c90544 iconvdata: Fix invalid pointer arithmetic in ANSI_X3.110 module
ebd45473f5 nss: Missing checks in __nss_configure_lookup, __nss_database_get (bug 28940)
937ef7aaf3 Linux: In getlogin_r, use utmp fallback only for specific errors
3989780591 nss: Introduce dedicated struct nss_database_for_fork type

Testing Results:
+--------------+--------+--------+------+
| Result       | Before | After  | Diff |
+--------------+--------+--------+------+
| PASS         | 6934   | 6938   | +4   |
| XPASS        | 4      | 4      |  0   |
| FAIL         | 76     | 75     | -1   |
| XFAIL        | 16     | 16     |  0   |
| UNSUPPORTED  | 108    | 109    | +1   |
+--------------+--------+--------+------+

Changes in testcases:
+------------------------------------------------------+--------+-------------+
| Testcase                                             | Before | After       |
+------------------------------------------------------+--------+-------------+
| elf/tst-glibc-hwcaps                                | FAIL   | PASS        |
| elf/tst-ldconfig-soname                             | FAIL   | PASS        |
| nptl/tst-thread-affinity-pthread2                   | PASS   | FAIL        |
| nss/tst-nss-malloc-failure-getlogin_r               | N/A    | UNSUPPORTED |
| posix/tst-wordexp-reuse-mem                         | N/A    | PASS        |
| resolv/tst-resolv-dns-section                       | N/A    | PASS        |
| resolv/tst-resolv-invalid-ptr                       | N/A    | PASS        |
+------------------------------------------------------+--------+-------------+

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 meta/recipes-core/glibc/glibc_2.42.bb     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 9991c024953..9f1003570d7 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.42/master"
 PV = "2.42+git"
-SRCREV_glibc ?= "912d89a766847649a3857985a3b5e6065c51bfd4"
+SRCREV_glibc ?= "a56a2943d2ce541102c630142c2eae0fbfc5886b"
 SRCREV_localedef ?= "cba02c503d7c853a38ccfb83c57e343ca5ecd7e5"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
diff --git a/meta/recipes-core/glibc/glibc_2.42.bb b/meta/recipes-core/glibc/glibc_2.42.bb
index a8717c0eae2..7e0aa3d5fc5 100644
--- a/meta/recipes-core/glibc/glibc_2.42.bb
+++ b/meta/recipes-core/glibc/glibc_2.42.bb
@@ -17,7 +17,7 @@ Allows for ASLR bypass so can bypass some hardening, not an exploit in itself, m
 easier access for another. 'ASLR bypass itself is not a vulnerability.'"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_STABLE_BACKPORTS"
-CVE_STATUS_STABLE_BACKPORTS = "CVE-2025-15281 CVE-2026-0861 CVE-2026-0915"
+CVE_STATUS_STABLE_BACKPORTS = "CVE-2025-15281 CVE-2026-0861 CVE-2026-0915 CVE-2026-4437 CVE-2026-4438"
 CVE_STATUS_STABLE_BACKPORTS[status] = "cpe-stable-backport: fix available in used git hash"
 
 DEPENDS += "gperf-native bison-native"

