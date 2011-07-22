Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qk5vD-0007IS-KL
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jul 2011 04:58:11 +0200
Received: by pzk1 with SMTP id 1so2946014pzk.16
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jul 2011 19:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=5v3V9ypjQywPI4rPpTxxfdT6hK6kfWhaKco08gIjVzQ=;
	b=T0+ACBBXLwvLsdvxHDBfrhBsjaNJSmvUl5xRjL/IsyBhM4mtl+oTdHeVfTi5DOUm+y
	T5df5HaAt8hFFO0+twog/H+GlXWT8c631tTgfBxLo3EeYex1u7zfktIavT3YlkeW1ZE5
	HxKXrMTPC0uyfqEQffRD5+JCJWw18xTpBnpa0=
Received: by 10.68.9.165 with SMTP id a5mr1531857pbb.412.1311303000222; Thu,
	21 Jul 2011 19:50:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.62.36 with HTTP; Thu, 21 Jul 2011 19:49:30 -0700 (PDT)
In-Reply-To: <4E28E363.7070609@windriver.com>
References: <cover.1311234759.git.kai.kang@windriver.com>
	<6cd8526778ee4b4ccd54bbac16dfbd492baa06c3.1311234759.git.kai.kang@windriver.com>
	<0C075F39-31A1-4D44-ADCE-F564EC54EAF9@dominion.thruhere.net>
	<CAMKF1srJx_m0g=cCWeWGaYDynWWqPQ2MtChBu90_43q8SOA9Uw@mail.gmail.com>
	<4E28E363.7070609@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 21 Jul 2011 19:49:30 -0700
Message-ID: <CAMKF1srG7U9508ym_jD-rkoQV_OJ5Ge0Lmd=z0YW-iHgjB9Wqg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 02/10] dropbear: Support PAM
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
X-List-Received-Date: Fri, 22 Jul 2011 02:58:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 21, 2011 at 7:41 PM, Kang Kai <Kai.Kang@windriver.com> wrote:
> On 2011=E5=B9=B407=E6=9C=8822=E6=97=A5 03:10, Khem Raj wrote:
>>
>> On Thu, Jul 21, 2011 at 1:54 AM, Koen Kooi<koen@dominion.thruhere.net>
>> =C2=A0wrote:
>>>
>>> Op 21 jul. 2011, om 10:00 heeft Kang Kai het volgende geschreven:
>>>
>>>> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>>>>
>>>> I make a patch and some changes in dropbear.inc for supporting pam.
>>>> - Enable pam in configure
>>>> - Modify file option.h to open pam supporting
>>>>
>>>> Signed-off-by: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>>>> ---
>>>> meta/recipes-core/dropbear/dropbear.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| =C2=A0 =C2=A06 ++++-
>>>> .../dropbear/dropbear/dropbear-enable-pam.patch =C2=A0 =C2=A0| =C2=A0 =
21
>>>> ++++++++++++++++++++
>>>> 2 files changed, 26 insertions(+), 1 deletions(-)
>>>> create mode 100644
>>>> meta/recipes-core/dropbear/dropbear/dropbear-enable-pam.patch
>>>>
>>>> diff --git a/meta/recipes-core/dropbear/dropbear.inc
>>>> b/meta/recipes-core/dropbear/dropbear.inc
>>>> index 1b51e1a..48cefb6 100644
>>>> --- a/meta/recipes-core/dropbear/dropbear.inc
>>>> +++ b/meta/recipes-core/dropbear/dropbear.inc
>>>> @@ -9,13 +9,15 @@ LIC_FILES_CHKSUM =3D
>>>> "file://LICENSE;md5=3D3a5b0c2f0d0c49dfde9558ae2036683c"
>>>>
>>>> DEPENDS =3D "zlib"
>>>> RPROVIDES =3D "ssh sshd"
>>>> +DEPENDS +=3D "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', ''=
,
>>>> d)}"
>>>>
>>>> SRC_URI =3D
>>>> "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.gz \
>>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://urandom-=
xauth-changes-to-options.h.patch \
>>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://configur=
e.patch \
>>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://fix-2kb-=
keys.patch \
>>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://allow-no=
pw.patch;apply=3Dno \
>>>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://init"
>>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://init \
>>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://dropbear-enab=
le-pam.patch "
>>>>
>>>> inherit autotools update-rc.d
>>>>
>>>> @@ -28,6 +30,8 @@ LD =3D "${CC}"
>>>> SBINCOMMANDS =3D "dropbear dropbearkey dropbearconvert"
>>>> BINCOMMANDS =3D "dbclient ssh scp"
>>>> EXTRA_OEMAKE =3D 'MULTI=3D1 SCPPROGRESS=3D1 PROGRAMS=3D"${SBINCOMMANDS=
}
>>>> ${BINCOMMANDS}"'
>>>> +EXTRA_OECONF +=3D "\
>>>> + =C2=A0 =C2=A0 ${@base_contains('DISTRO_FEATURES', 'pam', '--enable-p=
am',
>>>> '--disable-pam', d)}"
>>>>
>>>> DISTRO_TYPE =3D "${@base_contains("IMAGE_FEATURES", "debug-tweaks",
>>>> "debug", "",d)}"
>>>
>>> That one is missing a PR bump
>>
>> And does this mean that it also needs libpam in DEPENDS ?
>
> Yes, I think so. So add the
>
> +DEPENDS +=3D "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d=
)}"

and to all recipes which are modified

>
>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>>
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


