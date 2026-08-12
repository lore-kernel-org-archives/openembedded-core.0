Return-Path: <junjie.cao@linux.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18E8EC5AD5A
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 05:30:31 +0000 (UTC)
Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1518.1786512620669088289
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2026 22:30:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@linux.dev header.s=key1 header.b=H1xwbjnh;
 spf=pass (domain: linux.dev, ip: 91.218.175.186, mailfrom: junjie.cao@linux.dev)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786512617;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TOkpDiyQiEDd0MzoO5wsZTzIr8MyjW34xMFpK0qEvs4=;
	b=H1xwbjnhzaGqA8+OjEQ5FImuyGDC9WPi6IF81JRkdaVd0nT05FbX2FhIZd+JL5X32DV7XJ
	dxp8u42ZcOgkWhtjRGwiGsU5W0b3PtjvipnnkkevOkHrVtrx70Ggw+ZbSfwdittzAnY6Dq
	hBHbtB0RbKL91ULNtBpnk9f/acqezgo=
From: Junjie Cao <junjie.cao@linux.dev>
To: openembedded-core@lists.openembedded.org
Cc: paul@pbarker.dev
Subject: [OE-core][PATCH v3 0/9] cve-exclusions: triage nine kernel CVEs lacking upstream fix data
Date: Wed, 12 Aug 2026 02:28:33 -0500
Message-ID: <20260812072842.1176341-1-junjie.cao@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 05:30:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243225

This is v3 of the kernel CVE triage from Paul Barker's "linux-yocto CVEs
in need of triage" request, reworked according to his review of v2 [1].

Main changes since v2:

- Dropped the CVE-2023-4010 (imon) patch. The identification rested on
  inferring the reporter's intent from a screenshot, which the review
  rejected. The CVE record names a function that does not exist in the
  kernel (usb_giveback_urb()); I have reported that defect to the
  assigning CNA and left the CVE untriaged here.

- Moved the four entries that used "upstream-wontfix" (CVE-2019-14899,
  CVE-2021-3714, CVE-2021-3864, CVE-2022-4543) to "unpatched". None has
  an upstream kernel-community wontfix statement; the WONTFIX and
  deferred positions are distribution ones. "unpatched" keeps them
  visible in reports.

- CVE-2022-1247 now leads with the v7.1 removal of net/rose and keeps
  the v6.17 refcount commits, which are what cover the 6.18 kernel on
  master. Upstream has since assigned those two commits CVE-2025-39826
  and CVE-2025-39827, so the identification no longer rests on reading
  the diff alone.

- CVE-2023-3397: corrected the claim that only one fix was proposed and
  withdrawn; further fixes were posted in 2026 but none is merged, and
  syzbot still reproduces the txEnd()/lmLogClose() unmount race.

- CVE-2023-6240: dropped the Marvell/s390 aside and an unrelated commit
  reference flagged in review.

CVE-2022-0400 and CVE-2023-6238 are unchanged since v2.

AI assistance is disclosed with the AI-Generated trailer on each patch.

Summary of the nine verdicts:

  fixed-version   CVE-2022-1247   6.17, rose_neigh refcount conversion
  disputed        CVE-2022-0400   never substantiated, closed by three ve=
ndors
  unpatched       CVE-2019-14899  weak host model, config-only mitigation
                  CVE-2021-3714   inherent to KSM deduplication
                  CVE-2021-3864   two mitigation attempts, neither merged
                  CVE-2022-4543   KASLR not a boundary against local atta=
ckers
                  CVE-2023-3397   JFS txEnd UAF, no fix merged
                  CVE-2023-6238   NVMe fix applied then reverted
                  CVE-2023-6240   RSA timing oracle, fixed only in RHEL

Once these are settled I can prepare the wrynose and scarthgap backports.

[1] https://lore.kernel.org/openembedded-core/8bf8e31c06972ab4bfed61083d8=
d8c57e6c48d9e.camel@pbarker.dev/

v2: https://lore.kernel.org/openembedded-core/20260803084827.1348810-1-ju=
njie.cao@linux.dev/

Junjie Cao (9):
  cve-exclusions: set status for CVE-2019-14899
  cve-exclusions: set status for CVE-2021-3714
  cve-exclusions: set status for CVE-2021-3864
  cve-exclusions: set status for CVE-2022-0400
  cve-exclusions: set status for CVE-2022-1247
  cve-exclusions: set status for CVE-2022-4543
  cve-exclusions: set status for CVE-2023-3397
  cve-exclusions: set status for CVE-2023-6238
  cve-exclusions: set status for CVE-2023-6240

 meta/recipes-kernel/linux/cve-exclusion.inc | 67 +++++++++++++++++++++
 1 file changed, 67 insertions(+)

--=20
2.43.0


