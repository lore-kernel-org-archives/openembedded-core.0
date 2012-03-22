Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SAjla-0003D3-NS
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 16:17:30 +0100
Received: by wibhm17 with SMTP id hm17so748839wib.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2012 08:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=WN1Q4V2SQzl35woKJHsVG5rSglMMKCbwUEc3rs5JZgc=;
	b=dpgS1bA2KkQtGurUb/CjMHwjyt/Ci1tbI31uH24g3Z046AGVodOJbProZZPDVk0BDZ
	YW/O9Bjky2qrYWcP3k65x9mlDjFFpU0H4MqkxqyEYjQej6iQtlY3TvYsS0D2VeCAWZzc
	PslxMMzRHG6bkgXharyZe7bBZsdud78Cp1kolwuRe95CQdoU8B63sktMmZhnI5wfgPhi
	LQO0CdNEMD/AirWwMQl8jdfcBva/i2Osy51ssJk63qiv/R8fP0VOOUWR/hnsAxeQRRXs
	RTwgUNuo35xRX/GHoEAcbIHnyAz1lblqcY2e1ZT3djW+g0ImosGuWj/TrKKqJrvOlCHG
	1OfQ==
Received: by 10.224.32.12 with SMTP id a12mr11231411qad.66.1332428915316; Thu,
	22 Mar 2012 08:08:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.103.147 with HTTP; Thu, 22 Mar 2012 08:08:15 -0700 (PDT)
In-Reply-To: <1332428403-25048-1-git-send-email-kergoth@gmail.com>
References: <1332428403-25048-1-git-send-email-kergoth@gmail.com>
From: Chris Larson <kergoth@gmail.com>
Date: Thu, 22 Mar 2012 08:08:15 -0700
Message-ID: <CABcZANmc2Apcv3WyyX-JN4JV10RLV3_ARCOLq5+x1KSMrJjxPQ@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Thu, 22 Mar 2012 15:17:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 22, 2012 at 8:00 AM, Christopher Larson <kergoth@gmail.com> wro=
te:
> From: Christopher Larson <chris_larson@mentor.com>
>
> There's a problem in arch-powerpc.inc today, wherein it directly sets
> TUNE_PKGARCH, rather than setting TUNE_PKGARCH_tune-<tuning>. As a result=
,
> more specific tuning files (e.g. ppce500mc) then see their
> TUNE_PKGARCH_tune-<tuning> variable definitions no longer obeyed. As
> a consequence, the TUNE_PKGARCH ends up as 'powerpc' or 'powerpc-nf' rath=
er
> than 'ppce500mc', which in turn causes a 'TUNE_PKGARCH not in PACKAGE_ARC=
HS'
> failure in the build.
>
> To fix, the .inc now sets TUNE_PKGARCH_tune-powerpc and
> TUNE_PKGARCH_tune-powerpc-nf rather than TUNE_PKGARCH.
>
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> ---
> =C2=A0meta/conf/machine/include/powerpc/arch-powerpc.inc | =C2=A0 =C2=A05=
 +++--
> =C2=A01 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta/conf/machine/include/powerpc/arch-powerpc.inc b/meta/co=
nf/machine/include/powerpc/arch-powerpc.inc
> index c9b2829..f811a3e 100644
> --- a/meta/conf/machine/include/powerpc/arch-powerpc.inc
> +++ b/meta/conf/machine/include/powerpc/arch-powerpc.inc
> @@ -21,13 +21,14 @@ ABIEXTENSION =3D "${@['','spe'][d.getVar('TARGET_FPU'=
, True) in ['ppc-efd', 'ppc-e
> =C2=A0PPCPKGSFX_FPU =3D "${@bb.utils.contains("TUNE_FEATURES", "fpu-hard"=
 , "", "-nf", d)}"
>
> =C2=A0PPCPKGARCH =3D "${TUNE_ARCH}${PPCPKGSFX_FPU}"
> -TUNE_PKGARCH ?=3D "${PPCPKGARCH}"
>
> =C2=A0# Basic tune definitions
> -AVAILTUNES +=3D "powerpc powerpc-nf"
> +AVAILTUNES +=3D "powerpc powerpc-nf"
> =C2=A0TUNE_FEATURES_tune-powerpc-nf ?=3D "m32 fpu-soft"
> +TUNE_PKGARCH_tune-powerpc-nf =3D "${PPCPKGARCH}"
> =C2=A0BASE_LIB_tune-powerpc-nf =3D "lib"
> =C2=A0PACKAGE_EXTRA_ARCHS_tune-powerpc-nf =3D "powerpc-nf"
> =C2=A0TUNE_FEATURES_tune-powerpc ?=3D "m32 fpu-hard"
> +TUNE_PKGARCH_tune-powerpc =3D "${PPCPKGARCH}"
> =C2=A0BASE_LIB_tune-powerpc =3D "lib"
> =C2=A0PACKAGE_EXTRA_ARCHS_tune-powerpc =3D "powerpc

Hmm, actually, there's no reason these can't just set
TUNE_PKGARCH_tune-powerpc =3D "powerpc", etc rather than using the
PPCPKGARCH indirection. Anyone more familiar with the tuning code have
an opinion here?
--=20
Christopher Larson


