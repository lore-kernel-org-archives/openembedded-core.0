Return-Path: <junjie.cao@linux.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2B01C5DF8C
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 02:23:12 +0000 (UTC)
Received: from mta0.migadu.com (mta0.migadu.com [91.218.175.94])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8454.1787538190246982376
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2026 19:23:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.dev header.s=key1 header.b=H7bXPWX0;
 spf=pass (domain: linux.dev, ip: 91.218.175.94, mailfrom: junjie.cao@linux.dev)
X-Envelope-To: openembedded-core@lists.openembedded.org
DKIM-Signature: a=rsa-sha256; bh=pGsGDpWg+aHZqf4+4vY7kYtTtruOeEcGmceQZURz7Nc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787538188; v=1; x=1788142988;
 b=H7bXPWX0S8/bu9LF6a7oS/rCF2AeI/ij/MYF9+8FdaEQMFuFvH91p69bmBeuir02QIenaaOY
 uEKHwrdeaxdXTvyUOdyc2O6G0E0XB9+eyyxSy2sxhv/4cfE1sF+f/bizMweJrDu0vhyPWD8RVFj
 lqOifujc4qVEKSg5oGz8NjJ4=
X-Envelope-To: openembedded-core@lists.openembedded.org
Received: from localhost (2408:8806:52:f8ea:5de6:8d95:1672:70f3)
	by smtp.migadu.com with ESMTPS id a42adbead9210cca;
	Mon, 24 Aug 2026 02:23:08 +0000
X-Mizu-Trace-ID: a42adbead9210cca
X-Migadu-Flow: FLOW_OUT
From: Junjie Cao <junjie.cao@linux.dev>
To: openembedded-core@lists.openembedded.org
Cc: paul@pbarker.dev
Subject: [OE-core][PATCH v4 5/8] cve-exclusions: set status for CVE-2022-4543
Date: Sun, 23 Aug 2026 23:21:20 -0500
Message-ID: <20260824042123.1456876-6-junjie.cao@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824042123.1456876-1-junjie.cao@linux.dev>
References: <20260824042123.1456876-1-junjie.cao@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 02:23:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244051

KPTI clones the kernel entry text into the user page tables at its
KASLR-slid address and, on CPUs with PGE, sets the global bit on those
entries. The translation survives the CR3 write on kernel exit, and a
local attacker can time prefetch instructions across the kernel range
to recover the KASLR base in under a second.

Disclosure and write-up:

  https://www.openwall.com/lists/oss-security/2022/12/16/3
  https://www.willsroot.io/2022/12/entrybleed.html

The disclosure states that after discussion with security@kernel.org
and linux-distros "a fix for this is currently not available", and none
has appeared since; arch/x86/mm/pti.c still clones the entry text and
sets _PAGE_GLOBAL on the cloned mapping. Debian notes "Ignored
upstream and KASLR is not expected to be resistant to local attacks";
Ubuntu has the fix deferred since 2023-01-10:

  https://security-tracker.debian.org/tracker/CVE-2022-4543
  https://ubuntu.com/security/CVE-2022-4543

CC: Paul Barker <paul@pbarker.dev>
AI-Generated: Uses Claude (claude-opus-5)
Signed-off-by: Junjie Cao <junjie.cao@linux.dev>
---
v4:
- use the review's comment and status wording; drop the cpu_entry_area
  commit reference
- tighten the mechanism wording and the timing claim to match the
  cited sources

v3: https://lore.kernel.org/openembedded-core/20260812072842.1176341-1-junjie.cao@linux.dev/

 meta/recipes-kernel/linux/cve-exclusion.inc | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-kernel/linux/cve-exclusion.inc b/meta/recipes-kernel/linux/cve-exclusion.inc
index a9b4d9a2..4318fc79 100644
--- a/meta/recipes-kernel/linux/cve-exclusion.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion.inc
@@ -222,3 +222,12 @@ CVE_STATUS[CVE-2021-3864] = "unpatched: Proposed fixes were not merged upstream"
 # Fix https://git.kernel.org/linus/d860d1faa6b2ce3becfdb8b0c2b048ad31800061
 # Fix https://git.kernel.org/linus/da9c9c877597170b929a6121a68dcd3dd9a80f45
 CVE_STATUS[CVE-2022-1247] = "fixed-version: Fixed from version 6.17"
+
+# Triaged August 2026 - "EntryBleed", discussed with the kernel security team
+# but no fix appears to have been published since then. Debian says "Ignored
+# upstream and KASLR is not expected to be resistant to local attacks", fix
+# deferred in Ubuntu.
+# https://www.openwall.com/lists/oss-security/2022/12/16/3
+# https://security-tracker.debian.org/tracker/CVE-2022-4543
+# https://ubuntu.com/security/CVE-2022-4543
+CVE_STATUS[CVE-2022-4543] = "unpatched: No fix has been proposed"
-- 
2.43.0


