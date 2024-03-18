Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98E4CC54E5D
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 19:13:46 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.54078.1710789216505763179
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Mar 2024 12:13:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=E8XEqo78;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42IJDYwU011894;
	Mon, 18 Mar 2024 14:13:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1710789214;
	bh=WkujeCOWV6zUij6QRLl5Cm0LW/sq3JLgdD/IF6YhRgc=;
	h=Date:To:CC:Subject:From:References:In-Reply-To;
	b=E8XEqo78hjDffzSDGctuXtRnS8e5evMk8VYP3KzrE/wiLKlETc5Wh0dO1eRkb9QGt
	 ASrxD8BQdKWeUqGpSOM8Dg/nB2EEUlDqPsiy0220FuA67KbDjL2brIi18LrnpnsA9E
	 4XBNfhip1GaYI0zTo0be+VVC6eYpm6M7Hknb8LlE=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42IJDYBQ053690
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 18 Mar 2024 14:13:34 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 18
 Mar 2024 14:13:34 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 18 Mar 2024 14:13:33 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42IJDYat020686;
	Mon, 18 Mar 2024 14:13:34 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 18 Mar 2024 14:13:34 -0500
Message-ID: <CZX45V4AS4TK.14WNJ0K3ZEGU5@ti.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, <reatmon@ti.com>,
        <denys@konsulko.com>
CC: <openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core][PATCH] bzip2: add libbz2.so.1.0 link for compat
From: Randolph Sapp <rs@ti.com>
X-Mailer: aerc 0.15.2
References: <20240316001943.3733687-1-rs@ti.com>
 <419a6e703c2619c79e52772edf92f1f8c43230e8.camel@linuxfoundation.org>
In-Reply-To: <419a6e703c2619c79e52772edf92f1f8c43230e8.camel@linuxfoundation.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Mar 2024 19:13:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197313

On Sun Mar 17, 2024 at 4:28 AM CDT, Richard Purdie wrote:
> On Fri, 2024-03-15 at 19:19 -0500, rs@ti.com wrote:
> > From: Randolph Sapp <rs@ti.com>
> >=20
> > Add a link from libbz2.so.1.0 to libbz2.so.${PV} for compatibility
> > with
> > other distributions.
> >=20
> > A handfull of distributions are still using the "Makefile-libbz2_so" to
> > generate libbz2 and bzip2-shared. This creates a library with a soname
> > of "libbz2.so.1.0". This library link is not provide by default in
> > autotools builds so add one here as Gentoo does now [1].
> >=20
> > This has been addressed upstream already, but there hasn't been a stabl=
e
> > release since then [2].
> >=20
> > [1] https://bugs.gentoo.org/338321
> > [2] https://gitlab.com/bzip2/bzip2/-/merge_requests/42
> >=20
> > Signed-off-by: Randolph Sapp <rs@ti.com>
> > ---
> > =C2=A0meta/recipes-extended/bzip2/bzip2_1.0.8.bb | 5 +++++
> > =C2=A01 file changed, 5 insertions(+)
>
> I guess by "cross distro", you mean that you have some binaries which
> need to run on multiple distros, some of which have this naming and
> some of which do not?
>
> I am a bit worried about this as it is the kind of thing we add, then
> totally forget about removing so it gets carried even after it no
> longer makes sense (and the library name/version changes again for
> example).
>
> Ugly as it may be, I'm wondering if there should be a separate recipe
> to handle this link which the binaries could depend upon. Even a
> separate package for it and an error if the target lib doesn't exist
> might be better.
>
> Cheers,
>
> Richard

Yeah, anything compiled on Debian/Arch will run into issues looking up that=
 so
name when running under Yocto.

Oddly enough though, both Fedora and Gentoo seem to be using the new soname=
. I'm
not entirely sure if this is actually that common now. Maybe this should be
ignored.

