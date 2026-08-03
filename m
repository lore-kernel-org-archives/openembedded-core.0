Return-Path: <junjie.cao@linux.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38CD9C55184
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 08:50:58 +0000 (UTC)
Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39095.1785747050521069224
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 01:50:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@linux.dev header.s=key1 header.b=exJe2PVC;
 spf=pass (domain: linux.dev, ip: 91.218.175.173, mailfrom: junjie.cao@linux.dev)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785747047;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5Ag27dGr5ZrNePSTpMcmiyuLkAlF/sCHTZZPBlhPERQ=;
	b=exJe2PVCO7sC88nMibkLbVaONYPUCFnMyVybqkTBoXXqWUEWe5H6KQO4Q4cOQ9J2zgiod7
	wWHl7T3k9EK0GKEsD299ots0CIx0o7h7Gy3CGgYiboLlsR/wvsHDFP2EgQMhTDyZcM5U8U
	cq+NspRxLzi/J+mqxhfx1PgaRZ7yBkg=
From: Junjie Cao <junjie.cao@linux.dev>
To: openembedded-core@lists.openembedded.org
Cc: paul@pbarker.dev,
	randy.macleod@windriver.com,
	Venkata.Navuduri@windriver.com
Subject: [OE-core][PATCH v2 09/10] cve-exclusion: set status for CVE-2023-6238
Date: Mon,  3 Aug 2026 01:48:26 -0700
Message-ID: <20260803084827.1348810-10-junjie.cao@linux.dev>
In-Reply-To: <20260803084827.1348810-1-junjie.cao@linux.dev>
References: <20260803084827.1348810-1-junjie.cao@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 08:50:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242635

NVME_IOCTL_IO_CMD and the io_uring passthrough path accept a
metadata length from userspace without checking it against the number of
blocks and the namespace metadata size that the device uses to size the
transfer, so the device can DMA past the end of the buffer.

Kanchan Joshi posted a stopgap removing unprivileged passthrough,
reviewed by Christoph Hellwig and applied for nvme-6.6:

  https://lore.kernel.org/linux-nvme/20231016060519.231880-1-joshi.k@sams=
ung.com/

It was then backed out. Keith Busch wrote "I believe this large change
is a bit too late for 6.6 ... It's backed out now", to which Christoph
Hellwig replied "We leave an exploitable hole in, so I don't think
waiting any longer is an option". No replacement has been merged: the
commits the patch would have reverted are all still present, and
nvme_map_user_request() still passes the user-supplied metadata length
straight to blk_rq_integrity_map_user() with no cross-check.

The exposure was introduced by
855b7717f44b ("nvme: fine-granular CAP_SYS_ADMIN for nvme io commands")
in v6.2, so branches carrying older kernels are not affected. Debian
reached the same conclusion independently, marking the older suites
"Vulnerable code not present":

  https://security-tracker.debian.org/tracker/CVE-2023-6238

Red Hat rates it Low because the device node is root-only by default:

  https://access.redhat.com/security/cve/CVE-2023-6238

CC: Paul Barker <paul@pbarker.dev>
AI-Generated: Uses Claude (claude-opus-5)
Signed-off-by: Junjie Cao <junjie.cao@linux.dev>
---
changes in v2:
- split out of the single combined patch, one CVE per patch as requested
- added primary source links (disclosures, distribution trackers, mailing
  list threads, upstream commits) to every commit message
- added the three CVEs with no upstream fix as "unpatched" entries instea=
d
  of leaving them undocumented
- disclosed AI assistance per the contributor guide

v1: https://lore.kernel.org/openembedded-core/20260802143444.1178575-1-ju=
njie.cao@linux.dev/

 meta/recipes-kernel/linux/cve-exclusion.inc | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-kernel/linux/cve-exclusion.inc b/meta/recipes-k=
ernel/linux/cve-exclusion.inc
index 0647586f..506d3705 100644
--- a/meta/recipes-kernel/linux/cve-exclusion.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion.inc
@@ -244,3 +244,11 @@ patch was withdrawn by its author and the affected f=
s/jfs code is unchanged"
 # The CVE names usb_giveback_urb(), which does not exist; the reporter's=
 PoC
 # and Ubuntu's break-fix data both point at drivers/media/rc/imon.c.
 CVE_STATUS[CVE-2023-4010] =3D "fixed-version: Fixed from version 6.18"
+
+# The user metadata length is not checked against the length the device
+# derives from the command. The fix was applied to nvme-6.6 and then bac=
ked
+# out; nothing has landed since. Kernels before v6.2 predate unprivilege=
d
+# passthrough (855b7717f44b) and are not affected.
+# https://lore.kernel.org/linux-nvme/20231016060519.231880-1-joshi.k@sam=
sung.com/
+CVE_STATUS[CVE-2023-6238] =3D "unpatched: the proposed fix was applied t=
o \
+nvme-6.6 and then reverted, no upstream fix has landed since"
--=20
2.43.0


