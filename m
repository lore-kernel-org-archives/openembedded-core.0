Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 77D3960616;
	Mon, 30 Nov 2015 18:20:41 +0000 (UTC)
Received: by wmuu63 with SMTP id u63so141553826wmu.0;
	Mon, 30 Nov 2015 10:20:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=w4I3nTRvuZIGVaFbQbKGLKdLvKxYBNbBDb03LUA93S0=;
	b=G4P+C1T9zXgXe69ieNcgy5lyTwWhLKRn6y/oBYR0VYU4xp1Qj0njmJK7aaKE88IeMn
	eTre1tRejIXCSJLpJ8AlxcpeiK1R8QicTpRl0s1an7VEpPEkpMXZg2jLU5TpVPOHK4DN
	tb1aOnJoAhbYTljZUmKPHZxrnuiTyyc8wrx90y1nU3oT2ZcD4/By+RLLogKblzl7OdAJ
	PYRE3MoyKIX1s+X5GzYV0bIKpPqtqTqhXIC/SerDeof40eIedTrJdUUwcDviUWdYmwDr
	NVUrwcsmI6Az61/ifrjvIy9c1iI4o+1DTWPwRQqb+ZES0/lW+v6T2zoWdEcrkHxJy1CZ
	KS9w==
X-Received: by 10.28.88.5 with SMTP id m5mr31420678wmb.54.1448907641558;
	Mon, 30 Nov 2015 10:20:41 -0800 (PST)
Received: from ernie.rdm.local (rademacherexchange.de. [46.245.221.222])
	by smtp.gmail.com with ESMTPSA id
	z17sm48129715wjq.1.2015.11.30.10.20.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Nov 2015 10:20:40 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <CAF3SDA6DUQQm1Uq-T-qnWyVjcAzE+EQMwA_iKkKR+zwSgcyp4g@mail.gmail.com>
Date: Mon, 30 Nov 2015 19:20:38 +0100
Message-Id: <F94F5311-1C09-49AA-B666-681FCCC7B4D6@gmail.com>
References: <56538201.1020802@intel.com>
	<48CC80AE-4DC5-4631-81E3-8E6D781B7B3A@gmail.com>
	<CAF3SDA6DUQQm1Uq-T-qnWyVjcAzE+EQMwA_iKkKR+zwSgcyp4g@mail.gmail.com>
To: "Daniel." <danielhilst@gmail.com>
X-Mailer: Apple Mail (2.2104)
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	OE-core <openembedded-core@lists.openembedded.org>,
	openembedded-devel@lists.openembedded.org,
	Mariano Lopez <mariano.lopez@intel.com>
Subject: Re: [yocto] RFC: Reference updater filesystem
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
X-List-Received-Date: Mon, 30 Nov 2015 18:20:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

> 2015-11-30 14:10 GMT-02:00 Jens Rehsack <rehsack@gmail.com>:
>>=20
>>> Am 23.11.2015 um 22:15 schrieb Mariano Lopez =
<mariano.lopez@intel.com>:
>>>=20
>>> There has been interest in an image based software updater in Yocto =
Project. The proposed solution for a image based updater is to use =
Stefano Babic's software updater (http://sbabic.github.io/swupdate). =
This software do a binary copy, so it is needed to have at least two =
partitions, these partitions would be the rootfs and the maintenance =
partition. The rootfs it's the main partition used to boot during the =
normal device operation, on the other hand, the maintenance will be used =
to update the main partition.
>>>=20
>>> To update the system, the user has to connect to device and boot in =
the maintenance partition; once in the maintenance partition the =
software updater will copy the new image in the rootfs partition. A =
final reboot into the rootfs it is necessary to complete the upgrade.
>>>=20
>>> As mentioned before the the software will copy an image to the =
partition, so everything in that partition will be wiped out, including =
custom configurations. To avoid the loss of configuration I explore =
three different solutions:
>>> 1. Use a separate partition for the configuration.
>>> a. The pro of this method is the partition is not touched during the =
update.
>>> b. The con of this method is the configuration is not directly in =
rootfs (example: /etc).
>>>=20
>>> 2. Do the backup during the update.
>>> a. The pro is the configuration is directly in rootfs.
>>> b. The con is If the update fail most likely the configuration would =
be lost.
>>>=20
>>> 3. Have an OverlayFS for the rootfs or the partition that have the =
configuration.
>>> a. The pro is the configuration is  "directly" in rootfs.
>>> b. The con is there is need to provide a custom init to guarantee =
the Overlay is mounted before the boot process.
>>>=20
>>> With the above information I'm proposing to use a separate partition =
for the configuration; this is because is more reliable and doesn't =
require big changes in the current architecture.
>>>=20
>>> So, the idea is to have 4 partitions in the media:
>>> 1. boot. This is the usual boot partition
>>> 2. data. This will hold the configuration files. Not modified by =
updates.
>>> 3. maintenance. This partition will be used to update rootfs.
>>> 4. rootfs. Partition used for normal operation.
>>=20
>> That's what we currently have implemented and running in field for a =
while with a small difference:
>>=20
>> 1) We don't use Stefano Babic's software updater, but an own script =
which deals with initial software flash and later update similar - =
https://github.com/rdm-dev/meta-jens/tree/jethro/recipes-rdm/prd
>> 2) We have integrated the updater with an update-service which can =
download the new image and install based on a manifest (signature =
support comes with next update) - =
https://github.com/rdm-dev/meta-jens/tree/jethro/recipes-rdm/system-image =
// http://www.netbsd.org/~sno/talks/nrpm/Moo-at-System-Image-Update.pdf
>> 3) We use
>>=20
>> boot
>> rootfs
>> maintfs
>> data
>>=20
>> This layout allows us to extend data to fit the entire storage with =
know sizes for boot, rootfs and maintfs
>>=20
>> 4) Overlayfs with all serices is implemented (Update-wise, when =
coming from 3.10 to 3.18 or coming from 3.0 with unionfs to overlay ...) =
- =
https://github.com/rdm-dev/meta-jens/tree/jethro/recipes-core/initoverlay
>>=20
>> Feel free to use that solution if you want.

> Am 30.11.2015 um 17:54 schrieb Daniel. <danielhilst@gmail.com>:
>=20
> Hi,
>=20
> Hey Jen, I was looking for an image upgrade solution and factory reset
> solution using overlayfs. The idea have two partitions one read-only
> with the factory image, other to hold the changes that were made by
> time. The factory reset feature should be triggered by a hided button
> that can be pressed with help of a clips. I was thinking in using an
> init ram disk to wipe out the rw partition, making the rootfs clean as
> after an image installation. The upgrader tool shold re-flash a new
> image to rootfs. Old rootfs is lost. The configuration changes that
> have been holded by overlayfs should be wiped-out too, I didn't think
> about that, is something to take in account.
>=20
> Are you using overlayfs? How is it going? What difficulties you have =
found?

Yes, we do. All difficulties we'd found are solved in referred =
initoverlay
recipe. Maybe one fine I write a blog post regarding that topic ;)

> Other solution whould be using Smart package manager to upgrade the
> rootfs, but this doesn't attend my need for factory-reset.

How does that fit into an ro rootfs?

> Please tell me more about your experience with overlayfs :)

It's more stable than unionfs. There was little effort updating
systems from 3.10 with overlay patch to 4.1 with overlay builtin
kernel (work dirs must be created - =
https://github.com/rdm-dev/meta-jens/blob/jethro/recipes-core/initoverlay/=
initoverlay/migrate2overlay.sh#L28-L30)

Cheers
--=20
Jens Rehsack - rehsack@gmail.com


