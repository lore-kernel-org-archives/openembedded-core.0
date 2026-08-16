Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08BE7C5B572
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 16:21:57 +0000 (UTC)
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12670.1786897315417457056
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2026 09:21:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=hwCkdAzu;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=Dg47M3uT;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.147, mailfrom: paul@pbarker.dev)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 836B4EC0228;
	Sun, 16 Aug 2026 12:21:54 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Sun, 16 Aug 2026 12:21:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1786897314;
	 x=1786983714; bh=n3IyioIEFMI5UZRUZeSb4jQ8voeBUGT8ad8W1vUdUeI=; b=
	hwCkdAzuNTWuofxTPpuVLcNKuQoeQ9axZl/FZt1xcmrkYbdHrDbimTZy7zGQ+IIv
	laYf6KpDuqXjP+HUys+tURlfOw68x2nZOwg8+HVR4pXDUJ44JMNq5jSO8EMBAHRH
	s420rElGICR4BT0SP7pb7+aUnZI9oZtc8OjXFAYbKy4sVVVLhw5+vyQPGOpq5/AY
	h+5RNcop9pn3yQleDjhU9stfJCwkViifzcHLvj1Nr35xCmsSTYRcXvZF5eC24RS6
	DMQ9q8Fi274FqacN6oPx9Yo6IEANd7X12sxncJTo6bLq7NyteTMDM5d5I3dv8F+X
	2c/8AVqJqfrkURbKJgeoRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786897314; x=1786983714; bh=n
	3IyioIEFMI5UZRUZeSb4jQ8voeBUGT8ad8W1vUdUeI=; b=Dg47M3uT3b2R5Oadj
	LDOIRofY+L18mBy/PR9Ov7VHPI14rHirTtsIguh8lh7clmligWMi0ebgW1Z2vlZd
	Sgj9atp5WWsHT+0o15sIriPhU0fM2USahjeUoDENmPkxTeQnDV7iVj2Mq8u1I13e
	0VvJAOzgFDDPegYVOegrg/UNxNtw8C7mOnSjoDCiDueMgk0gVJ1snlZ6EBP1iaVl
	e+LwJa/hnD0JNg9R98mXi7/yMFjHSdwVQUWYsTQ8PiJmT/+8JE5wr0PmL376sZ6D
	Y6Bta+WxThmOcWJk0S5qyCKvyFu41t6xoj+qDT69mxM5+9BETa1ELKBNeR5uzZGm
	fa2aw==
X-ME-Sender: <xms:ouOBag0RTqjqCYu9vcrKcajI-o6yq8ccPv-28xy_wveB1T0ZVxjMpA>
    <xme:ouOBahGQHqPd0zulfLJ02RkrZbPFICkMtIo_KCEcWyZXIICj668A-OzT2CzF4txWB
    m7Kh4NxA3Nu1PvEAFHhHO6RcIBbTJeKzSFvQuvIRkVjIJFXc69lWS9i>
X-ME-Received: <xmr:ouOBamiTZ6tLPIDM20AePU_gQakTJKLcsNJbmjdEgkToGLH3wHA1Q2X9Mg0EYS3R6wo-7pTUS2jHLHoxFtiz1oQjfcihlJb3Ia8y73Oh4-CU>
X-ME-Proxy-Cause: dmFkZTEKRZIz7LCnkUyKsnho8O0UJTmUvojjGy+rA3Ke7R/EdbmjYMK3FXOb7QhgVTlqIK
    Rl38Xz4jrVIkdI+idveGIeipvTTxvyi8jka0jAS9TpUkGKrHTbpFB9nnz5b2soG8IjFBAA
    zFZVvQ9LWzfOWTeoEID79LjYY33lfkseO3Y6LXTdvZHHbVnenaSv7biNcmIbyQs2SJtV6Y
    LJWcdI9rUU4znPdYJ7mTpGGwn48vMemd23fJVy6/tpRNW4ydiGyY7gC0I8vyee4Uf+4P2e
    fzBNESOHc55MXgZGrlCgi5bbohcy181GzRdn+KvDIvNMenKVRIWW1EXLBJFJelAMxzlmli
    Fxi9nF1IS1kfDeuLfU5prSGx9fMmSjHD95BapPFl7HDyAWMIzMjavWslzUqk4PlJHI1i2A
    dinMQBOLz9VAbNJnP0AVifFYjiR90FbBH7OaSWVkm7IABc8IgMtrClHcuE4tAf7LfEZF8Q
    7q9t3I0w7tNpI2wOV0Go5k9Q/p70OgIxMKaYbGR7j6Nu+p8+RTGYDdg4iwCEKZaNGveZMy
    Iu/dbPNUXWNOBw+pAkjYXKC4KGJVmzVzwll+V/etirCRnH5EbwMmJRcQVw1khnLn2f2K8c
    AZonXeXMFQ0VDDqwRCXWNGFqFI6JQUtbJHiskloN2AMTIjGYIrC4yOTu14Jg
X-ME-Proxy: <xmx:ouOBak98Q0XNTlfUX3yj43X-2usJxMcSUQtFg-CDUxSX4IGVEIMGTQ>
    <xmx:ouOBalplBST-h6c3TTanVIcTFxqwNZu3NnoRhvql65VvrOsNlmWBEQ>
    <xmx:ouOBar_u6kcb1cpJUMEei1M757HShxR1EXv5LtuoCRwCfuHY9Cqo3Q>
    <xmx:ouOBahX0L0fF3bYtzg8aPwKZoj4tRjMe-Lk3qnWcbU-jpuH_jquwDw>
    <xmx:ouOBaqZiC4xk7fstFY1jhiSDAPyYSK1y0_J1VAAIWJHHn_a4iW-uR9lv>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Aug 2026 12:21:53 -0400 (EDT)
Message-ID: <1ffababa08333e0eb2963289daba44c562bb1acf.camel@pbarker.dev>
Subject: Re: [OE-core][PATCH v3 5/9] cve-exclusions: set status for
 CVE-2022-1247
From: Paul Barker <paul@pbarker.dev>
To: Junjie Cao <junjie.cao@linux.dev>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 16 Aug 2026 17:21:52 +0100
In-Reply-To: <20260812072842.1176341-6-junjie.cao@linux.dev>
References: <20260812072842.1176341-1-junjie.cao@linux.dev>
	 <20260812072842.1176341-6-junjie.cao@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 16:21:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243535

On Wed, 2026-08-12 at 02:28 -0500, Junjie Cao wrote:
> The CVE describes a race between rose_connect() and the code that frees
> a rose_neigh once its count and use fields reach zero.
>=20
> net/rose, and rose_connect() with it, was removed entirely in v7.1:
>=20
>   https://git.kernel.org/linus/dd8d4bc28ad7252610d8e79c1313a2d1e3499a51
>   ("net: remove ax25 and amateur radio (hamradio) subsystem", v7.1)
>=20
> The linux-yocto kernel on master is 6.18, which still carries net/rose.
> There the race is closed by Takamitsu Iwai's August 2025 refcount
> conversion, which converts the 'use' field to refcount_t and removes the
> unlocked rose->neighbour->use++ in rose_connect() that the CVE describes:
>=20
>   https://git.kernel.org/linus/d860d1faa6b2ce3becfdb8b0c2b048ad31800061
>   ("net: rose: convert 'use' field to refcount_t", v6.17)
>   https://git.kernel.org/linus/da9c9c877597170b929a6121a68dcd3dd9a80f45
>   ("net: rose: include node references in rose_neigh refcount", v6.17)
>=20
> Both are in v6.17 and were backported to 6.1.y, 6.6.y, 6.12.y and 6.16.y
> in the 2025-09-02 stable round. Upstream assigned these two commits their
> own identifiers, CVE-2025-39826 and CVE-2025-39827 (both fixed in
> v6.17-rc4), so the identification does not rest on this reading of the
> diff alone. The Red Hat record for CVE-2022-1247 still shows it open and
> lists no fix.

We can simplify the explanation here. The issue reported in
CVE-2022-1247 was independently fixed in v6.17 via two commits, these
were assigned CVE-2025-39826 & CVE-2025-39827 by the Linux kernel CVE
assignment team. The race condition described in the original report for
CVE-2022-1247 [1] exactly matches what was fixed.

[1]: https://bugzilla.redhat.com/show_bug.cgi?id=3D2066799

>=20
> CC: Paul Barker <paul@pbarker.dev>
> AI-Generated: Uses Claude (claude-opus-5)
> Signed-off-by: Junjie Cao <junjie.cao@linux.dev>
> ---
> v3:
> - lead with the v7.1 removal of net/rose per review; keep the v6.17
>   commits, which are what covers the 6.18 kernel on master
> - cite the upstream CVE-2025-39826 / CVE-2025-39827 assignments for
>   the two fixing commits instead of relying on the diff match alone
>=20
> v2: https://lore.kernel.org/openembedded-core/20260803084827.1348810-1-ju=
njie.cao@linux.dev/
>=20
>  meta/recipes-kernel/linux/cve-exclusion.inc | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/meta/recipes-kernel/linux/cve-exclusion.inc b/meta/recipes-k=
ernel/linux/cve-exclusion.inc
> index be74672..b08eaa1 100644
> --- a/meta/recipes-kernel/linux/cve-exclusion.inc
> +++ b/meta/recipes-kernel/linux/cve-exclusion.inc
> @@ -221,3 +221,11 @@ exploitation requires a relative kernel.core_pattern=
"
>  # https://bugzilla.redhat.com/show_bug.cgi?id=3D2044575
>  CVE_STATUS[CVE-2022-0400] =3D "disputed: the reported net/smc out-of-bou=
nds read \
>  was never substantiated and was closed as not-a-bug by Red Hat, SUSE and=
 Debian"
> +
> +# net/rose and rose_connect() were removed entirely in v7.1 (dd8d4bc28ad=
7).
> +# The 6.18 kernel on master still carries net/rose; there the race is
> +# closed by the v6.17 refcount conversion, which upstream tracks as
> +# CVE-2025-39826 / CVE-2025-39827.
> +# Fix https://git.kernel.org/linus/d860d1faa6b2ce3becfdb8b0c2b048ad31800=
061
> +# Fix https://git.kernel.org/linus/da9c9c877597170b929a6121a68dcd3dd9a80=
f45
> +CVE_STATUS[CVE-2022-1247] =3D "fixed-version: Fixed from version 6.17"

The comment and CVE_STATUS wording looks good to me. We don't need a
triage date on this one as we're effectively resolving it.

Best regards,

--=20
Paul Barker


