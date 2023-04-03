Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BE8AC761A6
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 17:45:56 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.78377.1680543954376143913
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Apr 2023 10:45:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=oLL2++4o;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.52, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f52.google.com with SMTP id eh3so120477153edb.11
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Apr 2023 10:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680543952; x=1683135952;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h1h3zStMerqJb3M6B8DcCY19uJM02kCNuEggAPCDtPA=;
        b=oLL2++4ojRlLDggck7ALFY6ZWk99rEDLBWv0LYeRShncwHQnfPP0+p2GE+NrsNhl2P
         YpZj0Al34Ove5UdaVU/adaFWd4N9UtvLAwLoUd72aTtTiYw2zb4j8ULG2uMND6O9Ez+r
         51ElxPr7Kgon5vvkKvnaPm7Wkk1uobL6lc+zZgogxfXUT71uAKKmmhcIzvkFAPS0rHd+
         O2uRtSaLn+eP+AR6iFuf9on8mKmJpoRDteQP+T2vejlHVTJkUCUOuF47yidd9hCJlqa4
         yn7UHn0JT3djouPCCrnKXC1IaQTsZKi1eEj1hXzmxQDrjcSOcqYzAv1z2lVR6EMP2WoM
         u08w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680543952; x=1683135952;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h1h3zStMerqJb3M6B8DcCY19uJM02kCNuEggAPCDtPA=;
        b=DADiaALL5zeKS1Rlzc89h6wJdh0FQ89pIKeXC8W3h0m2s76t4AlSk2SNFXFlJP+KRl
         JJXS4OmO7okIWXJiPatJBXhGhywZDB1XWJ8X9dxvO0XZLhFgF3ACH393XJVgbCZgTgqh
         L8lJQ6mBUAWwIq+5WoU6J4OQnJGtNeo4Oq+yFQDOmhaWIrnRxRNFnqKel4W/BxqBIckb
         ohlgHVoM1lhvQlQHiGJIBQ0bDevCNu2w2JIvX2Mz+oEzjcVWf91/RkbWJLDGFIjs6qFB
         354M7+f/OQImQHBzkT4h4MvUJhmdXRkV0ts+P5llsbPGQUy81Ff24sfmt4lwJ6hpZ4Bb
         xrdw==
X-Gm-Message-State: AAQBX9dxBzaCWIzoV1KZISbYwdog0heR3FgCiF/tMTiNkpOfrANSSigA
	u6Dk0d3Nx5R5OuvU5V3cc8DXIOKEtZLC2YETY393ng==
X-Google-Smtp-Source: AKy350a4/hAwt4+RdrkJXQiY50Zrysx1+4pEhTWepht8GeHmGNjnQi+9rEYGB8I4ckD1Tw6PNuQZUxxTWUwdd0dT83M=
X-Received: by 2002:a17:907:2d91:b0:931:3a19:d835 with SMTP id
 gt17-20020a1709072d9100b009313a19d835mr19663599ejc.3.1680543952261; Mon, 03
 Apr 2023 10:45:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAOSpxdaW3zZM83eQ+_R5q4L-vsHKPJ0Nn0jsktauLPx1mEAagg@mail.gmail.com>
 <6415.1680541213641212478@lists.openembedded.org>
In-Reply-To: <6415.1680541213641212478@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 3 Apr 2023 07:45:41 -1000
Message-ID: <CAOSpxdYPskA5Ryfi2VyB1aLxKFPyKQoeFAiBfpFCxCCyp3+V6g@mail.gmail.com>
Subject: Re: [OE-core] [meta][kirkstone][PATCH 2/2] curl: Add fix for CVE-2023-23916
To: Pawan Badganchi <badganchipv@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Apr 2023 17:45:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179648

> Could you please build again

OK, but as expected it still fails!

steve@hexa ~/test $ git clone https://git.yoctoproject.org/poky
Cloning into 'poky'...
remote: Enumerating objects: 598292, done.
remote: Counting objects: 100% (607/607), done.
remote: Compressing objects: 100% (329/329), done.
remote: Total 598292 (delta 412), reused 338 (delta 274), pack-reused 59768=
5
Receiving objects: 100% (598292/598292), 190.71 MiB | 11.72 MiB/s, done.
Resolving deltas: 100% (435720/435720), done.

steve@hexa ~/test $ cd poky/

steve@hexa ~/test/poky (master) $ git checkout origin/kirkstone
Note: switching to 'origin/kirkstone'.
<snip>
HEAD is now at 407c3e0237 systemd: fix wrong nobody-group assignment

steve@hexa ~/test/poky ((HEAD detached at origin/kirkstone)) $ git am
-3 ~/Downloads/meta-kirkstone-2-2-curl-Add-fix-for-CVE-2023-23916.patch
Applying: curl: Add fix for CVE-2023-23916

steve@hexa ~/test/poky ((HEAD detached from origin/kirkstone)) $
source oe-init-build-env
<snip>

steve@hexa ~/test/poky/build ((HEAD detached from origin/kirkstone)) $
bitbake curl
Loading cache: 100% |



                  | ETA:  --:--:--
Loaded 0 entries from dependency cache.
Parsing recipes: 100%
|##########################################################################=
###########################################################################=
###########################################################################=
########################################################|
Time: 0:00:19
Parsing of 882 .bb files complete (0 cached, 882 parsed). 1642
targets, 44 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           =3D "2.0.0"
BUILD_SYS            =3D "x86_64-linux"
NATIVELSBSTRING      =3D "ubuntu-22.04"
TARGET_SYS           =3D "x86_64-poky-linux"
MACHINE              =3D "qemux86-64"
DISTRO               =3D "poky"
DISTRO_VERSION       =3D "4.0.8"
TUNE_FEATURES        =3D "m64 core2"
TARGET_FPU           =3D ""
meta
meta-poky
meta-yocto-bsp       =3D "HEAD:005e7dbceb28cc9925e5756d8828c898f0761bdc"

NOTE: Fetching uninative binary shim
http://downloads.yoctoproject.org/releases/uninative/3.7/x86_64-nativesdk-l=
ibc-3.7.tar.xz;sha256sum=3Db110bf2e10fe420f5ca2f3ec55f048ee5f0a54c7e34856a3=
594e51eb2aea0570
(will check PREMIRRORS first)
Initialising tasks: 100%
|##########################################################################=
###########################################################################=
###########################################################################=
#####################################################|
Time: 0:00:01
Sstate summary: Wanted 186 Local 0 Mirrors 0 Missed 186 Current 0 (0%
match, 0% complete)
NOTE: Executing Tasks
WARNING: curl-native-7.82.0-r0 do_patch: Fuzz detected:

Applying patch CVE-2023-23916.patch
patching file lib/content_encoding.c
patching file lib/urldata.h
patching file tests/data/Makefile.inc
Hunk #1 succeeded at 68 with fuzz 2 (offset 2 lines).
patching file tests/data/test418


The context lines in the patches can be updated with devtool:

    devtool modify curl-native
    devtool finish --force-patch-refresh curl-native <layer_path>

Don't forget to review changes done by devtool!

WARNING: curl-native-7.82.0-r0 do_patch: QA Issue: Patch log indicates
that patches do not apply cleanly. [patch-fuzz]
WARNING: curl-7.82.0-r0 do_patch: Fuzz detected:

Applying patch CVE-2023-23916.patch
patching file lib/content_encoding.c
patching file lib/urldata.h
patching file tests/data/Makefile.inc
Hunk #1 succeeded at 68 with fuzz 2 (offset 2 lines).
patching file tests/data/test418


The context lines in the patches can be updated with devtool:

    devtool modify curl
    devtool finish --force-patch-refresh curl <layer_path>

Don't forget to review changes done by devtool!

WARNING: curl-7.82.0-r0 do_patch: QA Issue: Patch log indicates that
patches do not apply cleanly. [patch-fuzz]
NOTE: Tasks Summary: Attempted 746 tasks of which 0 didn't need to be
rerun and all succeeded.

Summary: There were 4 WARNING messages.

On Mon, Apr 3, 2023 at 7:00=E2=80=AFAM Pawan Badganchi <badganchipv@gmail.c=
om> wrote:
>
> Hi Steve,
> I have built with bitbake curl, it got built with no fuzz warnings.
> Could you please build again. Please find the attached screenshot  below.
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#179647): https://lists.openembedded.org/g/openembedde=
d-core/message/179647
> Mute This Topic: https://lists.openembedded.org/mt/97818991/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

