Return-Path: <prvs=7981aab84=Mikko.Rapeli@bmw.de>
Received: from esa2.bmw.c3s2.iphmx.com (esa2.bmw.c3s2.iphmx.com
	[68.232.133.169])
	by mail.openembedded.org (Postfix) with ESMTP id 314D279261
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2018 07:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1537773953; x=1569309953;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=tsA8kgmrM3A5d4Nes85Um3FG2sWRRkaDMqjR9fULYEU=;
	b=ggiyb/CaWJEan5GskQaLUq49XA7XFQBs7diUMuMQvdZTaI7G1O3GlLkI
	wzbsw6sQRZsMp0phJp7T3PB/6Ci7VqlYdOuRWNSo2iviQO6bbdrI9Lx3M
	qSELhlQjxXCUuCxKc5577hA7QwKvMXm2haw16zmtcA6alizmmSQE4cNYq I=;
Received: from esagw1.bmwgroup.com (HELO esagw1.muc) ([160.46.252.34]) by
	esa2.bmw.c3s2.iphmx.com with ESMTP/TLS; 24 Sep 2018 09:25:51 +0200
Received: from esabb3.muc ([160.50.100.30])  by esagw1.muc with ESMTP/TLS;
	24 Sep 2018 09:25:40 +0200
Received: from smucm10m.bmwgroup.net (HELO smucm10m.europe.bmw.corp)
	([160.48.96.49])
	by esabb3.muc with ESMTP/TLS; 24 Sep 2018 09:25:40 +0200
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10m.europe.bmw.corp
	(160.48.96.49) with Microsoft SMTP Server (TLS;
	Mon, 24 Sep 2018 09:25:39 +0200
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1367.000;
	Mon, 24 Sep 2018 09:25:39 +0200
From: <Mikko.Rapeli@bmw.de>
To: <bruce.ashfield@gmail.com>
Thread-Topic: [PATCH] kernel.bbclass: allow exporting files from kernel
	recipes to sysroot
Thread-Index: AQHUUaE9h/4Az64dPkO/QKSNq++KT6T+6syA
Date: Mon, 24 Sep 2018 07:25:39 +0000
Message-ID: <20180924072539.GE9430@hiutale>
References: <1537530567-8604-1-git-send-email-mikko.rapeli@bmw.de>
In-Reply-To: <1537530567-8604-1-git-send-email-mikko.rapeli@bmw.de>
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
X-List-Received-Date: Mon, 24 Sep 2018 07:25:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <95D1F9F74291554CAF786954AC22DE60@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

> On Fri, Sep 21, 2018 at 7:49 AM, Mikko Rapeli <mikko.rapeli at bmw.de> wr=
ote:
> > This change enables kernel recipes to share files with other
> > recipes. Firmware, modules and kernel-depmod are still not shared
> > since according to git history they cause problems with multiarch,
> > but all others are allowed. Examples of shared files are
> > kernel version and recipe specific headers and scripts which
> > are not needed by common linux-libc-headers to bootstrap glibc.
> >
> > For example, if a kernel recipe wants to share headers, it can do:
> >
> > PACKAGES =3D+ "${PN}-headers"
> >
> > do_install_append() {
> >     install -d "${D}${includedir}/${PN}"
> >     oe_runmake INSTALL_HDR_PATH=3D"${D}${includedir}/${PN}" headers_ins=
tall
> }
>=20
> This is what I've always done in the past (and in fact, there's an
> open Yocto bug
> to track this), but I haven't actually needed to do what you are
> modifying in the
> bbclass itself.

Without this patch, users of kernel.bbclass can provide the headers etc pac=
kages,
but other recipes can never see the files in their sysroot even if they dep=
end
on the kernel recipe because kernel.bbclass has disabled sysroot_stage_all(=
)
completely.

The recipes could define their own sysroot_stage_all() but I don't see
why kernel would be that special and why all of their installed files shoul=
d
be excluded from build sysroots by default.

The old way to do this was to fork linux-libc-headers for the custom kernel
but now it has a big fat warning to not do this, but exposing header etc
files to other recipes to build against was still not resolved.

With this patch the kernel recipe can just install the files needed and
users can see them unless they are filtered.

> If you call the sysroot stage routines directly in that
> install_append, are you really
> not seeing the files appear in the recipe's sysroot ?

Of course this can be done but why on earth is kernel so special that
it's installed files are not visible in sysroots by default?

If certain files are problematic, they can be filtered out from the
sysroot like my patch tries to do.

> Have you confirmed that we get a warning/error from bitbake about
> conflicting files
> from multiple recipes if someone doesn't know to use a custom path for th=
eir
> headers ? That has always been the main concern about allowing something =
like
> this.

No, but I do rely on this with other recipes as well. At least I know that
conflicting files warning will fail image and SDK generation.

I would expect that recipe specific sysroots don't allow conflicting files.

-Mikko=

