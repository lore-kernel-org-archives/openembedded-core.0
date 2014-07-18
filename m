Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B24B7705A8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jul 2014 13:25:00 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6IDOeI0013419; Fri, 18 Jul 2014 14:24:40 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 0GOLaup7mqGq; Fri, 18 Jul 2014 14:24:39 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6IDOVb9013410
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 18 Jul 2014 14:24:33 +0100
Message-ID: <1405689866.26348.39.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 18 Jul 2014 14:24:26 +0100
In-Reply-To: <1405638947-30399-1-git-send-email-Martin.Jansa@gmail.com>
References: <1405638947-30399-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: Martin Jansa <martin.jansa@lge.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gcc-4.8: backport fix for ICE when building opus
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
X-List-Received-Date: Fri, 18 Jul 2014 13:25:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2014-07-18 at 01:15 +0200, Martin Jansa wrote:
> From: Martin Jansa <martin.jansa@lge.com>
> 
> * backported from 4.8.2, so daisy isn't affected
> 
> Signed-off-by: Martin Jansa <martin.jansa@lge.com>
> ---
>  meta/recipes-devtools/gcc/gcc-4.8.inc              |   1 +
>  .../gcc-4.8/0001-fix-ICE-when-building-opus.patch  | 121 +++++++++++++++++++++
>  2 files changed, 122 insertions(+)
>  create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0001-fix-ICE-when-building-opus.patch

Doesn't apply against master?

Cheers,

Richard

> diff --git a/meta/recipes-devtools/gcc/gcc-4.8.inc b/meta/recipes-devtools/gcc/gcc-4.8.inc
> index f1260af..ac205de 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.8.inc
> +++ b/meta/recipes-devtools/gcc/gcc-4.8.inc
> @@ -79,6 +79,7 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
>  	   file://0047-repomembug.patch \
>  	   file://0048-PR57532.patch \
>  	   file://0048-PR58854_fix_arm_apcs_epilogue.patch \
> +           file://0001-fix-ICE-when-building-opus.patch \
>  	  "
>  SRC_URI[md5sum] = "3b2386c114cd74185aa3754b58a79304"
>  SRC_URI[sha256sum] = "545b44be3ad9f2c4e90e6880f5c9d4f0a8f0e5f67e1ffb0d45da9fa01bb05813"
> diff --git a/meta/recipes-devtools/gcc/gcc-4.8/0001-fix-ICE-when-building-opus.patch b/meta/recipes-devtools/gcc/gcc-4.8/0001-fix-ICE-when-building-opus.patch
> new file mode 100644
> index 0000000..9d3aeaa
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-4.8/0001-fix-ICE-when-building-opus.patch
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
> +http://gcc.1065356.n5.nabble.com/PATCH-ARM-Fix-unrecognizable-vector-comparisons-td947064.html
> +
> +git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-4_8-branch@201620 138bc75d-0d04-0410-961f-82ee72b054a4
> +---
> + gcc/ChangeLog                            |  8 ++++++++
> + gcc/config/arm/neon.md                   | 34 +++++++++++++++++++++++++++-----
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
> +   rtx magic_rtx = GEN_INT (magic_word);
> +   int inverse = 0;
> ++  int use_zero_form = 0;
> +   int swap_bsl_operands = 0;
> +   rtx mask = gen_reg_rtx (<V_cmp_result>mode);
> +   rtx tmp = gen_reg_rtx (<V_cmp_result>mode);
> +@@ -1742,12 +1743,16 @@
> +   switch (GET_CODE (operands[3]))
> +     {
> +     case GE:
> ++    case GT:
> +     case LE:
> ++    case LT:
> +     case EQ:
> +-      if (!REG_P (operands[5])
> +-	  && (operands[5] != CONST0_RTX (<MODE>mode)))
> +-	operands[5] = force_reg (<MODE>mode, operands[5]);
> +-      break;
> ++      if (operands[5] == CONST0_RTX (<MODE>mode))
> ++	{
> ++	  use_zero_form = 1;
> ++	  break;
> ++	}
> ++      /* Fall through.  */
> +     default:
> +       if (!REG_P (operands[5]))
> + 	operands[5] = force_reg (<MODE>mode, operands[5]);
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
> ++	  inverse = 0;
> ++	  switch (GET_CODE (operands[3]))
> ++	    {
> ++	    case LT:
> ++	      base_comparison = gen_neon_vclt<mode>;
> ++	      break;
> ++	    case LE:
> ++	      base_comparison = gen_neon_vcle<mode>;
> ++	      break;
> ++	    default:
> ++	      /* Do nothing, other zero form cases already have the correct
> ++		 base_comparison.  */
> ++	      break;
> ++	    }
> ++	}
> + 
> +       if (!inverse)
> + 	emit_insn (base_comparison (mask, operands[4], operands[5], magic_rtx));
> +diff --git a/gcc/testsuite/gcc.target/arm/lp1189445.c b/gcc/testsuite/gcc.target/arm/lp1189445.c
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
> ++  retval = id;
> ++  for (i = 0; i < id; i++)
> ++    {
> ++      retval &= (data[i] <= 0);
> ++    }
> ++
> ++  return (retval);
> ++}
> +-- 
> +2.0.0
> +
> -- 
> 1.9.1
> 



