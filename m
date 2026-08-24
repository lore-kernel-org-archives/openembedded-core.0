Return-Path: <junjie.cao@linux.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E28D1C5DF8C
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 02:23:02 +0000 (UTC)
Received: from mta1.migadu.com (mta1.migadu.com [95.215.58.236])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8451.1787538176580053917
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2026 19:22:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.dev header.s=key1 header.b=oF7z9yh0;
 spf=pass (domain: linux.dev, ip: 95.215.58.236, mailfrom: junjie.cao@linux.dev)
X-Envelope-To: openembedded-core@lists.openembedded.org
DKIM-Signature: a=rsa-sha256; bh=fidx4U7jtJX+oa/JHY2O2XZVSFhB4JydMSGAvpIvV2I=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787538174; v=1; x=1788142974;
 b=oF7z9yh0HfGhBcpCakaADxOfm/N86ILZsLKUsZyvPd9bJtCGxs/4sBF2Hqlw9KgkSZ2yaL/d
 1pCaqIG8fyptnTXhmA5/Tf7bqcMI+p27AcZsaWpwk6WxCxSIQQIH9naJqJbrCRW2R2AN3V+1tA0
 i6NW8nPWC25fC62skBngEw2E=
X-Envelope-To: openembedded-core@lists.openembedded.org
Received: from localhost (2408:8806:52:f8ea:5de6:8d95:1672:70f3)
	by smtp.migadu.com with ESMTPS id 2db75e3871ae28aa;
	Mon, 24 Aug 2026 02:22:54 +0000
X-Mizu-Trace-ID: 2db75e3871ae28aa
X-Migadu-Flow: FLOW_OUT
From: Junjie Cao <junjie.cao@linux.dev>
To: openembedded-core@lists.openembedded.org
Cc: paul@pbarker.dev
Subject: [OE-core][PATCH v4 3/8] cve-exclusions: set status for CVE-2021-3864
Date: Sun, 23 Aug 2026 23:21:18 -0500
Message-ID: <20260824042123.1456876-4-junjie.cao@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824042123.1456876-1-junjie.cao@linux.dev>
References: <20260824042123.1456876-1-junjie.cao@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 02:23:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244049

begin_new_exec() resets dumpability to owner-dumpable whenever the real
and effective ids match at exec time. A binary exec'd by a setuid
program that has already called setuid(0) therefore becomes dumpable as
root, and with a relative core_pattern plus an attacker-controlled
working directory the resulting core file can be dropped into a
privileged directory such as /etc/logrotate.d.

Full report with proof of concept:

  https://www.openwall.com/lists/oss-security/2021/10/20/2

Two fixes were proposed and neither was merged. Waiman Long's patch
was judged "not a particularly effective mitigation" by Eric W.
Biederman and the discussion went quiet by early 2022; Wander Lairson
Costa's RFC v2 received design feedback and no v3 followed:

  https://lore.kernel.org/all/20211221021744.864115-1-longman@redhat.com/
  https://lore.kernel.org/all/20211228170910.623156-1-wander@redhat.com/

CC: Paul Barker <paul@pbarker.dev>
AI-Generated: Uses Claude (claude-opus-5)
Signed-off-by: Junjie Cao <junjie.cao@linux.dev>
---
v4:
- use the review's comment and status wording; drop the coredump path
  analysis paragraph
- quote Biederman's assessment verbatim

v3: https://lore.kernel.org/openembedded-core/20260812072842.1176341-1-junjie.cao@linux.dev/

 meta/recipes-kernel/linux/cve-exclusion.inc | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-kernel/linux/cve-exclusion.inc b/meta/recipes-kernel/linux/cve-exclusion.inc
index 36643ccc..36920e2c 100644
--- a/meta/recipes-kernel/linux/cve-exclusion.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion.inc
@@ -206,3 +206,11 @@ model, no upstream fix"
 # https://ubuntu.com/security/CVE-2021-3714
 CVE_STATUS[CVE-2021-3714] = "unpatched: Timing side channel inherent to Kernel \
 Same-page Merging (KSM) page deduplication"
+
+# Triaged August 2026 - Two fixes proposed upstream but neither was merged,
+# attempts to fix seem to have petered out. Unfixed in Debian/Ubuntu.
+# https://lore.kernel.org/all/20211221021744.864115-1-longman@redhat.com/
+# https://lore.kernel.org/all/20211228170910.623156-1-wander@redhat.com/
+# https://security-tracker.debian.org/tracker/CVE-2021-3864
+# https://ubuntu.com/security/CVE-2021-3864
+CVE_STATUS[CVE-2021-3864] = "unpatched: Proposed fixes were not merged upstream"
-- 
2.43.0


