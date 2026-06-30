Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 713AEC43458
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 09:16:39 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17121.1782810991023367795
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2026 02:16:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=no13+ZND;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B57501A0D4F;
	Tue, 30 Jun 2026 09:16:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8178D60233;
	Tue, 30 Jun 2026 09:16:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0781F106F1C68;
	Tue, 30 Jun 2026 11:16:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782810988; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=28wdmwQ8P4S6VOaQcu1TC5IbAyczxtZds941wkktvNQ=;
	b=no13+ZNDBAV8bvHL6Olyh7L1WhaatLmNkJUbyVr6jpOvLlEbxFSWk2bHCoaArgLKMLaA3X
	YPb58QEXxo6sLx3XfcrPG34H3pvO7XwLpGuFCN6EN57DHmk9u3mhjRDEHnBzMW2H69xoY4
	8o/C37p5SjijEw5lR7tVy5f1xmLpshQtRaaRXZXj9qXNJUeQR44jZ6nkIpuHCXBDV8ZMzf
	gAJ4OUmDZOTIvCd9kd75BVX+fqVEBHaMQ92lDejutLCv8XvSaMuu5q8BDSmFxXgxHP1xUk
	rSZrZe7PsJQhO/AqcSxwrmLqW6bJlCtlGRGuMa8AxgKMNlJORw02HmV9DpEjxQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 30 Jun 2026 11:16:26 +0200
Message-Id: <DJM9R0H9XXTI.3BIET5EQ9GKC5@bootlin.com>
To: "Daniel Turull" <daniel.turull@ericsson.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>, "ross.burton@arm.com"
 <ross.burton@arm.com>
Subject: Re: [OE-core] [PATCH 1/3] classes/meson: use ninja explicitly when
 compiling
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260629141559.1305873-1-ross.burton@arm.com>
 <DJM8EZJFQZCJ.2860UZRX5PB0Q@bootlin.com>
 <ed70423e6ae6dfa9da7e739fd3c59a8f041a8773.camel@ericsson.com>
In-Reply-To: <ed70423e6ae6dfa9da7e739fd3c59a8f041a8773.camel@ericsson.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 09:16:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239870

On Tue Jun 30, 2026 at 10:20 AM CEST, Daniel Turull wrote:
> On Tue, 2026-06-30 at 10:13 +0200, Mathieu Dubois-Briand wrote:
>> On Mon Jun 29, 2026 at 4:15 PM CEST, Ross Burton via
>> lists.openembedded.org wrote:
>> > "meson compile" is essentially a glorified wrapper around calling
>> > ninja
>> > that doesn't support all of the options that ninja does, so calling
>> > it
>> > directly means builds are fractionally faster and we get direct
>> > control
>> > over the flags that ninja is passed.
>> >=20
>> > A longer rationale can be found in the Gentoo change by Eli
>> > Schwartz
>> > that caused this patch, who is both a Gentoo and Meson developer:
>> >=20
>> >=20
>> > The only change is that the compile target doesn't support the
>> > optional
>> > convenience target type, but this is rarely used.
>> >=20
>> > Signed-off-by: Ross Burton <ross.burton@arm.com>
>> > ---
>> > =C2=A0 meta/classes-recipe/meson.bbclass | 2 +-
>> > =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>> >=20
>> > diff --git a/meta/classes-recipe/meson.bbclass b/meta/classes-
>> > recipe/meson.bbclass
>> > index 9bed293603c..a4643591103 100644
>> > --- a/meta/classes-recipe/meson.bbclass
>> > +++ b/meta/classes-recipe/meson.bbclass
>> > @@ -180,7 +180,7 @@ meson_do_configure() {
>> > =C2=A0=20
>> > =C2=A0 do_compile[progress] =3D "outof:^\[(\d+)/(\d+)\]\s+"
>> > =C2=A0 meson_do_compile() {
>> > -=C2=A0=C2=A0=C2=A0 meson compile -v ${PARALLEL_MAKE} ${MESON_TARGET}
>> > +=C2=A0=C2=A0=C2=A0 ninja --verbose ${PARALLEL_MAKE} ${MESON_TARGET}
>> > =C2=A0 }
>> > =C2=A0=20
>> > =C2=A0 meson_do_install() {
>>=20
>> Hi Ross, Hi Daniel,
>>=20
>> I just note this this patch is conflicting with the one from Daniel
>> [1],
>> as it does use 'MESON_TARGET =3D "systemd-hwdb:executable"'. Depending
>> on
>> which patch is merged first, the other might have to be rebased and
>> fixed.
>>=20
>
> Do you know why is conflicting? the systemd patch doesn't touch
> meson.bbclass
>
> Is is a different format expected for MESON_TARGET content?
>

I do not have all the context, I bet Ross knows better. But you can have
a look at patch 2 in this series (systemd-systemctl-native: update
MESON_TARGET for direct ninja use) for part of the explanation.

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


