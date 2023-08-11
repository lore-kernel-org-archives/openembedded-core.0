Return-Path: <luca.boccassi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FBE0C0015E
	for <webhook@archiver.kernel.org>; Fri, 11 Aug 2023 12:57:13 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web11.41977.1691758626372468383
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Aug 2023 05:57:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=rkgzsy80;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: luca.boccassi@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-58688a0adbbso22036187b3.0
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Aug 2023 05:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691758625; x=1692363425;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tm/iK8pS4DRQ3jb277MhKNZ3P8evmVcTIaZrVNcz/nI=;
        b=rkgzsy80RhWOx0eNO+OaGv/+iAbDfzP0OTfPEEg1s3UMgUbtxDjIeWbEgNpVdXZl4X
         A31Mkk1ZH90R+3wqpK4ofum9muGAsJcDMog00gVCAedPYyLLqDvmELwK8pFpLt3klWEm
         EmDjXqoC/e3SLmj7ovzS9hL5omvaIwrUsbQGTt8sTmlD68H0WBJcptm3Bcz/EZDGVVgi
         AHpqZ5pTFB2hQ8lhAbzK3he97wYzhQjfB+hVapziBvd9Vbzundwi3d3Trq5a9euAfaSz
         8zA0isitUzf6zF+/LmdmSTEph6oGNtI5MBztN2mlLSRXf98MOikXbipntYK/m3oNVlIk
         6ViQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691758625; x=1692363425;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tm/iK8pS4DRQ3jb277MhKNZ3P8evmVcTIaZrVNcz/nI=;
        b=bQT2n4vOPAoQe/ABArKRhUhC7sbzTHWIlJNIvmJQhuaYhKWVze/rvKry0chPQlXXS3
         u6r8yQ6zIYyjTG/rT3B3oPx6qL5Fxc/faA263Q5tCaQVBm6QyVR768+BplZ9+4G6z8Un
         d9odrR59CDuaNam0xgD9LgRpv8doGaPz23319MCk68ukRcEClXBQ6Ra2fsQeC2+Z18Jz
         oo5v0W6Xn4pTw/r7A6oLVy/snUMQ2ltovHHQh3z4GT79cME0mbEjdzYSuqccx0yoYcTJ
         6dKqnbe1enEUCiIqKbNhLVDYjIC2bTo4UWMKRFusyuYSp2bqZJ1Z8WPxPOlYRYmkg92a
         txNw==
X-Gm-Message-State: AOJu0YwKQrs2plCkz/S2VUbc8ns1iUxMBt5x1kuTxztXelsjZWWVP6hG
	SLcDJok7BSnU4A1TeGEMiVAV3FG7GcHEXhOzVFnTiY1rU48=
X-Google-Smtp-Source: AGHT+IHC1AbcZq7uh65p/iHiffKfjtKzKwL5YPM8wP5UfjFieZ/0rQonoauHxP+iEzGh7htXv4xqzocW0ikFdd+5qNs=
X-Received: by 2002:a0d:c787:0:b0:575:4b1c:e5f0 with SMTP id
 j129-20020a0dc787000000b005754b1ce5f0mr1637813ywd.32.1691758625422; Fri, 11
 Aug 2023 05:57:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230805110643.2708376-1-luca.boccassi@gmail.com>
 <20230805213551.2737605-1-luca.boccassi@gmail.com> <5f41037241c33cd4cc36807f6be271007f1a8127.camel@linuxfoundation.org>
In-Reply-To: <5f41037241c33cd4cc36807f6be271007f1a8127.camel@linuxfoundation.org>
From: Luca Boccassi <luca.boccassi@gmail.com>
Date: Fri, 11 Aug 2023 13:56:53 +0100
Message-ID: <CAMw=ZnTQMqG1K2XZVvjCyWYKkG6LwUqs0EL4H3f-CvNBsqmw_A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] systemd: add usrmerge to REQUIRED_DISTRO_FEATURES
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, raj.khem@gmail.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Aug 2023 12:57:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185840

On Fri, 11 Aug 2023 at 13:24, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Sat, 2023-08-05 at 22:35 +0100, Luca Bocassi wrote:
> > From: Luca Boccassi <luca.boccassi@microsoft.com>
> >
> > Support for unmerged-usr is deprecated upstream, taints the system and
> > has been removed for v255 (next release).
> > Enforce building merged-usr images when using systemd. This allows one
> > release cycle where it can be tested for any remaining issue, and can
> > still be overridden, before it stops working completely.
> >
> > Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> > ---
> > v2: rearrange so systemd-boot.bb is left as-is for now
> >
> >  meta/recipes-core/systemd/systemd-compat-units.bb      | 3 ++-
> >  meta/recipes-core/systemd/systemd-conf_1.0.bb          | 3 +++
> >  meta/recipes-core/systemd/systemd-machine-units_1.0.bb | 3 ++-
> >  meta/recipes-core/systemd/systemd-serialgetty.bb       | 3 ++-
> >  meta/recipes-core/systemd/systemd_254.bb               | 6 +++++-
> >  5 files changed, 14 insertions(+), 4 deletions(-)
> >
> > diff --git a/meta/recipes-core/systemd/systemd-compat-units.bb b/meta/recipes-core/systemd/systemd-compat-units.bb
> > index 55ebf99117f..75b1045728a 100644
> > --- a/meta/recipes-core/systemd/systemd-compat-units.bb
> > +++ b/meta/recipes-core/systemd/systemd-compat-units.bb
> > @@ -14,7 +14,8 @@ INHIBIT_DEFAULT_DEPS = "1"
> >
> >  ALLOW_EMPTY:${PN} = "1"
> >
> > -REQUIRED_DISTRO_FEATURES = "systemd"
> > +REQUIRED_DISTRO_FEATURES += "systemd"
> > +REQUIRED_DISTRO_FEATURES += "usrmerge"
> >
> >  SYSTEMD_DISABLED_SYSV_SERVICES = " \
> >    busybox-udhcpc \
> > diff --git a/meta/recipes-core/systemd/systemd-conf_1.0.bb b/meta/recipes-core/systemd/systemd-conf_1.0.bb
> > index 61ce7939d3a..2355936631e 100644
> > --- a/meta/recipes-core/systemd/systemd-conf_1.0.bb
> > +++ b/meta/recipes-core/systemd/systemd-conf_1.0.bb
> > @@ -5,6 +5,9 @@ DefaultTimeoutStartSec setting."
> >  LICENSE = "MIT"
> >  LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> >
> > +inherit features_check
> > +REQUIRED_DISTRO_FEATURES += "usrmerge"
> > +
> >  PE = "1"
> >
> >  PACKAGECONFIG ??= "dhcp-ethernet"
> > diff --git a/meta/recipes-core/systemd/systemd-machine-units_1.0.bb b/meta/recipes-core/systemd/systemd-machine-units_1.0.bb
> > index 12f27d6ae30..7e59e86f9be 100644
> > --- a/meta/recipes-core/systemd/systemd-machine-units_1.0.bb
> > +++ b/meta/recipes-core/systemd/systemd-machine-units_1.0.bb
> > @@ -7,7 +7,8 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
> >
> >  PR = "r19"
> >
> > -inherit systemd
> > +inherit systemd features_check
> > +REQUIRED_DISTRO_FEATURES += "usrmerge"
> >  SYSTEMD_SERVICE:${PN} = ""
> >
> >  ALLOW_EMPTY:${PN} = "1"
> > diff --git a/meta/recipes-core/systemd/systemd-serialgetty.bb b/meta/recipes-core/systemd/systemd-serialgetty.bb
> > index fd888bb8340..c2c67e6fe08 100644
> > --- a/meta/recipes-core/systemd/systemd-serialgetty.bb
> > +++ b/meta/recipes-core/systemd/systemd-serialgetty.bb
> > @@ -14,7 +14,8 @@ S = "${WORKDIR}"
> >
> >  # As this package is tied to systemd, only build it when we're also building systemd.
> >  inherit features_check
> > -REQUIRED_DISTRO_FEATURES = "systemd"
> > +REQUIRED_DISTRO_FEATURES += "systemd"
> > +REQUIRED_DISTRO_FEATURES += "usrmerge"
> >
> >  do_install() {
> >       if [ ! -z "${SERIAL_CONSOLES}" ] ; then
> > diff --git a/meta/recipes-core/systemd/systemd_254.bb b/meta/recipes-core/systemd/systemd_254.bb
> > index 7ba4233f6a2..3fa49122cd6 100644
> > --- a/meta/recipes-core/systemd/systemd_254.bb
> > +++ b/meta/recipes-core/systemd/systemd_254.bb
> > @@ -10,9 +10,13 @@ SECTION = "base/shell"
> >
> >  inherit useradd pkgconfig meson perlnative update-rc.d update-alternatives qemu systemd gettext bash-completion manpages features_check
> >
> > +# unmerged-usr support is deprecated upstream, taints the system and will be
> > +# removed in the near future. Fail the build if it is not enabled.
> > +REQUIRED_DISTRO_FEATURES += "usrmerge"
> > +
> >  # As this recipe builds udev, respect systemd being in DISTRO_FEATURES so
> >  # that we don't build both udev and systemd in world builds.
> > -REQUIRED_DISTRO_FEATURES = "systemd"
> > +REQUIRED_DISTRO_FEATURES += "systemd"
> >
> >  SRC_URI += " \
> >             file://touchscreen.rules \
>
> FWIW I tried multiple runs of this through the autobuilder and tracked
> down all the places this needed fixing so the test work. Once those
> fixes merged, I was able to merge this.

Very nice, thank you!

Kind regards,
Luca Boccassi

