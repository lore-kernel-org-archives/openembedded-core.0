Received: from mail-qa0-f54.google.com ([209.85.216.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SAk4f-0003jl-5y
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 16:37:13 +0100
Received: by qao25 with SMTP id 25so435772qao.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2012 08:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=nr+7BrK+4FQq0DesM8AsIa/uXz8S90WbcfiRLng33+w=;
	b=fiuiw50OJihDefFvNPY2ld/O1kwBzuZONSWgg8LM2mUhvUssnxHgMq1q5f+XHiCJjz
	O8CqgwQrHs3Av8Nb+/6BQ8KeFRl8PBxpaiH6nPrxFjJgFaBBNAQOCEhqQn4NpY0YfK78
	wMo2+CHav9hniW5onGv/OHTLEFCFAnI+8lC6KSHAIX1Q+APwvl94C9UfdIoEFJ9s/1RM
	6D+mlEh8vVXStc5N2sg1m5wSfDocrr3YS0H+Nyrcwr7ENBokvYeu5MxV3J+iIbO2DNmJ
	tkiMiaaDYbkE2nlTHTYHvQzCUjaL8yEAV2+nzdsb7YAOmPPZYYaqjv6FO2BC6hoDbJ93
	V3dQ==
Received: by 10.224.32.12 with SMTP id a12mr11332107qad.66.1332430097288; Thu,
	22 Mar 2012 08:28:17 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.103.147 with HTTP; Thu, 22 Mar 2012 08:27:57 -0700 (PDT)
In-Reply-To: <CAEsOVNcFM35wUOMz+mHnCbDnWe1VAoUA-G79Wvco8MYaa=XF3Q@mail.gmail.com>
References: <1332428403-25048-1-git-send-email-kergoth@gmail.com>
	<CABcZANmc2Apcv3WyyX-JN4JV10RLV3_ARCOLq5+x1KSMrJjxPQ@mail.gmail.com>
	<CAEsOVNcFM35wUOMz+mHnCbDnWe1VAoUA-G79Wvco8MYaa=XF3Q@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 22 Mar 2012 08:27:57 -0700
X-Google-Sender-Auth: xW_3mnD6HdzF-sg9RY8V5DxbpEM
Message-ID: <CABcZANkM3zjp48pTU59QUmU2a40O_xnj-x6YMOtFmfSU-UOTbw@mail.gmail.com>
To: McClintock Matthew-B29882 <B29882@freescale.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCH] powerpc: fix overly aggressive TUNE_PKGARCH set
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
X-List-Received-Date: Thu, 22 Mar 2012 15:37:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 22, 2012 at 8:21 AM, McClintock Matthew-B29882
<B29882@freescale.com> wrote:
> On Thu, Mar 22, 2012 at 10:08 AM, Chris Larson <kergoth@gmail.com> wrote:
>> On Thu, Mar 22, 2012 at 8:00 AM, Christopher Larson <kergoth@gmail.com> =
wrote:
>>> From: Christopher Larson <chris_larson@mentor.com>
>>>
>>> There's a problem in arch-powerpc.inc today, wherein it directly sets
>>> TUNE_PKGARCH, rather than setting TUNE_PKGARCH_tune-<tuning>. As a resu=
lt,
>>> more specific tuning files (e.g. ppce500mc) then see their
>>> TUNE_PKGARCH_tune-<tuning> variable definitions no longer obeyed. As
>>> a consequence, the TUNE_PKGARCH ends up as 'powerpc' or 'powerpc-nf' ra=
ther
>>> than 'ppce500mc', which in turn causes a 'TUNE_PKGARCH not in PACKAGE_A=
RCHS'
>>> failure in the build.
>>>
>>> To fix, the .inc now sets TUNE_PKGARCH_tune-powerpc and
>>> TUNE_PKGARCH_tune-powerpc-nf rather than TUNE_PKGARCH.
>>>
>>> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
>>> ---
>>> =C2=A0meta/conf/machine/include/powerpc/arch-powerpc.inc | =C2=A0 =C2=
=A05 +++--
>>> =C2=A01 files changed, 3 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/meta/conf/machine/include/powerpc/arch-powerpc.inc b/meta/=
conf/machine/include/powerpc/arch-powerpc.inc
>>> index c9b2829..f811a3e 100644
>>> --- a/meta/conf/machine/include/powerpc/arch-powerpc.inc
>>> +++ b/meta/conf/machine/include/powerpc/arch-powerpc.inc
>>> @@ -21,13 +21,14 @@ ABIEXTENSION =3D "${@['','spe'][d.getVar('TARGET_FP=
U', True) in ['ppc-efd', 'ppc-e
>>> =C2=A0PPCPKGSFX_FPU =3D "${@bb.utils.contains("TUNE_FEATURES", "fpu-har=
d" , "", "-nf", d)}"
>>>
>>> =C2=A0PPCPKGARCH =3D "${TUNE_ARCH}${PPCPKGSFX_FPU}"
>>> -TUNE_PKGARCH ?=3D "${PPCPKGARCH}"
>>>
>>> =C2=A0# Basic tune definitions
>>> -AVAILTUNES +=3D "powerpc powerpc-nf"
>>> +AVAILTUNES +=3D "powerpc powerpc-nf"
>>> =C2=A0TUNE_FEATURES_tune-powerpc-nf ?=3D "m32 fpu-soft"
>>> +TUNE_PKGARCH_tune-powerpc-nf =3D "${PPCPKGARCH}"
>>> =C2=A0BASE_LIB_tune-powerpc-nf =3D "lib"
>>> =C2=A0PACKAGE_EXTRA_ARCHS_tune-powerpc-nf =3D "powerpc-nf"
>>> =C2=A0TUNE_FEATURES_tune-powerpc ?=3D "m32 fpu-hard"
>>> +TUNE_PKGARCH_tune-powerpc =3D "${PPCPKGARCH}"
>>> =C2=A0BASE_LIB_tune-powerpc =3D "lib"
>>> =C2=A0PACKAGE_EXTRA_ARCHS_tune-powerpc =3D "powerpc
>>
>> Hmm, actually, there's no reason these can't just set
>> TUNE_PKGARCH_tune-powerpc =3D "powerpc", etc rather than using the
>> PPCPKGARCH indirection. Anyone more familiar with the tuning code have
>> an opinion here?
>
> I thought this was already fixed in my patch. Seems like it was not appli=
ed?
>
> -M
>
> commit 216b54e23a995aea79499b88a99f606bb65579af
> Author: Matthew McClintock <msm@freescale.com>
> Date: =C2=A0 Mon Feb 27 10:58:45 2012 -0600
>
> =C2=A0 =C2=A0arch-powerpc.inc: use default value of TUNE_PKGARCH
>
> =C2=A0 =C2=A0We can use the default value for TUNE_PKGARCH, and now we ju=
st
> =C2=A0 =C2=A0append "-nf" if TARGET_FPU is fpu-soft
>
> =C2=A0 =C2=A0Signed-off-by: Matthew McClintock <msm@freescale.com>

Ah, indeed, apparently it was not. That said, it looks like your
version will end up with TUNE_PKGARCH like ppce500mc-nf, is that
correct? You know this stuff better than I do.
--=20
Christopher Larson


