Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f174.google.com (unknown [209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 0CA3E6FB98
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 20:00:40 +0000 (UTC)
Received: by mail-ie0-f174.google.com with SMTP id lx4so10482490iec.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 13:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=syu4Nybgr7lvzkK1/Rjd36e68TTTh9M6VGwr0WtZ0Nc=;
	b=V3YK2gmawBIxu8M3j/YUDEqmFyAhbbwcgwOAasHKRYdS2z/VquYgotBxkjwrzi1w30
	2B2PZ9+/q7seVZhN1VePRm/NiwCGNA3cfNmVD9RyKTaEF+qJkDuptAngvL/vbw4rQRG5
	zEgDNlCbEhGcppPfPPqpEY9FDiWygH96R0GfkHe442Ah6mjsAZC8LKSonRI51P+EO1BJ
	ET1orqh1bB9vCWb4ADuQQyxh0PsCPCH2L31FkJyWMxNVpjhvKNaixtfF/Ror4tsJe4WY
	rpIQ8FPpWwsxcvEDy+5aw6k/A7KJtP4NdHS9NQJKEFqZGBXSIzZXM1ZJnG1RgnjeZRgP
	C8WQ==
X-Received: by 10.50.43.136 with SMTP id w8mr4483173igl.20.1401307241811; Wed,
	28 May 2014 13:00:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.117.33 with HTTP; Wed, 28 May 2014 13:00:11 -0700 (PDT)
In-Reply-To: <CAMKF1soGxNSaJicQ+B5C13cMT3NqUE+-AZ_ZBr5yUGzLk9fQpg@mail.gmail.com>
References: <1401283484-28186-1-git-send-email-alexandru.sardan@freescale.com>
	<CAMKF1soGxNSaJicQ+B5C13cMT3NqUE+-AZ_ZBr5yUGzLk9fQpg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 28 May 2014 13:00:11 -0700
Message-ID: <CAMKF1spgZA9c1d5WO=Ldkt_BEVPA5Ux_XQnSouF2VLnFmQZ7Pw@mail.gmail.com>
To: Alexandru-Cezar Sardan <alexandru.sardan@freescale.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc: add patch to fix errors with Decimal64 type
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
X-List-Received-Date: Wed, 28 May 2014 20:00:41 -0000
Content-Type: text/plain; charset=UTF-8

Saul

can you cherry-pick
http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/gcc-4.9&id=c5f8c01c48afebc8a9987dc09f87e37520b94e25
along with this one now

On Wed, May 28, 2014 at 12:58 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Wed, May 28, 2014 at 6:24 AM, Alexandru-Cezar Sardan
> <alexandru.sardan@freescale.com> wrote:
>> [OE-core bug #6270] - https://bugzilla.yoctoproject.org/show_bug.cgi?id=6270
>>
>
> This looks good.
>
>> Signed-off-by: Alexandru-Cezar Sardan <alexandru.sardan@freescale.com>
>> ---
>>  meta/recipes-devtools/gcc/gcc-4.9.inc              |    1 +
>>  ...-E500-SPE-errors-with-the-_Decimal64-type.patch |   98 ++++++++++++++++++++
>>  2 files changed, 99 insertions(+)
>>  create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0052-Fix-GCC-targeting-E500-SPE-errors-with-the-_Decimal64-type.patch
>>
>> diff --git a/meta/recipes-devtools/gcc/gcc-4.9.inc b/meta/recipes-devtools/gcc/gcc-4.9.inc
>> index a409430..9b4fc2c 100644
>> --- a/meta/recipes-devtools/gcc/gcc-4.9.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-4.9.inc
>> @@ -65,6 +65,7 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
>>            file://0049-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch \
>>            file://0050-Revert-Use-dbx_reg_number-for-spanning-registers.patch \
>>             file://0051-eabispe.patch \
>> +           file://0052-Fix-GCC-targeting-E500-SPE-errors-with-the-_Decimal64-type.patch \
>>           "
>>  SRC_URI[md5sum] = "9709b49ae0e904cbb0a6a1b62853b556"
>>  SRC_URI[sha256sum] = "b9b047a97bade9c1c89970bc8e211ff57b7b8998a1730a80a653d329f8ed1257"
>> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0052-Fix-GCC-targeting-E500-SPE-errors-with-the-_Decimal64-type.patch b/meta/recipes-devtools/gcc/gcc-4.9/0052-Fix-GCC-targeting-E500-SPE-errors-with-the-_Decimal64-type.patch
>> new file mode 100644
>> index 0000000..ccfea9d
>> --- /dev/null
>> +++ b/meta/recipes-devtools/gcc/gcc-4.9/0052-Fix-GCC-targeting-E500-SPE-errors-with-the-_Decimal64-type.patch
>> @@ -0,0 +1,98 @@
>> +From e44a6d438db4848c2a555be773568a3cf7994206 Mon Sep 17 00:00:00 2001
>> +From: Alexandru-Cezar Sardan <alexandru.sardan@freescale.com>
>> +Date: Mon, 26 May 2014 12:11:13 +0300
>> +Subject: [PATCH] Fix E500 with SPE errors with the _Decimal64 type
>> +
>> +[gcc]
>> +2014-04-21 Michael Meissner  <meissner@linux.vnet.ibm.com>
>> +
>> +       PR target/60735
>> +       * config/rs6000/rs6000.md (mov<mode>_softfloat32, FMOVE64 case):
>> +       If mode is DDmode and TARGET_E500_DOUBLE allow move.
>> +
>> +       * config/rs6000/rs6000.c (rs6000_debug_reg_global): Print some
>> +       more debug information for E500 if -mdebug=reg.
>> +
>> +[gcc/testsuite]
>> +2014-04-21  Michael Meissner  <meissner@linux.vnet.ibm.com>
>> +
>> +       PR target/60735
>> +       * gcc.target/powerpc/pr60735.c: New test.  Insure _Decimal64 does
>> +       not cause errors if -mspe.
>> +
>> +Upstream status: Accepted
>> +
>> +This solves upstream bug 60735
>> +(https://gcc.gnu.org/bugzilla/show_bug.cgi?id=60735).
>> +
>> +Patch taken from https://gcc.gnu.org/viewcvs/gcc?view=revision&revision=209664
>> +---
>> + gcc/config/rs6000/rs6000.c                 |   18 ++++++++++++++++++
>> + gcc/config/rs6000/rs6000.md                |    3 ++-
>> + gcc/testsuite/gcc.target/powerpc/pr60735.c |   11 +++++++++++
>> + 3 files changed, 31 insertions(+), 1 deletion(-)
>> + create mode 100644 gcc/testsuite/gcc.target/powerpc/pr60735.c
>> +
>> +diff --git a/gcc/config/rs6000/rs6000.c b/gcc/config/rs6000/rs6000.c
>> +index 494efc5..6dcf440 100644
>> +--- a/gcc/config/rs6000/rs6000.c
>> ++++ b/gcc/config/rs6000/rs6000.c
>> +@@ -2283,6 +2283,24 @@ rs6000_debug_reg_global (void)
>> +   if (rs6000_float_gprs)
>> +     fprintf (stderr, DEBUG_FMT_S, "float_gprs", "true");
>> +
>> ++  fprintf (stderr, DEBUG_FMT_S, "fprs",
>> ++         (TARGET_FPRS ? "true" : "false"));
>> ++
>> ++  fprintf (stderr, DEBUG_FMT_S, "single_float",
>> ++         (TARGET_SINGLE_FLOAT ? "true" : "false"));
>> ++
>> ++  fprintf (stderr, DEBUG_FMT_S, "double_float",
>> ++         (TARGET_DOUBLE_FLOAT ? "true" : "false"));
>> ++
>> ++  fprintf (stderr, DEBUG_FMT_S, "soft_float",
>> ++         (TARGET_SOFT_FLOAT ? "true" : "false"));
>> ++
>> ++  fprintf (stderr, DEBUG_FMT_S, "e500_single",
>> ++         (TARGET_E500_SINGLE ? "true" : "false"));
>> ++
>> ++  fprintf (stderr, DEBUG_FMT_S, "e500_double",
>> ++         (TARGET_E500_DOUBLE ? "true" : "false"));
>> ++
>> +   if (TARGET_LINK_STACK)
>> +     fprintf (stderr, DEBUG_FMT_S, "link_stack", "true");
>> +
>> +diff --git a/gcc/config/rs6000/rs6000.md b/gcc/config/rs6000/rs6000.md
>> +index 64c9e7c..9cefe15 100644
>> +--- a/gcc/config/rs6000/rs6000.md
>> ++++ b/gcc/config/rs6000/rs6000.md
>> +@@ -9395,7 +9395,8 @@
>> +       (match_operand:FMOVE64 1 "input_operand" "r,Y,r,G,H,F"))]
>> +   "! TARGET_POWERPC64
>> +    && ((TARGET_FPRS && TARGET_SINGLE_FLOAT)
>> +-       || TARGET_SOFT_FLOAT || TARGET_E500_SINGLE)
>> ++       || TARGET_SOFT_FLOAT || TARGET_E500_SINGLE
>> ++       || (<MODE>mode == DDmode && TARGET_E500_DOUBLE))
>> +    && (gpc_reg_operand (operands[0], <MODE>mode)
>> +        || gpc_reg_operand (operands[1], <MODE>mode))"
>> +   "#"
>> +diff --git a/gcc/testsuite/gcc.target/powerpc/pr60735.c b/gcc/testsuite/gcc.target/powerpc/pr60735.c
>> +new file mode 100644
>> +index 0000000..9bac30b
>> +--- /dev/null
>> ++++ b/gcc/testsuite/gcc.target/powerpc/pr60735.c
>> +@@ -0,0 +1,11 @@
>> ++/* { dg-do compile } */
>> ++/* { dg-options "-mcpu=8548 -mspe -mabi=spe -O2" } */
>> ++/* { dg-skip-if "not an SPE target" { ! powerpc_spe_nocache } { "*" } { "" } } */
>> ++
>> ++/* In PR60735, the type _Decimal64 generated an insn not found message.  */
>> ++
>> ++void
>> ++pr60735 (_Decimal64 *p, _Decimal64 *q)
>> ++{
>> ++  *p = *q;
>> ++}
>> +--
>> +1.7.9.5
>> +
>> --
>> 1.7.9.5
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

