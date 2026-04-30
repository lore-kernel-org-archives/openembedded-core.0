Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE1EFFF8875
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 08:46:18 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15696.1777538774040440006
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2026 01:46:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bfHo0xoI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso7707715e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 01:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777538772; x=1778143572; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TdX2z0O7u47u2gokKpJPsEk/yo4rhAlxesvO+7FT/SU=;
        b=bfHo0xoIfxKgonNKtM23tSKq7u/wxGbVlA3HsC612FWmqX26bamHDTZ+Mt419orzLI
         LUS3elMDMFQAAJ26MKpk1Lzja8YEqE+A2qtUZh9PPkmS6YYtt8f8OfqEHsgs+RQKXCrY
         GdjU6py125vh7IhN/8RnQOj5BgEYdpPbaf/pU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777538772; x=1778143572;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TdX2z0O7u47u2gokKpJPsEk/yo4rhAlxesvO+7FT/SU=;
        b=M9hBMO93P/4pyQ4yBYa0iz7HIQdn3X5HpUGUR4rUBD3c8UD0sc3UE28/3hPo3pSGwn
         9/peJm99xdLGsglPg6/eib/UDRHN0eaKG9nlxUhcGx7MiukTih1EFYnXGV86s4K3l7zl
         U4Qco8BW0cWtyakGkt5BW7v0vwTYLWR6cBxBqUjubJYaNzO9rc9BRdNbkjSGY9Xr+SZD
         I/QhiQSdcPdNtUpc+++Kpp94JTvuw15pKDjoraXwmd0XyCMLOKADg/wGGyXLTDLCCGMj
         xS5fjkvFLp/2vTPcVVVPF6MO/eJcBtZeX5z1QND7jGMdj8A3+jUj1GXV+SeH7tfHkX8b
         dSZA==
X-Forwarded-Encrypted: i=1; AFNElJ8iVFjQ2YRZinfghRCX5fY5beOIhqppSQ/Pet7wXQ4It86tzMbIxDRYkhsVyWvVKt3kaWaZ84ck9oL1NT52F1K+zQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxnCZuqMoldNyLeQgWLujQud92JABaYXjAehy/5Pt9F6Dyf257q
	pnVPb4qDbgLclMq9KetOFgH+vuMheaGERzC/Hd3d/MArE6RWtCHFM6uD+D6crQetVQ8=
X-Gm-Gg: AeBDiesONbjUeFGDF3PFhBEs6bQS9bOctmreNWtdX4w231VDqyGANVoMwbQSp4owLd7
	7RKxHT+64Nrl5V7NPdiWRObKHrN2H30ngSYvKwAlS5qJqt8/QIxhV3uqW+YNyan9zNAlU9+341/
	XT2B974L0lDV9Oodrk0YQQ82lTdSIqktgGFDmz/faVhuMvwGEr2hDjsQyeaW5NFCfvx8l7+AcnT
	zIUYqsz6eI78SQVxaCYXmZwSl+sXn34p/+YjlWapKTQmEtj6JvWsxOXCzsLOYjgYkM8f+zRjiKK
	y5nwVq1QaEjxjX6O/n5O9LiiM4csrvEnje48+XO+BfUZFXG23iPjvGwgMsNCNvv3i71edCkd6tJ
	gkMxiki9rnf1WcGuoIH4QFtJ2s92Bf7yWRvdylEEQlJu4MkJtkVi8iGCAWv/ojO+7WDRRS0XjTA
	U/wY55ukuG0OajnlWzrvZLlUVXNjTwAa0kpweSqV1YhocJIuqwmLxQFUKTVicQZmoEjqVZBFJ6i
	I8mUIaf16UiNmWAypZIjlSV
X-Received: by 2002:a05:600c:4fc5:b0:489:c57:7836 with SMTP id 5b1f17b1804b1-48a8445dda3mr35574025e9.27.1777538772068;
        Thu, 30 Apr 2026 01:46:12 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:c98d:ac74:daf:72a1? ([2001:8b0:aba:5f3c:c98d:ac74:daf:72a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c310048sm36013975e9.22.2026.04.30.01.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 01:46:11 -0700 (PDT)
Message-ID: <e1a87043b8d16e9d2d49d5b0a2ac6ca48a023644.camel@linuxfoundation.org>
Subject: Re: [PATCH] populate_sdk: Execute populate_sdk before rm_work if
 rm_work.bbclass active
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Marek Vasut <marek.vasut@mailbox.org>, 
	openembedded-core@lists.openembedded.org
Cc: Adam Nilsson <Adam.X.Nilsson@axis.com>, Alexander Kanavin	
 <alex@linutronix.de>, Khem Raj <raj.khem@gmail.com>, Mathieu Dubois-Briand	
 <mathieu.dubois-briand@bootlin.com>, Patrick Ohly <patrick.ohly@intel.com>,
  Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Philip Lorenz
 <philip.lorenz@bmw.de>
Date: Thu, 30 Apr 2026 09:46:10 +0100
In-Reply-To: <20260429233224.562584-1-marek.vasut@mailbox.org>
References: <20260429233224.562584-1-marek.vasut@mailbox.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 08:46:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236146

On Thu, 2026-04-30 at 01:31 +0200, Marek Vasut wrote:
> In case the rm_work.bbclass is inherited via INHERIT +=3D "rm_work" into
> a build, it is currently possible for an image build to execute both
> rm_work and populate_sdk tasks in parallel, which usually leads to an
> unusual failure of the populate_sdk task.
>=20
> This can be reproduced with oe-core and bitbake as follows:
> $ . oe-init-build-env /path/to/build
> $ bitbake core-image-base core-image-base:do_populate_sdk
>=20
> Fix this in a manner similar to 00b1911c65fa ("populate_sdk_ext.bbclass:
> enhance compatibility with rm_work.bbclass"). Make sure do_populate_sdk
> is executed before rm_work for both image and SDK only recipes. Use the
> RM_WORK_BUILD_WITHOUT variable provided by rm_work bbclass to determine
> whether rm_work is inherited or not. This way, in case rm_work is not
> inherited, the dependencies remain unchanged, otherwise populate_sdk is
> surely executed before the rm_work task.
>=20
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
> ---
> Cc: Adam Nilsson <Adam.X.Nilsson@axis.com>
> Cc: Alexander Kanavin <alex@linutronix.de>
> Cc: Khem Raj <raj.khem@gmail.com>
> Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> Cc: Patrick Ohly <patrick.ohly@intel.com>
> Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> Cc: Philip Lorenz <philip.lorenz@bmw.de>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> =C2=A0meta/classes-recipe/populate_sdk.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 9 ++++++++-
> =C2=A0meta/classes-recipe/populate_sdk_base.bbclass | 7 +++++++
> =C2=A02 files changed, 15 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/classes-recipe/populate_sdk.bbclass b/meta/classes-reci=
pe/populate_sdk.bbclass
> index caeef5d2b2a..3b89ff997f5 100644
> --- a/meta/classes-recipe/populate_sdk.bbclass
> +++ b/meta/classes-recipe/populate_sdk.bbclass
> @@ -10,4 +10,11 @@
> =C2=A0inherit populate_sdk_base
> =C2=A0
> =C2=A0addtask populate_sdk after do_install before do_build
> -
> +addhandler inject_sdk_rm_work
> +inject_sdk_rm_work[eventmask] =3D "bb.event.RecipeTaskPreProcess"
> +python inject_sdk_rm_work() {
> +=C2=A0=C2=A0=C2=A0 if d.getVar('RM_WORK_BUILD_WITHOUT'):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.build.addtask('do_populate=
_sdk', 'do_rm_work do_build', ' ', d)
> +=C2=A0=C2=A0=C2=A0 else:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.build.addtask('do_populate=
_sdk', 'do_build', ' ', d)
> +}
> diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/classes=
-recipe/populate_sdk_base.bbclass
> index b427ff27616..073949ebcde 100644
> --- a/meta/classes-recipe/populate_sdk_base.bbclass
> +++ b/meta/classes-recipe/populate_sdk_base.bbclass
> @@ -435,3 +435,10 @@ do_populate_sdk[rdepends] =3D "${@' '.join([x + ':do=
_package_write_${IMAGE_PKGTYPE
> =C2=A0do_populate_sdk[recrdeptask] +=3D "do_packagedata do_package_write_=
rpm do_package_write_ipk do_package_write_deb do_package_qa"
> =C2=A0do_populate_sdk[file-checksums] +=3D "${POSTINST_INTERCEPT_CHECKSUM=
S}"
> =C2=A0addtask populate_sdk
> +
> +addhandler inject_sdk_rm_work
> +inject_sdk_rm_work[eventmask] =3D "bb.event.RecipeTaskPreProcess"
> +python inject_sdk_rm_work() {
> +=C2=A0=C2=A0=C2=A0 if d.getVar('RM_WORK_BUILD_WITHOUT'):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.build.addtask('do_populate=
_sdk', 'do_rm_work', ' ', d)
> +}

The solution is creative but I suspect it will cause problems with
populate_sdk being injected into builds where it otherwise wasn't going
to run.

There is clearly an issue here but I'm not sure it can be solved with
the way tehe task graph code currently works. It might be time to have
some kind of bitbake level API to better handle a task with the
requirements rm_work has. I've long wondered if we should do something
like that and this is a further sign we may not be able to do much
else.

Cheers,

Richard

