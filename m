Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B671C3DA49
	for <webhook@archiver.kernel.org>; Tue, 16 Jul 2024 22:11:40 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.2326.1721167897640761793
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jul 2024 15:11:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 007CD40C79;
	Tue, 16 Jul 2024 22:11:37 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EDcqVMeZbaaM; Tue, 16 Jul 2024 22:11:36 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D5B95407DA;
	Tue, 16 Jul 2024 22:11:35 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 7BB5F163FF3; Tue, 16 Jul 2024 18:11:35 -0400 (EDT)
Date: Tue, 16 Jul 2024 18:11:35 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] llvm: extend llvm-config reproducivility fix
 to all classes
Message-ID: <20240716221135.GC17572@denix.org>
References: <20240716013642.3050435-1-denis@denix.org>
 <725daf1938215f5228a29b272f446ad37d96d58e.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <725daf1938215f5228a29b272f446ad37d96d58e.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jul 2024 22:11:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202129

On Tue, Jul 16, 2024 at 08:12:25AM +0100, Richard Purdie wrote:
> On Mon, 2024-07-15 at 21:36 -0400, Denys Dmytriyenko via
> lists.openembedded.org wrote:
> > It's not limited to "target", but also happens to e.g. nativesdk:
> >=20
> > ERROR: nativesdk-llvm-18.1.8-r0 do_package_qa: QA Issue: File
> > /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-
> > linux/usr/bin/llvm-config in package nativesdk-llvm contains
> > reference to TMPDIR [buildpaths]
> >=20
> > Signed-off-by: Denys Dmytriyenko <denis@denix.org>
> > ---
> > =A0meta/recipes-devtools/llvm/llvm_18.1.8.bb | 2 +-
> > =A01 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/meta/recipes-devtools/llvm/llvm_18.1.8.bb
> > b/meta/recipes-devtools/llvm/llvm_18.1.8.bb
> > index 8dad952923..6afca9c7d7 100644
> > --- a/meta/recipes-devtools/llvm/llvm_18.1.8.bb
> > +++ b/meta/recipes-devtools/llvm/llvm_18.1.8.bb
> > @@ -95,7 +95,7 @@ EXTRA_OECMAKE:append:class-nativesdk =3D "\
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "
> > =A0
> > =A0# patch out build host paths for reproducibility
> > -do_compile:prepend:class-target() {
> > +do_compile:prepend() {
> > =A0=A0=A0=A0=A0=A0=A0=A0 sed -i -e "s,${WORKDIR},,g" ${B}/tools/llvm-
> > config/BuildVariables.inc
> > =A0}
> > =A0
>=20
>=20
> Do we need those buildpaths in llvm-native?

I'm not really sure, but I can spin up a v2.

--=20
Denys

