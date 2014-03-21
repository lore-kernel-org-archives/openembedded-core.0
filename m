Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f176.google.com (mail-ie0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id D05F46FA38
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Mar 2014 17:06:41 +0000 (UTC)
Received: by mail-ie0-f176.google.com with SMTP id rd18so2734689iec.21
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Mar 2014 10:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=BleuPOtxj0W/gfhggZgjkL4Ul0KeihWYN7zG5ma+2tA=;
	b=KgjT1kcoLqfaevaMtz0ritzshYTCLKsdpWo0OkAOsM0PTjvCNN6tJaFD2AYv4f22WL
	IKkt9gr5wHYUlAcypu3S1aywR+R3hcS1GasAelQv8lYlxxF4UJ+qZizuwE+ktxof2UGy
	OMl1fZf+Y7CKK/Dzpnv5Fo8IhIV9idfJq4kvxFtVBHTVzPHz2sNo2CPv27Zq9nVzTMTL
	bM7svep9KuEN1W3T5FLvrwy53GNUWR2N3bQ15GeRofrwHPsXHDTGM1QIYsQf5r9da+rT
	ZFOEQKtKIVDyjFGPKkO04OE3bCSp8ic6jxDF4GWSIqJtgLtxpu+pbdx0vosyc03tu+FF
	Bo8w==
X-Received: by 10.50.49.76 with SMTP id s12mr3941260ign.2.1395421602158; Fri,
	21 Mar 2014 10:06:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.224.136 with HTTP; Fri, 21 Mar 2014 10:06:12 -0700 (PDT)
In-Reply-To: <532C6C96.7020901@windriver.com>
References: <ED3E0BCACD909541BA94A34C4A164D4C5B3A4C94@post.tritech.se>
	<532C6C96.7020901@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 21 Mar 2014 10:06:12 -0700
Message-ID: <CAMKF1sopEU3L-ELyNw9FFMstLtayenJnq-f7W02j1LTX=1A_pA@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: libm accuracy, eglibc compared to glibc -- solved
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
X-List-Received-Date: Fri, 21 Mar 2014 17:06:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 21, 2014 at 9:45 AM, Mark Hatle <mark.hatle@windriver.com> wrot=
e:
> On 3/21/14, 7:10 AM, Mats K=C3=A4rrman wrote:
>>
>> Hi,
>>
>> On: Thursday, March 13, 2014 11:36 AM, Mats K=C3=A4rrman wrote:
>>>
>>> My "home made" hard float tune for PowerPC looks like this:
>>>
>>> ------------------------------------------------------------------
>>> # Tune for the e300c3 core
>>> require conf/machine/include/tune-ppce300c3.inc
>>>
>>> # Use hardware floating point
>>> AVAILTUNES +=3D "ppce300c3hf"
>>> TUNE_FEATURES_tune-ppce300c3hf =3D "m32 fpu-hard ppce300c3"
>>> TUNE_PKGARCH_tune-ppce300c3hf =3D "ppce300c3hf"
>>> PACKAGE_EXTRA_ARCHS_tune-ppce300c3hf =3D
>>> "${PACKAGE_EXTRA_ARCHS_tune-powerpc} ppce300c3hf"
>>> DEFAULTTUNE =3D "ppce300c3hf"
>>> ------------------------------------------------------------------
>>>
>>
>> I found the reason for the error (deviance) in the sqrt function. glibc
>> has
>> special code for PowerPC 603e core (e300 is an optimized variant of 603e=
).
>> By adding the following line to the tuning I now get the same result as
>> for all other environments that I've tried:
>>
>> GLIBC_EXTRA_OECONF +=3D "${@bb.utils.contains("TUNE_FEATURES", "ppce300c=
3",
>> "-with-cpu=3D603e", "", d)}"
>>
>> Does anyone know about the reason for having soft-float as the default a=
nd
>> only available alternative for e300c2/3 tunings?
>
>
> My guess is because e300 e300c2 were both soft-float designs.  And e300c3=
 is
> the first hard float design.
>
> The e300c3 should inherit and use the 603e directly.  This includes
> definiting the TUNE_FEATURES that the 603e does.  If it doesn't do that, =
I'd
> suggest it's a mistake.
>
> The default 603e tune should include:
>
> GLIBC_EXTRA_OECONF +=3D "${@bb.utils.contains("TUNE_FEATURES", "ppc603e",
> "-with-cpu=3D603e", "", d)}"
>
> or similar already -- and should already be hard float enabled.  (ppc603e
> soft-float should be the alternative -- as it is significantly rarer and =
the
> deviation.)


alternatively we should define fpu Iplies in glibc for e300c3,

>
>
>> Would it be worthwhile to send a patch to add the hf tuning to OE-core?
>
>
> As the e300c3 should be hard float, we shouldn't have the 'hf' designatio=
n.
> Otherwise, we should ensure the e300c3 tune is correctly configured.

may be for now controlling it in tune file is a quicker fix.

>
>
>> In that case what tests should be performed before that and what (relate=
d)
>> tests are performed by the OE auto-builder?
>>
>> BR // Mats
>>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

