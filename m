Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB79CC5AC7C
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 10:06:13 +0000 (UTC)
Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39388.1786097172537524198
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Aug 2026 03:06:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=L0ydjDEb;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=cMHi1Aw8;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.155, mailfrom: paul@pbarker.dev)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 4800714000BB;
	Fri,  7 Aug 2026 06:06:11 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Fri, 07 Aug 2026 06:06:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1786097171; x=1786183571; bh=S801Qc8AzD
	Hm9AtxVkcBRUzYRBrBKkJDU1+bn7xExqg=; b=L0ydjDEbo/95o2Do9vrAJfV3zn
	eqM/6CkJFvxXMHI72gjIBHRtkbdoMRs5LOBVqQm6olRu6AyTEM1oSOwGX/LA05wH
	Ftd8B3StG74MXqHE2otmhvmErMjhcfvvMveNWEVxgyYSuDogjwAYZfH2VT2/0au5
	PUrGXHjWExrDj4SvUkfXxDqUtTZK8qNgYuJx/NfGUMIZ3D0mPVBBCVClUjRHfZ9+
	5K57E2FrGtid3hT9UcdLaYu/D0wYYMF00yzMKRmPdFxpmGRR0qDTaueJZ1rEjWr0
	udllTOV44fiItZ7a66NXGSaQBv4to7DgzdS5MO7siSK4WncdA9GkPR+CEScg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1786097171; x=1786183571; bh=S801Qc8AzDHm9AtxVkcBRUzYRBrBKkJDU1+
	bn7xExqg=; b=cMHi1Aw88FXb0+iVoyEP03E+qeMf5jQkxM0wV4ce+eQ7YiRi2+W
	bugNbvEMIUrxO1HcDl2aveS4nyCAWe7ybvj5eKeIFvWJBj3LZqEglxLHtsafCuJP
	CAhqJdTFZg1BSpnZHuLyEzFbIyRavw4zMdD45QN0ZdQQum7YpR2x+B0K6BfMpziB
	mL0MK0EwFKoQFVvjhe4FIehaVPAyMCQTJVixp8j2mf4iuN7fCs3UZnpTfKLrBNOA
	DCCcVg9k1BMVbVa9s3fDn+20VVUqSIdqO+XEpDZrJK1lU89zaZ7tcrC692SzFpIA
	whR5MJENTChTIWsbwVNT4nEbWiSqeCl0qSw==
X-ME-Sender: <xms:Dq51aosFkJ0UpnlcoNY4YGoCr4SHHkFXiTnrwyEshDvaDvBH9UaLEw>
    <xme:Dq51ajRMkfoKrCXjalOyfSHZdsbuc_-I9tC0CULBCW0_XOWAvaiEIX5ZFRMtm-Qyw
    aZtaKc8gwE0EqFlepItrCLKysuuIYo0UOME71i55KA1ZtIMGYJthwEu>
X-ME-Received: <xmr:Dq51auNfhT80yRw5L2yRlJfnt--hRN1B4jJQdPg_pcOdoHpPvE89vZjEQDV0uMET7k2KCVoglwquAmxOMq2Pi8dikxpHMuxgzpUpqY780KVU>
X-ME-Proxy-Cause: dmFkZTFTAquKebgoPSiLK7+SY0MMCZs/sUCYEwgFczKhc6k+c0Wu8905giDIADK0YSW4bf
    pbHFmWw5XGTq45VDUzt3qLW8WPZ2ir+wMNd+0DIvBccsBWYAOozpg6BW1BfnuEoGkb+T3e
    KAAIP/oUf1N2bEFVQ4PTtRl48apnzpP8x5buCOy+BU+T2Gi74VQyCbU7R9S7MNjcZtDL3t
    jLhEDfIDTLX92s8lDYJhanP3rJTlFmUPMcRxUyKqgZatmSI3pZal2uWgCx3Y7OKWGf48Pe
    b9litdknZUwHjNOKCmxw0JXynmXsQ2zmVXTjMN/OPE4lSTcCBKmhg/KAXdxXzc854ww/DY
    pFmiRbIyFy8+PeFd19OpSdt34dgflZ3aFb0BJzOUEU8pCEPd8AovV0whDdchhhwVSgghx0
    00St+JrIbPJtP2ZuMc6Pnx1Ap0SBwpdAhZ2yzpzZ1gPvgwOA8TkUpl9bf1E4LhUPY3YNX/
    8a8EJmeq4Lj3+DcCZwpWm7qHGPeBqat4B107X4px2qVGD3PPr/xquiSuIGVEie3JDt0SCN
    A4F0P5VoYD+EgIUStJsuiu76qxPMIO/BcVv/AJNdYbCp1X6wwHYESZvSFFsARMXPVWFT2P
    Ikl0+5su6qX8nNZOrv0brEIbv1VpF4AzdI6oGWf3ytHE3+qdE5XKYC97qqJA
X-ME-Proxy: <xmx:Dq51aoYTym0B154iZJ4v-i287YEkwpK77AB8-v5qX6bFmQ_rnn9TTg>
    <xmx:Dq51aozHBwgl86vYOfDdkM9QXwo035R6jIuZOEkE3GdN41YiPCzpUA>
    <xmx:Dq51ajKl1OCdvnIOef0VRDloSo8hwneqet6oQQg4ViMOfWo8tI5mPw>
    <xmx:Dq51airVHxCeBBq3QtO7fBeeKv1ZPvRKVLL3sTET96HdMf_iWMqbgQ>
    <xmx:E651ajzkT4fo4ayEuuvIVKtq5YpIF3i9OA8AS9-sZQcTUoq90-BSjRNZ>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Aug 2026 06:06:05 -0400 (EDT)
Message-ID: <96bda687997ea3315101939f266b402138a931b7.camel@pbarker.dev>
Subject: Re: [PATCH] cve-exclusion: set status for CVE-2023-3640
From: Paul Barker <paul@pbarker.dev>
To: Venkata Navduri <vnavudur@oak-lpgbuild12.wrs.com>, 
	openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Navuduri Venkata Adhitya
	 <Venkata.Navuduri@windriver.com>
Date: Fri, 07 Aug 2026 11:06:01 +0100
In-Reply-To: <20260806170452.1411788-1-vnavudur@oak-lpgbuild12.wrs.com>
References: <20260806170452.1411788-1-vnavudur@oak-lpgbuild12.wrs.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-uS5AwTh+bxKs7d1ItimF"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Aug 2026 10:06:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243000


--=-uS5AwTh+bxKs7d1ItimF
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2026-08-06 at 17:04 +0000, Venkata Navduri wrote:
> From: Navuduri Venkata Adhitya <Venkata.Navuduri@windriver.com>
>=20
> The x86 cpu_entry_area KASLR bypass (CVE-2023-3640) was fixed in
> v6.2-rc1 by commit 97e3d26b5e5f ("x86/mm: Randomize per-cpu entry
> area") from Peter Zijlstra.
>=20
> The fix is already present in all Yocto releases shipping kernel >=3D6.2.
>=20
> Signed-off-by: Navuduri Venkata Adhitya <Venkata.Navuduri@windriver.com>

Hi,

Commit 97e3d26b5e5f371b3ee223d94dd123e6c442ba80 is the fix for
CVE-2023-0597 [1].

On NVD, the description of CVE-2023-3640 [2] includes:

  Based on the previous CVE-2023-0597, the 'Randomize per-cpu entry
  area' feature was implemented in /arch/x86/mm/cpu_entry_area.c, which
  works through the init_cea_offsets() function when KASLR is enabled.
  However, despite this feature, there is still a risk of per-cpu entry
  area leaks.

So this CVE appears to be about remaining issues after the fix in that
commit.

[1]: https://nvd.nist.gov/vuln/detail/cve-2023-0597
[2]: https://nvd.nist.gov/vuln/detail/cve-2023-3640

Best regards,

--=20
Paul Barker


--=-uS5AwTh+bxKs7d1ItimF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCanWuCREccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bgTYAP93cjxUEx33PPagQC5QTiVtAaQxjUsB2+Sj
jkRgVrkR0QD+O4oBCZW1xU7EVq8jkN/Za0sCfJAC8Rv9kSzG58yYCA0=
=S9EZ
-----END PGP SIGNATURE-----

--=-uS5AwTh+bxKs7d1ItimF--

