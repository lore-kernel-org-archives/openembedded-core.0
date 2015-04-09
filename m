Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id ED453606BF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Apr 2015 06:55:19 +0000 (UTC)
Received: by pdea3 with SMTP id a3so142850259pde.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Apr 2015 23:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=H9/4GRgbBpBCjBXRIJt2Bs8WaVuP4mnLz282JEEN730=;
	b=zUEBM+pUbkz63DzMDDliBBkrvZi8tbGJ6Nvs1MLGsV6ksHREVKeQobahikp3XW1JJ9
	NmK1VghLJNPYlIXx6us6wyRmTDLv3/w31W62TuXlNNv0c53Rk2hln+BJ/5h4UzUbjLA8
	+20l/EVtwgVopCYGRE33xNWGBHSbTvLvvGwOmZiJzU+niB8lgYGwAQdAyXVeLTyM/EMD
	o8PyXp2NLCtaqxgf44e2lmsNjLREThGs8vXndyl9UNLnh5gHtGiOtbubUfbUnc/brGKS
	8dchFhcZ7GjYOMdBM9jup41oI5141F5roZ+gly8Ih6PwmTpXBQTqFCa7UGhr8xRbx6Xe
	RZ8Q==
X-Received: by 10.70.0.11 with SMTP id 11mr53214534pda.32.1428562520239;
	Wed, 08 Apr 2015 23:55:20 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:68c8:2a57:ea69:48da?
	([2601:9:3580:84c:68c8:2a57:ea69:48da])
	by mx.google.com with ESMTPSA id
	gy3sm13126583pbb.42.2015.04.08.23.55.19
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 08 Apr 2015 23:55:19 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <a2991e0a-7cdc-49b4-8247-0caa77d26a8a@BN1BFFO11FD030.protection.gbl>
Date: Wed, 8 Apr 2015 23:55:19 -0700
Message-Id: <D2F1084E-BA28-413B-9723-83418C19E10B@gmail.com>
References: <a2991e0a-7cdc-49b4-8247-0caa77d26a8a@BN1BFFO11FD030.protection.gbl>
To: Nathan Rossi <nathan.rossi@xilinx.com>
X-Mailer: Apple Mail (2.2070.6)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] python: Change python 2.7.9 to use libffi from the system
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
X-List-Received-Date: Thu, 09 Apr 2015 06:55:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Apr 7, 2015, at 10:47 PM, Nathan Rossi <nathan.rossi@xilinx.com> =
wrote:
>=20
> Changes in python 2.7.9 from 2.7.3 cause issues when building the in
> tree libffi for ctypes. These issues primarily affect less common
> platforms (e.g. MicroBlaze) that are supported by libffi but the =
python
> overrides for the in tree libffi are not able to detect correctly.
>=20
> This patch changes the python 2.7.9 recipe to match how the python 3
> recipe handles libffi by configuring the build to use the system
> libffi. This brings consistency between the libffi used for different
> python versions as well as with the system.
>=20
> Signed-off-by: Nathan Rossi <nathan.rossi@xilinx.com>
> ---
> The main reason for this change is that python 2.7.9 builds are broken =
for
> MicroBlaze, when build the ctypes modules it fails to detect the =
'MICROBLAZE'
> platform, despite it being available in the libffi source tree as well =
as
> working correctly with python 2.7.3.
>=20
> |   File "build/temp.linux2-microblazeel-2.7/libffi/fficonfig.py", =
line 33, in <module>
> |     ffi_sources +=3D ffi_platforms['MICROBLAZE']
> | KeyError: 'MICROBLAZE'
> | Makefile:490: recipe for target 'sharedmods' failed
> | make: *** [sharedmods] Error 1
>=20
> It seems that this fficonfig.py file was added for python 2.7.9 and =
does not
> contain the equivalent entries for all of libffi's supported =
platforms.
>=20

this is ok



> Regards,
> Nathan
> ---
> meta/recipes-devtools/python/python_2.7.9.bb |    4 +++-
> 1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-devtools/python/python_2.7.9.bb =
b/meta/recipes-devtools/python/python_2.7.9.bb
> index 0031b8f..7918550 100644
> --- a/meta/recipes-devtools/python/python_2.7.9.bb
> +++ b/meta/recipes-devtools/python/python_2.7.9.bb
> @@ -1,5 +1,5 @@
> require python.inc
> -DEPENDS =3D "python-native bzip2 db gdbm openssl readline sqlite3 =
zlib"
> +DEPENDS =3D "python-native libffi bzip2 db gdbm openssl readline =
sqlite3 zlib"
> PR =3D "${INC_PR}"
>=20
> DISTRO_SRC_URI ?=3D "file://sitecustomize.py"
> @@ -32,6 +32,8 @@ S =3D "${WORKDIR}/Python-${PV}"
>=20
> inherit autotools multilib_header python-dir pythonnative
>=20
> +CONFIGUREOPTS +=3D " --with-system-ffi "
> +
> # The 3 lines below are copied from the libffi recipe, ctypes ships =
its own copy of the libffi sources
> #Somehow gcc doesn't set __SOFTFP__ when passing -mfloatabi=3Dsoftp :(
> TARGET_CC_ARCH_append_armv6 =3D " -D__SOFTFP__"
> --=20
> 1.7.10.4
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


