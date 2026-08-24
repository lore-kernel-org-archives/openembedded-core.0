Return-Path: <junjie.cao@linux.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF00FC5DF8C
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 02:23:32 +0000 (UTC)
Received: from mta0.migadu.com (mta0.migadu.com [91.218.175.101])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8502.1787538205209437363
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2026 19:23:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.dev header.s=key1 header.b=k8CRj9vl;
 spf=pass (domain: linux.dev, ip: 91.218.175.101, mailfrom: junjie.cao@linux.dev)
X-Envelope-To: openembedded-core@lists.openembedded.org
DKIM-Signature: a=rsa-sha256; bh=KuMDP1LgrOZ/zEuqpbHDNKCjoPiy9m8vEeMlCOmT9vY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787538203; v=1; x=1788143003;
 b=k8CRj9vl2b/vdlKeAZMW+ngGuNTBm9BcfkwvwEPdmPzkVoBq+nRK7sBYf2/J48O2uTJG9rmv
 SbvnSEapB3lJBettYYV/0SnxxxGERGljGy86KTABHQsm2SYI2pqfsYqX9qfp5QYmI46vJ/Q/LbN
 HaMiYl8/PiafJaIQzc2EzYN8=
X-Envelope-To: openembedded-core@lists.openembedded.org
Received: from localhost (2408:8806:52:f8ea:5de6:8d95:1672:70f3)
	by smtp.migadu.com with ESMTPS id d89bb3072466822a;
	Mon, 24 Aug 2026 02:23:23 +0000
X-Mizu-Trace-ID: d89bb3072466822a
X-Migadu-Flow: FLOW_OUT
From: Junjie Cao <junjie.cao@linux.dev>
To: openembedded-core@lists.openembedded.org
Cc: paul@pbarker.dev
Subject: [OE-core][PATCH v4 7/8] cve-exclusions: set status for CVE-2023-6238
Date: Sun, 23 Aug 2026 23:21:22 -0500
Message-ID: <20260824042123.1456876-8-junjie.cao@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824042123.1456876-1-junjie.cao@linux.dev>
References: <20260824042123.1456876-1-junjie.cao@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 02:23:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244053

NVME_IOCTL_IO_CMD and the io_uring passthrough path have never checked
the user-supplied metadata length against the number of blocks and the
namespace metadata size that the device uses to size the transfer, so
the device can DMA past the end of the buffer. 855b7717f44b ("nvme:
fine-granular CAP_SYS_ADMIN for nvme io commands", v6.2) let users with
write access to the device node issue the ioctl, turning the missing
check into an exposure; kernels before v6.2 are not affected, as Debian
concluded independently:

  https://security-tracker.debian.org/tracker/CVE-2023-6238

A fix removing unprivileged passthrough was proposed but not merged to
mainline, and nvme_map_user_request() still passes the metadata length
to blk_rq_integrity_map_user() with no cross-check:

  https://lore.kernel.org/linux-nvme/20231016060519.231880-1-joshi.k@samsung.com/

CC: Paul Barker <paul@pbarker.dev>
AI-Generated: Uses Claude (claude-opus-5)
Signed-off-by: Junjie Cao <junjie.cao@linux.dev>
---
v4:
- rework the explanation around 855b7717f44b making the ioctl reachable,
  per review; drop the applied-then-backed-out narrative
- status reads "Proposed fix was not merged" rather than "withdrawn",
  as flagged on the v3 thread: the fix was backed out by the nvme
  maintainer, not withdrawn by its author

v3: https://lore.kernel.org/openembedded-core/20260812072842.1176341-1-junjie.cao@linux.dev/

 meta/recipes-kernel/linux/cve-exclusion.inc | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-kernel/linux/cve-exclusion.inc b/meta/recipes-kernel/linux/cve-exclusion.inc
index a133bf08..4729191a 100644
--- a/meta/recipes-kernel/linux/cve-exclusion.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion.inc
@@ -240,3 +240,13 @@ CVE_STATUS[CVE-2022-4543] = "unpatched: No fix has been proposed"
 # https://security-tracker.debian.org/tracker/CVE-2023-3397
 # https://ubuntu.com/security/CVE-2023-3397
 CVE_STATUS[CVE-2023-3397] = "unpatched: Proposed fix was withdrawn"
+
+# Triaged August 2026 - Issue was introduced by kernel commit 855b7717f44b
+# ("nvme: fine-granular CAP_SYS_ADMIN for nvme io commands") in Linux v6.2.
+# Linux 6.1 and earlier not affected. Unfixed in recent Debian/Ubuntu releases
+# which use affected kernels. There was a fix proposed, but it was not merged
+# to mainline.
+# https://security-tracker.debian.org/tracker/CVE-2023-6238
+# https://ubuntu.com/security/CVE-2023-6238
+# https://lore.kernel.org/linux-nvme/20231016060519.231880-1-joshi.k@samsung.com/
+CVE_STATUS[CVE-2023-6238] = "unpatched: Proposed fix was not merged"
-- 
2.43.0


