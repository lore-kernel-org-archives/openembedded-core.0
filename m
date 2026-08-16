Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 251ECC5B572
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 16:35:40 +0000 (UTC)
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12922.1786898136974260731
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2026 09:35:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=ikJoilA2;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=M/WCx3lO;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.158, mailfrom: paul@pbarker.dev)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id EFF63140010F;
	Sun, 16 Aug 2026 12:35:35 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Sun, 16 Aug 2026 12:35:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1786898135;
	 x=1786984535; bh=PsVCWYi1odTE25JC1Y+8yrv4U4x8SGiKumBz6UfMDmQ=; b=
	ikJoilA2j454j/qJbkZOBVczKdvtG4h7/o3eJ2s2OLUDa2l3DCasBvpmAOGNyzml
	4RrdbONNk3d7+DM8c8oUC3C6+2GYKC/OgGiA7rtKofVYNaQhg1QI4w9UsFFL2JSy
	EutmxNYjJFXSho5SOaq+q1eNJCM9TJFZEnh+cCiO8g3xdWL76c8fTQAuHnMFzAjt
	Zv5LW3HT/COCW27wMuUBcBPjW7Y3/w8hgQM0/U7SRYZ35CLeMdbJCmTtAxalTiY/
	SFQFHpj+xOq1OhXv+bmBI2I4Fp8GHTrHYWJUiG3HKaOEU2dej/I0fFja4vROYBC7
	h1esum69D3b+Yb0XVCTTdg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786898135; x=1786984535; bh=P
	sVCWYi1odTE25JC1Y+8yrv4U4x8SGiKumBz6UfMDmQ=; b=M/WCx3lOr/9No8+XK
	ZnCRqkNN6S0Sw9nagnD9JIWkWu67sr6H9n+lzy2D8WFOSgAcukYioYRdDJoRgqT6
	/kgR5KeQmr8pnPO3jYBbUJJrPjS4oxEV6i0/sswcd8dkFpfZ1TbV6Zvdc/boxKHo
	jRsJiGL7iNAXflJO40IOho57egeBw9GDWBTpG4GfzU8t1dK/bnsx1OisYr6izgUq
	bSjs+gfyMq6b//2Tj+3Q4oBoVlRKppS1YP6h1BcJFb1XPCep8o7DSJQcrAThZwCw
	7LEv27V72Qjdw2YgGRsDKOyPtl/XZklRGFBqnIiexvhcrWHMxLdNX5rLI5fFtfHZ
	DXD/g==
X-ME-Sender: <xms:1-aBaqsqnfQ9w17MVDAjpwQRWQFIjrf_dwvikFM5YLCqsMndPrrZEg>
    <xme:1-aBaldseNMLJog76WWG3eieWnSX-9oNNxreE9FcpaK__0NQRwQuRX4BZyuF1kdXI
    4gjY94AHy8lawKFeTbG6LEx6aEgtEzyAjPgALVNYeDIElHApTEMK8eO>
X-ME-Received: <xmr:1-aBajZBGcJQsZRmpZvMr9PBQzS2n3zN_0Ou5XmN5UWkpdXWcNw0kRAFycJSPFL3RxMh20_gR6bwtQkKrUVykC6rzj7XuviHn0ilSEkpTYMg>
X-ME-Proxy-Cause: dmFkZTFyO+AW0lwSXCSUDNd6pvwUKaNwNq2b5KGUYEPcFMWh83bXQMItj+aaApUcxamGlO
    CbHO3N84fBiMv5qQzXlnuAA0K1/8g+AxhK82wxUfFH/V164B9bai4yH5A2ot9IR3NNht5O
    Olg5tFT9CPGd0jFMjNeBNOivN36wNPeLYtGF2Bad+0G6OBuXyPzcOKv3lfdWfcFoyUJhMp
    X6uEiKLNRciB6q3WpfjD+2SlsSYLsxIEjJl3LYm88BdT1bl8RqbnUwBarlvusd0gsKVe65
    qQt2FYaCdngjs7pmZEk4roD2RdJZNooS9a4vdyIe0dsj/TN5cFqoCgIzwlAWDpwnbTKQjh
    rzaiQU3xlNFr+PAynbFh+/wZ5nup7X+0UJ5ghOBwFrZDCVvDlBjScjD1n0L2ohMIVy1VYI
    JyPObvnxnjf9GYJPpl8Y3hTvYri9hP4frJTMVtBcvyhJeA8V7S/QyONYqnCVYTdie3mMLh
    0Qh4D6oOLyWHH5KIVOGxvia94sqPM4YxuufN1fH4bTLLvm4Jr0B9HiTW1Gu2nUj7rM9HHa
    qNp5KUYOBgxP/RfSDjaNVGNuZCv3B2HDxHL97S4rjR1T9Cobco78WvW8Prx+RF4ApWY4jX
    DbiopJlAcOuKbNDxitSBN5xSzzFcMU53VeiwQEJhHus+oA9zRdDl3SBtQjjA
X-ME-Proxy: <xmx:1-aBagWR-W6yl6KfWlAD02vpE45ZCNIg_qMrOSXUQm90apUz_ZqJXA>
    <xmx:1-aBati672gzNddKTF-ij7EopSJmkRrEf7MBciJetCQUItGWFCkgqg>
    <xmx:1-aBamWJqDzQ_LvFLu6u9MrONnatxdFhJxrNMKOZF_5zGZyQ0dzfxA>
    <xmx:1-aBasPw41mqSqTpIf8NZDO4Ujd_PFF_XXUyMJ_K-HuxosOHQjJCqQ>
    <xmx:1-aBaiRPdCbL0-l1X7h66oUr61E0ajuiBPZBQEbM6VuOLcFSqTzrUQ0U>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Aug 2026 12:35:35 -0400 (EDT)
Message-ID: <b9d374516e9940a309e92390644e5d6e47c49214.camel@pbarker.dev>
Subject: Re: [OE-core][PATCH v3 4/9] cve-exclusions: set status for
 CVE-2022-0400
From: Paul Barker <paul@pbarker.dev>
To: Junjie Cao <junjie.cao@linux.dev>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 16 Aug 2026 17:35:34 +0100
In-Reply-To: <20260812072842.1176341-5-junjie.cao@linux.dev>
References: <20260812072842.1176341-1-junjie.cao@linux.dev>
	 <20260812072842.1176341-5-junjie.cao@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 16:35:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243539

On Wed, 2026-08-12 at 02:28 -0500, Junjie Cao wrote:
> The CVE describes an out-of-bounds read in the SMC protocol stack, but
> no vulnerable code was ever identified. The MITRE record lists the
> affected version as "Not Known" and references only two Red Hat
> bugzillas, the originating one of which was never made public.
>=20
> The public bugzilla is closed as NOTABUG, with the statement "There was
> no shipped kernel version that was seen affected by this problem":
>=20
>   https://bugzilla.redhat.com/show_bug.cgi?id=3D2044575
>   https://access.redhat.com/security/cve/CVE-2022-0400

The second sentence of the statement in the Red Hat CVE entry is "These
files are not built in our source code". The "no shipped kernel version
was affected" statement is specific to Red Hat's configuration, and
without further info it doesn't really help anyone.

Drop the reference to that statement and the second of the two links,
it's misleading as it's easy to read it as a universal statement instead
of a Red Hat specific statement. Keep the first link as the report being
closed NOTABUG is interesting.

>=20
> SUSE reached the same conclusion independently, closing bsc#1195329 as
> RESOLVED / INVALID:
>=20
>   https://www.suse.com/security/cve/CVE-2022-0400.html

Include a link to https://bugzilla.suse.com/show_bug.cgi?id=3D1195329.

>=20
> So did Debian, which marks it unimportant with the note "non issue, no
> security impact":
>=20
>   https://security-tracker.debian.org/tracker/CVE-2022-0400

I read "non issue..." in the context of "Vulnerable code not present".
So the relevant thing is that Debian doesn't build the affected code. As
above we should be careful as the way you've referenced this makes it
sound like a blanket statement that there was no security impact in any
configuration.

It's also worth mentioning that Debian links to Red Hat bug #2040604,
but that's not public.

>=20
> There is no commit in mainline referencing this CVE. The net/smc
> out-of-bounds fixes that landed in v5.18 (b1871fd48efc, 0558226cebee)
> are in local, privileged paths and are not linked to this CVE by any
> tracker.

I would drop the references to unrelated commits.

>=20
> CC: Paul Barker <paul@pbarker.dev>
> AI-Generated: Uses Claude (claude-opus-5)
> Signed-off-by: Junjie Cao <junjie.cao@linux.dev>
> ---
> v3: no functional change since v2
>=20
> v2: https://lore.kernel.org/openembedded-core/20260803084827.1348810-1-ju=
njie.cao@linux.dev/
>=20
>  meta/recipes-kernel/linux/cve-exclusion.inc | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/meta/recipes-kernel/linux/cve-exclusion.inc b/meta/recipes-k=
ernel/linux/cve-exclusion.inc
> index ba8e467..be74672 100644
> --- a/meta/recipes-kernel/linux/cve-exclusion.inc
> +++ b/meta/recipes-kernel/linux/cve-exclusion.inc
> @@ -214,3 +214,10 @@ KSM page deduplication, only reachable when KSM is e=
nabled and opted into"
>  # https://ubuntu.com/security/CVE-2021-3864
>  CVE_STATUS[CVE-2021-3864] =3D "unpatched: no accepted mainline fix, \
>  exploitation requires a relative kernel.core_pattern"
> +
> +# Never substantiated: no affected version, reproducer or commit was eve=
r
> +# identified. Closed NOTABUG by Red Hat, INVALID by SUSE (bsc#1195329) a=
nd
> +# "non issue, no security impact" by Debian.
> +# https://bugzilla.redhat.com/show_bug.cgi?id=3D2044575
> +CVE_STATUS[CVE-2022-0400] =3D "disputed: the reported net/smc out-of-bou=
nds read \
> +was never substantiated and was closed as not-a-bug by Red Hat, SUSE and=
 Debian"

We should try to get Red Hat to release more info before we close this
as disputed.

Best regards,

--=20
Paul Barker


