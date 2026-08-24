Return-Path: <junjie.cao@linux.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AEE7C5DF97
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 02:31:53 +0000 (UTC)
Received: from mta0.migadu.com (mta0.migadu.com [91.218.175.162])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8550.1787538704652614106
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2026 19:31:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.dev header.s=key1 header.b=s+DiEci6;
 spf=pass (domain: linux.dev, ip: 91.218.175.162, mailfrom: junjie.cao@linux.dev)
X-Envelope-To: openembedded-core@lists.openembedded.org
DKIM-Signature: a=rsa-sha256; bh=dby0XxnPetZEY3hJJ3DlSDstHKbsqp84M1cM/SipO18=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787538702; v=1; x=1788143502;
 b=s+DiEci6kss4hOFJkAdBkuggh6hfIjkv/N/5OAWesxgytELekLmA8JbFh7DTjdCkBJkJlXor
 inZHx1KOxsn8mOooBxoMHfLxWA9kkrcRS0VEqq6P8dKU+N63eTONJN9DcqYYSNSXTP9Np8G/Cr5
 /BVKAFzXgDIWEbrJ2eEarli8=
X-Envelope-To: openembedded-core@lists.openembedded.org
Received: from localhost (2408:8806:52:f8ea:5de6:8d95:1672:70f3)
	by smtp.migadu.com with ESMTPS id 2dde8322dc195d43;
	Mon, 24 Aug 2026 02:31:42 +0000
X-Mizu-Trace-ID: 2dde8322dc195d43
X-Migadu-Flow: FLOW_OUT
From: Junjie Cao <junjie.cao@linux.dev>
To: openembedded-core@lists.openembedded.org
Cc: paul@pbarker.dev
Subject: [OE-core][PATCH] cve-exclusions: set status for CVE-2022-0400
Date: Sun, 23 Aug 2026 23:30:34 -0500
Message-ID: <20260824043034.1457687-1-junjie.cao@linux.dev>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 02:31:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244055

The CVE describes an out-of-bounds read in the SMC protocol stack, but
the originating report, Red Hat bug 2040604, was never made public and
no tracker records affected code or a fix.

On request, Red Hat PSIRT identified the affected code (ticket
PSIRTSUPT-22046, summarized in the public bug [1]): the v2_ext_offset
field of an incoming CLC proposal message is used to compute a memory
offset without validation, in the chain smc_clc_msg_hdr_valid() ->
smc_clc_msg_prop_valid() -> smc_get_clc_v2_ext() (net/smc/smc_clc.h).

The unchecked read dates from the introduction of V2 CLC proposal
parsing in v5.10 (8c3dca341aea); at the time of the report,
smc_get_clc_v2_ext() checked the offset only for zero and
smc_clc_msg_prop_valid() dereferenced the resulting pointer. It is
closed by the v6.13 validation of exactly these fields:

  https://git.kernel.org/linus/7863c9f3d24ba49dbead7e03dfbe40deb5888fdf
  ("net/smc: check v2_ext_offset/eid_cnt/ism_gid_cnt when receiving
   proposal msg", v6.13)

The kernel CVE team assigned that commit CVE-2024-49568, recording the
issue introduced in 5.10 and fixed in 6.6.68, 6.12.7 and 6.13:

  https://lore.kernel.org/linux-cve-announce/2025011142-CVE-2024-49568-e5f6@gregkh/

CVE-2022-0400 predates the kernel CNA and no tracker has connected it
to this fix.

[1] https://bugzilla.redhat.com/show_bug.cgi?id=2044575#c23

CC: Paul Barker <paul@pbarker.dev>
AI-Generated: Uses Claude (claude-opus-5)
Signed-off-by: Junjie Cao <junjie.cao@linux.dev>
---
Previously 4/9 of the triage series: v3 proposed "disputed" and the
patch was dropped pending more information from Red Hat, which has now
been provided. Applies on top of the "triage eight kernel CVEs" v4
series.

v3: https://lore.kernel.org/openembedded-core/20260812072842.1176341-1-junjie.cao@linux.dev/

 meta/recipes-kernel/linux/cve-exclusion.inc | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-kernel/linux/cve-exclusion.inc b/meta/recipes-kernel/linux/cve-exclusion.inc
index 8714173c..1505f9b3 100644
--- a/meta/recipes-kernel/linux/cve-exclusion.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion.inc
@@ -260,3 +260,12 @@ CVE_STATUS[CVE-2023-6238] = "unpatched: Proposed fix was not merged"
 # https://ubuntu.com/security/CVE-2023-6240
 CVE_STATUS[CVE-2023-6240] = "unpatched: Fixed in RHEL but patch not identified \
 publicly"
+
+# The originating report (Red Hat bug 2040604) is not public. On request,
+# Red Hat PSIRT identified the affected code: the v2_ext_offset of an
+# incoming SMC CLC proposal message was used without validation in
+# net/smc/smc_clc.h. Introduced in v5.10, fixed by the v6.13 proposal
+# message validation, which upstream tracks as CVE-2024-49568.
+# https://bugzilla.redhat.com/show_bug.cgi?id=2044575#c23
+# Fix https://git.kernel.org/linus/7863c9f3d24ba49dbead7e03dfbe40deb5888fdf
+CVE_STATUS[CVE-2022-0400] = "fixed-version: Fixed from version 6.13"
-- 
2.43.0


