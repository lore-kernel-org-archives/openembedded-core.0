Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD5A1C25B74
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 10:08:43 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.16153.1716286114061440519
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 May 2024 03:08:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k+34htEK;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-51fcb7dc722so4729233e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 03:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716286112; x=1716890912; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DBhMOQ3erWY3eQPeb6Lvedt2nCbl2nRUkfNbT430SFI=;
        b=k+34htEKCK4S02y0B4Su3zQNQC0H2sCC/WMfJG3qiaq6gyucvHwCeTNlAgymkcQCke
         baArZWax7+5WmcfOEdYopqUYV2z8d1iYwAzRAqaAHqge0OXPTv2B/yRXg5ewJ38MDIxd
         WVOzxZiSjgNJ7knNslmj3Y9IjFKbmrtkOswjvSmDIwB21EGVOC+A4IFwXPrfzkZaZozs
         3UP6y5MloDnqZQ7mulQDKJ23JDDgs/CFyeeV5g/wx2aRwPwvPG7UTA6kzWM3nFX84TXX
         vIAZHBfo3dziQfEN7q/WQcRwzEyPaGjI+Z5VPjEiDefYRD5R3FZBi8D+lFbJTQ+2rbsz
         vhYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716286112; x=1716890912;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DBhMOQ3erWY3eQPeb6Lvedt2nCbl2nRUkfNbT430SFI=;
        b=aHZDgH5NkVffpyFzdN0bq3mGwFwAm/pzdOuuDKMoVRqnJGfWD9+zOcAh4UwrCr8G4q
         G84M5haXJ7nM7BqDiU/jlYwZUPAcaEz1VciGkwQN9bz8ZdzH2vnBnb8g3Xz6TyvLlEvD
         AHXRtxNtBDml9kqlBSP/0LwJDhhY2brnHFgFsjbzKCAARxe+9wWzwRK4ZNdXyodjJkil
         qQbrztDWc10rSHs0JAJRt5pXqXR8qSLt8TbBg8esVvCToDRNDVZaR4su/63uZ3b9gma9
         36sIVje4aySuqEbLoTScf1GKYN8zcsz2DiiB1S6+AWVZ3a8xBEgZhOi+MUC9jRnynmIW
         d0VQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeeYD5WwocAIp/6ItYVn0oz/OXfpNj08/nc5IjYvUtWWGZXOX/WcCyp31cmq8SqB8vpCkXn1EhpanX15JLOoOFXqO1KJQC2m8TcCVbJpYdOjGYriJ+FGsA
X-Gm-Message-State: AOJu0Yy+zDb7f2nTZf2C1/e7P8nI+e/wpM/OVnt1ABcmwXMQfqUmXdfi
	qBW0YFydSy/PaJh2piZadxU9ycePKU0qgCAcnU7/4YXEGhF6nY6QS7Ekxw71Dc5eFDHWsFbPkFI
	xRTDqga4t8fLX47qtqtzWKCO2WbI=
X-Google-Smtp-Source: AGHT+IHFlIIeQeIX4ZKfJ7okxHCGHV31hnubXj6RErLsI9MasVLeBdNmwdtevvJTI04Sl0WNBAm0dbcNS6Ueq7ptJKI=
X-Received: by 2002:a19:e00d:0:b0:51d:534d:cb6c with SMTP id
 2adb3069b0e04-52407557cc7mr2814167e87.0.1716286111851; Tue, 21 May 2024
 03:08:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240515223500.3464486-1-johannes.schneider@leica-geosystems.com>
 <20240517183303e2ef2f5d@mail.local> <PAXPR06MB753497DD9AA695D02CCC14ACBCEF2@PAXPR06MB7534.eurprd06.prod.outlook.com>
In-Reply-To: <PAXPR06MB753497DD9AA695D02CCC14ACBCEF2@PAXPR06MB7534.eurprd06.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 21 May 2024 12:08:20 +0200
Message-ID: <CANNYZj_AFFjy6LBhEooLoud1bZuMY5LKD-MajZ+Jo0yQmtGyTw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v9 0/3] pkg-database and systemd-sysext image
To: SCHNEIDER Johannes <johannes.schneider@leica-geosystems.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 10:08:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199608

If you scroll further up, there's:

2024-05-16 22:05:57,101 - oe-selftest - INFO - FAIL:
imagefeatures.ImageFeatures.test_image_gen_pkgdbfs_ipk
(subunit.RemotedTestCase)
2024-05-16 22:05:57,102 - oe-selftest - INFO -
----------------------------------------------------------------------
2024-05-16 22:05:57,102 - oe-selftest - INFO -
testtools.testresult.real._StringException: Traceback (most recent
call last):
  File "/home/pokybuild/yocto-worker/oe-selftest-armhost/build/meta/lib/oeq=
a/selftest/cases/imagefeatures.py",
line 344, in test_image_gen_pkgdbfs_ipk
    result =3D runCmd(cmd)
  File "/home/pokybuild/yocto-worker/oe-selftest-armhost/build/meta/lib/oeq=
a/utils/commands.py",
line 212, in runCmd
    raise AssertionError("Command '%s' returned non-zero exit status
%d:\n%s" % (command, result.status, exc_output))
AssertionError: Command
'/home/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-4137794/tm=
p/sysroots/aarch64/usr/bin/opkg
--volatile-cache
--offline-root=3D/home/pokybuild/yocto-worker/oe-selftest-armhost/build/bui=
ld-st-4137794/tmp/deploy/images/qemuarm64
--add-arch qemuarm64:11 --add-arch qemuarm64:12 list-installed'
returned non-zero exit status 255:


Also note that this happened only on the arm host, and not on x86
hosts. Which does make it tricky to reproduce, but at least gives a
lead:
https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6921

Alex

On Sat, 18 May 2024 at 08:30, SCHNEIDER Johannes
<johannes.schneider@leica-geosystems.com> wrote:
>
> Hoi Alexandre,
>
>
> is there a way to get more output out of the autobuilder?
> the logs only tell "that" the test failed, not "why" =3D which assertion =
was missed
>
> if i run the test locally with the differing variables set like this:
> #> SDKMACHINE=3Daarch64 MACHINE=3Dqemuarm64 oe-selftest --verbose -r imag=
efeatures.ImageFeatures.test_image_gen_pkgdbfs_ipk
>
> it succeeds :-S
> ... ideas/thoughts?
>
>
> gru=C3=9F
> Johannes
>
> ________________________________________
> From: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Sent: Friday, May 17, 2024 20:33
> To: SCHNEIDER Johannes
> Cc: openembedded-core@lists.openembedded.org; richard.purdie@linuxfoundat=
ion.org; alex.kanavin@gmail.com
> Subject: Re: [OE-core] [PATCH v9 0/3] pkg-database and systemd-sysext ima=
ge
>
> This email is not from Hexagon=E2=80=99s Office 365 instance. Please be c=
areful while clicking links, opening attachments, or replying to this email=
.
>
>
> Hello,
>
> deb and rpm seem successful but ipk still fails:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/3335/s=
teps/14/logs/stdio
>
> On 16/05/2024 00:34:57+0200, Johannes Schneider via lists.openembedded.or=
g wrote:
> > systemd-sysext allows to overlay another image (or multiple) ontop of
> > a "base-image" =3D the current rootfs, via the use of overlayfs; to add
> > tools and features meant for development purposes.
> >
> > To quote the documentation on systemd-sysext:
> > " ...addition in order to make debugging/development easier). System
> > extension images should not be misunderstood as a generic software
> > packaging framework, ..."
> >
> > To build a lean image, that only holds packages that are not already
> > part of the base-image, a snapshot of the package-database is taken
> > after the installation of the base-rootfs is done, and picked up again
> > when collecting the rootfs of such a extension image.
> >
> > with all this in place an example usage could look like this:
> > some-core-image.bb
> >   inherit core-image
> >   IMAGE_GEN_PKGDBFS =3D "1"
> >
> > extending-image.bb
> >   inherit image-sysext
> >   IMAGE_FSTYPES =3D "squashfs"
> >   IMAGE_BASE_PKGDB =3D "some-core-image"
> >   # the above pointing at a package-db similar to:
> >   # build/deploy/images/$MACHINE/some-core-image-$MACHINE-2024021017230=
5-pkgdb.rootfs.tar.gz
> >
> > then on the device, running some-core-image, with the extension image p=
laced at FN:
> > $> ln -s "$FN" /run/extensions/$(basename $FN).raw
> > $> systemd-sysext list
> > $> SYSTEMD_LOG_LEVEL=3Ddebug systemd-sysext merge
> >
> > As long as the VERSION_ID of the extension image matches the os-release
> > in the base image, the above commands return sucessfully;
> > for details on the compativility check see the docs for systemd-sysext.
> >
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > changes with v2:
> >         rebase from 'kirkstone' onto 'master'
> >
> > changes with v3:
> >       incorporate review suggestions for simplification
> >       add task dependency handling
> >       add oe-selftest for the pkgdb handling
> >       add variable documentation and
> >       some more comments, and examples in the commit-msg
> >
> > changes with v4:
> >       rebase onto 'master' =3D> no functional changes
> >       fixed patchtest findings
> >
> > changes with v5:
> >         rebase onto 'master'
> >       add '.sysext' to the deployed symlink name
> >         sidenote on the tests and autobuilder failure: run locally they=
 succeed, e.g.:
> >           #> oe-selftest --verbose -r imagefeatures.ImageFeatures.test_=
image_gen_pkgdbfs
> >
> > changes with v6:
> >       tests: restructure to call 'bitbake' only once in the testcase it=
self
> >         (in hopes of solving the autobuilder problem; local test runs s=
ucceed)
> >
> > changes with v7:
> >         tests: undo the restructuring of done in v6, in favour of expli=
citly forcing steps:
> >         '-c rootfs -f'.  since concurrency of the autobuilder, and reus=
ing artifacts/sstate-caching is probably the issue?
> >
> > changes with v8:
> >         tests: fixed missing feature=3DPACKAGE_CLASSES during 'test_ima=
ge_gen_pkgdbfs'
> >          which is now split into three, one for each of the three avail=
able packagemanager: ipk, deb, rpm
> >
> > changes with v9:
> >       tests: fix singular failure in 'oe-selftest-armhost'
> >          which was due to the built image not containing a 'kernel-imag=
e...', which the gen-pkgdb sanity
> >          check expected, but 'packagegroup-core-boot' instead
>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#199430): https://lists.openembedded.org/g/openembed=
ded-core/message/199430
> > Mute This Topic: https://lists.openembedded.org/mt/106124365/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
alexandre.belloni@bootlin.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com/

