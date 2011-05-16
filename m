Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QLzes-0007Do-UQ
	for openembedded-core@lists.openembedded.org;
	Mon, 16 May 2011 17:24:35 +0200
Received: by wwb17 with SMTP id 17so4358345wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2011 08:21:42 -0700 (PDT)
Received: by 10.227.197.201 with SMTP id el9mr4427044wbb.22.1305559302461;
	Mon, 16 May 2011 08:21:42 -0700 (PDT)
Received: from [172.20.2.72] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id w12sm3205776wby.58.2011.05.16.08.21.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 May 2011 08:21:41 -0700 (PDT)
References: <cover.1305422996.git.sgw@linux.intel.com>
	<212bfaaefe0979c155069b6d3a0d42205a398a67.1305422996.git.sgw@linux.intel.com>
	<1305557051.3424.88.camel@rex>
In-Reply-To: <1305557051.3424.88.camel@rex>
Mime-Version: 1.0 (iPhone Mail 8J2)
Message-Id: <5542601C-464E-4D1B-9D8F-2A25EA8CA532@dominion.thruhere.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: iPhone Mail (8J2)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 16 May 2011 17:21:33 +0200
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 11/15] gcc-common.inc: Consider hardfp knob for configuring toolchain
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
X-List-Received-Date: Mon, 16 May 2011 15:24:35 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

both softp and hardfp use the actual hardware fpu, but have different callin=
g conventions and are incompatible. So you need vars.

Op 16 mei 2011 om 16:44 heeft Richard Purdie <richard.purdie@linuxfoundation=
.org> het volgende geschreven:

> Hi Khem,
>=20
> I've a concern about ending up with several different variables all
> doing the same thing. Why do we need both TARGET_FPU and ARM_FP_ABI?
> Couldn't we just have values or "hard, sort or empty" for TARGET_FPU?
>=20
> Cheers,
>=20
> Richard
>=20
> On Sat, 2011-05-14 at 18:32 -0700, Saul Wold wrote:
>> From: Khem Raj <raj.khem@gmail.com>
>>=20
>> pass --with-float=3Dhard|soft depending upon ARM_FP_ABI settings
>>=20
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> meta/recipes-devtools/gcc/gcc-common.inc |   13 ++++++++++---
>> 1 files changed, 10 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devt=
ools/gcc/gcc-common.inc
>> index a3fa234..8b7c3ad 100644
>> --- a/meta/recipes-devtools/gcc/gcc-common.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-common.inc
>> @@ -8,10 +8,17 @@ NATIVEDEPS =3D ""
>> inherit autotools gettext
>>=20
>> FILESDIR =3D "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/gcc-${PV}"
>> -
>> def get_gcc_fpu_setting(bb, d):
>> -    if bb.data.getVar('TARGET_FPU', d, 1) in [ 'soft' ]:
>> -        return "--with-float=3Dsoft"
>> +    if bb.data.getVar('TARGET_FPU', d, True) in [ 'soft', 'hard'] and bb=
.data.getVar('TARGET_OS', d, True).find('linux') >=3D 0 :
>> +        # ARM_FP_ABI could be either 'hardfp' or 'softfp'
>> +        arm_fpabi =3D bb.data.getVar('ARM_FP_ABI', d, True) or ""
>> +        if arm_fpabi !=3D "":
>> +            if arm_fpabi  =3D=3D "hardfp":
>> +                # reset it to whatever gcc --with-float configure expect=
s which is either 'softfp' or 'hard'
>> +                arm_fpabi =3D "hard"
>> +            return "--with-float=3D" + arm_fpabi
>> +        else:
>> +            return "--with-float=3D" + bb.data.getVar('TARGET_FPU', d, T=
rue)
>>     return ""
>>=20
>> def get_gcc_mips_plt_setting(bb, d):
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


