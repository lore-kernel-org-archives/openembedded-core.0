Return-Path: <stefan@herbrechtsmeier.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5FBFC433F5
	for <webhook@archiver.kernel.org>; Sun,  6 Feb 2022 16:55:02 +0000 (UTC)
Received: from dd43212.kasserver.com (dd43212.kasserver.com [85.13.165.135])
 by mx.groups.io with SMTP id smtpd.web10.10846.1644166499938556852
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 08:55:01 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: herbrechtsmeier.net,
 ip: 85.13.165.135, mailfrom: stefan@herbrechtsmeier.net)
Received: from [192.168.178.45] (i5E8667C7.versanet.de [94.134.103.199])
	by dd43212.kasserver.com (Postfix) with ESMTPSA id 0031A43C070F
	for <openembedded-core@lists.openembedded.org>;
 Sun,  6 Feb 2022 17:54:56 +0100 (CET)
Message-ID: <fb6b0d98-663b-628f-e1d6-dca777d9bc90@herbrechtsmeier.net>
Date: Sun, 6 Feb 2022 17:54:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [OE-core] [PATCH v2 3/3] systemd: Minimize udev package size if
 DISTRO_FEATURES contains systemd
Content-Language: en-US
From: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
To: openembedded-core@lists.openembedded.org
References: <20220202073525.3413-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <20220202073525.3413-3-stefan.herbrechtsmeier-oss@weidmueller.com>
 <16D124152B709F2D.20549@lists.openembedded.org>
 <d32894f49e357e1bcd713a5ab843f43cad6ce1e7.camel@linuxfoundation.org>
 <16D1401AF7E66E0D.14843@lists.openembedded.org>
In-Reply-To: <16D1401AF7E66E0D.14843@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Feb 2022 16:55:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161404

Am 06.02.22 um 17:43 schrieb Stefan Herbrechtsmeier:
> Am 06.02.22 um 10:53 schrieb Richard Purdie:
>> On Sun, 2022-02-06 at 08:10 +0000, Richard Purdie via=20
>> lists.openembedded.org
>> wrote:
>>> On Wed, 2022-02-02 at 08:35 +0100, Stefan Herbrechtsmeier wrote:
>>>> From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com=
>
>>>>
>>>> Link udev shared with systemd helper to minimize the udev package si=
ze
>>>> if DISTRO_FEATURES contains systemd.
>>>>
>>>> It is only usefull to link udev static with systemd helper if udev
>>>> should be installed without systemd.
>>>>
>>>> Signed-off-by: Stefan Herbrechtsmeier=20
>>>> <stefan.herbrechtsmeier@weidmueller.com>
>>>>
>>>> ---
>>>>
>>>> (no changes since v1)
>>>>
>>>> =C2=A0 meta/recipes-core/systemd/systemd_249.7.bb | 1 +
>>>> =C2=A0 1 file changed, 1 insertion(+)
>>>
>>>
>>> This seems to break some of our tests:
>>>
>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/470=
8
>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/312=
1
>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/308=
5
>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/308=
9
>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/312=
7
>>>
>>> Presumably it causes extra dependencies to be pulled in causing the=20
>>> file overlap
>>> where there was previously none.
>>
>> Thinking a bit more, I think this needs to be:
>>
>> diff --git a/meta/recipes-core/systemd/systemd_250.3.bb=20
>> b/meta/recipes-core/systemd/systemd_250.3.bb
>> index 2b6bfcc2c25..7851c4c16a7 100644
>> --- a/meta/recipes-core/systemd/systemd_250.3.bb
>> +++ b/meta/recipes-core/systemd/systemd_250.3.bb
>> @@ -69,7 +69,7 @@ PACKAGECONFIG ??=3D " \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.filter('DISTRO_FEATURES', '=
acl audit efi ldconfig=20
>> pam selinux smack usrmerge polkit seccomp', d)} \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES',=
 'wifi', 'rfkill', '', d)} \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES',=
 'x11', 'xkbcommon', '',=20
>> d)} \
>> -=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES', 'systemd',=
=20
>> 'link-udev-shared', '', d)} \
>> +=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit'=
, '',=20
>> 'link-udev-shared', d)} \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 backlight \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 binfmt \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gshadow \
>>
>>
>> which I'll test...
>=20
> Maybe the systemd naming for the option is sub optimal. The=20
> link-udev-shared option create a dependency between udev and systemd=20
> package. It links udev against the libsystemd-shared library. Without i=
t=20
> udev is linked statically against this library. The option should only=20
> be enabled if udev is always used together with systemd.

Sorry, I should read the patch careful.

I we can assume that udev from systemd is only used with sysvinit or=20
systemd, this is okay.

Regards
   Stefan

