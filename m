Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45604C3ABBF
	for <webhook@archiver.kernel.org>; Wed,  7 May 2025 13:31:13 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web10.9166.1746624666583543039
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 May 2025 06:31:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aRMzvSnA;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6f5499c21bbso2264826d6.3
        for <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 06:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746624665; x=1747229465; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oj9zDDj5WHaKpS9j3INKI1jXTBhxyCAzPM3b5e0mGcE=;
        b=aRMzvSnALlWYvxeU5jAjCusMSmgzZ+Frec3AFrTqGyUHODMg5yL79vQDo1+IRI9+BH
         3VplK4xIOQ7KIvAQJ49tE2evtlMiS7vYs+6AZ0fpxDRUOHXIJ3sgYj74NdEgXkGCKlWU
         Lcuh8QD35sSvBvHWo0ttoEbtw3noshAMcbffiBlMaUPGjLZAOLeETosfbcJkYBkuilFg
         Sqz/MKYhvNsmKAo+YNCnrY7YWcf9YbiD1ML6Oa1xaR8NSp6nxceStxMKc+/bfhT8mDf0
         LM1Ja4xTOR+4xW36vfUSau/kHZOOBmloSGG9nV5Qfq0bzrECeLk6NoyRC2E5BU9Do85X
         fIFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746624665; x=1747229465;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oj9zDDj5WHaKpS9j3INKI1jXTBhxyCAzPM3b5e0mGcE=;
        b=QycKXz9GRD/KdQ+Q4zloORxdC6g/N3F61Vgcbq4O1jSHElswqTufnyIlVJkPb+CYLr
         C5GrI0JkDDgwyXsoncL7Rn78I8VV3FMXdUyNceyvMtgBPahngLn5jyQaj9wrlT0xC74W
         QKYShs0Ofhvje1LCk9FzaFsFnu9zJKBn4l6bpYXvOB1+xMdqACWbsUQT4wNwz1MKlA7C
         eSdkG4J+5NDCk9JANbxez674ohhlsL+Wytfulh0cAHR0X8i+1tfjGKpzHThcKlYDCspD
         0jwmgwu8ywiKHdMzPo2IHwRhz9Ge8mHa0muTcbwuAdDTmZjmlDYXVoqV6JAlIEFPi8v+
         N1HA==
X-Gm-Message-State: AOJu0Yy1qq253MIUbgx14mFr+kFUcxeHImyAbzm2RGj4sslNU31OKg5f
	8/bF97GD52RpeLftw/NVZj+F1us5W95gvbM8/qoo4/OOfGy7GKgWEfFFo1jgxV+I08h1NS39UDd
	+nUKQJluwilcdfmcf2tnY0znaq8g=
X-Gm-Gg: ASbGncsUMd7yS80f6jrUp8YiRtzPrcaeTK4QGBofw2oxyDdStjs3MlHm+FpZToeeMEC
	xbgcZ5ZQs937QSILy4kiQrqJITuKMbTS0POutUNwWfp8LndFWGgX4fkdGjK0hqkUM6ObMteAA1o
	+Viupiq1mNS5W/AhbnVrBvcD4=
X-Google-Smtp-Source: AGHT+IHCJ+PLwS7fXTE0wyGlJqcx9HYQv6Za0ejm3TGfpnOYIEIcOLF8+PcUWiNBzZUQEwwAf3O3dWYSaSxxW6rOTpM=
X-Received: by 2002:a05:6214:1307:b0:6f2:c9e1:8511 with SMTP id
 6a1803df08f44-6f542ade2f5mr40682106d6.39.1746624665337; Wed, 07 May 2025
 06:31:05 -0700 (PDT)
MIME-Version: 1.0
References: <Rr0o.1746565000533076699.rvHw@lists.openembedded.org>
In-Reply-To: <Rr0o.1746565000533076699.rvHw@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 7 May 2025 15:30:53 +0200
X-Gm-Features: ATxdqUFNBxwF7a4M0H_pzd58fBwGwH1dQvEpDB8P9qC9fdIW4djkgOnP5ZLJGq0
Message-ID: <CANNYZj9+uGR-_4WU04Dm7fR5zP8Rf7ggJh_+YFVSAy8fOKKOCg@mail.gmail.com>
Subject: Re: [OE-core] [oe] glib-2.0 Introspection Data Question #poky
To: eric.meyers15310@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 13:31:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216110

On Tue, 6 May 2025 at 22:56, Eric Meyers via lists.openembedded.org
<eric.meyers15310=3Dgmail.com@lists.openembedded.org> wrote:
>
> Was wondering if someone can help me with an issue I'm seeing with my wor=
kflow after upgrading to styhead/master on poky - specifically related to g=
object-introspection data for the GLib-2.0 recipe. In particular, I see tha=
t the gobject-introspection/glib recipes were updated in this patch/mailing=
 list discussion:
>
> https://lists.openembedded.org/g/openembedded-core/topic/105860089
>
> But it is unclear to me if this patch still supports producing native GLi=
b-2.0/Gio/GObject .typelib files in a recipe's sysroot?
>
> It looks suspect to me that the PACKAGECONFIG for the native class is wip=
ed in this line:
>
> https://github.com/yoctoproject/poky/blob/master/meta/recipes-core/glib-2=
.0/glib.inc#L40
>
> Which would lead me to believe that glib-2.0-native does not produce any =
.typelib files?

Correct. I think native gir/typelib files were never enabled, oe-core
only ever had them enabled for target.

> However, when digging, I noticed that the missing .typelib file existed i=
n the gobject-introspection-native build directory, but was just not being =
shipped to the sysroot-destdir. I needed to add the following do_install:ap=
pend to gobject-introspection_%.bbappend:
>
> do_install:append:class-native() {
>         cp -f ${B}/gir/GLib-2.0.typelib ${D}${RECIPE_SYSROOT_NATIVE}/usr/=
lib/girepository-1.0/GLib-2.0.typelib
>         cp -f ${B}/gir/GObject-2.0.typelib ${D}${RECIPE_SYSROOT_NATIVE}/u=
sr/lib/girepository-1.0/GObject-2.0.typelib
>         cp -f ${B}/gir/Gio-2.0.typelib ${D}${RECIPE_SYSROOT_NATIVE}/usr/l=
ib/girepository-1.0/Gio-2.0.typelib
> }
>
> (OR this patch will also accomplish similar behavior):
>
> gobject-introspection_%.bbappend:
>
> SRC_URI:append:class-native =3D " ${@bb.utils.contains('GI_DATA_ENABLED',=
 'True', 'file://0001-Install-typelib-files-if-native-build.patch', '', d)}=
"
>
> 0001-Install-typelib-files-if-native-build.patch:
> +---
> + gir/meson.build | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/gir/meson.build b/gir/meson.build
> +index e5a7a13..e8100fd 100644
> +--- a/gir/meson.build
> ++++ b/gir/meson.build
> +@@ -541,6 +541,8 @@ foreach gir: uninstalled_gir_files
> +     output: '@BASENAME@.typelib',
> +     depends: [gobject_gir, gircompiler, ],
> +     command: gircompiler_command,
> ++    install: true,
> ++    install_dir: typelibdir,
> +   )
> + endforeach
>
> I'm hesitant to submit either patch due to the fear that I'm (1) missing =
something/not understanding something right and (2) doing something complet=
ely wrong.

Upstream has made the decision to transition from installing static
pre-generated gir/typelib files in g-i to generating them from actual,
current glib libraries inside glib itself. This indeed introduced a
circular dependency, which was solved for the target by first building
glib-2.0-initial (that does not enable gir/typelib generation), then
building target g-i with it, then  building final target glib with
gir/typelib generation

You would have to replicate this sequence for the native recipes.
Pre-built files in g-i are not meant for installation, only for
running tests during the build. Any attempt to change that will be
rejected by both g-i upstream and oe-core.

Alex

