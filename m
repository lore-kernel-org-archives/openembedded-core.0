Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QMSB7-0006Gt-W1
	for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 23:51:46 +0200
Received: by ewy5 with SMTP id 5so287063ewy.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2011 14:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=8tgeAHjFBxVN+/OizR3w3ATqbstcbhrFJ2Eqm1sjNJk=;
	b=Jin3ThoUvlZBFvM5qf1HovcJOxWYwI2YV1RcnyArEpOIVp7k6Lufhkh/I/NpsXfRQG
	XAcqhj59u6rhfkWUeG0l5c9k0MINLWhq/wNe28ZPEf9i1LBFCNO13/l538z2cuKrhtxv
	iR3QS1Mls+tAcvysqvU47qzH3/LeFbdW18fO0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=vvD9G+s1gY7H0IjOOGOvqWAcgd/nbWomJWFl/yqWrBhwTWHntokuf7cFqZySJ8hrB2
	fy58WzV0olyMarMNroonKl8w7x2iNnQDD93CjrlEYNzPNOLUZe7HBdVPM1Wpl8rf4Lb6
	BstsyTo2P5pPtsrRcqwpGOT+36hCTQkZU0heU=
Received: by 10.14.49.210 with SMTP id x58mr384693eeb.12.1305668932112; Tue,
	17 May 2011 14:48:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.53.78 with HTTP; Tue, 17 May 2011 14:48:22 -0700 (PDT)
In-Reply-To: <3F9AD32B-28F9-4EC4-87A4-827AAB6CA6B7@dominion.thruhere.net>
References: <cover.1305665459.git.raj.khem@gmail.com>
	<cc2e6337ae338737455bf63bd43278dee302fb5c.1305665459.git.raj.khem@gmail.com>
	<3F9AD32B-28F9-4EC4-87A4-827AAB6CA6B7@dominion.thruhere.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 17 May 2011 14:48:22 -0700
Message-ID: <BANLkTinwX5X-sb4cwZDO2-Su+Bj7Oyd36Q@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] default-distrovars.inc, task-core-boot.bb: Create distro overridable varibales
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
X-List-Received-Date: Tue, 17 May 2011 21:51:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, May 17, 2011 at 2:03 PM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
>
> Op 17 mei 2011, om 22:57 heeft Khem Raj het volgende geschreven:
>
>> With default-setup being pulled in via bitbake.conf and task-core-boot
>> being pulled into all images in distros, we need
>> to have some variables that distro's can override if need be
>> This is a backport from angstrom/OE. It will help distros which
>> e.g. would like to use busybox-mdev instead of udev and similarly
>> for login manager these variables can be defined in distro policies
>
> The whole idea of IMAGE vars is that they can be overridden by image reci=
pes. Putting the vars in a tasks defeats that.

I see that. OK so we can define a variable like IMAGE_BOOT with some defaul=
ts
in image.bbclass which collects these variables and remove these packages f=
rom

I will post a patch for that
>
> regards,
>
> Koen
>
>
>
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> meta/conf/distro/include/default-distrovars.inc | =C2=A0 13 ++++++++++++=
+
>> meta/recipes-core/tasks/task-core-boot.bb =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =
=C2=A08 ++++----
>> 2 files changed, 17 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf=
/distro/include/default-distrovars.inc
>> index 9b1d0ee..3b78d66 100644
>> --- a/meta/conf/distro/include/default-distrovars.inc
>> +++ b/meta/conf/distro/include/default-distrovars.inc
>> @@ -6,6 +6,19 @@ OEINCLUDELOGS ?=3D "yes"
>> KERNEL_CONSOLE ?=3D "ttyS0"
>>
>> PCMCIA_MANAGER ?=3D "pcmciautils"
>> +#
>> +# udev, devfsd, busybox-mdev (from busybox) or none
>> +#
>> +IMAGE_DEV_MANAGER ?=3D "udev"
>> +#
>> +# sysvinit, upstart
>> +#
>> +IMAGE_INIT_MANAGER ?=3D "sysvinit"
>> +IMAGE_INITSCRIPTS ?=3D "initscripts"
>> +#
>> +# tinylogin, getty
>> +#
>> +IMAGE_LOGIN_MANAGER ?=3D "tinylogin"
>>
>> IMAGE_LINGUAS ?=3D "en-us en-gb"
>> LIMIT_BUILT_LOCALES ?=3D "POSIX en_US en_GB"
>> diff --git a/meta/recipes-core/tasks/task-core-boot.bb b/meta/recipes-co=
re/tasks/task-core-boot.bb
>> index 5aea771..af2c2ee 100644
>> --- a/meta/recipes-core/tasks/task-core-boot.bb
>> +++ b/meta/recipes-core/tasks/task-core-boot.bb
>> @@ -21,13 +21,13 @@ RDEPENDS_task-core-boot =3D "\
>> =C2=A0 =C2=A0 base-files \
>> =C2=A0 =C2=A0 base-passwd \
>> =C2=A0 =C2=A0 busybox \
>> - =C2=A0 =C2=A0initscripts \
>> + =C2=A0 =C2=A0${IMAGE_INITSCRIPTS} \
>> =C2=A0 =C2=A0 ${@base_contains("MACHINE_FEATURES", "keyboard", "keymaps"=
, "", d)} \
>> =C2=A0 =C2=A0 modutils-initscripts \
>> =C2=A0 =C2=A0 netbase \
>> - =C2=A0 =C2=A0sysvinit \
>> - =C2=A0 =C2=A0tinylogin \
>> - =C2=A0 =C2=A0udev \
>> + =C2=A0 =C2=A0${IMAGE_INIT_MANAGER} \
>> + =C2=A0 =C2=A0${IMAGE_LOGIN_MANAGER} \
>> + =C2=A0 =C2=A0${IMAGE_DEV_MANAGER} \
>> =C2=A0 =C2=A0 ${VIRTUAL-RUNTIME_update-alternatives} \
>> =C2=A0 =C2=A0 ${MACHINE_ESSENTIAL_EXTRA_RDEPENDS}"
>>
>> --
>> 1.7.4.1
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


