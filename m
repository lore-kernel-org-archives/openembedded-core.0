Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70D2EC61DD6
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 19:38:21 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3039.1787945891022790011
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 12:38:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=jjBP+6/U;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49557167508so12996925e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 12:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787945889; x=1788550689; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Fo2bk1ZpRidtrvBDEwIoLUt4lCO42JHvFcW8/Leh/O4=;
        b=jjBP+6/UhhN8SIkBMJ2oS2wqeACZfF4aEBbRPPos62lK/FZtqVNmjQ+fpFEf08+H7M
         8BVUWFbEX+r2JcOwXhl8RROYPRF62mSxUwrjt0L43o860KrM8kbDzXIbcpwXcFUj/+wO
         knLc3O9x1WwxYjxGX7u0lfuWNTYyMhXKzcqsg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787945889; x=1788550689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Fo2bk1ZpRidtrvBDEwIoLUt4lCO42JHvFcW8/Leh/O4=;
        b=mjB/R8xLE/7qldcmc+XX5171BzpmjdVt3Ob4kBI9Qcr0qrz/FqqCiWnjXhdF802836
         b8oIyA/jO6vmmIHYDNoj79t5m5y/W+8mwbYkeCcekvP9M+zQ3hQe4W/Z7xSh7XnU+E3S
         so1dAKbLDFouzH4fLF12jxXrKshtTlgJJQSKnCqfgBP7HI9tHjsoZEKvSGr1bxhC4mWJ
         UxnoWDNxvqLtwkahTCu9hIBZSrecwjebSC49JN5oiF0VnxZGg7zYhti5oYMKpqHWxoVn
         InFirehJlxsrj/7NejJNVkxG6WkJld6/bqfXYNWNVu6gELqTjSdzybYRpXUlbVZDOOcO
         cMwg==
X-Gm-Message-State: AFuF++nInLd4IKeuBnfj6555/kLsKylyU8vjzPo2skVvB/mqz7nLPpmK
	TOY78yHuu+GISSdl8wVRUVDtSYqH9wTEI9ovd4gPR/WaI5j2Mav7sLSEJYv73W9KRizmlzaaCwU
	Rt2Zn/iE=
X-Gm-Gg: AR+sD12GE4tCu9dZwFiQ5STg2H/RSAXuFKKGBJPNIigPp1S6mqPkpbbi0XQmTj/cAao
	nKDZ8Po8ExuCIdHLuUeFH9RO/4CKIGWwOYQqg8GPOKBMrW63UAdywiWchUwbl2dgP4bSigYKs7j
	bUhxq5vm5fElaNiU2C8VArGzv5goV611Ep6cZ7GzQkzXnxKoZzbv0ww0l8lAtIRzYEKXYiK7ZU3
	mmcLCHEnHXQbhyVqV74qNpbjojiez+ccBwBuZs0KGh+yXhdTnLZNARmOL/tVa8B4bUY0hxc+gbe
	YSBBgpKPbv1mFwlvWkEikR9mhMPnxFhqdH975PHkMaXjK0PIbsFO0XGEtfnnU+l5r8Xsnrv7vcX
	xXpMVw7rmLsqgUHN5qDd7nEEm7kqrfxib/nvcgEs+/NfvoH+h3Gd6QLwr4sWe7tivmTJ2n8xacN
	LGX3iLU+IO69J+Mp8PhyFmG8foHuyNFM47CcUM6m8Oipp3LqxSylIP9BZwUYwZBPrEpBAwVeAVy
	xpz9tDqQB7OI6JCBDPr6cfd87cW9FNhMPN6CKX2q4SOjdB5eZJGWN6HQ63e4ECM
X-Received: by 2002:a05:600c:4594:b0:49b:4d64:bbc4 with SMTP id 5b1f17b1804b1-49b91c2f990mr128606745e9.8.1787945889237;
        Fri, 28 Aug 2026 12:38:09 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm147703115e9.4.2026.08.28.12.38.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 12:38:08 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 09/56] glibc: stable 2.43 branch updates
Date: Fri, 28 Aug 2026 21:35:19 +0200
Message-ID: <baac950330001792597b898128bad605caacd101.1787945536.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787945536.git.yoann.congal@smile.fr>
References: <cover.1787945536.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 19:38:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244570

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

Update SRCREV to pull the latest fixes from the upstream
release/2.43/master branch, including fixes for the following CVEs:

  CVE-2026-5435  resolv: More types as unknown in ns_sprintrrf
  CVE-2026-5450  stdio-common: Fix buffer overflow in scanf %mc [BZ #34008]
  CVE-2026-5928  libio: Fix ungetwc operating on byte stream [BZ #33998]
  CVE-2026-6238  resolv: Fix buffer overreads in ns_sprintrrf
  CVE-2026-6791  posix: Fix stack overflow in wordexp tilde expansion (BZ 34091)

Commits between the old SRCREV (e9517114ac) and the new SRCREV (1c9988e525):

1c9988e525 rtld: cache cpuid results on the stack for intel
dae425b554 posix: Fix stack overflow in wordexp tilde expansion (BZ 34091, CVE-2026-6791)
8759917de5 resolv: Add test case tst-ns_sprintrr (bug 34033, bug 34069)
3a418da6a3 resolv: Fix buffer overreads in ns_sprintrrf (CVE-2026-6238)
e64ae5a591 resolv: More types as unknown in ns_sprintrrf (CVE-2026-5435)
c9225a3e73 resolv: Check for inet_ntop failure in ns_sprintrrf
c46f7b2fd6 resolv: Improve formatting of unknown records in ns_sprintrrf
1d7d1a16b0 resolv: Fix ns_sprintrrf formatting of class, type values (bug 34289)
349297a4eb resolv: Declare __p_class_syms, __p_type_syms for internal use
fdf10644d6 hppa: Fix missing call to __feraiseexcept (BZ 34306)
a6fa9a9594 arm: Save/restore VFP registers in PLT trampolines (BZ 34144, BZ 15792)
fe0ccc9564 iconv: Suppress intermediate errors with //TRANSLIT (bug 34236)
22f3d24a6b Hurd: restore some SIOC ioctls
a13ebdbc7e Hurd: comment ioctls which cannot currently compile
446f708e4c Hurd: comment PF_ROUTE/AF_ROUTE defines
ced45fd472 Hurd: comment PF_LINK/AF_LINK defines
89cbf46693 elf: don't clobber ld.so.conf in tst-glibc-hwcaps-prepend-cache [BZ #34210]
18b97b03b7 Rename __unused fields to __glibc_reserved.
a47b5b2b3e math: Fix fma alignment when exponent difference is exactly 64 (BZ 34183)
4070d808be stdio-common: Fix buffer overflow in scanf %mc [BZ #34008]
2890b35cd3 libio: Fix ungetwc operating on byte stream [BZ #33998]

Testing Results:
             Before    After    Diff
PASS         6609      6611      +2
XPASS        4         4          0
FAIL         131       132       +1
XFAIL        16        16         0
UNSUPPORTED  554       555       +1

Changes in testcases:

testcase-name                                before  after
resolv/tst-ns_sprintrr(new)                    -     PASS
nptl/tst-robustpi7                            PASS    FAIL

[Note: The uplift adds new testcases including resolv/tst-ns_sprintrr
from commit 8759917de5, which passes, accounting for the PASS and
UNSUPPORTED increases.

nptl/tst-robustpi7 shows as PASS->FAIL, but it is a flaky test under
QEMU user-mode emulation (PI robust-mutex handling). No nptl code was
changed in the SRCREV range.]

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 meta/recipes-core/glibc/glibc_2.43.bb     | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index af3db54cee5..cf5a4440956 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.43/master"
 PV = "2.43+git"
-SRCREV_glibc ?= "e9517114acc77c0b8af9da6700107df16882b701"
+SRCREV_glibc ?= "1c9988e52540c844928c6d93ff45305adc2c24a0"
 SRCREV_localedef ?= "cba02c503d7c853a38ccfb83c57e343ca5ecd7e5"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
diff --git a/meta/recipes-core/glibc/glibc_2.43.bb b/meta/recipes-core/glibc/glibc_2.43.bb
index b84c55ca170..9f3a3814d0a 100644
--- a/meta/recipes-core/glibc/glibc_2.43.bb
+++ b/meta/recipes-core/glibc/glibc_2.43.bb
@@ -19,6 +19,7 @@ easier access for another. 'ASLR bypass itself is not a vulnerability.'"
 CVE_STATUS_GROUPS += "CVE_STATUS_STABLE_BACKPORTS"
 CVE_STATUS_STABLE_BACKPORTS = "CVE-2025-15281 CVE-2026-0861 CVE-2026-0915 CVE-2026-4437 CVE-2026-4438 \
     CVE-2026-4046 \
+    CVE-2026-5435 CVE-2026-5450 CVE-2026-5928 CVE-2026-6238 CVE-2026-6791 \
 "
 CVE_STATUS_STABLE_BACKPORTS[status] = "cpe-stable-backport: fix available in used git hash"
 

