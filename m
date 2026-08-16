Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22EE0C5DF6D
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 16:39:50 +0000 (UTC)
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12817.1786898381999110334
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2026 09:39:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=BsiHojC8;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=Pl44Gttc;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.147, mailfrom: paul@pbarker.dev)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 1AF31EC00CD;
	Sun, 16 Aug 2026 12:39:41 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Sun, 16 Aug 2026 12:39:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1786898381;
	 x=1786984781; bh=6mlWcnUYp+muspv+Z554F7M8V0h82LhRePkNJ4mT3W0=; b=
	BsiHojC8MLVAiarokzqHCUDrSm0u1zuaTKG5EUXbHvw6of2eCshBDp3fji2xsXTt
	E7ST9JgRLrLGy7Iee1FrBiC+gUkMnpXrFODWvCfHVAmNNIfCEO4P2yLSloK8ApzE
	PltJ+1t2tQJczIFzQ7IyoW0AQ9q68r8YrB+Zrf1xk+qZHGPt1ftyNV5KsX3L041E
	meq3b5GtlxmPjYB7LY18kYnb7qGrDGG4QZpWEXL8JQH3pp6dsB2L3njpM/qTjpMF
	mRCv4xaA3qxt/VI4MLz8UTMjyIpRYumAgln4S0LJSFJTLcITYc86WOjWHc+Ax863
	rXtcEAysqs/+4ofcVlY79A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786898381; x=1786984781; bh=6
	mlWcnUYp+muspv+Z554F7M8V0h82LhRePkNJ4mT3W0=; b=Pl44GttcCb00jk4Un
	QjL7GpmrvqsDo24AM2ZHDSn7HjbXEK02ms3abDC6aAsB5xFcouAtLVh6DjCYg/CL
	7LfBpXNy1tVsx45atuZFuWNprUgMtI+cDKmGre6J0Sxs7GHHKidP672MbuZ4U41g
	NuieXKfBFV2LUSJrbwQsOOFV5uuR0pHce/9D/4/5jFdyJR68cviYuUrIflrwISP9
	NGW4zEKcAc+PMTu9woQ/uSnhxKXXbqPDAkTR7Bq67rqS4IIyde7Z4QvUohn5iqCJ
	rfTiSr7VAtuuoL5eX7tztFTHfiQ8nEoeEnhAdISvkgpDr+sI+dQGvdzRs3OyHQup
	1fJuQ==
X-ME-Sender: <xms:zOeBaiVQAOCbAlEAwFTVWG1tDhqeASOgZlio1iVMZfuGzV0hpQnqaw>
    <xme:zOeBakn90ngMz2q63iKUgHGAmm07yqNLyhPkMYvcdPr5z63fmf12qcIRwLvzejIZm
    4VDn-6V4QKttgQEblEo4QVNJEURriMk1CXi9rHOqsPX_amOVPUgtKQ>
X-ME-Received: <xmr:zOeBakBk-gL3ss7-K4cnugepIkiffgHCogywRtLEjGpbmuxDS7Ti-MCG-i1iLpZ7M-ESis8AYJmyCDmXyYng9-cfgK-3vkVuMGUNAw0PsTAM>
X-ME-Proxy-Cause: dmFkZTF4r1Wf69PklvjDqV5/s5/guxoaISyw16kbn5YHCq6TI8H+6vznCPK4Q+z/JEN9uj
    grZ7lH1mE1OI6S8BAPdj8VLtqcuzilBdmjm521dyO6isWbykVL+jz50gv4DuRoFR5bKSYK
    O8fY9A0NACq0e/cDbXR+shvp6RLzSJYFYXFZG2VnKE4Xg3BpKfwy+nlND2zCgjiGGVbpDr
    klmitRspJc7ySafevZYqkZbrZirmZS8+fWc58aOQcP90BOiUnejCLm7Tm1MldMpdMpfNwJ
    Rie6hBmY8TyKr4TQuJEhhKt0e4sa8mP9v4D3lzb7TQueNpolyumanRYvVUHYtCyqMGbWNG
    q5/bWFWlBwWLKG7zR2oI1RpuxDig5ZEmiRg/zWbmZlVDHqaecduMIS0PF9YjJShubQwHp4
    g2ns5AwXieV0FWeZ5H6HISymS/FPZFP9MYqSHwtxRrvLtqXp/pXQQL+4B8BIpIm5fou8iI
    HvRgCg4jBJPwH8E2Rz66470R21SBc3WCIZl5a/cFh7LSJOos7mwn3eRwxu9QlnhXP07ntQ
    Gpz3Bip+9devX0mWyTVy2+QgupMyEzNaij5+js28F3LSKGcL9l3LX8Kfrmeo4se6p5i0Fp
    uYF61U2gIELBVtSdnbu5DxdGSF1HKNEOfHH6cu5QSrVBMIxqSqAsojrFNgDQ
X-ME-Proxy: <xmx:zOeBakd4iE0vVXUeSGaS-otJgJt2xEU27-HbV8Y0p19M_ZjlIA8TNQ>
    <xmx:zOeBavJ9ZfwND7Z7qFu8hxlhpAj6G6N7Y7tp2QcA_PG1IpgwpWYRXQ>
    <xmx:zOeBanf3DTv-M_oNLBvQDJbGDod-ArzGRjuISXoDQ9Zn_wDH-x59pg>
    <xmx:zOeBam36j-DvvVTBKzTS2kl3olAVzN94FOT7t3jjhCW_uY5W2jgHOg>
    <xmx:zeeBaj6nG8s-Vft5b5HY5Td3G9fh6TBs2NbHtOdA7P3R13UygzOyG7eQ>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Aug 2026 12:39:40 -0400 (EDT)
Message-ID: <7b18fd3a5e6b660b9c605671da2b188b5abbf4ba.camel@pbarker.dev>
Subject: Re: [OE-core][PATCH v3 0/9] cve-exclusions: triage nine kernel CVEs
 lacking upstream fix data
From: Paul Barker <paul@pbarker.dev>
To: Junjie Cao <junjie.cao@linux.dev>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 16 Aug 2026 17:39:39 +0100
In-Reply-To: <20260812072842.1176341-1-junjie.cao@linux.dev>
References: <20260812072842.1176341-1-junjie.cao@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 16:39:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243540

On Wed, 2026-08-12 at 02:28 -0500, Junjie Cao wrote:
> This is v3 of the kernel CVE triage from Paul Barker's "linux-yocto CVEs
> in need of triage" request, reworked according to his review of v2 [1].
>=20
> Main changes since v2:
>=20
> - Dropped the CVE-2023-4010 (imon) patch. The identification rested on
>   inferring the reporter's intent from a screenshot, which the review
>   rejected. The CVE record names a function that does not exist in the
>   kernel (usb_giveback_urb()); I have reported that defect to the
>   assigning CNA and left the CVE untriaged here.
>=20
> - Moved the four entries that used "upstream-wontfix" (CVE-2019-14899,
>   CVE-2021-3714, CVE-2021-3864, CVE-2022-4543) to "unpatched". None has
>   an upstream kernel-community wontfix statement; the WONTFIX and
>   deferred positions are distribution ones. "unpatched" keeps them
>   visible in reports.
>=20
> - CVE-2022-1247 now leads with the v7.1 removal of net/rose and keeps
>   the v6.17 refcount commits, which are what cover the 6.18 kernel on
>   master. Upstream has since assigned those two commits CVE-2025-39826
>   and CVE-2025-39827, so the identification no longer rests on reading
>   the diff alone.
>=20
> - CVE-2023-3397: corrected the claim that only one fix was proposed and
>   withdrawn; further fixes were posted in 2026 but none is merged, and
>   syzbot still reproduces the txEnd()/lmLogClose() unmount race.
>=20
> - CVE-2023-6240: dropped the Marvell/s390 aside and an unrelated commit
>   reference flagged in review.
>=20
> CVE-2022-0400 and CVE-2023-6238 are unchanged since v2.
>=20
> AI assistance is disclosed with the AI-Generated trailer on each patch.
>=20
> Summary of the nine verdicts:
>=20
>   fixed-version   CVE-2022-1247   6.17, rose_neigh refcount conversion
>   disputed        CVE-2022-0400   never substantiated, closed by three ve=
ndors
>   unpatched       CVE-2019-14899  weak host model, config-only mitigation
>                   CVE-2021-3714   inherent to KSM deduplication
>                   CVE-2021-3864   two mitigation attempts, neither merged
>                   CVE-2022-4543   KASLR not a boundary against local atta=
ckers
>                   CVE-2023-3397   JFS txEnd UAF, no fix merged
>                   CVE-2023-6238   NVMe fix applied then reverted
>                   CVE-2023-6240   RSA timing oracle, fixed only in RHEL
>=20
> Once these are settled I can prepare the wrynose and scarthgap backports.

Hi,

I have spent some time validating the status of all the issues and I
think we're nearly there. I've suggested changes to the commit messages,
comments and CVE_STATUS wordings, with those addressed I think 8/9 of
these will be ready to merge.

CVE-2022-0400 still bothers me. There was clearly something reported,
there's a non-public Red Hat bugzilla entry referenced by Debian [1]. It
looks like it was closed by Red Hat, SUSE and Debian as they don't build
the affected code, not because it was an invalid report. We should ask
Red Hat to release more details.

[1]: https://bugzilla.redhat.com/show_bug.cgi?id=3D2040604

Best regards,

--=20
Paul Barker



