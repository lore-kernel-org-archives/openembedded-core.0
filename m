Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B248C43458
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 08:13:52 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16463.1782807227831243576
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2026 01:13:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=sN2yDwzD;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DA77B1A0D52;
	Tue, 30 Jun 2026 08:13:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AF5FB60233;
	Tue, 30 Jun 2026 08:13:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ED2AB106F1CC9;
	Tue, 30 Jun 2026 10:13:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782807224; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Y5++6RqWyeOU79RZEro59GVvt3/FLtaz8Il2klaMuyE=;
	b=sN2yDwzDrD9aoyBo5fJlUWyizd6W/jKyTkVkYSNSBMOge0UXBKAAFOEhKw3RXwsetcCz4z
	ytwKfVWBSzGgZmUIYAq+KpAUCOPBTKMVcIChXKrEspXYHTh7JtFk304S8TWMZid+SogLhJ
	TgGsfSv4A+5TCDGo67NzFW4G0qZqXhX7Fbd5CqXNgtaSEQ9osJmpy2/IkRzCHIaiHLn416
	yhhyXxY+TUhYmOun35gEkaJsHjCgMsKikPdTTQI/4yuZj/exMz57j8I1KrmJViIs3Uhs/0
	fPdeI69ENiW5QfmRr0oIeAgqU8KzIVRNeNv0/zFnRaR97Hsgc0m7tp3sKGsRVg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 30 Jun 2026 10:13:42 +0200
Message-Id: <DJM8EZJFQZCJ.2860UZRX5PB0Q@bootlin.com>
Subject: Re: [OE-core] [PATCH 1/3] classes/meson: use ninja explicitly when
 compiling
Cc: <daniel.turull@ericsson.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <ross.burton@arm.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260629141559.1305873-1-ross.burton@arm.com>
In-Reply-To: <20260629141559.1305873-1-ross.burton@arm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 08:13:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239865

On Mon Jun 29, 2026 at 4:15 PM CEST, Ross Burton via lists.openembedded.org=
 wrote:
> "meson compile" is essentially a glorified wrapper around calling ninja
> that doesn't support all of the options that ninja does, so calling it
> directly means builds are fractionally faster and we get direct control
> over the flags that ninja is passed.
>
> A longer rationale can be found in the Gentoo change by Eli Schwartz
> that caused this patch, who is both a Gentoo and Meson developer:
>
> https://github.com/gentoo/gentoo/commit/66011abd663671947fe07835f0d9cc360=
f5de317
>
> The only change is that the compile target doesn't support the optional
> convenience target type, but this is rarely used.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/classes-recipe/meson.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes-recipe/meson.bbclass b/meta/classes-recipe/meso=
n.bbclass
> index 9bed293603c..a4643591103 100644
> --- a/meta/classes-recipe/meson.bbclass
> +++ b/meta/classes-recipe/meson.bbclass
> @@ -180,7 +180,7 @@ meson_do_configure() {
> =20
>  do_compile[progress] =3D "outof:^\[(\d+)/(\d+)\]\s+"
>  meson_do_compile() {
> -    meson compile -v ${PARALLEL_MAKE} ${MESON_TARGET}
> +    ninja --verbose ${PARALLEL_MAKE} ${MESON_TARGET}
>  }
> =20
>  meson_do_install() {

Hi Ross, Hi Daniel,

I just note this this patch is conflicting with the one from Daniel [1],
as it does use 'MESON_TARGET =3D "systemd-hwdb:executable"'. Depending on
which patch is merged first, the other might have to be rebased and
fixed.

[1]: https://lore.kernel.org/all/20260626073812.769193-4-daniel.turull@eric=
sson.com/

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


