Return-Path: <rehsack@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 90C09755FA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Oct 2015 07:30:51 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so58235663wic.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Oct 2015 00:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=VeopkFX3m0Jt4okyUmwcgeCdPfLYe3gzig7voEPYPdk=;
	b=05rp7fm3ufhBIvdA8VrVg/Xw9W4JLyHdNi9IohsDVTZ83kvOY3pdt/TT850fX/3UDS
	uB6PXB7AioSoRDHUHPDFN8v+qZ0JVhpO6EhqidTClGrhbV4ZwQMJGmX2MJMefjZnfslb
	9SVCIwjDEcJDiiLHWU4b+/dbIY+hgFUaPNk82EDPyZTGCj1aF3BEyujsfk6jL9f28P1x
	4G3E8gWQdxTIhnnTen+tQfVsu8NiwWP1TFjoflZSzOBJV+W894sSUNIc/HjeQ4E/fHHe
	I07gH/ZsxX425gFfqNiudUDiUHDBS/D9wm8H3ui28orbGvC8Df58ACpQZFGZ+OJltiVz
	4kLA==
X-Received: by 10.180.8.132 with SMTP id r4mr9196801wia.70.1444375851652;
	Fri, 09 Oct 2015 00:30:51 -0700 (PDT)
Received: from ernie.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12])
	by smtp.gmail.com with ESMTPSA id bh5sm330809wjb.42.2015.10.09.00.30.50
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 09 Oct 2015 00:30:50 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <20151008172250.GM2385@jama>
Date: Fri, 9 Oct 2015 09:30:49 +0200
Message-Id: <E1FF050B-317A-4B6D-BF2B-CEFA226501A1@gmail.com>
References: <2D0D4F06-AB53-4200-B729-AB982B4CBB46@gmail.com>
	<20151008172250.GM2385@jama>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.2104)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] udev: Don't introduce pci dependencies without pci being featured
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
X-List-Received-Date: Fri, 09 Oct 2015 07:30:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Am 08.10.2015 um 19:22 schrieb Martin Jansa <martin.jansa@gmail.com>:
>=20
> On Thu, Oct 08, 2015 at 05:26:11PM +0200, Jens Rehsack wrote:
>> Fixes that udev always requires PCI, idenpendently from machine or =
distro features.
>>=20
>> Signed-off-by: Jens Rehsack <sno@netbsd.org>
>> ---
>> meta/recipes-core/udev/udev.inc | 10 +++++-----
>> 1 file changed, 5 insertions(+), 5 deletions(-)
>>=20
>> diff --git a/meta/recipes-core/udev/udev.inc =
b/meta/recipes-core/udev/udev.inc
>> index c378ae3..573ecca 100644
>> --- a/meta/recipes-core/udev/udev.inc
>> +++ b/meta/recipes-core/udev/udev.inc
>> @@ -12,7 +12,9 @@ LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
>>=20
>> LDFLAGS +=3D "-lrt"
>>=20
>> -DEPENDS =3D "glib-2.0 libusb usbutils pciutils glib-2.0-native =
gperf-native libxslt-native util-linux"
>> +DEPENDS =3D "glib-2.0 glib-2.0-native gperf-native libxslt-native =
util-linux"
>> +DEPENDS +=3D " ${@base_contains('MACHINE_FEATURES', 'usbhost', =
'libusb usbutils', '', d)}"
>> +DEPENDS +=3D " ${@base_contains('MACHINE_FEATURES', 'pci', =
'pciutils', '', d)}"
>=20
> NAK
>=20
> udev isn't (and shouldn't be) MACHINE_ARCH, so it cannot use
> MACHINE_FEATURES variable.

Why shouldn't be?

We have 2 machines, both iMX6 based, one with Multimedia and one =
without.
For the -lite one, we wouldn't want provide rules for dealing with hdmi,
audio, ...

The other ARM machines we have which are complete different platforms
(iMX6 vs. Kirkwood) are distinguished by armv5 vs. armv7 - but what
happens when another platform joins the farm which is ARMv7 but no i.MX?

> Please change them to PACKAGECONFIG options and distro can decide to
> disable them for all MACHINEs (or at least for whole set of MACHINEs
> sharing the same TUNE_PKGARCH)

This should be done along with some reasonable documentation how to
tune that - can you give me (depending on my question above) a hint =
where
to add such a notice for platform integrators?

Cheers
--=20
Jens Rehsack - rehsack@gmail.com


