Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 819FDC10DC3
	for <webhook@archiver.kernel.org>; Thu,  7 Dec 2023 12:59:06 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web11.82925.1701953945413103083
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Dec 2023 04:59:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HSiqF9d0;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2c9f4bb2e5eso9560161fa.1
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 04:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701953943; x=1702558743; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EtX2pCAWJCipbB4VsK4snRPUkAFoxbx2OcKUAXUvMuQ=;
        b=HSiqF9d0ZeA3PxwNZorwFTG8CcWrw1GdwsOAI8W+WIQy91nhvS4WpTgpqRxXVTRz5Y
         NMxW7Uai6EHnTcWTkx41hLp5v0suwZEBD5GvO4m7Vlslx59vWEYEfn5TWzsAiKJKcriB
         AWWK4kSE3dzyVXtpV2G6TnA9OCFmccPO9iJkFowsaDXz0jaTQ/hUHpLy76Mi7HBeg0TH
         aHRmvPK9I6ve3XNWqyWuxKE22ORIEmrnJVKpmitriLrtMfF5TZI9PqlqAiAjPMS7S3L4
         mm/tAa5sUR2vuG2NS5Zw06IxTKHNdqvbKpo0OmgTLExLCVoXUoLmCA7tY6wr46hrez+w
         JKPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701953943; x=1702558743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EtX2pCAWJCipbB4VsK4snRPUkAFoxbx2OcKUAXUvMuQ=;
        b=T012ZRfFpeHj+5SI5Sh+mBepdCtk1AJWQDpJfHiSUoc5bPfFHKMK4JkamWElsVOJDM
         EUj0+BHn7hZZQqXEz2BIyCOH7enx/2+1fUz1zIukgg10VINKqHUvDDNh+DC3mO4ZMShk
         dBn4Pg7BNA+KmxBw/kWT8cwQ6JxN2QE7xxVff1qdZe29ICGOkGeVeCfkVbuXTt6/Udsg
         Qy6BgweeO9ta9QId0sRbJrPkf+JU4elobtCO2crSV3/o0J78QEaWDiXD1zdwSg78FrkU
         9noRlQ+jkwON/AqMiiKGn3EU6yVyAoMCeS1YvyzbX/D1qh+Atd13oVCqCulHF5Hyvxfl
         6RRA==
X-Gm-Message-State: AOJu0Yz9pcgyNbLwNcaYsyAWaTPnbHzw2NTASXHdkURJbQh/KNI7qmQd
	llFgWF5XMPeCz3sofaXWs7PR7i3kFT81g5tJAwQ=
X-Google-Smtp-Source: AGHT+IG/W4IHevAe1ip6fZWl2z2vcwvdRddYHQEg2Mo/sTr/mm7N5tMukSJcV3+FI4yg047tsuxsAC7x9JbRnlDoUGg=
X-Received: by 2002:a2e:7d10:0:b0:2c9:ec92:7bc3 with SMTP id
 y16-20020a2e7d10000000b002c9ec927bc3mr1514867ljc.6.1701953943272; Thu, 07 Dec
 2023 04:59:03 -0800 (PST)
MIME-Version: 1.0
References: <cover.1701952927.git.pidge@baylibre.com> <1560cc968f5f93a925cc3ba9436f13210dc4e4c5.1701952927.git.pidge@baylibre.com>
In-Reply-To: <1560cc968f5f93a925cc3ba9436f13210dc4e4c5.1701952927.git.pidge@baylibre.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 7 Dec 2023 13:58:52 +0100
Message-ID: <CANNYZj-yakHq4q+TVONzN2GyYc8jxhC3Jb4hebbekKXv9WbJfg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] useradd: Fix issues with useradd dependencies
To: =?UTF-8?B?RWlsw61zICdwaWRnZScgTsOtIEZobGFubmFnw6Fpbg==?= <pidge@baylibre.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 12:59:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191952

On Thu, 7 Dec 2023 at 13:45, Eil=C3=ADs 'pidge' N=C3=AD Fhlannag=C3=A1in
<pidge@baylibre.com> wrote:
> -USERADDSETSCENEDEPS:class-target =3D "${MLPREFIX}base-passwd:do_populate=
_sysroot_setscene pseudo-native:do_populate_sysroot_setscene shadow-native:=
do_populate_sysroot_setscene ${MLPREFIX}shadow-sysroot:do_populate_sysroot_=
setscene"
> +USERADDSETSCENEDEPS:class-target =3D "${MLPREFIX}base-passwd:do_populate=
_sysroot_setscene pseudo-native:do_populate_sysroot_setscene shadow-native:=
do_populate_sysroot_setscene ${MLPREFIX}shadow-sysroot:do_populate_sysroot_=
setscene ${@' '.join(['%s:do_populate_sysroot_setscene' % pkg for pkg in d.=
getVar("USERADD_DEPENDS").split()])}"

I'd like to clarify: do all these recent fixes mean that we can also
add dynamic library dependencies of shadow-native into this list (it
becomes an issue with latest versions of shadow currently not in
oe-core)?

Specifically, this commit

https://git.yoctoproject.org/poky-contrib/commit/?h=3Dakanavin/package-vers=
ion-updates&id=3D9fdbe321fa53785cc35bd1bb4054366383ef20e5

doing

-USERADDSETSCENEDEPS:class-target =3D
"${MLPREFIX}base-passwd:do_populate_sysroot_setscene
pseudo-native:do_populate_sysroot_setscene
shadow-native:do_populate_sysroot_setscene
${MLPREFIX}shadow-sysroot:do_populate_sysroot_setscene"
+USERADDSETSCENEDEPS:class-target =3D
"${MLPREFIX}base-passwd:do_populate_sysroot_setscene \
+ pseudo-native:do_populate_sysroot_setscene \
+ shadow-native:do_populate_sysroot_setscene \
+ attr-native:do_populate_sysroot_setscene \
+ libbsd-native:do_populate_sysroot_setscene \
+ libmd-native:do_populate_sysroot_setscene \
+ ${MLPREFIX}shadow-sysroot:do_populate_sysroot_setscene"

has been rejected by RP with the suggestion that shadow should be
linked statically, but now I'm not sure if the argument still holds.

Alex

