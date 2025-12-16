Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C449DD5E14E
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 13:24:05 +0000 (UTC)
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22508.1765891442243063663
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 05:24:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=bz/GUIU0;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=GZ419LtG;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.158, mailfrom: paul@pbarker.dev)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 4C0CA1400134;
	Tue, 16 Dec 2025 08:24:01 -0500 (EST)
Received: from phl-frontend-01 ([10.202.2.160])
  by phl-compute-05.internal (MEProxy); Tue, 16 Dec 2025 08:24:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1765891441; x=1765977841; bh=QjGBuYqy/x
	xgHKgXTRDtHoK2WQSlH4NF0uv5Q0pC1EI=; b=bz/GUIU0ijN80OzynVXeo1r958
	BEEup37w7/7POXSXAiGsf7j2oIaMkVNexX6IHBxTpKqmzhKsOsdNUXlxOfbebDEg
	HdAcYnyfUqgQ30a84OrgfioVJzK1Z5ApYTHBQ5HZlqO6fDkppztuNLm8kEpamWOW
	Jubv/VdjL5lCRZBro11KM9h56b2pKq52z6Uj8TYgM0Kl6VJdo1SzpVTJEiSDE9Ny
	iCFm0rvd9ro7JcvtfP3TNer0l/46xkRfkX3RKFxTFQciXImQ72I1BG5CnrGk3/yG
	J8pCR/P0rBbMV/AoZn6pXNRhf6QX1q8DVpW+x5QBChnW3JmevpaxDoBr0/XA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1765891441; x=1765977841; bh=QjGBuYqy/xxgHKgXTRDtHoK2WQSlH4NF0uv
	5Q0pC1EI=; b=GZ419LtGa6nXH5e2l+RbWxI5Ku3wuWCFj8nqPqsY5AtvvHOIzCg
	5EPKVzOS7oz8uj3hSpfyOb1IsEe7AUjazk3raS4/oNbBZtqmfzwA2swOGfFfYg2E
	xoZudOQt4yNjzPOnNVxB8icLoIk1f02HAEC2waR6+mO+03MBNkiVnjeFEruUp0oo
	ljD9+QSEGABIuPGgTmCXf5CAWDlsj4DJcjFYe1bo2h/rlp4gPS8m9fIF0WVyaolw
	4I9hnDrUXJTuGeBljUeMFumTM68ODjk5JzyUlr+EyEQYF1OBW2j04+AuKMAcx5kt
	3KNalALr2ktoIl/0G8MIEEzzsH3PqdH5rcg==
X-ME-Sender: <xms:cF1BaQtVZJJ-Jq9ui9w8u3aKBXPTPIHZcrgOp_UcKlnVBA28Pnq2CA>
    <xme:cF1BaU4PFhvfvKlGx8MqQBKd_jFYpL6fF-7LMaSVVH4Z8ibM4az9mrMvyZXhRsqOV
    Q-Dfa2N_Zzn8IVF5jGU5_EOW8Ivuu89gmfbSRPgOungnWkmitMalLk>
X-ME-Received: <xmr:cF1BaZKgik47DDCyXexbUW1CHhZM9MYpZmPu5QVl3OYbfQL8_LMVysAYMAU7-qiSAXykkUgebvm2_7WAKTsW2WZpKRn9NzPTd8W_2wYrzxGf>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefleejlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefkuffhvfevffgjfhgtfgggsehgtderredtreejnecuhfhrohhmpefrrghulhcuuegr
    rhhkvghruceophgruhhlsehpsggrrhhkvghrrdguvghvqeenucggtffrrghtthgvrhhnpe
    efffdvfeegveekudfhteeuhefhieekvdeiueefveeiffeukedtledutdfggeevheenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghulhesph
    gsrghrkhgvrhdruggvvhdpnhgspghrtghpthhtohepfedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepqhhirdgthhgvnhesfihinhgurhhivhgvrhdrtghomhdprhgtphhtth
    hopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvggu
    uggvugdrohhrghdprhgtphhtthhopegrlhgvgieslhhinhhuthhrohhnihigrdguvg
X-ME-Proxy: <xmx:cF1Bac4NrIj2waJjtadUDv7_saBG0PzrvDuaS8Sjbk-pjtf5YVnIwA>
    <xmx:cF1BaUxw8o3ntZSABeU0Ar2M3F0AAsGwjovcL95hY8zYux5tk9sGZQ>
    <xmx:cF1BaYaZv7mOFnppoc9i6kUeBnTArUBltIviTfSffI5xFK6aQ8iUiA>
    <xmx:cF1BaeTL3WOHnG4ZJtFXDyGc43NT1EdqgH4GqMZT2fH2RaPSJqK79w>
    <xmx:cV1BabbWJS1_sZpi6KdnRG98qSIpUFAVJbVbpWrAK76S8wNdHHCdONg5>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Dec 2025 08:24:00 -0500 (EST)
Message-ID: <f5aafc65f9a29a4ee07ac93e664af238cbe9a9a9.camel@pbarker.dev>
Subject: Re: [OE-core][PATCH V5 2/2] rootfs-postcommands.bbclass: fix adding
 'no password' banner
From: Paul Barker <paul@pbarker.dev>
To: "Chen, Qi" <Qi.Chen@windriver.com>, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Cc: "alex@linutronix.de" <alex@linutronix.de>
Date: Tue, 16 Dec 2025 13:23:55 +0000
In-Reply-To: <CO6PR11MB56021F91F5A05724552D07E3EDAAA@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20251204083208.1046464-1-Qi.Chen@windriver.com>
	 <20251204083208.1046464-2-Qi.Chen@windriver.com>
	 <09078a17ec73a43bfbda989cdc9f4a2ece5d4384.camel@pbarker.dev>
	 <CO6PR11MB56028B34D3F4318930C01EC0EDAEA@CO6PR11MB5602.namprd11.prod.outlook.com>
	 <CO6PR11MB56021F91F5A05724552D07E3EDAAA@CO6PR11MB5602.namprd11.prod.outlook.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 ep0k17xg==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-FLFYEB1HZQJBxVQUUG/s"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 13:24:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227946


--=-FLFYEB1HZQJBxVQUUG/s
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2025-12-16 at 02:13 +0000, Chen, Qi wrote:
> Ping
>=20
> Randy told me that this one was hold because the :append concern.
> I think I've stated the reason clearly.
> The function is not changing /etc/passwd and /etc/shadow. It's just check=
ing them and changing /etc/issues.
>=20
> Anyway, if anyone has some other approach. Please let me know.

Hi Qi,

We discussed this on the patch review call yesterday.

I understand the reasons for the :append here and the interaction with
the extrausers bbclass. However, this still leaves us with concerns - we
don't want recipes chasing each other using :append as the ordering gets
very difficult to reason about.

The extrausers bbclass also uses :append, would the ordering be correct
if set_user_group and add_empty_root_password_note were both added using
+=3D instead? If so, let's patch extrausers.bbclass instead of using an
append here.

Best regards,

--=20
Paul Barker


--=-FLFYEB1HZQJBxVQUUG/s
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaUFdaxEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bgCvAP9/GzFQWUn2CCOrTZ4QcZ3YlTXZ43UuxXgC
FXO9eM19mwEAgyMC7GwswPC33pmeirHxcscC+qkavjliIF52yuNcPAQ=
=TqkS
-----END PGP SIGNATURE-----

--=-FLFYEB1HZQJBxVQUUG/s--

