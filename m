Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B06FFC98338
	for <webhook@archiver.kernel.org>; Sat, 26 Sep 2026 14:05:29 +0000 (UTC)
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19582.1790431526939599008
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Sep 2026 07:05:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=Q7fqUrXt;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=H5W6NLJR;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.147, mailfrom: paul@pbarker.dev)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 26C5A1D00046;
	Sat, 26 Sep 2026 10:05:26 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Sat, 26 Sep 2026 10:05:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1790431526;
	 x=1790517926; bh=5WJg2Xj1cYg8qjPZZjVCpGJcQTpXNGqlCweP/IRM9no=; b=
	Q7fqUrXta6mRkpeDGBZls+/m/8hjHWQEX6QX84qZ4QxVfUBClqOSK5IAqBlQ214v
	s2IlfPA+yvmTHdMfn5nnHg4JgTXMv1cw6JtLInVH+mTvmHGZSIs7V+Y++oRchxZB
	xAcvubo0w488/3T457l9ZY1lavx9S6J3zNWh0xbTDz1yFiwQYlRK0d3CfespNxvq
	YLgARRdtD30RGpk1/ml+QHcIgiOqXCjFSAyS7OnyDjrqx1noqRwtZy6veMUNaeel
	E340L0En43sbAZ+YGrm3q9Bt2YsH198dFv7Nc2vDRLH3dtUlM23UTBMjpSOij37k
	PQLa+MgAC/iaWUz2RZl76w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1790431526; x=1790517926; bh=5
	WJg2Xj1cYg8qjPZZjVCpGJcQTpXNGqlCweP/IRM9no=; b=H5W6NLJRn02L2Z+Eb
	9TGMXhnp0/CMnJB49bToyjUim58usdMRRqZM3PX7KtdBi6kr9+EaYeT0MNFtADDZ
	v7x/uOLLtMNH1zxLAen48ydk0m4kKLEVXKrIS7+b5H1WGzduQAA4KG/O4iUA5OFU
	qKJPQcAOG0B7IF5rfctQg18Yb1Al85kJw0gQ8F5KC4qP3ihSuLThhW7FUl3jYFi6
	5TYtuiNVtotQ1PzFLi4JLb0EqKgn3TwZb90g+R0FLDBL9O3TOVa5SvKHfEmWgyKq
	GeK4kjIvS0et1ZLzAVPUBr61igwzj34m2LJ4Om3b3zmEWQXKHYi8f9Zg5jz6hsjV
	OJ+sw==
X-ME-Sender: <xms:JdG3ahtCz_Q1Q0t6VGqD5myojlnHKNxcWPxUHXS7249UmEPbpExczw>
    <xme:JdG3agcHG6WrgW0sUGMwsvvyhkjKZqGxrpZPkgHX5eqp9Eu2i8qpJmDjR3RHdtUE2
    k342WbOeJp_f2Ph6Jvbh2TnkQN6w9ygbJvTbkiKLMTu8z_Fk9uYv2-O>
X-ME-Received: <xmr:JdG3aiY-j1WRCOtNfpWJeFry5VMV2k6vyAPGmAjoZzlKuBIAKfxrNOg4wYv-XnnU6-LpLse7a4moiH-T-eb3toMSyjIzdAuS_HLKuG0>
X-ME-Proxy-Cause: dmFkZTEGTETsi3p74YBMgPJ4gYCQU5gjWD/NlVkOm9MjraEgfD/cp3ROQbnYxsdhAEECfj
    seVcWmAGflThOrEz+G4lA+vM0DlJXedpUWusEvLvXN16BCtKw03l69aTvU8wXWLoc9pAKq
    /5n9Rdx4iJsl5EVp+tQQC36kp3ecZ3N1N2WsesvTBINn8d5CyO8QnnkN00fwY7V7Wb9pw1
    q68SjBfP6/7qKjwicNs2UC3/g13pKG5i/uYapsEq7zoDO81xMN13RiBxCLwgY/PtwKYLkF
    v56EKAoKFCc+iBlnpTWLGru1NAbeq0OhQ4Ee5M+7tSGXntpuv6SXQo6B0EkpxILVbyFZCP
    DVY90G1OccmGcJC35V3eih4SDh4Et4w8Bxt/XmNuQJx968/pTHtdgF9dzYmYbOCW3NPuRY
    00xjrg4IKdPPsTNKqeruUsDxEv2BS+vJOepiC0nrAAU8ikuNGprO9SxwfEkekwOTdiBu02
    k5u/CUWAgmmmqqoSagPevZJIGeRRnW5zwpBRY+L81wSEmUMz6zj6gBoXh/KCDlDe+tUQ8Z
    SEmBj00z7EKO59WmTjquuseXlaGO3npqh511WlCG8IN4WPwDU0ElcjxyYWVLTcU389z4Ds
    YjkRqQRpaUuOffWip5MnX1nYasfknwK56Mt3XU/lOfLJfZUz+Fz4+YSmceNg
X-ME-Proxy: <xmx:JdG3ajXjtYaZQ3p6ziOWGM5Y-q00fMLhgeXsU02nnx8xCg35tkZWGQ>
    <xmx:JdG3akjZNRrEzDrbDWTufddtmPXf0Dttmg8gOIRrCCeP-VzoIuKuqw>
    <xmx:JdG3ahUfHOZXeLZmIhYU0exuwHZgi34m6_YL74NnfMHAlEgFaqnj5w>
    <xmx:JdG3arPM1vagUGSwtv_20PhcuClVotCQGzDo8EFh6b5LHIQ8Ff3P_Q>
    <xmx:JtG3anvNJ2hzNlgY0p67glpKXgtTX7luFmxqXOe4MctPRrj2VpVXA4ko>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 26 Sep 2026 10:05:25 -0400 (EDT)
Message-ID: <d090889df2d7b67661ba42e1ab91de9f9c22dd73.camel@pbarker.dev>
Subject: Re: [oe-core][PATCH 2/5] cpan: survive the Makefile that MakeMaker
 rebuilds under us
From: Paul Barker <paul@pbarker.dev>
To: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
Date: Sat, 26 Sep 2026 15:05:24 +0100
In-Reply-To: <20260922092411.262885-2-f_l_k@t-online.de>
References: <20260922092411.262885-1-f_l_k@t-online.de>
	 <20260922092411.262885-2-f_l_k@t-online.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Sep 2026 14:05:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246637

On Tue, 2026-09-22 at 11:23 +0200, Markus Volk wrote:
> ExtUtils::MakeMaker makes the generated Makefile depend on Config.pm and
> config.h from the perl it was configured against. do_prepare_recipe_sysro=
ot
> stages those files fresh on every run, so their mtime can end up newer th=
an
> a Makefile written by a do_configure that is still valid. make then
> regenerates the Makefile, prints "Please rerun the make command" and exit=
s
> non-zero, which fails do_compile or do_install. Run make a second time in
> that case, which is what MakeMaker asks for; a run that fails for any oth=
er
> reason fails again. Also drop a stale Makefile before Makefile.PL runs, s=
o
> a configure in a used work directory does not start from old settings.
>=20
> Reproduced with liburi-perl by touching Config.pm and config.h in the
> recipe sysroot and forcing do_install: it failed before the change and
> succeeds after it.
>=20
> AI-Generated: Uses Claude Code (Claude Opus 5)
> Signed-off-by: Markus Volk <f_l_k@t-online.de>

Hi Markus,

The commit summary here is an excellent example of Claudish. I'm not
really sure what it means... It could do with re-writing.

> ---
>  meta/classes-recipe/cpan.bbclass | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/classes-recipe/cpan.bbclass b/meta/classes-recipe/cpan.=
bbclass
> index dbf44da9d2..0f7384786f 100644
> --- a/meta/classes-recipe/cpan.bbclass
> +++ b/meta/classes-recipe/cpan.bbclass
> @@ -23,6 +23,10 @@ export PERLHOSTLIB =3D "${STAGING_LIBDIR_NATIVE}/perl5=
/${@get_perl_version(d)}/"
>  export PERLHOSTARCHLIB =3D "${STAGING_LIBDIR_NATIVE}/perl5/${@get_perl_v=
ersion(d)}/${@get_perl_hostarch(d)}/"
> =20
>  cpan_do_configure () {
> +	# A Makefile left behind by an earlier configure run would be used with=
 the
> +	# settings it was generated with, so start from the Makefile.PL every t=
ime.
> +	rm -f Makefile

I'm not really familiar with cpan packages - are we sure that none
include a Makefile?

> +
>  	yes '' | perl ${EXTRA_PERLFLAGS} Makefile.PL INSTALLDIRS=3Dvendor NO_PE=
RLLOCAL=3D1 NO_PACKLIST=3D1 PERL=3D$(which perl) ${EXTRA_CPANFLAGS}
> =20
>  	# Makefile.PLs can exit with success without generating a
> @@ -57,12 +61,17 @@ do_configure:append:class-nativesdk() {
>             -e 's:LD_RUN_PATH ?=3D ?"?[^"]*"?::g'
>  }
> =20
> +# ExtUtils::MakeMaker regenerates the Makefile when the staged perl has =
become
> +# newer than it, and then exits asking for make to be rerun. Do that ins=
tead of
> +# failing the task; a run that fails for any other reason fails again.
>  cpan_do_compile () {
> -	oe_runmake PASTHRU_INC=3D"${CFLAGS}" LD=3D"${CCLD}"
> +	oe_runmake_call PASTHRU_INC=3D"${CFLAGS}" LD=3D"${CCLD}" || \
> +		oe_runmake PASTHRU_INC=3D"${CFLAGS}" LD=3D"${CCLD}"

Are we sure this won't mask other issues? The staged perl becoming newer
than the generated Makefile should be a rare occurance, perhaps we can
check for that before calling make and handle it explicitly?

>  }
> =20
>  cpan_do_install () {
> -	oe_runmake DESTDIR=3D"${D}" install_vendor
> +	oe_runmake_call DESTDIR=3D"${D}" install_vendor || \
> +		oe_runmake DESTDIR=3D"${D}" install_vendor

We don't want surprise rebuilds during do_install.

>  	for PERLSCRIPT in `grep -rIEl '#! *${bindir}/perl-native.*/perl' ${D}`;=
 do
>  		sed -i -e 's|${bindir}/perl-native.*/perl|/usr/bin/env nativeperl|' $P=
ERLSCRIPT
>  	done

Best regards,

--=20
Paul Barker


