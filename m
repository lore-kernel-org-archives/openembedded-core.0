Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3758DC5AE59
	for <webhook@archiver.kernel.org>; Tue,  3 Jun 2025 14:07:19 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.12542.1748959638587227383
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jun 2025 07:07:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=S3b51hOF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a4fb9c2436so1956285f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 07:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1748959637; x=1749564437; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QW6DuIe+i8T8YFA/KM+ykYiH/ibpId6r6gHrfrU2a4A=;
        b=S3b51hOF1n6PgTbp2ctPDx7GJfOYaywOA/8XR6fTZuUG42837j8Ndm8ZUa0lr0jAxE
         KOfX6l7+Z01yYVBjGn6iQE8Ammr5P5MveiJe16B6a56rMow9zMAFigBeVn48ttU//2A+
         aRqAUzcqkkcecymuWcmvMdek9lsusGGQVYJWA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748959637; x=1749564437;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QW6DuIe+i8T8YFA/KM+ykYiH/ibpId6r6gHrfrU2a4A=;
        b=nmwIihrZwlxMovPpy34+We3EFpMg7AuNyzNlNfzGUOyFjbz1ERJVNDzDXWNFUt32/l
         /sctDwmp1tUMNM+0994H1uKM9MG5RME/beAXr/9zebQ3quBuMMy7qtgX7zHKv99hsD28
         4Io/sbS2ralCSCZmeREg2L77KLRH5vOnHOD9IFXiLhqPk7PS0/pzTzgmhZdmcM4EXIon
         oJ+yvl6MsgNb6zly2JZEFi22OqR8GTcZSJvLeqNmbrMF9/8DGopUdT14ueND3FUYot0H
         3F/9/TAud9Rx0D5SHXFnji2AZz2byemXh/uIGQCTFw7WHJUOD6tZz8HElZR2wnXTH5sY
         uJUg==
X-Forwarded-Encrypted: i=1; AJvYcCUwjvxohYjmSNpWr6gIp+LQu7sXaDbD0tyPyuGerZoZyrO37sI4/BNYO7pyaJm6LElJbLj6dzbqW0PKKQY1s518Sw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzl6H/1X/japIlwKqrJsyL9QxOzA2cztTIy8N+qEqPwS3XJMvwy
	Aglj6QzGtrkbMkaN6ft5SfWXE+RAZyy7DtvMumOBOkLbM9vAn+QlHJ12xL01lydZlc6qGezzQiW
	F0frheVI=
X-Gm-Gg: ASbGncshWeOGYu/wBKuuuAqg7vIWTKEaBTPiS7Qt7e1sMjjfdSnHLjAm4EyOUJwdLL9
	3zxC5UDisn6ui1SQxeRS00RUzjA6RuXvitNYrtKByDGToy0hthA8eIEu8yEfmnXEdRFUfLaXtm8
	wbdEENGfzlAhXQMxsMgWIDLVzuG8UDUuTOFWrMAAYDyrfJiAkKFHXuIWFK7Z3iKCsI21NmAjLeZ
	7/Ws1P4dGtqyjPAqFb1deJjX8oZ30xDfgum/hD9+iakBoQqa3wt1pDBQJQ/7YHAe6Mg2YTxR5oG
	7QuDKlZQOCoFqofWe9SMqfEV/xJp9C6P3MXKsAmCPESVhIrHRGBqyODUYNsCOHpmXWQO5euWAbx
	ehUl9KNzsdpgphDrJ3FNA62ir0PDyvZcL9nLcrUT1
X-Google-Smtp-Source: AGHT+IGfewZK2tw2AAy/U7ZBZL10lPvytXy8choW4ufsrLbtb7+y8+cdiuCmcyKl2dPQk4J100Z3Kg==
X-Received: by 2002:a05:6000:2886:b0:3a3:67bb:8f46 with SMTP id ffacd0b85a97d-3a4f89eadcemr13457752f8f.57.1748959636585;
        Tue, 03 Jun 2025 07:07:16 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3864:8101:3606:8242? ([2001:8b0:aba:5f3c:3864:8101:3606:8242])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f00972aasm18784444f8f.66.2025.06.03.07.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 07:07:15 -0700 (PDT)
Message-ID: <ccdd6019b9d9c263f5d63f21d6c83dc0bddba02b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v7 00/20] FIT image improvements
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Freihofer, Adrian" <adrian.freihofer@siemens.com>, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 03 Jun 2025 15:07:15 +0100
In-Reply-To: <3338cd8105d0f0832f01bb0f8b705e26f91c50d2.camel@siemens.com>
References: <20250603082419.409564-1-adrian.freihofer@siemens.com>
		 <dd27e615bd3ea965dee284352c90794d77854cf0.camel@linuxfoundation.org>
	 <3338cd8105d0f0832f01bb0f8b705e26f91c50d2.camel@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 14:07:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217816

On Tue, 2025-06-03 at 13:35 +0000, Freihofer, Adrian wrote:
> On Tue, 2025-06-03 at 11:48 +0100, Richard Purdie wrote:
> > On Tue, 2025-06-03 at 10:23 +0200, Adrian Freihofer via
> > lists.openembedded.org wrote:
> > > From: Adrian Freihofer <adrian.freihofer@siemens.com>
> > >=20
> > > This patch series re-writes the FIT image related code. The goal is
> > > to
> > > fix [YOCTO #12912] which is a long standing issue.
> > >=20
> > > Changes in comparison to v6
> > > ---------------------------
> > >=20
> > > * Move the code for exporting the FIT image specific kernel
> > > artifacts
> > > in a new,
> > > =C2=A0 separate kernel-fit-extra-artifacts.bbclass rather than adding=
 it
> > > to the
> > > =C2=A0 existing kernel-uimage.bbclass.
> > > * Improve the devicetree.bbclass to skip error messages of shell
> > > globs
> > > * Improve the error message in the kernel.bbclass to: "fitImage is
> > > no
> > > longer
> > > =C2=A0 supported as a KERNEL_IMAGETYPE(S). FIT images are built by th=
e
> > > =C2=A0 linux-yocto-fitimage recipe."
> > >=20
> > > Revert a non essential refactoring in the kernel.bbclass
> >=20
> > v7 seems to have some new failures:
> >=20
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/111/builds/497
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/builds/1810
> >=20
> > both in musl.
>=20
> Hi Richard
>=20
> My conclusion is that the change requested by this discussion
> https://lists.openembedded.org/g/openembedded-core/message/217730
> makes the linux-yocto-fitimage.bb incompatible with bitbake world.
> I guess that bitbake world would now fail for all build configurations,
> not only for musl.
> The background is that the kernel artifact (linux.bin) which gets
> included into the Fit image is no longer built by default. It requires
> KERNEL_CLASSES +=3D "kernel-fit-extra-artifacts".
>=20
> I guess that this !fixup patch is the solution:
>=20
> diff --git a/meta/classes-recipe/kernel-fit-image.bbclass
> b/meta/classes-recipe/kernel-fit-image.bbclass
> index 6d80cd4bb47..d2eebb88bc2 100644
> --- a/meta/classes-recipe/kernel-fit-image.bbclass
> +++ b/meta/classes-recipe/kernel-fit-image.bbclass
> @@ -7,6 +7,9 @@ UNPACKDIR =3D "${S}"
>=20
> =C2=A0PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>=20
> +# This bbclass requires KERNEL_CLASSES +=3D "kernel-fit-extra-artifacts"
> +EXCLUDE_FROM_WORLD =3D "1"
> +
> =C2=A0DEPENDS +=3D "\
> =C2=A0=C2=A0=C2=A0=C2=A0 u-boot-tools-native dtc-native \
>=20
> But I need to test it before sending a new version. And today I have no
> access to my build machine.

I just saw this and it matches my other email. I also just realised
there are mutliple other world build failures. To expedite things, I'll
include the above change in a test build.

Cheers,

Richard

