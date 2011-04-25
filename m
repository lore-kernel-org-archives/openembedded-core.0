Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QEOnF-0002Zz-7L
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Apr 2011 18:37:49 +0200
Received: by wwb17 with SMTP id 17so2004188wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2011 09:35:20 -0700 (PDT)
Received: by 10.227.10.131 with SMTP id p3mr4094395wbp.125.1303749320379;
	Mon, 25 Apr 2011 09:35:20 -0700 (PDT)
Received: from [172.20.2.72] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id x1sm3350047wbh.19.2011.04.25.09.35.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 25 Apr 2011 09:35:16 -0700 (PDT)
References: <cover.1303539961.git.sgw@linux.intel.com>
	<a0629aa0dc55829565b7ab1725875eac065ab2f1.1303539961.git.sgw@linux.intel.com>
	<4DB562CF.1020100@mlbassoc.com> <4DB59811.5040109@linux.intel.com>
In-Reply-To: <4DB59811.5040109@linux.intel.com>
Mime-Version: 1.0 (iPhone Mail 8H7)
Message-Id: <8420B834-06E0-46FA-8811-8D121880DDE4@dominion.thruhere.net>
X-Mailer: iPhone Mail (8H7)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 25 Apr 2011 18:35:06 +0200
To: Saul Wold <sgw@linux.intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 07/37] modutils-initscripts: fix wrong order of module loading happening in udev
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Apr 2011 16:37:49 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Is anyone still using 2.4 kernels? That's what modutils is for, module-init-=
tools is for 2.6 kernels

Op 25 apr. 2011 om 17:49 heeft Saul Wold <sgw@linux.intel.com> het volgende g=
eschreven:

> On 04/25/2011 05:02 AM, Gary Thomas wrote:
>> On 04/23/2011 12:28 AM, Saul Wold wrote:
>>> From: =3D?UTF-8?q?Petr=3D20=3DC5=3DA0tetiar?=3D<ynezz@true.cz>
>>>=20
>>> In the current state, udev init script is loaded as 3rd and
>>> modutils.sh as
>>> 20th, so udevadm called in udev init script loads all kernel modules
>>> in some
>>> unpredictable order, not honoring in any way specified order of
>>> modules in
>>> /etc/modules. This causes some troubles mainly in the first boot. So
>>> to fix
>>> this we now move loading of the kernel modules just before we exec
>>> udev init
>>> script. Example of the current state:
>>>=20
>>> Starting udev
>>> rtc-m48t86 rtc-m48t86: rtc core: registered m48t86 as rtc0
>>> rtc-m48t86 rtc-m48t86: battery ok
>>> ep93xx-rtc ep93xx-rtc: rtc core: registered ep93xx-rtc as rtc1
>>>=20
>>> root@ts72xx:~# cat /etc/modules
>>> rtc-ep93xx
>>> ohci-hcd
>>> ts72xx_sbcinfo
>>> rtc-m48t86
>>>=20
>>> As you can guess, this is really wrong behaviour, because I've rtc1 as
>>> the
>>> main time source for my system.
>>>=20
>>> root@ts72xx:~# cat /etc/default/hwclock
>>> HWCLOCKACCESS=3Dyes
>>> HWCLOCKDEVICE=3D/dev/rtc1
>>>=20
>>> Expected behaviour with this patch applied:
>>>=20
>>> Please wait: booting...
>>> ep93xx-rtc ep93xx-rtc: rtc core: registered ep93xx-rtc as rtc0
>>> usbcore: registered new device driver usb
>>> ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
>>> ...
>>> rtc-m48t86 rtc-m48t86: rtc core: registered m48t86 as rtc1
>>> rtc-m48t86 rtc-m48t86: battery ok
>>> Starting udev
>>>=20
>>> Signed-off-by: Petr =C5=A0tetiar<ynezz@true.cz>
>>>=20
>>> (based on http://patches.openembedded.org/patch/1917/)
>>> Signed-off-by: Koen Kooi<koen@dominion.thruhere.net>
>>> Signed-off-by: Saul Wold<sgw@linux.intel.com>
>>> ---
>>> .../modutils/modutils-initscripts.bb | 4 ++--
>>> 1 files changed, 2 insertions(+), 2 deletions(-)
>>>=20
>>> diff --git a/meta/recipes-kernel/modutils/modutils-initscripts.bb
>>> b/meta/recipes-kernel/modutils/modutils-initscripts.bb
>>> index 1665955..5ae34b4 100644
>>> --- a/meta/recipes-kernel/modutils/modutils-initscripts.bb
>>> +++ b/meta/recipes-kernel/modutils/modutils-initscripts.bb
>>> @@ -4,10 +4,10 @@ LICENSE =3D "PD"
>>> LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D7bf87fc37976e93ec66ad84fac58c=
098"
>>> SRC_URI =3D "file://modutils.sh \
>>> file://PD.patch"
>>> -PR =3D "r4"
>>> +PR =3D "r5"
>>>=20
>>> INITSCRIPT_NAME =3D "modutils.sh"
>>> -INITSCRIPT_PARAMS =3D "start 20 S ."
>>> +INITSCRIPT_PARAMS =3D "start 2 S ."
>>>=20
>>> inherit update-rc.d
>>>=20
>>=20
>> Should there not be a corresponding change to modutils_2.4.27.bb? It's
>> not clear to me
>> where there are these two separate recipes, but they should at least be
>> kept in sync.
>>=20
> Gary,
>=20
> Could you please resend this as a proper patch with Signed-off-by and comm=
it info.
>=20
> Thanks
>    Sau!
>=20
>> diff --git a/meta/recipes-kernel/modutils/modutils_2.4.27.bb
>> b/meta/recipes-kernel/modutils/modutils_2.4.27.bb
>> index 1ebc90c..2944201 100644
>> --- a/meta/recipes-kernel/modutils/modutils_2.4.27.bb
>> +++ b/meta/recipes-kernel/modutils/modutils_2.4.27.bb
>> @@ -5,7 +5,7 @@ manageable for all users, administrators and
>> distribution maintainers."
>> LICENSE =3D "GPLv2"
>> LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8ca43cbc842c2336e835926c2166c2=
8b"
>> DEPENDS =3D "bison-native"
>> -PR =3D "r9"
>> +PR =3D "r10"
>>=20
>> SRC_URI =3D
>> "${KERNELORG_MIRROR}/linux/utils/kernel/modutils/v2.4/modutils-${PV}.tar.=
bz2
>> \
>> file://lex.l.diff;patch=3D1 \
>> @@ -51,7 +51,7 @@ if test -n "$D"; then
>> done
>> fi
>> fi
>> -update-rc.d $D modutils.sh start 20 S .
>> +update-rc.d $D modutils.sh start 2 S .
>> }
>>=20
>> pkg_prerm_modutils () {
>>=20


