Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBCE1D3B7F2
	for <webhook@archiver.kernel.org>; Mon,  8 Dec 2025 15:39:42 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10713.1765208380867730215
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Dec 2025 07:39:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=APuTZWWy;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-594330147efso4977713e87.2
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Dec 2025 07:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765208379; x=1765813179; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6iP30lDdqnG1EuAl6BsVNh1SeScouN4EoYW4IZoRyuc=;
        b=APuTZWWyO1W1deD6yrkBv/4W80W5TZv377btUouTDl+UmNJ9ZwaxXjVecPtrZC5sW/
         TB6a+7WqFXjSMihuaqgw5pCAyvOw+ReHnDOs0BmPjIGaseRJ7nPJ1wryGfmEITkw7k7t
         g+UnQlLrdaXpUUGX9N56Vbva2Rrxcjhl5wVA0kXvo/8RDbTncBh58AAeLF6frK2LHRy+
         FWE5FfTM8vGQW6ypLrX9BFxLH3/W5gwqHjX7DmAeMNRxb0zA72EBEZC+bxnau2XkUVDd
         HgcUtaUHsJ7vBh++Sf/zKiAa4hXS2XtFBHE04HKFtUSCbD5dv3GlsrWp9CB+4DTAMuTi
         kfRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765208379; x=1765813179;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6iP30lDdqnG1EuAl6BsVNh1SeScouN4EoYW4IZoRyuc=;
        b=Sgca3Fpbk0KH4cMdnmYGDmdFWnQNEWkWsTk5b8Jnx81Y5cl5S1w0NXm+CEragu+FSb
         zQTzXmzjU4pHzFlL0et+HNekQl9F9RxslRBAXbt0WAFtK5aU6HsAcTNRT1jn0dXnPcG8
         OBTFFEF18WZPyIozMMuukm6PZ9QnUCewaC916ZOsU/Abt62KLjOPlxdmiXBtE9fdfElE
         56+z81DTQRZIgKeOJ8fVjrmVHndrAFnMyc5TwV7EQEmYCPCfy/8Xbd2iZlJaVcdVjfya
         tWXxwtvtcQPuQBKZNdDBOVL+c5CyAeIRr0EVjEssO7c0mTKsgqobF8jV285jN9EcEj6C
         swIQ==
X-Gm-Message-State: AOJu0Yw+azJiDP6yF8eXJB4/bIgEnETLGA3VUlE0DpN0sndVwPf3sjZ7
	e2k22klEtthYGo2dHSuVhxrRMtj8bbQ/kn/Z39hvEjQugd74Uho1+q/AUiIKDycJJjY+3aUUqjk
	JucGeo8IRENG4MFctMS/DQvKYWlzDn31t9Q==
X-Gm-Gg: ASbGnctM386W1Z+jY892OUxIMTCUhUs7ZxusT239LebRmLua35xgcwOsVquXoobpAc8
	8PtmG+l1FCebLFVeTDy26nCGXA6jsBAPZsy/kP+SLrtmxEvVL4XP02B620J47OV3ZLyzpWan15Q
	QcPN40bW6EdxaQSkrFzZ8oHNTDvmwyFAwZgZ2op6wNxFXE4YhEIF8g7P1nUODGihwopvAzaZ7pg
	GRIeg0N0cgU1fDiAh/0V+3icbmRoAs9wmhv25rFAEfvFQJb0xqABNsvs1GcbcW27LsLK+jgBy/5
	rb4ED+JTxtGQ6kzCBmNBo446
X-Google-Smtp-Source: AGHT+IH55ow9q08/mgb05cQFE6g09KfB74VFI0meQ7rEKSqGS18qT/BKkwLBjGuWUP5mqL1tWSycIh+d33jA81XvLhg=
X-Received: by 2002:a05:6512:3da3:b0:594:2f25:d488 with SMTP id
 2adb3069b0e04-5987e8a1532mr3041339e87.21.1765208378256; Mon, 08 Dec 2025
 07:39:38 -0800 (PST)
MIME-Version: 1.0
References: <a83fbc50-c122-a60e-176d-9c492664fb2d@crashcourse.ca>
In-Reply-To: <a83fbc50-c122-a60e-176d-9c492664fb2d@crashcourse.ca>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Mon, 8 Dec 2025 15:39:26 +0000
X-Gm-Features: AQt7F2o584f58gLNFrFjFnHJ9WfKPxVTFE6Zc9eDnO0EhXcGn9N022KoPzo_vZE
Message-ID: <CAO5Uq5TGQzSksy6V2LOGqDtvtiSR7_GG5puZc=_FtG3jZSvbtA@mail.gmail.com>
Subject: Re: [OE-core] is there any reason for a ptest-enabled recipe to
 conditionally SRC_URI run-ptest?
To: rpjday@crashcourse.ca
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Dec 2025 15:39:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227397

On Mon, Dec 8, 2025 at 12:39=E2=80=AFPM Robert P. J. Day via
lists.openembedded.org <rpjday=3Dcrashcourse.ca@lists.openembedded.org>
wrote:
>
>
>   working on a tutorial for ptest and i ran across an oddity under
> meta-openembedded, not sure if it means something or is just leftover
> cruft from days gone by. i found three recipes with the following
> construct (reformatted slightly for visual aesthetics):
>
> $ grep -r "PTEST_ENABLED.*run-ptest" *
>
> meta-oe/recipes-dbs/mysql/mariadb_11.4.9.bb:SRC_URI +=3D
> "${@bb.utils.contains('PTEST_ENABLED', '1', 'file://run-ptest', '', d)}"
>
> meta-oe/recipes-devtools/lapack/lapack_3.12.1.bb:
> ${@bb.utils.contains('PTEST_ENABLED', '1', 'file://run-ptest', '', d)} \
>
> meta-oe/recipes-support/re2/re2_2024.03.01.bb:
> ${@bb.utils.contains('PTEST_ENABLED', '1', 'file://run-ptest', '', d)} \
>
>   all three recipes check whether PTEST_ENABLED =3D 1 before adding
> file://run-ptest to SRC_URI.
>
>   is there any reason for this?

All three gained ptest support in 2023, two from the same author... my
money's on copy and paste from another recipe.

> all three recipes inherit ptest, so it
> seems that they *must* provide a run-ptest file. and even if one does
> not enable that setting with DISTRO_FEATURES +=3D "ptest", if a recipe
> inherits ptest, does that not *require* that recipe to make sure a
> run-ptest file is available if called upon? or am i misreading
> something?
>
> rday
>
> p.s. i might ask a similar question about this snippet from
> ptest.bbclass:
>
>     do_install_ptest_base() {
>         if [ -f ${UNPACKDIR}/run-ptest ]; then
>             install -D ${UNPACKDIR}/run-ptest ${D}${PTEST_PATH}/run-ptest
>         fi
>
> if run-ptest does not come from UNPACKDIR, where would it come from?
> might the recipe generate that file dynamically upon package creation?
>

The golang classes do exactly that.

> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#227392): https://lists.openembedded.org/g/openembedde=
d-core/message/227392
> Mute This Topic: https://lists.openembedded.org/mt/116674580/3618097
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kiernan@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
Alex Kiernan

