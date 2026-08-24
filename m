Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27B36C5DF94
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 07:57:45 +0000 (UTC)
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11785.1787558260841928851
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 00:57:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=q2kacqgi;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=W4XzgmBw;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.151, mailfrom: paul@pbarker.dev)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id D8F221D0008D;
	Mon, 24 Aug 2026 03:57:39 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Mon, 24 Aug 2026 03:57:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1787558259;
	 x=1787644659; bh=iB6+RyiHLe+IYgdwyJQk8XZhsSn7MRc0gW+5OJeS2nw=; b=
	q2kacqgiQEFxtm8LQDsgSQRZeHfBngFq5HzzZhm7fOzcPggId06A/2/gQSDeBAMo
	ie2dVsaERTKAzAj/0+UJo8zsAATAiRG3LC76RUd9ZUnm5RhMbe2jiipkE+TAGlVt
	FjmwoPQvONqDAy27LqPSmOr60T3M9UUeWhyEPNfeIaU55veOzIYIuEX78h+AFKdf
	rcEF1NQqoeqgR9HmbojfxWaC7KW6CC4nXTEFKcQ6q9hQ6Olusmto3DeyY0p5jokq
	rl+aOw4pAQ2v5L1YG3mmth+WNxnnwRojRVXhg91CqWRRzjZz8p+MnT626tZcdYq+
	M+kdsfv/gHH2h5VLU/mvGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1787558259; x=1787644659; bh=i
	B6+RyiHLe+IYgdwyJQk8XZhsSn7MRc0gW+5OJeS2nw=; b=W4XzgmBwkbtnfTici
	Gz5Ke8iHvH9CRyGmfTgCg5OBYhCKes3ThgcPKTAQQmIWbnmMoI+bJqgG1D1Zy7mF
	34jn+l33tNUyzj4kUymuF24LDVXIiDDzu7Eu16EVPExbP5QFveQDxoLTzWmc8mRS
	QLNnPG4IYcr6dqKo5ZjVZ10yC1zUz8WwVACEpNhtWn9Qf+tw+m3wn68knyvpFrKa
	Y73rVC5fZtEaY2XcyGmH23STWheHJq5yLNMCRe2E/sIYIjkCFCUOpT9t4cQEhePC
	xTPeqT2Zjoaxczf3AzWCiHRCH5rf9wkR84Cw9N4fbPKO7/tZ926mLQVl6+aMbp3X
	peyEQ==
X-ME-Sender: <xms:c_mLap--_HCjiycM2ZqPKgmsZo0ByrWYZEPcebpw7sU7PbiRf47luA>
    <xme:c_mLajujB6SbSVwr-Gte3w6Ue8Fs1bW9Jkspg6mgHEzj8JiMQ4MCXBuFKtMn8RTZ8
    atoKZwyZQ-xt8HqGndSkQzf2sIoZ8Jd9nSqqE6pGcUOPfttGkjAUko>
X-ME-Received: <xmr:c_mLakp4lIxdssO88oAoHWsRwssi7OYUQ089s19wuGebzVBrhQ3ZxvMAzokrEMTjsFb8nRB9JxZS96eUxRC3P793P4QK1rLhrRYw1Q>
X-ME-Proxy-Cause: dmFkZTGN7zrsnH3qCAE7qVJq+5DM8C4qitPf44nD1S5HlHGt6mD/2V/0BqK4HbIWpcvXd5
    HrRM/imHe0hs6SXo8BPeO34RfLQweHj5i8LBrhNrXWl8bsTYdGX+Fa/FbpTVsMKfQrggKw
    2dZ24X5KvCjsBlQHd+Cma6sheutmsZ4OoAne2qRCbOfojTMPWtwkCKrCS+SlrdNFvVmRxa
    GFGLdNOwvToAL5d3g1UcaS1adgQL38TBblhewpSCxZ6CCaSEAYQDMgwn1BY5bxJqBkkeS2
    l6fX5UMKyCDya6owLwU1lM+3SypqVaxyU9iQ0joqYqR5G5bAFdws6JnnUZ01aODXmR4lnv
    8tngetPgRWkNxPgW9ZtJn+CcsiWGQSeFTjfBTziVk3qyigHUYZRTN88MKD4xsnozkc44g4
    FFtNRaIj1Dpn66j1uXvrmwIw3NLTaPzp8UM6fU3yJ1lSYHQ+K1Xk+e/OQj9RMowdDydNAD
    i1A8PZqtFMD7q+KM6qpwvnGZ7eizwky7tK/1Xc01VYZLXFtuxS/dVu1bJurVNn3p40lo0M
    htgjKMWIpBILk4/ryuh3yZXIWPct8lVT6h2XYO2Wu04O27AdhM2mGWU94lbkkJ9niWip9x
    HnFuo36NNPDfXe26mxZOsDLL3WSNbT078Zs6fXQKPkOJXzhEyp06ax+9DPZQ
X-ME-Proxy: <xmx:c_mLaon8W3caPCHcsnKKulvWK3Bx0VI30830azLABQ3lf8EwA2NOSg>
    <xmx:c_mLagwaIP1JCLXMkLjSgnYS2CZY3fVfAQ8F784Og7z38jFrFQZO8Q>
    <xmx:c_mLaonKuabr5ES4S6gKWLHulEeA8I1_Cp13vbaItN8CqS0xIyIlXg>
    <xmx:c_mLahcF80hU2IuneBjxm1eRKl-ddLaTOFXRnRj2aCBcshyvVXRWEw>
    <xmx:c_mLalhYaMUJOWlU7vr3aW4DoE0blkf2XUTfQwswp6auUxX63OEm-Ff3>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Aug 2026 03:57:39 -0400 (EDT)
Message-ID: <49cc2c17fff4ee8eb6f8494891edc3c04895176b.camel@pbarker.dev>
Subject: Re: [OE-core][PATCH v4 0/8] cve-exclusions: triage eight kernel
 CVEs lacking upstream fix data
From: Paul Barker <paul@pbarker.dev>
To: Junjie Cao <junjie.cao@linux.dev>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 24 Aug 2026 08:57:37 +0100
In-Reply-To: <20260824042123.1456876-1-junjie.cao@linux.dev>
References: <20260824042123.1456876-1-junjie.cao@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 07:57:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244070

On Sun, 2026-08-23 at 23:21 -0500, Junjie Cao wrote:
> This is v4 of the kernel CVE triage from Paul Barker's "linux-yocto
> CVEs in need of triage" request, reworked according to his review of
> v3 [1].
>=20
> Changes since v3:
>=20
> - Seven entries adopt the comment and CVE_STATUS wordings suggested in
>   [1], including triage dates and distribution tracker links in the
>   .inc comments; the CVE-2022-1247 entry was approved as-is and is
>   unchanged. Commit message detail flagged as unnecessary or
>   time-consuming to validate is dropped. One deviation: the
>   CVE-2023-6238 status reads "Proposed fix was not merged" rather than
>   "withdrawn" - the fix was backed out by the nvme maintainer, not
>   withdrawn by its author - matching the comment above the entry.
>=20
> - CVE-2022-0400 stays out of this series as agreed. Red Hat PSIRT has
>   since answered the request for details (ticket PSIRTSUPT-22046) and
>   named the affected code; it is the issue fixed in v6.13 that
>   upstream tracks as CVE-2024-49568, with the details recorded on the
>   public bug [2]. A separate patch records the fixed-version status.
>=20
> Summary of the eight verdicts:
>=20
>   fixed-version   CVE-2022-1247   6.17, rose_neigh refcount conversion
>   unpatched       CVE-2019-14899  weak host model, no upstream fix
>                   CVE-2021-3714   inherent to KSM deduplication
>                   CVE-2021-3864   proposed fixes not merged
>                   CVE-2022-4543   EntryBleed, no fix proposed
>                   CVE-2023-3397   JFS UAF, proposed fix withdrawn
>                   CVE-2023-6238   NVMe passthrough, fix not merged
>                   CVE-2023-6240   Marvin oracle, fixed only in RHEL
>=20
> AI assistance is disclosed with the AI-Generated trailer on each patch.
>=20
> Once these are settled I can prepare the wrynose and scarthgap
> backports.
>=20
> [1] https://lore.kernel.org/openembedded-core/7b18fd3a5e6b660b9c605671da2=
b188b5abbf4ba.camel@pbarker.dev/
> [2] https://bugzilla.redhat.com/show_bug.cgi?id=3D2044575
>=20
> v3: https://lore.kernel.org/openembedded-core/20260812072842.1176341-1-ju=
njie.cao@linux.dev/
> v2: https://lore.kernel.org/openembedded-core/20260803084827.1348810-1-ju=
njie.cao@linux.dev/
>=20
> Junjie Cao (8):
>   cve-exclusions: set status for CVE-2019-14899
>   cve-exclusions: set status for CVE-2021-3714
>   cve-exclusions: set status for CVE-2021-3864
>   cve-exclusions: set status for CVE-2022-1247
>   cve-exclusions: set status for CVE-2022-4543
>   cve-exclusions: set status for CVE-2023-3397
>   cve-exclusions: set status for CVE-2023-6238
>   cve-exclusions: set status for CVE-2023-6240

These all look good to me now, thanks for working through them!

Best regards,

--=20
Paul Barker


