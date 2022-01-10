Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D20D6C433EF
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 12:39:50 +0000 (UTC)
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by mx.groups.io with SMTP id smtpd.web10.30982.1641818389535879088
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 04:39:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm3 header.b=GPBJMABh;
 spf=pass (domain: gherzan.com, ip: 64.147.123.25,
 mailfrom: andrei@gherzan.com)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id D3CF63201DB9;
	Mon, 10 Jan 2022 07:39:48 -0500 (EST)
Received: from imap41 ([10.202.2.91])
  by compute4.internal (MEProxy); Mon, 10 Jan 2022 07:39:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	mime-version:message-id:in-reply-to:references:date:from:to:cc
	:subject:content-type; s=fm3; bh=hC2O/QNIl5TWupIQUJl0awgPiYdMga6
	D6EzzPh2hN/8=; b=GPBJMABhhxAfEcatSXNt61MBJS1m6CU3rkv+bYnXaMUyMtt
	980LQo3XYpYoQmxmID9dCu8DupEBuBY8PcKn6/5wqImqIFWokO7dmRuXVWf5C/nk
	kDv1N2gXLu2MIMDyTo9VllEsl2QqGByZ/vWQukguFzn7P4jJgnGxP4RUkws5xX5q
	4aXu04ozrxEpB60wzaNy6MOBrc2akG0bZVk5FLDMJ+LfFPywDqW+46NrhXJB+Lz6
	jG3/bajj9SBHj0LLYwoWFq/dahhU9rcfnLLuN1LQdYhd9qFGlTMOPMrOnSkJyDsI
	/Yw1sukYfC35f2vsb4Hs/KZE1+QIHDqNDXDOCAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=hC2O/Q
	NIl5TWupIQUJl0awgPiYdMga6D6EzzPh2hN/8=; b=CMrNSTzAWVvnLiq9uWC+Lx
	tB3f/Dc2gNGlsLq95se5/kph9yEXhi6ISB18a+yItDlI5jlc6+9T1Q+2dz0b4/ML
	JctnB9JhkKfZTPpLukg3/ht9AbwS2EcNNsj950oc/mCaeSBt5NWRR1y2ClIa56rK
	1BtvXraxApzwww0UEfSlWSGs3HONtwjVVBlyUjG/a/Rrbgg1LqAUa+aTLQScpTGX
	xx8fFIC9l56ffggThI4M3eh3xaCeFhcxXUYBDD8D2LQh+qLRWPJURMeDoXStiN2y
	1Q9cUHshTEOdtLHWXXA9J1kZNtNAbC3snpCysvdFVvkZmbTSGfxbtFqYOV2qSmPw
	==
X-ME-Sender: <xms:FCncYS-dEsFBU4HC20fg4Icc1SplCSpJC963mzkveahHt5kCGI4E9A>
    <xme:FCncYStDb9-1g8AcjNf4N0nhv169kAtgwA0Xu1R2A3a3OvyZLwMWIbxBe5lUsVVvK
    gDDISqN-qn0l149f88>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvuddrudehuddgudekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsehttd
    ertderredtnecuhfhrohhmpedftehnughrvghiucfihhgvrhiirghnfdcuoegrnhgurhgv
    ihesghhhvghriigrnhdrtghomheqnecuggftrfgrthhtvghrnhepfeetgeduleehtdeive
    duledugeetgeeggfeltdekleehtddvveefleeuteevheegnecuffhomhgrihhnpehpvghr
    lhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpegrnhgurhgvihesghhhvghriigrnhdrtghomh
X-ME-Proxy: <xmx:FCncYYCTvEW_O0BeRCIoWm16rAAYK0PZqkhlPy7rUUo3_XXXF7an5g>
    <xmx:FCncYac5s1ymFRFA6R1xptPnaZoC9ITRiP7Cu-_9fwdCRJbNx-gn9g>
    <xmx:FCncYXNaU7I11NtaQRXtlWgovzOpz8T2o86cTqhllMdi7TRnx79p5Q>
    <xmx:FCncYWaQCsK1bj_ncQ65ephwwtIWbs8gM4Zq4-KqQnhZHG0X64jNaw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 1E2D63C0146; Mon, 10 Jan 2022 07:39:48 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4527-g032417b6d6-fm-20220109.002-g032417b6
Mime-Version: 1.0
Message-Id: <b44541ed-2bb1-485d-99d3-e6ab1fe61664@www.fastmail.com>
In-Reply-To: <20220106201234.159792-1-saul.wold@windriver.com>
References: <20220106201234.159792-1-saul.wold@windriver.com>
Date: Mon, 10 Jan 2022 12:39:28 +0000
From: "Andrei Gherzan" <andrei@gherzan.com>
To: openembedded <openembedded-core@lists.openembedded.org>
Cc: bero@lindev.ch
Subject: Re: [OE-core] [PATCH v2] perl: Enable threading
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jan 2022 12:39:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160346

Hi,

On Thu, 6 Jan 2022, at 20:12, Saul Wold wrote:
> From: Saul Wold <Saul.Wold@windriver.com>
>
> When the tranisiton to perl-cross occured, the threading define
> seems to have been missed.  The perl tests for threading where
> simply skipped, so there was no direct failures.  This was verified
> by running perl ptest before and after the change to see PASS vs SKIP
> results of threaded related tests.
>
> NOTE: Perl officially discourges the use of threads, so this
> functionality maybe depercated in the future [0][1]
>
> v2: adds the usethreads to native and nativesdk. This was tested by
> builing postresql and rrdtool which use perl and automake.
>
> [0] https://perldoc.perl.org/5.34.0-RC2/threads#WARNING
> [1] https://perldoc.perl.org/perlpolicy#discouraged
>
> Signed-off-by: Saul Wold <saul.wold@windriver.com>
> ---
>  meta/recipes-devtools/perl/perl_5.34.0.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-devtools/perl/perl_5.34.0.bb 
> b/meta/recipes-devtools/perl/perl_5.34.0.bb
> index a6ae80f07e1..e4bcfe3ce69 100644
> --- a/meta/recipes-devtools/perl/perl_5.34.0.bb
> +++ b/meta/recipes-devtools/perl/perl_5.34.0.bb
> @@ -53,6 +53,7 @@ do_configure:class-target() {
>      ./configure --prefix=${prefix} --libdir=${libdir} \
>      --target=${TARGET_SYS} \
>      -Duseshrplib \
> +    -Dusethreads \
>      -Dsoname=libperl.so.5 \
>      -Dvendorprefix=${prefix} \
>      -Darchlibexp=${STAGING_LIBDIR}/perl5/${PV}/${TARGET_ARCH}-linux \
> @@ -80,6 +81,7 @@ do_configure:class-nativesdk() {
>      ./configure --prefix=${prefix} \
>      --target=${TARGET_SYS} \
>      -Duseshrplib \
> +    -Dusethreads \
>      -Dsoname=libperl.so.5 \
>      -Dvendorprefix=${prefix} \
>      -Darchlibexp=${STAGING_LIBDIR}/perl5/${PV}/${TARGET_ARCH}-linux \
> @@ -94,6 +96,7 @@ do_configure:class-native() {
>      ./configure --prefix=${prefix} \
>      -Dbin=${bindir}/perl-native \
>      -Duseshrplib \
> +    -Dusethreads \
>      -Dsoname=libperl.so.5 \
>      -Dvendorprefix=${prefix} \
>      -Ui_xlocale \

This patch seems to break perl-native with musl:

| /[...]/tmp/hosttools/ld: perlmini.c:(.text+0x8298): undefined reference to `PL_perldb'
| /[...]/tmp/hosttools/ld: perlmini.c:(.text+0x82a4): undefined reference to `PL_DBsingle'
| /[...]/tmp/hosttools/ld: perlmini.c:(.text+0x82b1): undefined reference to `PL_DBcontrol'
| /[...]/tmp/hosttools/ld: perlmini.c:(.text+0x82bf): undefined reference to `PL_initav'
| /[...]/tmp/hosttools/ld: perlmini.c:(.text+0x82d2): undefined reference to `PL_phase'
| /[...]/tmp/hosttools/ld: perlmini.o: in function `Perl_my_failure_exit':
| perlmini.c:(.text+0x831d): undefined reference to `PL_statusvalue'
| /[...]/tmp/hosttools/ld: perlmini.c:(.text+0x8336): undefined reference to `PL_exit_flags'
| /[...]/tmp/hosttools/ld: perlmini.o: in function `Perl_xs_boot_epilog':
| perlmini.c:(.text+0x83a7): undefined reference to `PL_unitcheckav'
| /[...]/tmp/hosttools/ld: perlmini.c:(.text+0x83b9): undefined reference to `PL_scopestack_ix'
| /[...]/tmp/hosttools/ld: perlmini.c:(.text+0x83c7): undefined reference to `PL_stack_base'
| /[...]/tmp/hosttools/ld: perlmini.c:(.text+0x83ce): undefined reference to `PL_sv_immortals'
| /[...]/tmp/hosttools/ld: perlmini.c:(.text+0x83e6): undefined reference to `PL_stack_sp'
| collect2: error: ld returned 1 exit status
| make[1]: *** [Makefile:99: miniperl] Error 1
| make[1]: Leaving directory '/[...]/tmp/work/x86_64-linux/perl-native/5.34.0-r0/perl-5.34.0'
| make: *** [Makefile:79: all] Error 2
| ERROR: oe_runmake failed
| WARNING: /[...]/work/x86_64-linux/perl-native/5.34.0-r0/temp/run.do_compile.685819:191 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
|       #1: bbfatal_log, /[...]/tmp/work/x86_64-linux/perl-native/5.34.0-r0/temp/run.do_compile.685819, line 191
|       #2: die, /[...]/tmp/work/x86_64-linux/perl-native/5.34.0-r0/temp/run.do_compile.685819, line 175
|       #3: oe_runmake, /[...]/tmp/work/x86_64-linux/perl-native/5.34.0-r0/temp/run.do_compile.685819, line 170
|       #4: do_compile, /[...]/tmp/work/x86_64-linux/perl-native/5.34.0-r0/temp/run.do_compile.685819, line 148
|       #5: main, /[...]/work/x86_64-linux/perl-native/5.34.0-r0/temp/run.do_compile.685819, line 195

Andrei

