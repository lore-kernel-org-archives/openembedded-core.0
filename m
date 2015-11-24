Return-Path: <roman@khimov.ru>
Received: from roman.khimov.ru (roman.khimov.ru [82.146.54.17])
	by mail.openembedded.org (Postfix) with ESMTP id B60136018D;
	Tue, 24 Nov 2015 10:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=khimov.ru;
	s=mail; 
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From;
	bh=0MkJEg+czYiD4HeN0lTo7i+7rDhboKaZjQborIsyE4Q=; 
	b=Ef0qZFyKgGbIUkcWiInmbVHyhdLhelY2zvMzi/nV3knMrUmJh+5IbuYnAXpbZF0Z/ojNbCZXQIQm7Vfy4lAJ0HrqwOGBVLoFdoJcM3shP8ScqJnM6TePWjbd3Y3IdwhSgHRjwLqe/hxMV4hazPb8xPNi+hKRweZM7/gHIrnx6C6iKeJ+/TtgCh2S2yJot31PZqL+TZAWhkJ7fxOHQY8X2LSeow+FCoV94ld5BuHgTQ/QV/M+BuouyOi+VN2+ZfXydvcy5S/aROI5a54WMZYAjwH8ADn3ZWMA1M55LCPpUS5ywPkr3qYc2EFe5JAA3p3rwqvef2v/q0NAEC0A4bp38Q==;
Received: from mail.pkcc-tb.ru ([185.33.199.10] helo=bancha.hex)
	by roman.khimov.ru with esmtpsa (TLS1.0:ECDHE_RSA_AES_256_CBC_SHA1:256)
	(Exim 4.84) (envelope-from <roman@khimov.ru>)
	id 1a1B0X-0001LX-B5; Tue, 24 Nov 2015 13:39:35 +0300
From: Roman Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 24 Nov 2015 13:39:32 +0300
Message-ID: <14934048.INuFbpGn5J@bancha.hex>
User-Agent: KMail/4.14.9 (Linux/3.16.7-24-desktop; KDE/4.14.9; x86_64; ; )
In-Reply-To: <56538808.5050606@linux.intel.com>
References: <56538808.5050606@linux.intel.com>
MIME-Version: 1.0
Cc: yocto@yoctoproject.org, OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Tue, 24 Nov 2015 10:39:40 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

=D0=92 =D0=BF=D0=B8=D1=81=D1=8C=D0=BC=D0=B5 =D0=BE=D1=82 23 =D0=BD=D0=BE=
=D1=8F=D0=B1=D1=80=D1=8F 2015 15:41:28 =D0=BF=D0=BE=D0=BB=D1=8C=D0=B7=D0=
=BE=D0=B2=D0=B0=D1=82=D0=B5=D0=BB=D1=8C Mariano Lopez =D0=BD=D0=B0=D0=BF=
=D0=B8=D1=81=D0=B0=D0=BB:
> 1. Use a separate partition for the configuration.
>    a. The pro of this method is the partition is not touched during t=
he
> update.
>    b. The con of this method is the configuration is not directly in
> rootfs (example: /etc).

That's the right solution, although to do it really right (at least IMO=
) you=20
need to implement the /usr merge [1] (and that's orthogonal to using or=
 not=20
using systemd), which can also help you make your /usr read-only (becau=
se=20
that's just code and static data) with read-write / for user data of va=
rious=20
sorts.

> 3. Have an OverlayFS for the rootfs or the partition that have the
> configuration.
>    a. The pro is the configuration is  "directly" in rootfs.
>    b. The con is there is need to provide a custom init to guarantee =
the
> Overlay is mounted before the boot process.

And this is the approach I would recommend not doing. I've used UnionFS=
 for=20
thing like that (overlaying whole root file system) some 6 years ago, i=
t=20
sounded nice and it kinda worked, but it wasn't difficult to make it fa=
il=20
(just a little playing with power), we've even seen failures on product=
ion=20
devices, like when you have whiteout file for directory already written=
, but=20
don't have new files in it yet and that can completely ruin the system.=


Also, it usually works better when you don't have any changes in the lo=
wer=20
layer, but we're talking about updating it here, you can easily end up =
in a=20
situation where you have updated something in the rootfs but that was=20=

overriden by upper layer and thus your user doesn't see any change.

> With the above information I'm proposing to use a separate partition =
for
> the configuration; this is because is more reliable and doesn't requi=
re
> big changes in the current architecture.
>=20
> So, the idea is to have 4 partitions in the media:
> 1. boot. This is the usual boot partition
> 2. data. This will hold the configuration files. Not modified by upda=
tes.
> 3. maintenance. This partition will be used to update rootfs.
> 4. rootfs. Partition used for normal operation.

You probably don't need to separate 1 and 3, all the code for system up=
date=20
should easily fit into initramfs and just making /boot a bit larger wou=
ld=20
allow you to store some backup rootfs.

Also, you can swap 4 and 2 which will be useful if you're installing on=
=20
different sized storage devices, usually you know good enough the size =
of your=20
rootfs, but you probably want to leave more space for user data if ther=
e is an=20
opportunity to do so, that's just easier to do with data partition at t=
he end.


[1] http://www.freedesktop.org/wiki/Software/systemd/TheCaseForTheUsrMe=
rge/

