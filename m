Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id DD7126FE7E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jul 2014 00:16:26 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id hi2so135234wib.17
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 17:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=L/yhWX1grFh0aCvJ0Ws4ncRjjjQ6D6TggI0vE4qM5XM=;
	b=xQ5y97epXOHMxadTtic67iaXXVMKbQEvxoF2nmagL0ghb9GHIAZA+k4Q6CEqg8sZYQ
	S4CfrjjM6ZkOlBwdzUEZMjynqLMTPM2y+UOaOB6i5UWtlC/mzqch9xa47qgmKKXmNEiG
	eSEUq1VkjuG889If1om+d1wu91bvLoasc/ZrpZvLXiciHPwdr4gZFOoP2l+WE7WMZBnt
	pAwVz3Z0i3mSg9DuMBnrxOZgcn8hUYgzIsfLts0qDCs5KDdBX33ZMaxFWQbh8EZWTjcH
	qkEJJJ++yZIoMK0vUUfxGX+q/YrNfu9A1+OeJoS8+A7FHBa3FyPlBkm3BqhY/NXi/hDn
	Stag==
X-Received: by 10.194.92.148 with SMTP id cm20mr17107479wjb.57.1406247387670; 
	Thu, 24 Jul 2014 17:16:27 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ft17sm20216730wjc.14.2014.07.24.17.16.26 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Jul 2014 17:16:26 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 25 Jul 2014 02:16:45 +0200
To: openembedded-core@lists.openembedded.org,
	Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20140725001645.GQ2492@jama>
References: <1405638999-9737-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1405638999-9737-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [dora][PATCHv2] gcc-4.8: backport fix for ICE when building opus
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
X-List-Received-Date: Fri, 25 Jul 2014 00:16:37 -0000
X-Groupsio-MsgNum: 55539
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kbZGpL0ScFxCd8mt"
Content-Disposition: inline

--kbZGpL0ScFxCd8mt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 18, 2014 at 01:16:39AM +0200, Martin Jansa wrote:
> From: Martin Jansa <martin.jansa@lge.com>
>=20
> * backported from 4.8.2, so daisy isn't affected

Robert, any eta on this one? If we cannot expect this to be merged in
dora in next few days, let me know and I'll temporary add it to
=2Ebbappends in our layers.

Regards,

> Signed-off-by: Martin Jansa <martin.jansa@lge.com>
> ---
>  meta/recipes-devtools/gcc/gcc-4.8.inc              |   1 +
>  .../gcc-4.8/0001-fix-ICE-when-building-opus.patch  | 121 +++++++++++++++=
++++++
>  2 files changed, 122 insertions(+)
>  create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0001-fix-ICE-when-b=
uilding-opus.patch
>=20
> diff --git a/meta/recipes-devtools/gcc/gcc-4.8.inc b/meta/recipes-devtool=
s/gcc/gcc-4.8.inc
> index f1260af..ac205de 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.8.inc
> +++ b/meta/recipes-devtools/gcc/gcc-4.8.inc
> @@ -79,6 +79,7 @@ SRC_URI =3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.=
bz2 \
>  	   file://0047-repomembug.patch \
>  	   file://0048-PR57532.patch \
>  	   file://0048-PR58854_fix_arm_apcs_epilogue.patch \
> +           file://0001-fix-ICE-when-building-opus.patch \
>  	  "
>  SRC_URI[md5sum] =3D "3b2386c114cd74185aa3754b58a79304"
>  SRC_URI[sha256sum] =3D "545b44be3ad9f2c4e90e6880f5c9d4f0a8f0e5f67e1ffb0d=
45da9fa01bb05813"
> diff --git a/meta/recipes-devtools/gcc/gcc-4.8/0001-fix-ICE-when-building=
-opus.patch b/meta/recipes-devtools/gcc/gcc-4.8/0001-fix-ICE-when-building-=
opus.patch
> new file mode 100644
> index 0000000..9d3aeaa
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-4.8/0001-fix-ICE-when-building-opus.p=
atch
> @@ -0,0 +1,121 @@
> +From 22228d8ba86c70381f7c34c22ac6994234d0f3e7 Mon Sep 17 00:00:00 2001
> +From: xguo <xguo@138bc75d-0d04-0410-961f-82ee72b054a4>
> +Date: Fri, 9 Aug 2013 06:59:01 +0000
> +Subject: [PATCH] gcc/ChangeLog:
> +
> +        Backport from mainline:
> +        2013-08-09  Zhenqiang Chen  <zhenqiang.chen@linaro.org>
> +
> +        * config/arm/neon.md (vcond): Fix floating-point vector
> +        comparisons against 0.
> +
> +gcc/testsuite/ChangeLog:
> +
> +        Backport from mainline:
> +        2013-08-09  Zhenqiang Chen  <zhenqiang.chen@linaro.org>
> +
> +        * gcc.target/arm/lp1189445.c: New testcase.
> +
> +Upstream-Status: Backport from 4.8.2
> +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> +
> +More details in:
> +http://gcc.1065356.n5.nabble.com/PATCH-ARM-Fix-unrecognizable-vector-com=
parisons-td947064.html
> +
> +git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-4_8-branch@201620=
 138bc75d-0d04-0410-961f-82ee72b054a4
> +---
> + gcc/ChangeLog                            |  8 ++++++++
> + gcc/config/arm/neon.md                   | 34 +++++++++++++++++++++++++=
++-----
> + gcc/testsuite/ChangeLog                  |  7 +++++++
> + gcc/testsuite/gcc.target/arm/lp1189445.c | 18 +++++++++++++++++
> + 4 files changed, 62 insertions(+), 5 deletions(-)
> + create mode 100644 gcc/testsuite/gcc.target/arm/lp1189445.c
> +
> +diff --git a/gcc/config/arm/neon.md b/gcc/config/arm/neon.md
> +index d8d4202..86a5932 100644
> +--- a/gcc/config/arm/neon.md
> ++++ b/gcc/config/arm/neon.md
> +@@ -1732,6 +1732,7 @@
> + 			     ? 3 : 1;
> +   rtx magic_rtx =3D GEN_INT (magic_word);
> +   int inverse =3D 0;
> ++  int use_zero_form =3D 0;
> +   int swap_bsl_operands =3D 0;
> +   rtx mask =3D gen_reg_rtx (<V_cmp_result>mode);
> +   rtx tmp =3D gen_reg_rtx (<V_cmp_result>mode);
> +@@ -1742,12 +1743,16 @@
> +   switch (GET_CODE (operands[3]))
> +     {
> +     case GE:
> ++    case GT:
> +     case LE:
> ++    case LT:
> +     case EQ:
> +-      if (!REG_P (operands[5])
> +-	  && (operands[5] !=3D CONST0_RTX (<MODE>mode)))
> +-	operands[5] =3D force_reg (<MODE>mode, operands[5]);
> +-      break;
> ++      if (operands[5] =3D=3D CONST0_RTX (<MODE>mode))
> ++	{
> ++	  use_zero_form =3D 1;
> ++	  break;
> ++	}
> ++      /* Fall through.  */
> +     default:
> +       if (!REG_P (operands[5]))
> + 	operands[5] =3D force_reg (<MODE>mode, operands[5]);
> +@@ -1798,7 +1803,26 @@
> + 	 a GT b -> a GT b
> + 	 a LE b -> b GE a
> + 	 a LT b -> b GT a
> +-	 a EQ b -> a EQ b  */
> ++	 a EQ b -> a EQ b
> ++	 Note that there also exist direct comparison against 0 forms,
> ++	 so catch those as a special case.  */
> ++      if (use_zero_form)
> ++	{
> ++	  inverse =3D 0;
> ++	  switch (GET_CODE (operands[3]))
> ++	    {
> ++	    case LT:
> ++	      base_comparison =3D gen_neon_vclt<mode>;
> ++	      break;
> ++	    case LE:
> ++	      base_comparison =3D gen_neon_vcle<mode>;
> ++	      break;
> ++	    default:
> ++	      /* Do nothing, other zero form cases already have the correct
> ++		 base_comparison.  */
> ++	      break;
> ++	    }
> ++	}
> +=20
> +       if (!inverse)
> + 	emit_insn (base_comparison (mask, operands[4], operands[5], magic_rtx)=
);
> +diff --git a/gcc/testsuite/gcc.target/arm/lp1189445.c b/gcc/testsuite/gc=
c.target/arm/lp1189445.c
> +new file mode 100644
> +index 0000000..766748e
> +--- /dev/null
> ++++ b/gcc/testsuite/gcc.target/arm/lp1189445.c
> +@@ -0,0 +1,18 @@
> ++/* { dg-do compile } */
> ++/* { dg-require-effective-target arm_neon } */
> ++/* { dg-add-options arm_neon } */
> ++/* { dg-options "-O3" } */
> ++
> ++int id;
> ++int
> ++test (const long int *data)
> ++{
> ++  int i, retval;
> ++  retval =3D id;
> ++  for (i =3D 0; i < id; i++)
> ++    {
> ++      retval &=3D (data[i] <=3D 0);
> ++    }
> ++
> ++  return (retval);
> ++}
> +--=20
> +2.0.0
> +
> --=20
> 2.0.0
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--kbZGpL0ScFxCd8mt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPRoe0ACgkQN1Ujt2V2gBwKgQCeKQk0t79NN8PfBH+M/RJeOip5
QGAAmwXZpuBdXYtbM8eBbQ/Xe3vAJ88f
=f032
-----END PGP SIGNATURE-----

--kbZGpL0ScFxCd8mt--
