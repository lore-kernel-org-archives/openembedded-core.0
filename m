Return-Path: <junjie.cao@linux.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F5C9C55175
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 08:48:48 +0000 (UTC)
Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39063.1785746926838466614
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 01:48:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@linux.dev header.s=key1 header.b=e5g0upg0;
 spf=pass (domain: linux.dev, ip: 95.215.58.171, mailfrom: junjie.cao@linux.dev)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785746924;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tf2LwXRonYPGygBrmVACvAsWm627X5UFUkPTP5uPfio=;
	b=e5g0upg0H5zRSslvTWGJYVbiwTjfrEC/IFFoMXGIW5gkMWCd0i9gUbtaGzOUl4LL8KMvny
	MrWNNpcXgpFf+obuUzsh7cjEpkY0LPkOrpQ/e4k7kcoL3TieKadFPd8n8PVxiZkW6iGKFO
	khv7C89dxXgSNirsUsV9FMHYWiwcbZY=
From: Junjie Cao <junjie.cao@linux.dev>
To: openembedded-core@lists.openembedded.org
Cc: paul@pbarker.dev,
	randy.macleod@windriver.com,
	Venkata.Navuduri@windriver.com
Subject: [OE-core][PATCH v2 00/10] cve-exclusion: triage ten kernel CVEs lacking upstream fix data
Date: Mon,  3 Aug 2026 01:48:17 -0700
Message-ID: <20260803084827.1348810-1-junjie.cao@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 08:48:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242626

This is v2 of the triage of the CVEs from Paul Barker's "linux-yocto CVEs
in need of triage" request [1], reworked according to his review [2]:
one patch per CVE, primary sources cited in every commit message, and
the three CVEs which have no upstream fix recorded as "unpatched" rather
than left out.

CVE-2023-3640 is not included; Adhitya is handling that one.

Summary of the ten verdicts:

  fixed-version     CVE-2022-1247   v6.17, rose_neigh refcount conversion
                    CVE-2023-4010   v6.18, imon URB resubmit loop
  disputed          CVE-2022-0400   never substantiated, closed by three =
vendors
  upstream-wontfix  CVE-2019-14899  weak host model, config-only mitigati=
on
                    CVE-2021-3714   inherent to KSM deduplication
                    CVE-2021-3864   two fix attempts, neither merged
                    CVE-2022-4543   KASLR not a boundary against local at=
tackers
  unpatched         CVE-2023-3397   JFS txEnd UAF, proposed fix withdrawn
                    CVE-2023-6238   NVMe fix applied then reverted
                    CVE-2023-6240   RSA timing oracle, fixed only in RHEL

Every commit referenced above was verified to exist and to be contained i=
n
the stated release using git tag --contains against mainline history at
linux-next 20260727.

Two points for reviewer attention:

- CVE-2023-4010 (patch 8) is the one identification that rests on
  inference rather than an authoritative statement: the fixing commit
  carries no CVE reference. The reasoning is spelled out in the commit
  message; "disputed" would also be defensible and I am happy to respin
  that patch if preferred.

- CVE-2022-1247 (patch 5) is fixed in v6.17, but no distribution tracker
  has connected the fix to the CVE yet. If the conclusion looks right it
  would be worth reporting back to Ubuntu, Debian and Red Hat.

The AI-Generated trailer on each patch covers source research and the
drafting of the commit messages. Every commit hash, release attribution
and quotation was verified against mainline git history and the cited
sources before submission, and I take responsibility for the
conclusions.

Once these are settled I am happy to prepare the wrynose and scarthgap
backports.

[1]: https://lore.kernel.org/all/4ac849a706feb16688020d5bcc3e74aececd63cf=
.camel@pbarker.dev/
[2]: https://lore.kernel.org/openembedded-core/95aae562c0b8862ac687a63e80=
03143044519d6e.camel@pbarker.dev/

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

Junjie Cao (10):
  cve-exclusion: set status for CVE-2019-14899
  cve-exclusion: set status for CVE-2021-3714
  cve-exclusion: set status for CVE-2021-3864
  cve-exclusion: set status for CVE-2022-0400
  cve-exclusion: set status for CVE-2022-1247
  cve-exclusion: set status for CVE-2022-4543
  cve-exclusion: set status for CVE-2023-3397
  cve-exclusion: set status for CVE-2023-4010
  cve-exclusion: set status for CVE-2023-6238
  cve-exclusion: set status for CVE-2023-6240

 meta/recipes-kernel/linux/cve-exclusion.inc | 67 +++++++++++++++++++++
 1 file changed, 67 insertions(+)

--=20
2.43.0


