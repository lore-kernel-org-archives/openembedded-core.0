Return-Path: <prvs=864285786=Mikko.Rapeli@bmw.de>
X-Greylist: delayed 724 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 29 Nov 2018 14:29:32 UTC
Received: from esa5.bmw.c3s2.iphmx.com (esa5.bmw.c3s2.iphmx.com
	[68.232.139.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5A98A6D455
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2018 14:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1543501774; x=1575037774;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=kAx0QDFt//Nk8bFQ3hMMYAUiXyMRiSzMAv6F/7CRo0M=;
	b=AT1tW+sE2aDllyIjj7tV4m1JMZzAphN5+sGfM6qTqR7wcNUoDYR//S67
	6W5sL3cHZmmzulWAya81PkwYoxU1ZxjgbvcVxxA+9enK/pWMLneZ6Lpi5
	2ossbELNf9HsfITl78wA0mpvXO66/oLFprrQotADdmKT/86GacSj20c8x I=;
Received: from esagw5.bmwgroup.com (HELO esagw5.muc) ([160.46.252.46]) by
	esa5.bmw.c3s2.iphmx.com with ESMTP/TLS; 29 Nov 2018 15:17:11 +0100
Received: from esabb3.muc ([160.50.100.30])  by esagw5.muc with ESMTP/TLS;
	29 Nov 2018 15:17:10 +0100
Received: from smucm12k.bmwgroup.net (HELO smucm12k.europe.bmw.corp)
	([160.48.96.55])
	by esabb3.muc with ESMTP/TLS; 29 Nov 2018 15:17:10 +0100
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm12k.europe.bmw.corp
	(160.48.96.55) with Microsoft SMTP Server (TLS;
	Thu, 29 Nov 2018 15:17:10 +0100
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1395.000;
	Thu, 29 Nov 2018 15:17:10 +0100
From: <Mikko.Rapeli@bmw.de>
To: <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH 1/5] RFC image_types.bbclass: add image size
	limit for tar image type
Thread-Index: AQHUh94x/gkUVkgp2k6cUKrj5tmVXaVmuFEAgAADnIA=
Date: Thu, 29 Nov 2018 14:17:10 +0000
Message-ID: <20181129141709.GB10799@hiutale>
References: <1543494097-19534-1-git-send-email-mikko.rapeli@bmw.de>
	<1543494097-19534-2-git-send-email-mikko.rapeli@bmw.de>
	<335a4290d941021b84a2b0447e2017774d0e5259.camel@linuxfoundation.org>
In-Reply-To: <335a4290d941021b84a2b0447e2017774d0e5259.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.221.37]
MIME-Version: 1.0
Cc: Michael.Ho@bmw.de, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/5] RFC image_types.bbclass: add image size limit for tar image type
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
X-List-Received-Date: Thu, 29 Nov 2018 14:29:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8BC195ABE786404DA05A3A198C23D671@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 29, 2018 at 02:04:14PM +0000, Richard Purdie wrote:
> On Thu, 2018-11-29 at 14:21 +0200, Mikko Rapeli wrote:
> > If IMAGE_ROOTFS_SIZE_LIMIT is defined in image configuration, then
> > build will fail if for tar image type the uncompressed tar ball size
> > exceeds the value, as reported by 'du -ks'.
> >=20
> > This check could be extended to other image types as well.
> >=20
> > There already exists a check with IMAGE_ROOTFS_SIZE variable
> > but I could not figure out how to actually use it. It does
> > some quite complex overhead calculations which did not seem
> > to work for me on sumo.
> >=20
> > When the image size is exceeded, build fails like this:
> >=20
> > ERROR: image-1.0-r0 do_image_tar: Image size 170712 of
> > /home/builder/src/base/build/tmp/work/linux/image/1.0-r0/deploy-
> > image-complete/image.rootfs.tar reported by 'du -ks' is larger than
> > limit IMAGE_ROOTFS_SIZE_LIMIT 170000
>=20
> What about IMAGE_ROOTFS_MAXSIZE?
>
> I think IMAGE_ROOTFS_SIZE is about adding extra space to the image, not
> limiting its size...

Yea, forgot to mention that I tried that too but got inconsisten results.
I know it's bad but it was easier for me to add this new test than to figur=
e
out what's wrong with current yocto image size checks. Hence RFC.

-Mikko

> Cheers,
>=20
> Richard=

