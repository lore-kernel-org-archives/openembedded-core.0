Return-Path: <junjie.cao@linux.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1988C5DF9C
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 02:22:52 +0000 (UTC)
Received: from mta1.migadu.com (mta1.migadu.com [95.215.58.235])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8450.1787538169652705256
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2026 19:22:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.dev header.s=key1 header.b=DBllYQBV;
 spf=pass (domain: linux.dev, ip: 95.215.58.235, mailfrom: junjie.cao@linux.dev)
X-Envelope-To: openembedded-core@lists.openembedded.org
DKIM-Signature: a=rsa-sha256; bh=fn3Kt76z/ne0wvF+12NhERrQBvQKUU7HbJv4M0uxCt4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787538167; v=1; x=1788142967;
 b=DBllYQBV5fYXWak4OIt3hsn+Hbll7vf0zNQgCoR6c/HXA8V321D4NtHFbBVfmVIYtF2bZUiO
 ozxBzqFFAjAUKWunO4AlUXzaZ6gynX0v418BqDB9dGqaYqjm0/XHOOu9/1IP+4VStQcgP35Q9bE
 4NjtfjYVHWi0p8pSYH6dAnSA=
X-Envelope-To: openembedded-core@lists.openembedded.org
Received: from localhost (2408:8806:52:f8ea:5de6:8d95:1672:70f3)
	by smtp.migadu.com with ESMTPS id 5773324741d78868;
	Mon, 24 Aug 2026 02:22:47 +0000
X-Mizu-Trace-ID: 5773324741d78868
X-Migadu-Flow: FLOW_OUT
From: Junjie Cao <junjie.cao@linux.dev>
To: openembedded-core@lists.openembedded.org
Cc: paul@pbarker.dev
Subject: [OE-core][PATCH v4 2/8] cve-exclusions: set status for CVE-2021-3714
Date: Sun, 23 Aug 2026 23:21:17 -0500
Message-ID: <20260824042123.1456876-3-junjie.cao@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824042123.1456876-1-junjie.cao@linux.dev>
References: <20260824042123.1456876-1-junjie.cao@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 02:22:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244048

KSM merges identical anonymous pages across processes. An attacker who
can place chosen page-sized content in a victim's memory can detect the
merge through the timing of the resulting copy-on-write fault, and so
leak memory contents.

There is no upstream fix; removing the side channel means removing
deduplication. Distribution trackers describe it the same way - Debian
marks src:linux unfixed with "Inherent design limitation, can be
avoided by not using KSM", Red Hat closed its bug WONTFIX, and Ubuntu
records no upstream fix as of 2024-06-17:

  https://security-tracker.debian.org/tracker/CVE-2021-3714
  https://bugzilla.redhat.com/show_bug.cgi?id=1931327
  https://ubuntu.com/security/CVE-2021-3714

CC: Paul Barker <paul@pbarker.dev>
AI-Generated: Uses Claude (claude-opus-5)
Signed-off-by: Junjie Cao <junjie.cao@linux.dev>
---
v4:
- use the review's comment and status wording; drop the KSM runtime
  opt-in paragraph

v3: https://lore.kernel.org/openembedded-core/20260812072842.1176341-1-junjie.cao@linux.dev/

 meta/recipes-kernel/linux/cve-exclusion.inc | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-kernel/linux/cve-exclusion.inc b/meta/recipes-kernel/linux/cve-exclusion.inc
index b2eb15d0..36643ccc 100644
--- a/meta/recipes-kernel/linux/cve-exclusion.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion.inc
@@ -197,3 +197,12 @@ CVE_STATUS[CVE-2025-71145] = "cpe-stable-backport: Fixed from v6.18.3"
 # https://ubuntu.com/security/CVE-2019-14899
 CVE_STATUS[CVE-2019-14899] = "unpatched: Consequence of the default weak host \
 model, no upstream fix"
+
+# Triaged August 2026 - no upstream fix, Debian says "Inherent design
+# limitation, can be avoided by not using KSM", Red Hat closed their bug as
+# WONTFIX.
+# https://security-tracker.debian.org/tracker/CVE-2021-3714
+# https://bugzilla.redhat.com/show_bug.cgi?id=1931327
+# https://ubuntu.com/security/CVE-2021-3714
+CVE_STATUS[CVE-2021-3714] = "unpatched: Timing side channel inherent to Kernel \
+Same-page Merging (KSM) page deduplication"
-- 
2.43.0


