Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f170.google.com (mail-we0-f170.google.com
	[74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id CB0D565D2A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Apr 2014 07:02:19 +0000 (UTC)
Received: by mail-we0-f170.google.com with SMTP id w61so3249251wes.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Apr 2014 00:02:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=oGeyor9uD4RnuR+gJr9/od6njbX4Wv6aOlGsugjDQ3c=;
	b=Mn858Gc1uaV5dmh6L1AfHke7AgBc/je16fwyM1dET3eJ7I7/Kjd8EvrInUvvJcl9bQ
	7knxG6iejNFAQpvYDyUyEmMjYFnSpOz3+3LjN8TLhgC5Shy6B77p7j6HrMR5WpwrsIV8
	HZ+SpQeea9FYfcHnOyCeQvXmK3WbMuQZQMYX+XqHX4c59i79Q8AqWPtJomVTx2Ck3UoA
	EOMz8QzOMbx/gwoRS/Eu3cySy5D9uIIZM4c6lCjLLQhydXmsPykAuBur0C+Uw00cQvQc
	OIDtxU17aR7bzB4aZ+7MoWG2gX1qYt+dBw2bja8aXztd32+cS/SnnmuF1fx0zvPg9afp
	Xw4w==
X-Gm-Message-State: ALoCoQnrCq7W9viFCJ8fR5W/FfTeW46xmxq2Vx+orAsKhjAvFrES120m9PTzsb7V1kNp5JQUxgck
X-Received: by 10.180.99.40 with SMTP id en8mr2383555wib.24.1398409340764;
	Fri, 25 Apr 2014 00:02:20 -0700 (PDT)
Received: from [172.20.0.187] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id nb8sm3947109wic.18.2014.04.25.00.02.19
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 25 Apr 2014 00:02:19 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1397462617-29584-1-git-send-email-koen.kooi@linaro.org>
Date: Fri, 25 Apr 2014 09:02:17 +0200
Message-Id: <AA8CCA9F-D7A1-428E-B6A3-0CEE7F996E09@dominion.thruhere.net>
References: <1397462617-29584-1-git-send-email-koen.kooi@linaro.org>
To: Koen Kooi <koen.kooi@linaro.org>
X-Mailer: Apple Mail (2.1874)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] grub git: workaround debugedit problems
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
X-List-Received-Date: Fri, 25 Apr 2014 07:02:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

This is in OE-core master now, can it please go into 'daisy' as well? As =
you can see from Martins reports, it doesn't build there due to this =
problem.

Op 14 apr. 2014, om 10:03 heeft Koen Kooi <koen.kooi@linaro.org> het =
volgende geschreven:

> Debugedit errors out on bare metal binaries. The first version of this =
patch limited it to 64 bit targets, but the problem now shows up on 32 =
bit targets (minnowboard) as well.
>=20
> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> ---
> meta/recipes-bsp/grub/grub_git.bb | 4 ++++
> 1 file changed, 4 insertions(+)
>=20
> diff --git a/meta/recipes-bsp/grub/grub_git.bb =
b/meta/recipes-bsp/grub/grub_git.bb
> index 9b5d9bb..114cf77 100644
> --- a/meta/recipes-bsp/grub/grub_git.bb
> +++ b/meta/recipes-bsp/grub/grub_git.bb
> @@ -53,8 +53,12 @@ do_configure_prepend() {
> do_install_append () {
>     install -d ${D}${sysconfdir}/grub.d
>     install -m 0755 ${WORKDIR}/40_custom =
${D}${sysconfdir}/grub.d/40_custom
> +=20
> }
>=20
> +# debugedit chokes on bare metal binaries
> +INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
> +
> RDEPENDS_${PN} =3D "diffutils freetype"
> FILES_${PN}-dbg +=3D "${libdir}/${BPN}/*/.debug"
>=20
> --=20
> 1.9.0
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20


