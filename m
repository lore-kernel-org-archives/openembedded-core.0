Return-Path: <junjie.cao@linux.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09607C5DF97
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 02:23:13 +0000 (UTC)
Received: from mta0.migadu.com (mta0.migadu.com [91.218.175.91])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8497.1787538183585360629
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2026 19:23:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.dev header.s=key1 header.b=J1H4PuN9;
 spf=pass (domain: linux.dev, ip: 91.218.175.91, mailfrom: junjie.cao@linux.dev)
X-Envelope-To: openembedded-core@lists.openembedded.org
DKIM-Signature: a=rsa-sha256; bh=m2eZT6oy8fRj4bCNXbioLDgdUeaCWkG+Sqja1xEi4q8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787538181; v=1; x=1788142981;
 b=J1H4PuN9hld5oI7yuJZQMN6c56FyUeBBZEbi2a2CPPPOJMwycTc+nU265rK6o7Fst0+93Ffc
 pcUWhQsENOylx6alZpyO9oQPRK8u3is4b1gJNAjWhkGtPZBmPhhI8pbA5mLbq39B8BDzYzqGI/B
 7Hm8mgJQ9wbzJmcD3pEoYXC4=
X-Envelope-To: openembedded-core@lists.openembedded.org
Received: from localhost (2408:8806:52:f8ea:5de6:8d95:1672:70f3)
	by smtp.migadu.com with ESMTPS id 386e441e906ce66b;
	Mon, 24 Aug 2026 02:23:01 +0000
X-Mizu-Trace-ID: 386e441e906ce66b
X-Migadu-Flow: FLOW_OUT
From: Junjie Cao <junjie.cao@linux.dev>
To: openembedded-core@lists.openembedded.org
Cc: paul@pbarker.dev
Subject: [OE-core][PATCH v4 4/8] cve-exclusions: set status for CVE-2022-1247
Date: Sun, 23 Aug 2026 23:21:19 -0500
Message-ID: <20260824042123.1456876-5-junjie.cao@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824042123.1456876-1-junjie.cao@linux.dev>
References: <20260824042123.1456876-1-junjie.cao@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 02:23:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244050

The CVE describes a race between rose_connect() and the code that
frees a rose_neigh once its count and use fields reach zero. The race
in the original report [1] is the one fixed independently in v6.17 by
the rose_neigh refcount conversion:

  https://git.kernel.org/linus/d860d1faa6b2ce3becfdb8b0c2b048ad31800061
  ("net: rose: convert 'use' field to refcount_t", v6.17)
  https://git.kernel.org/linus/da9c9c877597170b929a6121a68dcd3dd9a80f45
  ("net: rose: include node references in rose_neigh refcount", v6.17)

The Linux kernel CVE team assigned these commits CVE-2025-39826 and
CVE-2025-39827.

[1] https://bugzilla.redhat.com/show_bug.cgi?id=2066799

CC: Paul Barker <paul@pbarker.dev>
AI-Generated: Uses Claude (claude-opus-5)
Signed-off-by: Junjie Cao <junjie.cao@linux.dev>
---
v4:
- simplify the explanation as suggested; reference the original report
  instead of arguing from the commit diffs

v3: https://lore.kernel.org/openembedded-core/20260812072842.1176341-1-junjie.cao@linux.dev/

 meta/recipes-kernel/linux/cve-exclusion.inc | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-kernel/linux/cve-exclusion.inc b/meta/recipes-kernel/linux/cve-exclusion.inc
index 36920e2c..a9b4d9a2 100644
--- a/meta/recipes-kernel/linux/cve-exclusion.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion.inc
@@ -214,3 +214,11 @@ Same-page Merging (KSM) page deduplication"
 # https://security-tracker.debian.org/tracker/CVE-2021-3864
 # https://ubuntu.com/security/CVE-2021-3864
 CVE_STATUS[CVE-2021-3864] = "unpatched: Proposed fixes were not merged upstream"
+
+# net/rose and rose_connect() were removed entirely in v7.1 (dd8d4bc28ad7).
+# The 6.18 kernel on master still carries net/rose; there the race is
+# closed by the v6.17 refcount conversion, which upstream tracks as
+# CVE-2025-39826 / CVE-2025-39827.
+# Fix https://git.kernel.org/linus/d860d1faa6b2ce3becfdb8b0c2b048ad31800061
+# Fix https://git.kernel.org/linus/da9c9c877597170b929a6121a68dcd3dd9a80f45
+CVE_STATUS[CVE-2022-1247] = "fixed-version: Fixed from version 6.17"
-- 
2.43.0


