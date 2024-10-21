Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7068ED0E6E6
	for <webhook@archiver.kernel.org>; Mon, 21 Oct 2024 10:26:27 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.42823.1729506382903448907
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Oct 2024 03:26:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XrkThtF1;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-539e63c8678so5078026e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Oct 2024 03:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729506381; x=1730111181; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TJTJ2fUJcJVVeVbAzjOAGN63+4132v3rtzst8zhZHeI=;
        b=XrkThtF1+RLn0YjJfo2aJ8xHUxbqAKTZOiBfwVMyjiyMnZN2jpnMB1OLyeWxFRI4Qa
         Aq6htKJgzCtM6aUXGPILsFxu0C/3UzwnknSLHdfntEba8F8JickISLe9wpRBhooOs+ox
         9LHybACX0suozUpQCybt4Ssr57mu2JlrXRaQceZMyMWoEYnhr0Lf2VI8aeVIyjGsbqfE
         JQgL5hwOxrWGqpOPUzd5XuukYprmSYEzacWmc1XzzxiWKsrnWBpOb/bEqeoYuce2iIUa
         0gKrcExXyVFpBYKNdOmw9EED+lLtwe/2j2rz9iJ99diZzCvy2v9OMMxza2mcTOWJDiRl
         pNCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729506381; x=1730111181;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TJTJ2fUJcJVVeVbAzjOAGN63+4132v3rtzst8zhZHeI=;
        b=q2ySe5IIeNBZekQGAq32sL39HIr8kwfDtz6CrUntb/LudCWunW3Gn/CwtCEfqUHaN3
         e8akA3Yv/udxjGhGKaBS3dHKgmcS+FIV0y5QxFKKaib6ciG7f96kjwzdpthnV58S6nmC
         92P2XvnhMgI+9jWgr9yms2vVBgMWU+QNTetQB3b2AlUN8kxMZ5kmJZfhdzlk0Dia44yw
         bbnUp8TrcnyRalKI8wBaT/9rQuHmkB3B0Xgj9xdnqRNK8iSDCr5y6t1K7oC+CnTpNjmt
         lls71f781KAsqgCYYeO2KrdAM5lX8Xfcf0XX5ZMwEGFJ7PpXFVCYLeFZXfPbuMKxafPs
         Fhjg==
X-Gm-Message-State: AOJu0Yy8G4GJL6We877c6ZF+9GintjSWCxdTNpAPljscNbRBz/1z6fPL
	IDHAUKm1rwhGPfZgMDKTfAanjRoEIfKBtshYYFMeAvA+crb1UAlmkSq8uVlkv2/AgtMn2w+0C/Q
	BO9CnOdZNDVGnwSo+TCorJIQrlak=
X-Google-Smtp-Source: AGHT+IGZAQgRSGnD/skkNQWAc2L6SEGwtNL+AQiktevPVeQ/16tjv1zRP88GB3UsJc+Mt936JMccC38EuNnvy9sDmJA=
X-Received: by 2002:a05:6512:3d04:b0:539:905c:15ab with SMTP id
 2adb3069b0e04-53a154b1726mr5418860e87.32.1729506380590; Mon, 21 Oct 2024
 03:26:20 -0700 (PDT)
MIME-Version: 1.0
References: <20241019064817.22938-1-mail2szahir@gmail.com>
In-Reply-To: <20241019064817.22938-1-mail2szahir@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 21 Oct 2024 12:26:09 +0200
Message-ID: <CANNYZj8cmL_MfdCahdGq1PsHYzPo94QGHfmrejknGJRnRpZWYg@mail.gmail.com>
Subject: Re: [OE-core][scarthgap][PATCH] alsa-lib: enabling ptest for alsa-lib component
To: mail2szahir@gmail.com
Cc: openembedded-core@lists.openembedded.org, zahir.basha@kpit.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Oct 2024 10:26:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206104

This needs to be accepted for master first, and that submission had
comments that need to be addressed.

Alex

On Sat, 19 Oct 2024 at 08:48, aszh07 via lists.openembedded.org
<mail2szahir=gmail.com@lists.openembedded.org> wrote:
>
> This change adds ptest for alsa-lib.
>
> 1) Removed the test suite execution 'make check-TESTS' call using 'sed' command.
>
> 2) Compiled the test directory source code using "oe_runmake check" command.
>
> 3) Copied all the required binaries into PTEST_PATH using do_install_ptest()
>  function.
>
> Signed-off-by: aszh07 <mail2szahir@gmail.com>
> ---
>  .../distro/include/ptest-packagelists.inc     |  1 +
>  .../alsa/alsa-lib/run-ptest                   | 15 +++++++++++++
>  .../alsa/alsa-lib_1.2.11.bb                   | 21 ++++++++++++++++++-
>  3 files changed, 36 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/run-ptest
>
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
> index 5975db25cc..4fe5ce34e4 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -5,6 +5,7 @@
>  #
>  PTESTS_FAST = "\
>      acl \
> +    alsa-lib \
>      apr-util \
>      attr \
>      babeltrace \
> diff --git a/meta/recipes-multimedia/alsa/alsa-lib/run-ptest b/meta/recipes-multimedia/alsa/alsa-lib/run-ptest
> new file mode 100644
> index 0000000000..b991de145f
> --- /dev/null
> +++ b/meta/recipes-multimedia/alsa/alsa-lib/run-ptest
> @@ -0,0 +1,15 @@
> +#!/bin/sh
> +set -eux
> +
> +for t in config control midi_event client_event_filter client_event_filter
> +do
> +    if "./$t" > "alsa-lib_$t.log" 2>&1
> +    then
> +        echo "PASS: $t"
> +    else
> +        echo "FAIL: $t"
> +        cat "alsa-lib_$t.log"
> +    fi
> +    rm "alsa-lib_$t.log"
> +done
> +
> diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.2.11.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.2.11.bb
> index c212b17aa3..8b4f3baecc 100644
> --- a/meta/recipes-multimedia/alsa/alsa-lib_1.2.11.bb
> +++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.11.bb
> @@ -11,10 +11,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7 \
>
>  SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2 \
>             file://0001-topology-correct-version-script-path.patch \
> +           file://run-ptest \
>             "
>  SRC_URI[sha256sum] = "9f3f2f69b995f9ad37359072fbc69a3a88bfba081fc83e9be30e14662795bb4d"
>
> -inherit autotools pkgconfig
> +inherit autotools pkgconfig ptest
>
>  EXTRA_OECONF += " \
>      ${@bb.utils.contains('TARGET_FPU', 'soft', '--with-softfloat', '', d)} \
> @@ -44,3 +45,21 @@ RREPLACES:alsa-conf = "alsa-conf-base"
>  RCONFLICTS:alsa-conf = "alsa-conf-base"
>
>  BBCLASSEXTEND = "native nativesdk"
> +
> +do_compile_ptest() {
> +        sed -i 's/^.*$(MAKE) $(AM_MAKEFLAGS) check-TESTS.*$/ /' ${S}/test/lsb/Makefile.in
> +        oe_runmake check
> +}
> +
> +do_install_ptest:append() {
> +    for f in control client_event_filter namehint
> +    do
> +        install -m 0755 "${B}/test/.libs/$f" "${D}${PTEST_PATH}";
> +    done
> +
> +    for f in config midi_event
> +    do
> +        install -m 0755 "${B}/test/lsb/.libs/$f" "${D}${PTEST_PATH}";
> +    done
> +}
> +
> --
> 2.17.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#206081): https://lists.openembedded.org/g/openembedded-core/message/206081
> Mute This Topic: https://lists.openembedded.org/mt/109097481/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

