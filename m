Received: from mail-yh0-f52.google.com ([209.85.213.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UGEy7-000058-K8
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Mar 2013 21:41:47 +0100
Received: by mail-yh0-f52.google.com with SMTP id q46so470808yhf.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Mar 2013 13:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=SLhN7YNQTcLAi6MameiAoFlZ1Ur+ZXNAl/np1cDfhbc=;
	b=CbU/LHKK8g4lCHrb0dWsLXDOrSSU08qig+UnfEH49gGicNYnicL0uhEvVd9kTEMHPJ
	uYZfQ89FWFoZ4WuuAZJ2I0MJfhA+YoQZPVYFuj1/myrJ08B0MBL+ZabIpYfAWRKeYGxA
	cZ2f56uQSkw12klxKv286RrfLmT70yGZnfEnVtBimbjw7Qyw8rkNQX9P5So0SWlVfSHy
	zTtpcO+XnOSUuf+tgtlwmx9x/m/gxKMWG8pKorQXN7jzgKOKr1+N3GaocoRxUzsCkuoi
	6J2gPBYQlOgMnYiGAIXBE+mLGRw7i+HCNFJ8kVDCuhT8722diLTPUa07slT9tFMlWKdZ
	K8MA==
X-Received: by 10.236.144.199 with SMTP id n47mr5251153yhj.23.1363292700558;
	Thu, 14 Mar 2013 13:25:00 -0700 (PDT)
Received: from [172.23.7.5] (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id n2sm6787032yhm.1.2013.03.14.13.24.58
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 14 Mar 2013 13:24:59 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <5142148A.7010009@linaro.org>
Date: Thu, 14 Mar 2013 13:24:58 -0700
Message-Id: <5D166876-A7B9-4F53-A0DC-61DA13087097@gmail.com>
References: <1363282893-19390-1-git-send-email-marcin.juszkiewicz@linaro.org>
	<51421128.6090201@windriver.com> <5142148A.7010009@linaro.org>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
X-Mailer: Apple Mail (2.1499)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Add architecture files for AArch64 architecture.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Mar 2013 20:41:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Mar 14, 2013, at 11:18 AM, Marcin Juszkiewicz =
<marcin.juszkiewicz@linaro.org> wrote:

> W dniu 14.03.2013 19:04, Mark Hatle pisze:
>> I'm not completely familiar with aarch64.  So a couple of questions.=20=

>> The first is is it supposed to allow a multilib configuration?  I.e.
>> being able to run both 32-bit "arm/thumb" code & aarch64 code on the
>> same machine?  If so, a "BASE_LIB_tune-aarch64" should be defined =
with
>> the right value.
>=20
> AArch64 is able to run ARMv7a code but it not something we worry too=20=

> much now as there is no hardware yet so we mostly use OE for porting
> software. There will be no multilib related work done by Linaro in =
near
> time (if at all).
>=20
>> Second are there expected to be tuned variants for the aarch64, i.e.
>> processor/core tunings that need to get embedded into the package =
arch.=20
>> if so the definition of the TUNE_ARCH and TUNE_PKGARCH should =
probably
>> be based on the tune_feature...  (This may simply not be necessary
>> though as this is a new architecture that will expand and grow...)
>=20
> Probably big endian version will arrive sooner or later. Other than =
that
> no extra tuning will be needed (no hardware yet).
>=20
>> My suggestion then, to help with future growth is:
>>=20
>> DEFAULTTUNE ?=3D "aarch64"
>>=20
>> ARMPKGARCH ?=3D "aarch64"
>>=20
>> TUNEVALID[aarch64] =3D "Enable instructions for aarch64"
>> TUNECONFLICTS[aarch64] =3D ""
>> MACHINEOVERRIDES .=3D "${@bb.utils.contains("TUNE_FEATURES", =
"aarch64",
>> ":aarch64", "" ,d)}"
>>=20
>> # Little Endian base configs
>> AVAILTUNES +=3D "aarch64"
>> TUNE_FEATURES_tune-aarch64 ?=3D "aarch64"
>> BASE_LIB_tune-aarch64 =3D "lib64" <-- guess on my part
>=20
> No, we do not use /lib64/ for AArch64.


Thats under discussion I have seen threads and patches on gcc ml and =
glibc ml
about it.

http://gcc.gnu.org/ml/gcc-patches/2013-03/msg00288.html
http://sourceware.org/ml/libc-ports/2013-03/msg00125.html

 I would rather like to have lib64
but I guess multi arch guys will not like it
>=20
>> TUNE_ARCH_tune-aarch64 =3D "aarch64"
>> TUNE_PKGARCH_tune-aarch64 =3D "aarch64"
>> PACKAGE_EXTRA_ARCHS_tune-aarch64 +=3D "aarch64"
>=20
> Thanks, changed and attached new version.
>=20
> =46rom b303dd32eecd2fca3708eef468910f19bb903b3f Mon Sep 17 00:00:00 =
2001
> From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> Date: Thu, 14 Mar 2013 18:41:08 +0100
> Subject: [PATCH] Add architecture files for AArch64 architecture.
>=20
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
> meta/conf/machine/include/aarch64/README           |  9 +++++++++
> meta/conf/machine/include/aarch64/arch-aarch64.inc | 14 ++++++++++++++
> 2 files changed, 23 insertions(+)
> create mode 100644 meta/conf/machine/include/aarch64/README
> create mode 100644 meta/conf/machine/include/aarch64/arch-aarch64.inc
>=20
> diff --git a/meta/conf/machine/include/aarch64/README =
b/meta/conf/machine/include/aarch64/README
> new file mode 100644
> index 0000000..59c8710
> --- /dev/null
> +++ b/meta/conf/machine/include/aarch64/README
> @@ -0,0 +1,9 @@
> +2013-03-14 - Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> + - Initial Revision
> +
> +Currently only little endian is defined for AArch64.
> +
> +AArch64 is 64-bit ARM architecture.
> +
> +Also known as ARMv8 (instruction set) or ARM64 (name in Linux kernel =
and
> +architecture name in Debian and derived).
> diff --git a/meta/conf/machine/include/aarch64/arch-aarch64.inc =
b/meta/conf/machine/include/aarch64/arch-aarch64.inc
> new file mode 100644
> index 0000000..121d339
> --- /dev/null
> +++ b/meta/conf/machine/include/aarch64/arch-aarch64.inc
> @@ -0,0 +1,14 @@
> +DEFAULTTUNE ?=3D "aarch64"
> +
> +ARMPKGARCH ?=3D "aarch64"
> +
> +TUNEVALID[aarch64] =3D "Enable instructions for aarch64"
> +TUNECONFLICTS[aarch64] =3D ""
> +MACHINEOVERRIDES .=3D "${@bb.utils.contains("TUNE_FEATURES", =
"aarch64", ":aarch64", "" ,d)}"
> +
> +# Little Endian base configs
> +AVAILTUNES +=3D "aarch64"
> +TUNE_FEATURES_tune-aarch64 ?=3D "aarch64"
> +TUNE_ARCH_tune-aarch64 =3D "aarch64"
> +TUNE_PKGARCH_tune-aarch64 =3D "aarch64"
> +PACKAGE_EXTRA_ARCHS_tune-aarch64 +=3D "aarch64"
> --=20
> 1.8.1.2
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



