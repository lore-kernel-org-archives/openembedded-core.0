Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4EFDCDB478
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 21:15:12 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7460.1782162904059741125
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2026 14:15:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Uc4XAhZJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: jpewhacker@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-805f5d1a6c3so10831547b3.1
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 14:15:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782162903; cv=none;
        d=google.com; s=arc-20240605;
        b=UFK5BRX+reG/BFTchjHdY+4SuAeJKH9Awa8zi8xkQP/nYUOHV/fxN8bm/YJ/Nb8BH3
         12Rtp6nXArkhFy1HMxoWl3v3pEJGKSGYOduInOPlioICJpCYjQjeFFVhqXLDdiZEyVWy
         AHc81lW/EWzgjVACJZxJav1gHfkCAhuT6GPbShmOGYRjO6mhD7yB0dUYVjm4TSth0lgP
         hQiyl+WLj75YT+UVcDLUDDyQw5tOe0IZkCUvJSTjs8jXAZvePzmXYTlnJJjNAJx4V5q4
         upzC7A23Gg6FBeOMxso27vGyUcMbl5o/8p2+caIGEBG7loDPOQpeifXSgezmeItUEyRx
         XOgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oNQYt6oX0QlQofJM82CIBoW6KKOfDUExSWXKmVH2vJo=;
        fh=TGF7TVa5Eshw5M6K2XLmjdIMKFhrsPaliuC+tv7wzuY=;
        b=UKBDm7uRcRYOzKf9OkclDANf3eLEp9YTzS4+7QPfx6FPy47O4I06OotCG75rxT3kK3
         MFcPZkguClJArkDnr5rKaY0z4gXweYfkP+myUk5jElb20ZoWGTOos4fX+eqGcWO3mmnh
         OPajgMAV4W0tLoP3mOaHWe8fg3UEy/ui3S4kdqRm8F3jJ8TpFtMiFyoHbIi7p1SYvI0V
         HY9yVzemnQwp38jOjGEHusVPFLJ6NebP2/e3/92wrRZ0/y5rh6dXyjmd9xi5XcdPz3Qz
         ywGfPvV5tm/LMHX3T+92ob1ZPDpHZki7mS3djtM9CWZMyBkyQCAUIu9DsqEWebczq25P
         TNZQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782162903; x=1782767703; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oNQYt6oX0QlQofJM82CIBoW6KKOfDUExSWXKmVH2vJo=;
        b=Uc4XAhZJkizQwCvMG4n/8QFhVH2Xy4/iBiKvW8qwYhibKxQAx6e2phgIxbsnIXPrg+
         XRmhNaFVcnT8oiWH/ZFjNRpJBAQ2WqDUh3DoaR5viDesbiUBMHp5fmK32QYLVtdcbdFw
         phIPaZfJn9l2LQ3T+RJ136Fjv2AeWpRI3keznWScu0hTyERVMs6EjSW1YbPvf+W8Ui8t
         +ZgJmGPsZBjmUMkjGzp6kCMuah5o2VIUj8ZdphiGStEQeG5m0WX/vyoQ8Hk7awTUjkF2
         KB9y0UdJ8oSRJM4P+Z6UpTelz0r2QHyfk+T9nfdg8PtKew8tasdSnCfxTph4srYnsflI
         uw7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782162903; x=1782767703;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oNQYt6oX0QlQofJM82CIBoW6KKOfDUExSWXKmVH2vJo=;
        b=UBQyRiWW1i3Y6P9vEovmFZBOBitA4yJK4W96HO6+87nawhLtzZUIC+p8z6TLRP5k9o
         dkSQVOWykAI8y+NLvz2BcCvFAZPCcAWeVX7wHb14J2wnVnx6GymjJwDAdYKACKrqQRhh
         a594NxHjpok7V4oejnx2prtfoV+LLgZnCLbzalewIyM890PVNJkfuI463NSCtIZk2Xtz
         +3diFdIVKyvDw97cW9WiituZ7BJoavjRHVEuGnVN4Jg4tBHwCtIqZhd5laiY91qR1NuZ
         b0mYSSkleON8IYZU44QYpVoiuUz/PvX9bFr9gh3VCarkRCeWyD0Tijh6ce21guQXOwI+
         /cTg==
X-Gm-Message-State: AOJu0YxzJ4hN5medKBJYmcQQXekXccEvKLYy738YY1HaTyIE85lMN1I+
	IYgS9SZGyTRoq5W1Me8QrsUJNmAD9TaQAX+UdR4DF9GAtn/iDSgGlTM1nINvUeSmfdqSu2yPYtU
	MOvHEFgdCZdaEfeslQzZkLZqSMhtpOclXig==
X-Gm-Gg: AfdE7cnVkLgqMAw+YfDvJOa1QQEPuqxgvpR6+gpemyTf8SAW8cM6jZvAwMu/AoHnd2W
	0Q04pH3aW0syB3XGkypFXbWdy2d1qYuQV+gzhUuMpP3NHFM7MsDMAkJgBFxvzH24RwmrNJCRrWH
	Rs+QvTmkWFsbabbZlhSUE1xZ95a6hAzmOlkWEWTqVaGsjR1kVxGA2oble+segoFjrHr143ixfb+
	eG3Ex0nzmuIsPd5NJPFXpJtsPjZku9uZuiC2aAIV08XfRnxc7eS/Eg4Lf43KDyDIrBgTWgXNerd
	F/ILqvid7sw=
X-Received: by 2002:a05:690c:c248:b0:7de:700a:8eb5 with SMTP id
 00721157ae682-806c2e4f52fmr83837b3.32.1782162901938; Mon, 22 Jun 2026
 14:15:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260609222331.1293007-1-JPEWhacker@gmail.com>
 <20260618165032.347436-1-JPEWhacker@gmail.com> <DJEHMH0KYGRH.1BI8DRKQCG0R8@bootlin.com>
In-Reply-To: <DJEHMH0KYGRH.1BI8DRKQCG0R8@bootlin.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Mon, 22 Jun 2026 15:14:50 -0600
X-Gm-Features: AVVi8CdP7Lt78E8I5Za2NUkiJenWZtaYkq50aYE2NnT1O4NxZfxg299UV6AHipI
Message-ID: <CAJdd5GZm27XJuaWYeRJ=bTHePXgr27wmTv+A4=xkn7dUkVWvHg@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2 0/5] Implement SPDX for deploy tasks
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 21:15:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239317

On Sat, Jun 20, 2026 at 11:45=E2=80=AFPM Mathieu Dubois-Briand
<mathieu.dubois-briand@bootlin.com> wrote:
>
> On Thu Jun 18, 2026 at 5:38 PM CEST, Joshua Watt via lists.openembedded.o=
rg wrote:
> > The SPDX use case for file system image has been well defined since SPD=
X
> > was first implemented, however there has always been a desire to also
> > express SPDX output for other non-image deliverables (primarily, those
> > that have a do_deploy task or similar). These types of tasks cannot
> > easily use the traditional method of having a separate SPDX task that
> > runs to create their SPDX output as this causes lots of problems with
> > the way dependencies are specified. Instead, it is desirable for these
> > tasks to directly produce SPDX output that can be consumed by other
> > tasks that depend on them.
> >
> > This patch series adds support for this. Any sstate task that starts
> > with "do_deploy" can now be added to the SPDX_DEPLOY_TASKS list and it
> > will run a postfunc to generate SPDX output that describes what is bein=
g
> > deployed. For classical do_deploy tasks, this is setup to be easy by
> > automatically capturing all the deployed output files in the SPDX data,
> > but other tasks can be added as well.
> >
> > Finally, the do_create_image_spdx task is removed and replaced with a
> > SPDX deploy postfunc using this new system. This means that any task
> > that depends on do_image_complete will automatically also get the SPDX
> > output for the image, simplifying the dependency handling.
> >
> > V2: Fixed SPDX documents missing at SBoM creation time when the
> > documents were not a direct dependency of the SBoM, and were present in
> > a sstate object. Previously, these sstate objects were not restored
> > because they were "covered" by the later sstate tasks, but now they are
> > restored if they are depended on by a task that creates SPDX output.
> >
>
> Hi Joshua,
>
> Thanks for the new version, but I'm still seeing some errors on the
> autobuilder:
>
> ERROR: systemd-boot-259.5-r0 do_deploy_setscene: Recipe systemd-boot is t=
rying to install files into a shared area when those files already exist. T=
he files and the manifests listing them are:
>   /srv/pokybuild/yocto-worker/wic/build/build/tmp/deploy/spdx/3.0.1/core2=
-32/by-task/systemd-boot:do_deploy.spdx.json
>     (matched in manifest-qemux86-systemd-boot.deploy)
>   /srv/pokybuild/yocto-worker/wic/build/build/tmp/deploy/spdx/3.0.1/core2=
-32/deploy/systemd-boot-do_deploy-deploy.spdx.json
>     (matched in manifest-qemux86-systemd-boot.deploy)
>   /srv/pokybuild/yocto-worker/wic/build/build/tmp/deploy/spdx/3.0.1/core2=
-32/by-spdxid-hash/c0/c00d8889d28fc9521178ce481c8e76cfc116eb5f57bb1c1bb7d9d=
98271b16e07.spdx.json
>     (matched in manifest-qemux86-systemd-boot.deploy)
> Please adjust the recipes so only one recipe provides a given file.
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/15/builds/3927
>
> 2026-06-20 11:34:04,962 - oe-selftest - INFO - spdx.SPDX30Check.test_bare=
metal_helloworld (subunit.RemotedTestCase)
> 2026-06-20 11:34:04,963 - oe-selftest - INFO -  ... FAIL
> ...
> 2026-06-20 11:34:04,963 - oe-selftest - INFO - testtools.testresult.real.=
_StringException: Traceback (most recent call last):
>   File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/opene=
mbedded-core/meta/lib/oeqa/selftest/cases/spdx.py", line 155, in test_barem=
etal_helloworld
>     self.check_objset_missing_ids(objset)
>   File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/opene=
mbedded-core/meta/lib/oeqa/selftest/cases/spdx.py", line 73, in check_objse=
t_missing_ids
>     self.assertTrue(
>   File "/usr/lib/python3.11/unittest/case.py", line 715, in assertTrue
>     raise self.failureException(msg)
> AssertionError: False is not true : The following SPDXIDs are unresolved:
>   http://spdxdocs.org/openembedded-alias/by-doc-hash/de503ed2af15b13f05a8=
f9025f181bbb421f080060947c2e31b480bd76d017b7/linux-libc-headers/UNIHASH/rec=
ipe/linux-libc-headers
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/4105
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3936

Mathieu, I looked at these links, but they do not seem to be related
to the error you listed; are they perhaps wrong? If so can you provide
the correct links?

Thanks

>
> Can you have a loot at the issue?
>
> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

