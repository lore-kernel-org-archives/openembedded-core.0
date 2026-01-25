Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 653C4E63CAB
	for <webhook@archiver.kernel.org>; Sun, 25 Jan 2026 16:23:33 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41728.1769358209138204920
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Jan 2026 08:23:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=YqnWQ+nc;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-202601251623278b0736f45200020755-jisbpi@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202601251623278b0736f45200020755
        for <openembedded-core@lists.openembedded.org>;
        Sun, 25 Jan 2026 17:23:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=8RFPtsftAHjsoyvk+j2gn5HVVfY/TeqlkhebfPEFGTE=;
 b=YqnWQ+ncioV3yQdy03KX3TXFMeiDqvbZL0lSDpUBRN815XfWTD8gAJldE9ejEFBF7wahrV
 0vdFbeJAfv78/+UM6yedmEAJNN5p9IbCtZl6V2g9xAw/F86i449EnURH2xO0Jxozfgdc+d9r
 Hv86mBgr9GVkYd6NcnWzTo3gHSVj4YhS2m1oYc+cn6Nh9I098509TXs2LhRR1z1C9/iKgCFs
 XGbnDMHYp2CB6mz1i/WkTJcXPenQ2P/xCrt7ElVNwLeKe0qkoD98ytRzwGmG8Y51/Qz0DvLz
 J7ANKqCabP48GGNDDpkRztz8dF81PbcoQdItc3PnY6A7sYnFKD7dx+8Q==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] glibc: stable 2.35 branch updates
Date: Sun, 25 Jan 2026 17:16:34 +0100
Message-Id: <20260125161634.729904-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Jan 2026 16:23:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229938

From: Peter Marko <peter.marko@siemens.com>

git log --oneline 4e50046821f05ada5f14c76803845125ddb3ed7d..bb59339d02faebac534a87eea50c83c948f35b77
bb59339d02 (HEAD -> release/2.35/master, origin/release/2.35/master) posix: Reset wordexp_t fields with WRDE_REUSE (CVE-2025-15281 / BZ 33814)
66f0cb057c resolv: Fix NSS DNS backend for getnetbyaddr (CVE-2026-0915)
499d1ccafc memalign: reinstate alignment overflow check (CVE-2026-0861)
9e1a305028 nptl: Optimize trylock for high cache contention workloads (BZ #33704)
a94467ce05 ppc64le: Power 10 rawmemchr clobbers v20 (bug #33091)

Testing Results:
             Before     After   Diff
PASS         4774      4770     -4
XPASS        6         6         0
FAIL         149       154      +5
XFAIL        16        16        0
UNSUPPORTED  246       246       0

Changes in failed testcases:

testcase-name                                    before  after
malloc/tst-malloc-fork-deadlock-malloc-hugetlb2  FAIL    PASS
posix/tst-wait4                                  FAIL    PASS
malloc/tst-malloc-too-large                      PASS    FAIL
malloc/tst-malloc-too-large-malloc-check         PASS    FAIL
malloc/tst-malloc-too-large-malloc-hugetlb1      PASS    FAIL
malloc/tst-malloc-too-large-malloc-hugetlb2      PASS    FAIL
malloc/tst-malloc-too-large-mcheck               PASS    FAIL
malloc/tst-mallocfork2                           PASS    FAIL
malloc/tst-mallocfork3                           PASS    FAIL

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 meta/recipes-core/glibc/glibc_2.35.bb     | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index b9f5e8fb8f..06edbeb47f 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.35/master"
 PV = "2.35"
-SRCREV_glibc ?= "4e50046821f05ada5f14c76803845125ddb3ed7d"
+SRCREV_glibc ?= "bb59339d02faebac534a87eea50c83c948f35b77"
 SRCREV_localedef ?= "794da69788cbf9bf57b59a852f9f11307663fa87"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/glibc/glibc_2.35.bb
index 1b5830699f..97ba50bec4 100644
--- a/meta/recipes-core/glibc/glibc_2.35.bb
+++ b/meta/recipes-core/glibc/glibc_2.35.bb
@@ -27,7 +27,8 @@ CVE_CHECK_IGNORE += "CVE-2023-4527"
 CVE_CHECK_IGNORE += " \
     CVE-2023-0687 CVE-2023-4813 CVE-2023-4806 CVE-2023-4911 CVE-2023-5156 \
     CVE-2024-2961 CVE-2024-33599 CVE-2024-33600 CVE-2024-33601 CVE-2024-33602 \
-    CVE-2025-0395 CVE-2025-4802 CVE-2025-8058 \
+    CVE-2025-0395 CVE-2025-4802 CVE-2025-8058 CVE-2025-15281 \
+    CVE-2026-0861 CVE-2026-0915 \
 "
 
 DEPENDS += "gperf-native bison-native"

