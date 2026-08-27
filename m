Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE192C61DC2
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 14:05:05 +0000 (UTC)
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36884.1787839497700064310
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2026 07:04:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=LuMwMbQq;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=aSbhFCIR;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.152, mailfrom: paul@pbarker.dev)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id CB5171400151;
	Thu, 27 Aug 2026 10:04:56 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Thu, 27 Aug 2026 10:04:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1787839496;
	 x=1787925896; bh=/V7Zlm9iGD6K4joEsI5NDsaZaV56BYd2T/NoF0YlT9c=; b=
	LuMwMbQqPGJU2jqvI8RSS7xWkSpYws28J0yZR/p3/WQ6IpNa/ip26vuuOygX9TJn
	AkkqolBajzbp5VwqHmWGWiR9xevJIqFphH+t0+CmTlejCDG5WJAorDefzMZT4X37
	VPkCL3S8YI+OTHj5cOH1F63/Ywn6xirWAJDwDAroSaQvDltycBs4aZ38nSGaL//F
	gcSeov3JAaI3PoMbBW1gCEsmlPEYnFST8J0m6aIe8HLjrbZNiY5rbIN7TW/F07r1
	hwlpjs6vhC/9zGZEVpXaSSlwPDBTGZcWS7CPfg+NHIzCUHujfWIIKniAPBpO/2Vx
	56M3ctcrQ3WzWmgL3gd/mg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1787839496; x=1787925896; bh=/
	V7Zlm9iGD6K4joEsI5NDsaZaV56BYd2T/NoF0YlT9c=; b=aSbhFCIRYZnXVUr1E
	Jt1p19YWVzBfZZGrqJqIgFQDBO+Coz4LlB8FyfuFRUc0MhbrT8TkrVPOVDTR/BDX
	xsZ1QvjNSSyBZIxYrI7yNEbs9FVJYBwVJvJK5h7nCpwzbSqZbGsNHZM95Alo1F16
	J18CzdMdiMajqVDq+eNQFXxrmIPd2NjGHt8sm74ymwROnZubYkGVvintLPN71x9B
	YOBVNgnsgKt4+fMp8RqKaSxFI9sTbH2hdKfzla5kmhxKyo8nmNdki+bB8jU06J/b
	e39EpR+7zwbiGV4WBLl+9gRujeobKopbBwDnoklBqTYeqOIOdBSqVCnz2bBN0fbj
	a0naw==
X-ME-Sender: <xms:CESQapYIcGVTAU4oVA01KeFsDucPQa278dKXZJVmGahvHH-Qgty47w>
    <xme:CESQamYLRq9Gwl802EQ78hyAbQBMDPqYkyxCvMWiqmfY5YLEm7LovPy3UbpYoYmW1
    sTthiBKwWPzEEQqPcUYOiC8WQWf0GN-FTMaTaoXrTs9P5GQZyqlDhM>
X-ME-Received: <xmr:CESQapl0YbmhbXJ0z4jaePKOGI06-1JVktwXjBrPtUOpjTri9NZ1W-d8T4W6LyXBmkWMmwLq0e1bOIhgX3iKvG01MAjHLYMi45JtN2k>
X-ME-Proxy-Cause: dmFkZTGbQZKtEfH0kYbk5rzp//Nr6K+YXIbxqgovlx4kG68WzRHWmgR8lAOg+2t4UoBiMr
    rqfDqx+rYDXOmJ6ugtIkslcZtUdhQpOxiymuL8iyKNBpaA23emiyxRsYjcdFgVJMmRfgq8
    K991MRm1TxKWQehjhG+6o82s0fpAXxkqdRvpginiOyAOq1OGlQAyx/PZNzH61qqGnCRm38
    MpL0lfZzF5gnwqTw1opDn4Allk4Eu+WZ5uejYaYvyu316DwzviVX6WjXtylSmfmyFhpBH9
    5Vu95Mh7KUt8UwqtkrC6hdkuxdv7SegfGFKrUlbGSW4ZIsWJHYC7UR3TQTNIWB6WNS5YKj
    ex9nIMkV+Q8Wku+6jhOOfeawWoNbE8coEn+SzcaUxlSH+ts0ntuFjMtRiA6OU7hQ7mn/Wr
    IcrHb1Ey3rHvmDNt9/ODYoW9V1RH62UsQBeQ33qmUoQuWZBooQAExz0+/R2IJjWG0Ry8MF
    8Z+8D2b1mv3TriyfSh95MF3c2/ifUk1E5tiA984PXBv7kTBmJhjzeMhbmIlZ0jaAGZxzvj
    26/mlpGwgy+sEho4xeX5dq7YHBHEluaUFXKm+yZyC+BnL13Ub8tvoyTdgGb1JtXvQszI3D
    A5UsxzrxSa6aQFgYjWoKlcvhdkNxv8Jhy2ZdoFYC22z83DzLSzgQau3zoWRg
X-ME-Proxy: <xmx:CESQaixkJtABkw8IrGi8Vp-vidl8ZlBAbMumM65ruVuni93vk9pReA>
    <xmx:CESQanOsrogVj8tnIjXuzBgfmSlT2DhjXe8JUIIn-ycHyCaDD7l0jQ>
    <xmx:CESQamSq6nKn82wpp0uZw8U5FykU-0a6dS2-CK0FNDALr2hCW_NPtQ>
    <xmx:CESQalYXxWrbyWzSw1ilWouJlIEsfzfbbazSjdc8tTt9QR6xwR8CjQ>
    <xmx:CESQasqc-ekC0vy8gi1GBZ21YdzXCoDvNdyGdv6uEYxI053mZoEUwiBt>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 27 Aug 2026 10:04:56 -0400 (EDT)
Message-ID: <0b9e6c93df2096a9e0f8c777e286e6ab97f0be56.camel@pbarker.dev>
Subject: Re: [PATCH v2 2/5] vex: skip the VEX symlink when IMAGE_LINK_NAME
 is empty
From: Paul Barker <paul@pbarker.dev>
To: Thomas Roos <roosesweb@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 27 Aug 2026 15:04:55 +0100
In-Reply-To: <c70d63515c72d28e1427a2e53fc8cafd7f0fc952.camel@pbarker.dev>
References: <483e1f11846c0941d287a3a9228bd759a1310bdd.camel@pbarker.dev>
	 <20260819062208.680468-1-roosesweb@gmail.com>
	 <20260819062208.680468-3-roosesweb@gmail.com>
	 <c70d63515c72d28e1427a2e53fc8cafd7f0fc952.camel@pbarker.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 14:05:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244493

On Thu, 2026-08-27 at 14:25 +0100, Paul Barker wrote:
> On Wed, 2026-08-19 at 08:22 +0200, Thomas Roos wrote:
> > An empty IMAGE_LINK_NAME left a bare ".vex.json" symlink in the deploy
> > directory. Skip the link, as image.bbclass and rootfs-postcommands do.
> >=20
> > AI-Generated: Uses Claude Opus 5
> > Signed-off-by: Thomas Roos <roosesweb@gmail.com>
> > ---
> >  meta/classes/vex.bbclass | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/meta/classes/vex.bbclass b/meta/classes/vex.bbclass
> > index b3c2aca..eee3af6 100644
> > --- a/meta/classes/vex.bbclass
> > +++ b/meta/classes/vex.bbclass
> > @@ -204,7 +204,8 @@ python vex_write_rootfs_manifest () {
> >      with open(manifest_name, "w") as f:
> >          json.dump(json_data, f, indent=3D2)
> > =20
> > -    update_symlinks(manifest_name, link_path)
> > +    if link_name:
> > +        update_symlinks(manifest_name, link_path)
>=20
> Using link_name in the conditional and link_path in the function
> argument is confusing. Perhaps we should move the link_path assignment
> inside this conditional? It's not used anywhere else.
>=20
>     if link_name:
>         link_path =3D os.path.join(deploy_dir, "%s.vex.json" % link_name)
>         update_symlinks(manifest_name, link_path)

Actually, ignore this, I'm going in the wrong direction here.... I'll
reply to the cover letter about the whole series.

Sorry for the noise!

--=20
Paul Barker


