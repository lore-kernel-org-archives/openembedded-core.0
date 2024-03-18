Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 985DDC54E5D
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 19:15:56 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.54158.1710789348083489910
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Mar 2024 12:15:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=OPCD+Jig;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42IJFhRg108080;
	Mon, 18 Mar 2024 14:15:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1710789343;
	bh=e6LjlCNn2nHLfOTNpZTbtWNKCmit/IA0i879lGS4FR4=;
	h=Date:To:CC:Subject:From:References:In-Reply-To;
	b=OPCD+JigYQzFWPAry3W68ELoMBAmx7gRB7wuwi+tu8xuJy3ME918lm3aXjEvxJvkw
	 8fynjevFAAv8DdUFZuLphIig3hwg8nDdaSGkiNk1jCoYz7pYhzlzlmMsz6XxFc/ibc
	 e6p+WaStJo9+D04RVqo+y1ofcLRmYy5HxxFGHgNI=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42IJFhlU055740
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 18 Mar 2024 14:15:43 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 18
 Mar 2024 14:15:43 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 18 Mar 2024 14:15:43 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42IJFheB082220;
	Mon, 18 Mar 2024 14:15:43 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 18 Mar 2024 14:15:43 -0500
Message-ID: <CZX47IKEQWCK.2KATHXYT1JHB9@ti.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: <richard.purdie@linuxfoundation.org>, <reatmon@ti.com>,
        <denys@konsulko.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core][PATCH] bzip2: add libbz2.so.1.0 link for compat
From: Randolph Sapp <rs@ti.com>
X-Mailer: aerc 0.15.2
References: <20240316001943.3733687-1-rs@ti.com>
 <CANNYZj_qsiHUM08irST1aONGtWARW0FJTA8OdKoFwC7VpstpCA@mail.gmail.com>
In-Reply-To: <CANNYZj_qsiHUM08irST1aONGtWARW0FJTA8OdKoFwC7VpstpCA@mail.gmail.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Mar 2024 19:15:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197314

On Sat Mar 16, 2024 at 11:52 AM CDT, Alexander Kanavin wrote:
> It's better to backport the upstream patch, as nobody's going to
> remember why do_install snippet is there, or to remove it when there's
> a new release (if it doesn't cause installation conflicts).
>
> Alex

I would backport the upstream patch, if it wasn't dependant on a migration =
to
Cmake. I feel like that's a bit much.

Randolph

> On Sat, 16 Mar 2024 at 01:19, Randolph Sapp via lists.openembedded.org
> <rs=3Dti.com@lists.openembedded.org> wrote:
> >
> > From: Randolph Sapp <rs@ti.com>
> >
> > Add a link from libbz2.so.1.0 to libbz2.so.${PV} for compatibility with
> > other distributions.
> >
> > A handfull of distributions are still using the "Makefile-libbz2_so" to
> > generate libbz2 and bzip2-shared. This creates a library with a soname
> > of "libbz2.so.1.0". This library link is not provide by default in
> > autotools builds so add one here as Gentoo does now [1].
> >
> > This has been addressed upstream already, but there hasn't been a stabl=
e
> > release since then [2].
> >
> > [1] https://bugs.gentoo.org/338321
> > [2] https://gitlab.com/bzip2/bzip2/-/merge_requests/42
> >
> > Signed-off-by: Randolph Sapp <rs@ti.com>
> > ---
> >  meta/recipes-extended/bzip2/bzip2_1.0.8.bb | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb b/meta/recipes-=
extended/bzip2/bzip2_1.0.8.bb
> > index 4e3a06f240..4453171701 100644
> > --- a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
> > +++ b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
> > @@ -62,6 +62,11 @@ do_install_ptest () {
> >         sed -i -e "s|^Makefile:|_Makefile:|" ${D}${PTEST_PATH}/Makefile
> >  }
> >
> > +# add the following link for cross-distro compatibility
> > +do_install:append () {
> > +       ln -s libbz2.so.${PV} "${D}${libdir}/libbz2.so.1.0"
> > +}
> > +
> >  FILES:libbz2 =3D "${libdir}/lib*${SOLIBS}"
> >
> >  RDEPENDS:${PN}-ptest +=3D "make bash"
> > --
> > 2.44.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#197252): https://lists.openembedded.org/g/openembed=
ded-core/message/197252
> > Mute This Topic: https://lists.openembedded.org/mt/104959821/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >


