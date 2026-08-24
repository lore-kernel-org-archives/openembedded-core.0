Return-Path: <junjie.cao@linux.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C871C5DF9C
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 02:22:43 +0000 (UTC)
Received: from mta0.migadu.com (mta0.migadu.com [91.218.175.73])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8492.1787538153331431893
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2026 19:22:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.dev header.s=key1 header.b=JPdTZqVt;
 spf=pass (domain: linux.dev, ip: 91.218.175.73, mailfrom: junjie.cao@linux.dev)
X-Envelope-To: openembedded-core@lists.openembedded.org
DKIM-Signature: a=rsa-sha256; bh=KXm8tU5mMO15on8Ni99ECOWQZymTgnUa7xr9bKGFcWk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787538151; v=1; x=1788142951;
 b=JPdTZqVtbGwdDg/f1DVPMcCXC5OepST7U7RA3iXNLBvyYrDOqXN0mD8xV6VHWlG0vxc5CFoH
 6dFwXdygPsrjVvujCyif+rxJOwbonADSzXnFknURG5z6uyJdI+zB4nnILkQCT41B3U0zgESOe7O
 B9tHQV0MKQMQfTIDgqzchRXg=
X-Envelope-To: openembedded-core@lists.openembedded.org
Received: from localhost (2408:8806:52:f8ea:5de6:8d95:1672:70f3)
	by smtp.migadu.com with ESMTPS id b157176e2ee159d1;
	Mon, 24 Aug 2026 02:22:31 +0000
X-Mizu-Trace-ID: b157176e2ee159d1
X-Migadu-Flow: FLOW_OUT
From: Junjie Cao <junjie.cao@linux.dev>
To: openembedded-core@lists.openembedded.org
Cc: paul@pbarker.dev
Subject: [OE-core][PATCH v4 0/8] cve-exclusions: triage eight kernel CVEs lacking upstream fix data
Date: Sun, 23 Aug 2026 23:21:15 -0500
Message-ID: <20260824042123.1456876-1-junjie.cao@linux.dev>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 02:22:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244046

This is v4 of the kernel CVE triage from Paul Barker's "linux-yocto
CVEs in need of triage" request, reworked according to his review of
v3 [1].

Changes since v3:

- Seven entries adopt the comment and CVE_STATUS wordings suggested in
  [1], including triage dates and distribution tracker links in the
  .inc comments; the CVE-2022-1247 entry was approved as-is and is
  unchanged. Commit message detail flagged as unnecessary or
  time-consuming to validate is dropped. One deviation: the
  CVE-2023-6238 status reads "Proposed fix was not merged" rather than
  "withdrawn" - the fix was backed out by the nvme maintainer, not
  withdrawn by its author - matching the comment above the entry.

- CVE-2022-0400 stays out of this series as agreed. Red Hat PSIRT has
  since answered the request for details (ticket PSIRTSUPT-22046) and
  named the affected code; it is the issue fixed in v6.13 that
  upstream tracks as CVE-2024-49568, with the details recorded on the
  public bug [2]. A separate patch records the fixed-version status.

Summary of the eight verdicts:

  fixed-version   CVE-2022-1247   6.17, rose_neigh refcount conversion
  unpatched       CVE-2019-14899  weak host model, no upstream fix
                  CVE-2021-3714   inherent to KSM deduplication
                  CVE-2021-3864   proposed fixes not merged
                  CVE-2022-4543   EntryBleed, no fix proposed
                  CVE-2023-3397   JFS UAF, proposed fix withdrawn
                  CVE-2023-6238   NVMe passthrough, fix not merged
                  CVE-2023-6240   Marvin oracle, fixed only in RHEL

AI assistance is disclosed with the AI-Generated trailer on each patch.

Once these are settled I can prepare the wrynose and scarthgap
backports.

[1] https://lore.kernel.org/openembedded-core/7b18fd3a5e6b660b9c605671da2b188b5abbf4ba.camel@pbarker.dev/
[2] https://bugzilla.redhat.com/show_bug.cgi?id=2044575

v3: https://lore.kernel.org/openembedded-core/20260812072842.1176341-1-junjie.cao@linux.dev/
v2: https://lore.kernel.org/openembedded-core/20260803084827.1348810-1-junjie.cao@linux.dev/

Junjie Cao (8):
  cve-exclusions: set status for CVE-2019-14899
  cve-exclusions: set status for CVE-2021-3714
  cve-exclusions: set status for CVE-2021-3864
  cve-exclusions: set status for CVE-2022-1247
  cve-exclusions: set status for CVE-2022-4543
  cve-exclusions: set status for CVE-2023-3397
  cve-exclusions: set status for CVE-2023-6238
  cve-exclusions: set status for CVE-2023-6240

 meta/recipes-kernel/linux/cve-exclusion.inc | 68 +++++++++++++++++++++
 1 file changed, 68 insertions(+)

-- 
2.43.0


