Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id D0D4F60767;
	Sun,  6 Dec 2015 11:34:27 +0000 (UTC)
Received: by wmww144 with SMTP id w144so109631487wmw.1;
	Sun, 06 Dec 2015 03:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=tiZI0oDP8p0/ufyTb1jNDyChdkxvxOZfLKECSUYk/fk=;
	b=oth/Uk2gR+OIYthtlegbkhSsmfZTB8Nb99psqGAWRX63chxlgzQ4mLpw0vrc/67DKK
	voSc7YzQtVi/4706VdBmJ6VSBfexCPoyBrDh0toqQdUGXPQCYCKdCGP/YMlGLF0mI6iD
	q+L1xmwTpxvCglJoO4ER/JG2TakjcrMYdurDRtiGbxp+IHsYlINFM1z3+48LBuPj9Ir6
	nVZn5UuBfl7h9K3JN8CwL5VX6lbBOZd2MRJ6BE6kUFc+iyxrXiroC+VF8mUT4CKa3cSA
	rkO9xrQD4EUglMagCTBXRtLv0Pl1pZ8l4DTmYVvw8wLFqt3F41S/x+S+QJhmi6R4E6gX
	0Gfg==
X-Received: by 10.28.61.4 with SMTP id k4mr15733003wma.34.1449401667654;
	Sun, 06 Dec 2015 03:34:27 -0800 (PST)
Received: from ernie.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12]) by smtp.gmail.com with ESMTPSA id
	c194sm11547737wmd.13.2015.12.06.03.34.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 06 Dec 2015 03:34:27 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <566071A5.4010005@linux.intel.com>
Date: Sun, 6 Dec 2015 12:34:25 +0100
Message-Id: <EBE355CC-5515-4C2A-AB72-A326E2D46F70@gmail.com>
References: <56538808.5050606@linux.intel.com> <90526450.BhUWnDVvgQ@masala.hex>
	<5654AC12.9060808@windriver.com> <11874234.lUveKP5eiY@masala.hex>
	<566071A5.4010005@linux.intel.com>
To: Mariano Lopez <mariano.lopez@linux.intel.com>
X-Mailer: Apple Mail (2.2104)
Cc: openembedded-devel@lists.openembedded.org,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] RFC: Reference updater filesystem
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
X-List-Received-Date: Sun, 06 Dec 2015 11:34:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Am 03.12.2015 um 17:45 schrieb Mariano Lopez =
<mariano.lopez@linux.intel.com>:
>=20
> [...]
>=20
> Thanks to all for your input. The conclusion of this thread is:
>=20
> 1. One size doesn't fit all.
> 2. Most of the people was fine with the image based update.

Where is the image stored? I read over referred =
http://sbabic.github.io/swupdate/
and realized that the update image must include a stripped rootfs and =
the entire
software for rootfs as well as probably the recoveryfs/maintfs and some =
logic
for updating the data volume (eg. migrator for database of business =
logic).

This can be very large ... and must be stored somewhere.

Next question: how bullet proof is the swupdate?

Out process is designed (because of typical users can't interact) to can =
survive
surprising power outage. Unfortunately we didn't manage to split out =
u-boot into
separate updatable parts, so we can't benefit from it - but technically =
(if one
has implemented for heir targets), our script updates and continues =
after power
comes back.

I think, beside the question of having an image containing the update =
(we have such
an add-on, too - for legacy devices without he modern Yocto based =
firmware), the
question of stability should be evaluated, too.

> 3. The recommended way to keep the configuration is to have a =
separated data partition.
> 4. The partition scheme would be:
>    1. boot. This is the usual boot partition
>    2. rootfs. Partition used for normal operation.
>    3. maintenance. This partition will be used to update rootfs.
>    4. data. This will hold the configuration files. Not modified by
>    updates.

Cheers
--=20
Jens Rehsack - rehsack@gmail.com


