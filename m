Return-Path: <junjie.cao@linux.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E08E5C5DF97
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 02:23:22 +0000 (UTC)
Received: from mta0.migadu.com (mta0.migadu.com [91.218.175.98])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8500.1787538197634567540
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2026 19:23:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.dev header.s=key1 header.b=O/s1COKG;
 spf=pass (domain: linux.dev, ip: 91.218.175.98, mailfrom: junjie.cao@linux.dev)
X-Envelope-To: openembedded-core@lists.openembedded.org
DKIM-Signature: a=rsa-sha256; bh=CSlll7AdLE98TBmmVIe0thr3faY5DopwGjR0uRMpTQA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787538195; v=1; x=1788142995;
 b=O/s1COKGjz9gMd2KWv/gPWbymrl8+wKQ2wRyH52wVVNqT6pd6pNxQvyjVI3UUqgUSBmatfa5
 c4Zfz24D5Wa/lyDPVbPyFLiAuH8WTGr5K/JZlVoGhHeIpV8Aj9nzMB8w1uffB/PI6uUAgZldUtS
 MDNDAn6CZFCpaIX7orQ2sD2E=
X-Envelope-To: openembedded-core@lists.openembedded.org
Received: from localhost (2408:8806:52:f8ea:5de6:8d95:1672:70f3)
	by smtp.migadu.com with ESMTPS id 26be0d46bcbf65e0;
	Mon, 24 Aug 2026 02:23:15 +0000
X-Mizu-Trace-ID: 26be0d46bcbf65e0
X-Migadu-Flow: FLOW_OUT
From: Junjie Cao <junjie.cao@linux.dev>
To: openembedded-core@lists.openembedded.org
Cc: paul@pbarker.dev
Subject: [OE-core][PATCH v4 6/8] cve-exclusions: set status for CVE-2023-3397
Date: Sun, 23 Aug 2026 23:21:21 -0500
Message-ID: <20260824042123.1456876-7-junjie.cao@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824042123.1456876-1-junjie.cao@linux.dev>
References: <20260824042123.1456876-1-junjie.cao@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 02:23:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244052

txEnd() in fs/jfs/jfs_txnmgr.c reads the log pointer from the
superblock info, drops TXN_LOCK and then takes log->gclock, while
lmLogClose() can free that log during umount.

No fix has been merged. The 2023 proposal was withdrawn by its author
("I think my fix method is not a good solution"), and proposals in 2026
for similar jfs slab use-after-free races are unreviewed:

  https://lore.kernel.org/all/20230515095956.17898-1-zyytlz.wz@163.com/
  https://lore.kernel.org/all/20260505123330.2822833-1-tristmd@gmail.com/
  https://lore.kernel.org/all/20260603171620.2532527-1-jie.wang@intel.com/

A similar use-after-free was reported against 7.0-rc1 in June 2026,
with the free stack in lmLogClose() via jfs_umount(), and syzbot has
an open slab use-after-free write in lmLogSync(); the txEnd() sequence
is unchanged in linux-next 20260727:

  https://lore.kernel.org/all/6a3eedfa.fd822575.2d6b21.e180@mx.google.com/
  https://syzkaller.appspot.com/bug?extid=ea7ed3bb2f444cb4dfeb

CC: Paul Barker <paul@pbarker.dev>
AI-Generated: Uses Claude (claude-opus-5)
Signed-off-by: Junjie Cao <junjie.cao@linux.dev>
---
v4:
- describe the 2026 proposals and reports as similar races rather than
  the same one; drop the kernel-cache configuration paragraph; use the
  review's comment and status wording
- name the open syzbot bug as the lmLogSync write rather than the
  txEnd write

v3: https://lore.kernel.org/openembedded-core/20260812072842.1176341-1-junjie.cao@linux.dev/

 meta/recipes-kernel/linux/cve-exclusion.inc | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-kernel/linux/cve-exclusion.inc b/meta/recipes-kernel/linux/cve-exclusion.inc
index 4318fc79..a133bf08 100644
--- a/meta/recipes-kernel/linux/cve-exclusion.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion.inc
@@ -231,3 +231,12 @@ CVE_STATUS[CVE-2022-1247] = "fixed-version: Fixed from version 6.17"
 # https://security-tracker.debian.org/tracker/CVE-2022-4543
 # https://ubuntu.com/security/CVE-2022-4543
 CVE_STATUS[CVE-2022-4543] = "unpatched: No fix has been proposed"
+
+# Triaged August 2026 - Originally proposed fix was withdrawn, similar
+# slab-use-after-free appears to have been re-found by syzkaller in 2026.
+# Unfixed in Debian, "needs evaluation" in Ubuntu.
+# https://lore.kernel.org/lkml/CAJedcCzmx02bfa22QezE8mu-iDsSdSy_oApT2ozCWO8O-8MJEQ@mail.gmail.com/
+# https://syzkaller.appspot.com/bug?extid=ea7ed3bb2f444cb4dfeb
+# https://security-tracker.debian.org/tracker/CVE-2023-3397
+# https://ubuntu.com/security/CVE-2023-3397
+CVE_STATUS[CVE-2023-3397] = "unpatched: Proposed fix was withdrawn"
-- 
2.43.0


