Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 122BCEB64D9
	for <webhook@archiver.kernel.org>; Tue,  4 Jul 2023 09:24:08 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web10.54824.1688462647129825714
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jul 2023 02:24:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=KfMGwxu9;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-51d88f1c476so6069646a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 02:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688462645; x=1691054645;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EYIjcYd0M4lTUsB4kYeEdkpMy9Eej5fkZ3yOCzm/oWE=;
        b=KfMGwxu9evYNAaLtGiTtjKjosPh/pYHXk9WiVsh72pygSQcQKzAFYEZu+/hOTkEuZi
         SlpNWdTvlqKMNOxTPBryKOS4kifsS49yZKMhJBkvNdLuFx8p7FECGOBGeLR+GcG0f4+/
         HlTIX4d3AduCpImbSMdOLTD3FUcrSKv/WoMAIOnsfc6n9g10sUYWL54WnfcL0Yr7OFqz
         apNuMVGewNAYwwcKjCSZyXezr3z4abtiwPviE5vW/XiJDKSLxtyEI3O2caTkkS7xwSge
         8G33pzahApiYulPGRbhlFDG5WOI+QaC4bgRijPgYI+2PQRvQubkC951P1xATHycJuVe7
         Gykg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688462645; x=1691054645;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EYIjcYd0M4lTUsB4kYeEdkpMy9Eej5fkZ3yOCzm/oWE=;
        b=gStMA+13Sr9+pqnEkKuR+RVrCXWsOec16GuL3NgMdr+GtXYyUE8zt+yvCDjlCisPqE
         SSMFzCoYeNaLEwl9dWvqKbZnt5BnGpyjJuYIQUvNVokexyHU6gKCHXSLKzu/d7s2/3ZO
         bZWCfbtrFphv9S0zMiN10tuh8eVhPfQwExwCoWZYviXvirXloKPUOBnGL+NtM93ux0V9
         chD7QSE+z/syH337EOIkD42S/eGvo2mK+57Kau/eKt8Lysj7FApO16em+Rvisj4L3uGr
         EMjbkdJaOXoFk2Z0iCOYNW9L6D0x4VIDRNLK/0kJiy6Fl0Fy4/7mChsBfIpytu34O35F
         uM8g==
X-Gm-Message-State: ABy/qLYLdIQGgVug3Dn+wNa21FtvV3ev+EkaH//5Um3IuSnU8Sq0d12I
	cG0MHl51hcSl3H8lnIAYH8YfL+5xfE/t1A==
X-Google-Smtp-Source: APBJJlEJQ88uw2YdAOfN0X9YoOjJalvrsZl+ojYajhYSJhmAfb4fR3k7V4MiErPFigsoTBAwgOMFtg==
X-Received: by 2002:a05:6402:6da:b0:51e:fa7:a292 with SMTP id n26-20020a05640206da00b0051e0fa7a292mr3432182edy.12.1688462645011;
        Tue, 04 Jul 2023 02:24:05 -0700 (PDT)
Received: from [129.214.122.111] ([165.225.94.231])
        by smtp.gmail.com with ESMTPSA id z2-20020a50eb42000000b0051bf17d7710sm11569738edp.57.2023.07.04.02.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 02:24:04 -0700 (PDT)
Message-ID: <9e2b277f4e7aa4573dc19e79fdd71189302a2551.camel@gmail.com>
Subject: [RFC] devtool IDE plugin
From: adrian.freihofer@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com, Andrej Valek <andrej.valek@siemens.com>, 
	ross.burton@arm.com, peter.kjellerstedt@axis.com, pbarker@konsulko.com, 
	richard.purdie@linuxfoundation.org
Date: Tue, 04 Jul 2023 11:24:03 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 09:24:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183819

Hi

On
https://www.yoctoproject.org/community/yocto-project-engineering-request-fo=
r-quotation/
there are some proposed areas of development for the Yocto Project. I
think I have a first draft implementation available for "VSCode IDE
Integration =E2=80=93 New developer tooling".

It's available on my branch in poky-contrib:
https://git.yoctoproject.org/poky-contrib/log/?h=3Dadrianf/devtool-ide.
Just let me know if patches are preferred over this link.

A brief summary how it works:

Prepare the eSDK (not the installer, just the bitbake environment)
$ . oe-init-build-env
 =20
Add this to the local.conf

IMAGE_CLASSES +=3D "image-combined-dbg"
IMAGE_GEN_DEBUGFS =3D "1"
IMAGE_FEATURES +=3D "ssh-server-dropbear bash-completion-pkgs"
IMAGE_INSTALL:append =3D "\
cmake-example-ptest meson-example-ptest gdbserver"

$ devtool modify cmake-example
$ devtool ide cmake-example core-image-minimal
$ runqemu

Start VSCode
$ code "$BUILDDIR/workspace/sources/cmake-example"

Work in VSCode, after installing the proposed plugins
Ctrl + Shift + p, cmake Select Configure Preset
Ctrl + Shift + p, cmake Build
Ctrl + Shift + p, cmake Test
...

Remote debugging with GDB
Ctrl + Shift + p, Run Task --> install && deploy-target cmake-example
F5 (Debug configuration might be selected before)=20

The same should work for meson.


The design goal is to generate a configuration for VSCode (or other
IDEs) that allows to develop the code of a recipe completely
independent from bitbake. bitbake is only needed to generate the
configuration and update the SDK. But bitbake should not be called
while working in the IDE. This has two major advantages over calling
devtool build, for example:
 * The IDE offers plugins e.g. for integration with cmake. These
   features are usable, which would not be the case if bitbake or
   devtool were called from the IDE.
 * It is much faster.

If devtool ide is called for a recipe like none, meta-ide-support a
cmake-kit
https://vector-of-bool.github.io/docs/vscode-cmake-tools/kits.html is
added to the User-Local Kits.


There is still a lot of room for improvement and TODOs in the code. But
I would like to share my current status with you now. Who knows, maybe
someone is interested in trying it out or even contributing in some way
so that we can get it into poky before the next LTS release.

Regards,
Adrian

