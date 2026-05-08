Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37DB3CD3436
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 13:30:02 +0000 (UTC)
Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13708.1778246993545175843
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 06:29:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=Vn0NNUJo;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=YQBzpkXq;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.152, mailfrom: paul@pbarker.dev)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id C33A97A00E9;
	Fri,  8 May 2026 09:29:52 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Fri, 08 May 2026 09:29:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm1;
	 t=1778246992; x=1778333392; bh=hBFzF8klNb5NJzkE8zR//Zh7iBYgMaHC
	Z16lAKQfUoc=; b=Vn0NNUJor4ZOaX82gCczmx7qnVaEhko6lhbuhnOntdkJpvsu
	4qo5fXf4kdemmlfpl5i9ldAkE4iNJl5U5azVhSiOI6Pz06TjbKzJC3bxCmOfV/Um
	W6pNh+yswZ+rpdl9lk7n1FayAaP6UvXh1zlm7V+jhzQn6kYSSXzPzOnY/Rv7nKIK
	pggPpFVNwIQQhn8KDVkbph0VECvu2NMnffXEsIsy0A6F1w4Zt2vRcRiAu+qhyJgo
	6D7CEuw6HVoNkCAxvpafjho0EDh7sSXnY+bQvHWpBvbeZdKL2AaYKAC/y4jwm43m
	2Ums+BZ1yqS81O5DjLGR5hJXcEmElSOo+PIr2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1778246992; x=
	1778333392; bh=hBFzF8klNb5NJzkE8zR//Zh7iBYgMaHCZ16lAKQfUoc=; b=Y
	QBzpkXq/mpbHEfnDb35wY6RKWfE1BLBw1jhfwJKVNeeyM9UBD78fF29bgAlY0Uou
	kNd2gCUAQJAeCbntHIDJp1Sfjb7Hjb//I5sHKCN+eNdcfdma1mHXZMjHXAUI1K5Z
	uebPaZBp3T+CJimwHpWP5c5QXC54peFufuDaRi5kcbUF5M941LHTDmArXuTYtCaa
	fZSU7hye8PRCBvQ7ncoDLssSwOY4Q/NccJBhnSpj3CnlUwuFyPbOFI+ZaHMIpl6p
	MTMERWNWfzyIi04eO8OkrK5md0B2BvlhsD5RLAtjSTPi8kdwuj63NKawKaltAnQ8
	jZKZvwzdQQEMvDPKQ4/TA==
X-ME-Sender: <xms:UOX9aW5Wz8AokJ21GG3-Tj1N-d3zpZEQnL9KTRxVuSIUy_v6OsFy6A>
    <xme:UOX9ad3pMJmCXq6Emj_jw2z6m5KH_f3ZEzxQqWfUUQnTbPnhCDnV9EC9uY91nKEC2
    BArqU8E5Coprg-3NrNJ-Q7LHJ4D7k1qc8VYdbCczfPc4gVgqNPTxQ>
X-ME-Received: <xmr:UOX9adCeclMhJ3EJ6858lLPvD5AOHbM2xc96qjn21D7WJrqJmbc2udNFi6cAqWCkBhmPwfIafX6nCu6jocpmOTSZGHjPb0xXPy7NlCemK5zU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduuddtgeejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefkuffhvffftggfggesghdtreertderje
    enucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdruggv
    vheqnecuggftrfgrthhtvghrnhepffefgeelleegueeujeevkefffffftdeigfehffevte
    dtvefhgeehudeljeefveefnecuffhomhgrihhnpeguvggsihgrnhdrohhrghdpghhithhh
    uhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepphgruhhlsehpsggrrhhkvghrrdguvghvpdhnsggprhgtphhtthhopedvpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvse
    hlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtthhopehophgvnhgv
    mhgsvgguuggvugdqrghrtghhihhtvggtthhurhgvsehlihhsthhsrdhophgvnhgvmhgsvg
    guuggvugdrohhrgh
X-ME-Proxy: <xmx:UOX9af1p1OeTb6ls1PbSfImmo_Vf09IEMT-oG8OSN2cb60sq7QqWig>
    <xmx:UOX9aXshe4NDcRy_9vAQjs97oq9uSWTs19042U6TmSpKmafanMkd6Q>
    <xmx:UOX9af66t9R6CB_ELEkbuCz1Xht_cA3YNqUV2g7bQvvjSBZ8X9z5Qg>
    <xmx:UOX9aYLa4H6pLDXSjSF1qVdRBqW9uheUx8_2i3pnuKyVWn3GFzbAQg>
    <xmx:UOX9aR6IalYAMRtx2wHHb6o9OW_UOA19wHgVKO1zR4eHnNOXRYE0NdJv>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 May 2026 09:29:51 -0400 (EDT)
Message-ID: <5622df201a632dfc83c5193f029745b3ebd97e44.camel@pbarker.dev>
Subject: What to do with vim in openembedded-core?
From: Paul Barker <paul@pbarker.dev>
To: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>, 
 "openembedded-architecture@lists.openembedded.org"
	 <openembedded-architecture@lists.openembedded.org>
Date: Fri, 08 May 2026 14:29:43 +0100
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-E8squ558cXtS0PoA1DZ5"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 13:30:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236713


--=-E8squ558cXtS0PoA1DZ5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

We have a vim recipe in openembedded-core to provide:
- An editor without the limitations of busybox vi.
- The `xxd` command, used as a runtime dependency of dosfstools-ptest.

However, vim is difficult to maintain in our stable releases. There is a
regular stream of CVEs that need fixing due to the large UI and input
surface of vim, and backporting fixes has proven difficult. This isn't
just a Yocto Project issue, the Debian tracker [1] currently shows 14
unresolved CVEs in Trixie and 15 unresolved CVEs in Bookworm. And, it's
very difficult to share work between distros, as vim tags every commit
as a new release, every distro ends up on a different release and needs
to re-validate any backported patches.

So, I propose we drop vim from openembedded-core on the master branch,
post-wrynose.

We can use tinyxxd [2] to provide xxd, this is based on the vim codebase
and frequently merges changes from upstream.

We can use GNU Nano as our default editor where something more capable
than busybox vi is needed, this has a sensible release model. The much
simpler input model and lack of scripting facility means that CVEs in
nano are much fewer and further between.

If we do this, what should we do with vim? We could move it back to
meta-oe, but that would simply be moving the maintenance burden. We
could stop backporting CVE fixes to vim and recommend that an LTS mixin
layer is used to provide newer versions of vim for stable branches. I'm
open to ideas.

[1]: https://tracker.debian.org/pkg/vim
[2]: https://github.com/xyproto/tinyxxd

Best regards,

--=20
Paul Barker


--=-E8squ558cXtS0PoA1DZ5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaf3lRxEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bu15AQCI2bhe/KD6n7A03vTuQWfLGMer2Cacjm7N
+EsdH4956wD/bc2X3+SiUd9P+ZpIJE/JxacguWAvxqwDlv0fBI7P0QI=
=OQ6R
-----END PGP SIGNATURE-----

--=-E8squ558cXtS0PoA1DZ5--

