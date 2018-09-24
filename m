Return-Path: <prvs=7981aab84=Mikko.Rapeli@bmw.de>
Received: from esa1.bmw.c3s2.iphmx.com (esa1.bmw.c3s2.iphmx.com
	[68.232.133.201])
	by mail.openembedded.org (Postfix) with ESMTP id 2E54A607AC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2018 12:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1537791571; x=1569327571;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=n+7jQKDrIPHzSEYsJ+1mER+Xt30mB5y9PSadD6uXuGQ=;
	b=ObK1jjMgI0+4WEPXynxMTjRLHBdwOfiGyle3NkKR8Aa7sEuF6F5QRhc/
	ufAN7DnEwYJGmOEvvhtJ25Skd9/vk6e5YqNnT0WJxe2ten8sqTDeYenNa
	WgewcBj1NkKmVHxU1ZxeIKMRdTlXDvkCU8I7sWYInt86YqmLmvnILRTN0 M=;
Received: from esagw2.bmwgroup.com (HELO esagw2.muc) ([160.46.252.38]) by
	esa1.bmw.c3s2.iphmx.com with ESMTP/TLS; 24 Sep 2018 14:19:30 +0200
Received: from esabb6.muc ([160.50.100.50])  by esagw2.muc with ESMTP/TLS;
	24 Sep 2018 14:19:29 +0200
Received: from smucm10m.bmwgroup.net (HELO smucm10m.europe.bmw.corp)
	([160.48.96.49])
	by esabb6.muc with ESMTP/TLS; 24 Sep 2018 14:19:29 +0200
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10m.europe.bmw.corp
	(160.48.96.49) with Microsoft SMTP Server (TLS;
	Mon, 24 Sep 2018 14:19:28 +0200
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1367.000;
	Mon, 24 Sep 2018 14:19:28 +0200
From: <Mikko.Rapeli@bmw.de>
To: <bruce.ashfield@gmail.com>
Thread-Topic: [PATCH] kernel.bbclass: allow exporting files from kernel
	recipes to sysroot
Thread-Index: AQHUUaE9h/4Az64dPkO/QKSNq++KT6T+6syAgABQQYCAAAHVgA==
Date: Mon, 24 Sep 2018 12:19:28 +0000
Message-ID: <20180924121927.GI9430@hiutale>
References: <1537530567-8604-1-git-send-email-mikko.rapeli@bmw.de>
	<20180924072539.GE9430@hiutale>
	<CADkTA4MBwLt_7AHDqVfh79KNB_sG58+gGWLz=4KqMg1Qpk1Ngg@mail.gmail.com>
In-Reply-To: <CADkTA4MBwLt_7AHDqVfh79KNB_sG58+gGWLz=4KqMg1Qpk1Ngg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.221.36]
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kernel.bbclass: allow exporting files from kernel recipes to sysroot
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Sep 2018 12:19:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3CCE8D80353CA344AF1F1B4BC0AEF48E@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 24, 2018 at 08:12:53AM -0400, Bruce Ashfield wrote:
> On Mon, Sep 24, 2018 at 3:25 AM,  <Mikko.Rapeli@bmw.de> wrote:
> >> On Fri, Sep 21, 2018 at 7:49 AM, Mikko Rapeli <mikko.rapeli at bmw.de>=
 wrote:
> >> > This change enables kernel recipes to share files with other
> >> > recipes. Firmware, modules and kernel-depmod are still not shared
> >> > since according to git history they cause problems with multiarch,
> >> > but all others are allowed. Examples of shared files are
> >> > kernel version and recipe specific headers and scripts which
> >> > are not needed by common linux-libc-headers to bootstrap glibc.
> >> >
> >> > For example, if a kernel recipe wants to share headers, it can do:
> >> >
> >> > PACKAGES =3D+ "${PN}-headers"
> >> >
> >> > do_install_append() {
> >> >     install -d "${D}${includedir}/${PN}"
> >> >     oe_runmake INSTALL_HDR_PATH=3D"${D}${includedir}/${PN}" headers_=
install
> >> }
> >>
> >> This is what I've always done in the past (and in fact, there's an
> >> open Yocto bug
> >> to track this), but I haven't actually needed to do what you are
> >> modifying in the
> >> bbclass itself.
> >
> > Without this patch, users of kernel.bbclass can provide the headers etc=
 packages,
> > but other recipes can never see the files in their sysroot even if they=
 depend
> > on the kernel recipe because kernel.bbclass has disabled sysroot_stage_=
all()
> > completely.
>=20
> It doesn't need to be in a class, any kernel recipe can create a task to
> do this. The class implementation isn't special in this manner.
>=20
> >
> > The recipes could define their own sysroot_stage_all() but I don't see
> > why kernel would be that special and why all of their installed files s=
hould
> > be excluded from build sysroots by default.
>=20
> Exactly. It is because of the ability to clobber the libc-headers that is=
 is
> special.
>=20
> >
> > The old way to do this was to fork linux-libc-headers for the custom ke=
rnel
> > but now it has a big fat warning to not do this, but exposing header et=
c
> > files to other recipes to build against was still not resolved.
>=20
> That was one old way, but not the only. And not for exposing non uapi
> headers.

What other ways exist?

I don't care how, but I must export custom kernel specific headers and
other files to other recipes in a build in ways which are compatible with
yocto upstream.

I have not seen any documented ways for this.

> >
> > With this patch the kernel recipe can just install the files needed and
> > users can see them unless they are filtered.
>=20
> And as the warning points out, risk the libc-interface, which has caused
> many problems in the past .. and problems that are hard to detect and
> dig out at runtime.
>=20
> >
> >> If you call the sysroot stage routines directly in that
> >> install_append, are you really
> >> not seeing the files appear in the recipe's sysroot ?
> >
> > Of course this can be done but why on earth is kernel so special that
> > it's installed files are not visible in sysroots by default?
>=20
> because they clobber the uapi libc-headers :D
>=20
> >
> > If certain files are problematic, they can be filtered out from the
> > sysroot like my patch tries to do.
>=20
> Or we could catch that the clobbering is happening, and not let it happen=
.
>=20
> >
> >> Have you confirmed that we get a warning/error from bitbake about
> >> conflicting files
> >> from multiple recipes if someone doesn't know to use a custom path for=
 their
> >> headers ? That has always been the main concern about allowing somethi=
ng like
> >> this.
> >
> > No, but I do rely on this with other recipes as well. At least I know t=
hat
> > conflicting files warning will fail image and SDK generation.
>=20
> For something that is being proposed as a general purpose addition to
> the core, it would probably be a good idea to test these extra cases.
>=20
> >
> > I would expect that recipe specific sysroots don't allow conflicting fi=
les.
>=20
> Agreed, but definitely worth testing and logging. That way the change
> won't be blamed for causing issues later.

If files from a recipe can replace files from another recipe when preparing
recipe specific sysroot we have bigger problems than just the kernel.

I can try test this out with the kernel recipe though.

-Mikko=

