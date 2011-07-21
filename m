Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qjyhu-000663-NA
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 21:14:50 +0200
Received: by pzk1 with SMTP id 1so2449385pzk.16
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jul 2011 12:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=gl63vTSGyEzDc2MjBNEe4dfFnxDHkA2ZZPJwPU4L8yI=;
	b=XapPetmg/MEUQW3lHNNpiNeMdT1xcUUlIkZG1Gin++ecAtJD9aTsOp43sMl7bYHfnP
	4wTeOgRfsvttsHOjKebmZc4lHBDMlFf7Uzg2Rvwu9Xk60yWkhjPqGZSMfSmmkFP1Q2QV
	Qlac4BAY08lwzljZFMoTKWPe64jrCor5z0M4o=
Received: by 10.68.28.1 with SMTP id x1mr889580pbg.77.1311275442093; Thu, 21
	Jul 2011 12:10:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.62.36 with HTTP; Thu, 21 Jul 2011 12:10:12 -0700 (PDT)
In-Reply-To: <0C075F39-31A1-4D44-ADCE-F564EC54EAF9@dominion.thruhere.net>
References: <cover.1311234759.git.kai.kang@windriver.com>
	<6cd8526778ee4b4ccd54bbac16dfbd492baa06c3.1311234759.git.kai.kang@windriver.com>
	<0C075F39-31A1-4D44-ADCE-F564EC54EAF9@dominion.thruhere.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 21 Jul 2011 12:10:12 -0700
Message-ID: <CAMKF1srJx_m0g=cCWeWGaYDynWWqPQ2MtChBu90_43q8SOA9Uw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Scott Garman <scott.a.garman@intel.com>
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
X-List-Received-Date: Thu, 21 Jul 2011 19:14:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 21, 2011 at 1:54 AM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
>
> Op 21 jul. 2011, om 10:00 heeft Kang Kai het volgende geschreven:
>
>> From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
>>
>> I make a patch and some changes in dropbear.inc for supporting pam.
>> - Enable pam in configure
>> - Modify file option.h to open pam supporting
>>
>> Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
>> ---
>> meta/recipes-core/dropbear/dropbear.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 =C2=A06 ++++-
>> .../dropbear/dropbear/dropbear-enable-pam.patch =C2=A0 =C2=A0| =C2=A0 21=
 ++++++++++++++++++++
>> 2 files changed, 26 insertions(+), 1 deletions(-)
>> create mode 100644 meta/recipes-core/dropbear/dropbear/dropbear-enable-p=
am.patch
>>
>> diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core=
/dropbear/dropbear.inc
>> index 1b51e1a..48cefb6 100644
>> --- a/meta/recipes-core/dropbear/dropbear.inc
>> +++ b/meta/recipes-core/dropbear/dropbear.inc
>> @@ -9,13 +9,15 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3a5b0c2f0d0=
c49dfde9558ae2036683c"
>>
>> DEPENDS =3D "zlib"
>> RPROVIDES =3D "ssh sshd"
>> +DEPENDS +=3D "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', =
d)}"
>>
>> SRC_URI =3D "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar=
.gz \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://urandom-xa=
uth-changes-to-options.h.patch \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://configure.=
patch \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://fix-2kb-ke=
ys.patch \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://allow-nopw=
.patch;apply=3Dno \
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://init"
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://init \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://dropbear-enable=
-pam.patch "
>>
>> inherit autotools update-rc.d
>>
>> @@ -28,6 +30,8 @@ LD =3D "${CC}"
>> SBINCOMMANDS =3D "dropbear dropbearkey dropbearconvert"
>> BINCOMMANDS =3D "dbclient ssh scp"
>> EXTRA_OEMAKE =3D 'MULTI=3D1 SCPPROGRESS=3D1 PROGRAMS=3D"${SBINCOMMANDS} =
${BINCOMMANDS}"'
>> +EXTRA_OECONF +=3D "\
>> + =C2=A0 =C2=A0 ${@base_contains('DISTRO_FEATURES', 'pam', '--enable-pam=
', '--disable-pam', d)}"
>>
>> DISTRO_TYPE =3D "${@base_contains("IMAGE_FEATURES", "debug-tweaks", "deb=
ug", "",d)}"
>
> That one is missing a PR bump

And does this mean that it also needs libpam in DEPENDS ?
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


