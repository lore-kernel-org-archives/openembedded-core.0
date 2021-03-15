Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.2341.1615767370423183361
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Mar 2021 17:16:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 80B3A40BFF;
	Mon, 15 Mar 2021 00:16:09 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ePUilI7WnaXV; Mon, 15 Mar 2021 00:16:09 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3870540BE6;
	Mon, 15 Mar 2021 00:16:04 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 87D0F174542; Sun, 14 Mar 2021 20:16:03 -0400 (EDT)
Date: Sun, 14 Mar 2021 20:16:03 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: Robert Yang <liezhi.yang@windriver.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org, steve@sakoman.com,
	anibal.limon@linaro.org
Subject: Re: [OE-core] [PATCH 1/1] image.bbclass: deltask do_packagedata
Message-ID: <20210315001603.GJ4892@denix.org>
References: <cover.1615452338.git.liezhi.yang@windriver.com>
 <25142da05a29d5782b7d9030858c54a3c55730f2.1615452338.git.liezhi.yang@windriver.com>
 <20210311090200.33p3mptsfwusspwa@jama>
 <64d5a49eeb455d812d7d5e30dfc2c63394d97ff7.camel@linuxfoundation.org>
 <fba65a47-7d0c-e0b4-3ea8-aad55b66bd62@windriver.com>
 <20210312111708.zgj3qjikjcekj4y6@jama>
MIME-Version: 1.0
In-Reply-To: <20210312111708.zgj3qjikjcekj4y6@jama>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 12, 2021 at 12:17:08PM +0100, Martin Jansa wrote:
> On Fri, Mar 12, 2021 at 03:59:20PM +0800, Robert Yang wrote:
> > Hi RP,
> >=20
> > On 3/11/21 10:38 PM, Richard Purdie wrote:
> > > On Thu, 2021-03-11 at 10:02 +0100, Martin Jansa wrote:
> > > > On Thu, Mar 11, 2021 at 12:46:22AM -0800, Robert Yang wrote:
> > > > > This can fix a do_package error when compile with meta-secure-c=
ore layer:
> > > > > http://layers.openembedded.org/layerindex/branch/master/layer/m=
eta-secure-core/
> > > > >=20
> > > > > $ bitbake kernel-initramfs
> > > > > [snip]
> > > > > WARNING:kernel-initramfs-1.0-r0 do_package: Manifest
> > > > > build/tmp-glibc/sstate-control/manifest-x86_64_x86_64-nativesdk=
-secure-core-image-initramfs.packagedata
> > > > > not found in intel_x86_64 corei7-64 core2-64 x86_64 allarch x86=
_64_x86_64-nativesdk (variant '')?
> > > > > [snip]
> > > > >=20
> > > > > This is because kernel-initramfs wants to pack an initramfs ima=
ge into
> > > > > kernel-initramfs.rpm which adds a dependency in kernel-initramf=
s.bb to do this:
> > > > >=20
> > > > > d.appendVarFlag('do_install', 'depends', ' ${INITRAMFS_IMAGE}:d=
o_image_complete')
> > > > >=20
> > > > > This causes kernel-initramfs' do_package depends on
> > > > > ${INITRAMFS_IMAGE}:do_image_complete's do_packagedata, then we =
will get the
> > > > > error. Delete do_packagedata as other do_package relelated task=
s for the image
> > > > > recipe will fix the error.
> > > > >=20
> > > > > Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> > > >=20
> > > > Acked-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > >=20
> > > > I went a bit further and inheritted nopackages, but RP mentioned =
that it
> > > > might be removing too much. Nothing failed with nopackages over n=
ight,
> > > > but still this smaller version will be safer as this needs to got=
 to
> > > > gatesgarth and dunfell as well now.
> > >=20
> > > This has side effects and there was a reason this wasn't done origi=
nally.=A0The
> > > trouble is that nobody is testing for that, just wanting to fix the=
 problem
> > > they see. To prove this isn't straightforward, I tested this locall=
y, comparing
> > > task-depends.dot from "bitbake core-image-sato -g" before and after=
 this patch.
> >=20
> > If we want to avoid disconnecting them, it seems that a better way is=
 fixing
> > this in the recipes which has this problem? For example, I got this e=
rror in
> > secure-core-image-initramfs.bb, then we can add "deltask do_packageda=
ta" in the
> > recipe to fix the problem.
>=20
> That's what I did in initramfs-android-image (which was triggering this
> for me as reported on ML)
> https://github.com/shr-distribution/meta-smartphone/commit/732dd29325d8=
82a9b3414764ad4c7a254dae3f03

The issue of doing this in each and every possible initramfs image recipe=
 is=20
that it does not scale. For example, this code in the original patch is v=
ery=20
common:

d.appendVarFlag('do_install', 'depends', ' ${INITRAMFS_IMAGE}:do_image_co=
mplete')

And INITRAMFS_IMAGE can be set anywhere - in machine config, distro confi=
g or=20
even by end user in local.conf


> > @Martin maybe we shouldn't backport this patch to gatesgarth or dunfe=
ll since
> > it may suprise the users.
>=20
> Unfortunately
> https://git.openembedded.org/openembedded-core/commit/?h=3Ddunfell&id=3D=
e0c1db170fdd6c1d78fdfce017feae26c96fac29
> was already backported to both gatesgarth and dunfell.

Yeah, it's unfortunate. Our LTS maintainer is too good! :)
Seriously though, not sure why changing warning to error was even conside=
red=20
for backporting to LTS! Making things stricter doesn't usually fall under=
=20
"bugfix" category...

--=20
Denys
