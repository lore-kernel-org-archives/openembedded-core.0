Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A12DCA0EEB
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 16:42:56 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web11.819.1755621769476223236
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Aug 2025 09:42:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=IHHLuKvc;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.174, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-71d603658e3so47935587b3.1
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 09:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1755621768; x=1756226568; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=75gPBgyo+p8HDncqFUODzDqYDwCmGZSrXDt7iwP70/A=;
        b=IHHLuKvc75d1OgEmKEpdFyGruGE9M24WE1FLGE69XGoKWnG3gy/DYuG8fz5DyQQu3L
         XBbS0L15OurhFeeyob2eAZrCnTQjrslUxANoyAx7yDsWRiY4MIGDx0vQgWSbmXP4PBOM
         Cg+lCSfINcPHE2C4MFhkPxSDGv2Am2myWvEHd46M7R1r+N0k8HBQssGz7FcrOg9FMBjz
         cQvDxpQgrHLzJTn7nO9+h6puiaopdUo4VSvgu6cmdnEEX0VKgTNrQaA17xiZx1O2dJIy
         9WJRYWaSwmRXZIwpZW9TQLbC5sAgnf6MLidh+PiIJelq/3QZjX2h71H28r3Qb8eQbGDV
         1rlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755621768; x=1756226568;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=75gPBgyo+p8HDncqFUODzDqYDwCmGZSrXDt7iwP70/A=;
        b=c8VUHEi+bCvzf6AsmOk+dsu0J7xLDWd9vo+toK1ixIlab3xj03In2qIQgYmk/nu5hJ
         yshsyr3LCSIf5oSQbdaTI07IIRo7OKMunblpXz7gOZWv1bEb0FaBtCQYGGC8/UOLUkx7
         HlDVeHeYzpRvOceaVm9IJ58LoSSI3xw0A7V3fiw2lAvWNE+poX00hKZ6MvfrO2GUN0mb
         vvotC4lhxqlXnkGS7WRAeOQIUD8QO08Yltgyr1BPXEd7eqPILoS8rvDDaih5bJvUFqb2
         neb+0BleY6tdbWKw4SGlwk3ExXQUvQ4zFrHSFPyzy6NvgutExC+v+bFGcTpYtmhoZ9GC
         BTXg==
X-Gm-Message-State: AOJu0Yzytp+Udy3hguTM0X/xsftx+ctKujQR/7M6t2v8vqCJ0W40NaQX
	DTpvSJ+cA0ViDbL5GAqMM9izDSUDordUmHrsnfiqiqOBJdmi5xBLtVP58rSwcUpcgBdGutQTApd
	bxw7lh0oQwtGw2kcWcp6mZsDt7/d8Kaq5UO4N3+x1Aw==
X-Gm-Gg: ASbGncsn15lUUrSyz6hbov80XEylU2D6KtDxwStTYk+TiLU4ETXEjSpKsJMAs9AojSd
	R5vFifekJiZPUpFGbQeFovccNIOl1G7jiQxUOlVftThLv/0EJqO0cQw75+eOnN07sXinsRWDHfi
	Z8AMzLnM2mfNIjTv9MTip6NLur1YVLw9Z93AeLPvbyEH6FZ+hPWec+opRXZo2jXkAdjXGD6vcq4
	uK1ki43Cf5rEnjd0t05wU1dAR/p4H8hvodpUIs=
X-Google-Smtp-Source: AGHT+IHTBJktjI5DVGR90Evdvnn+G1TgeITRlIPyYlWso50fOvflogSaRvaCJxueL/SwncvRfBzLt1E7zIjUuJmlkh8=
X-Received: by 2002:a05:690c:7108:b0:71b:f9db:2725 with SMTP id
 00721157ae682-71f9d4dd5c7mr37881097b3.8.1755621768462; Tue, 19 Aug 2025
 09:42:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250815094509.3034151-1-philip.lorenz@bmw.de>
In-Reply-To: <20250815094509.3034151-1-philip.lorenz@bmw.de>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 19 Aug 2025 09:42:37 -0700
X-Gm-Features: Ac12FXzCwFw99M_2bBuAGKQrrQ5j9OnqgdZ0bW_8bVuXTzkM4z-3b_RAeC5q3TM
Message-ID: <CAOSpxdbT1VigkVchb3SroTCYA0kPhMGDiKd179zJf7o6Ku6tMQ@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH 1/2] insane: Improve patch
 warning/error handling
To: philip.lorenz@bmw.de
Cc: openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 16:42:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222121

This patch set is causing warnings for various non-oe-core layers used
in autobuilder testing:

meta-intel
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/41/builds/2086/st=
eps/12/logs/warnings

meta-virtualization
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/89/builds/2099/st=
eps/12/logs/warnings
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/89/builds/2099/st=
eps/16/logs/warnings

meta-agl
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/55/builds/2088/st=
eps/13/logs/warnings

meta-gplv2
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/33/builds/1299/st=
eps/11/logs/warnings

I'm not inclined to take this patch set since it is adding a lot of
noise to my testing.

If you submit patches for those layers to deal with the above issues,
or work with the layer maintainers to fix them I am happy to
reconsider.

Thanks!

Steve

On Fri, Aug 15, 2025 at 2:53=E2=80=AFAM Philip Lorenz via
lists.openembedded.org <philip.lorenz=3Dbmw.de@lists.openembedded.org>
wrote:
>
> From: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> Currently, whilst patch errors or warnings are shown, the errors don't st=
op builds.
> The configuration isn't very configurable from WARN_QA and ERROR_QA eithe=
r.
>
> This patch:
>  * Uses the standard mechanisms to handle the patch fuzz warnings/errors
>  * Makes Upstream-Status checking configurable from WARN/ERROR_QA
>  * Allows that checking to be used with non-core layers
>  * Makes patch-fuzz an error by default
>
> (From OE-Core rev: 76a685bfcf927593eac67157762a53259089ea8a)
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 3c3fd6a65e8103f74ae382d196d486b31a168b39)
>
> The backported commit was modified to not mark "patch-fuzz" as an error
> by default (which retains compatibility with kirkstone behaviour).
>
> Signed-off-by: Philip Lorenz <philip.lorenz@bmw.de>
> ---
>  meta/classes/insane.bbclass | 24 ++++++++++++++++--------
>  1 file changed, 16 insertions(+), 8 deletions(-)
>
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index f4b4c05e3d8..495bdda652c 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -28,6 +28,7 @@ WARN_QA ?=3D " libdir xorg-driver-abi \
>              missing-update-alternatives native-last missing-ptest \
>              license-exists license-no-generic license-syntax license-for=
mat \
>              license-incompatible license-file-missing obsolete-license \
> +            patch-status-noncore \
>              "
>  ERROR_QA ?=3D "dev-so debug-deps dev-deps debug-files arch pkgconfig la =
\
>              perms dep-cmp pkgvarcheck perm-config perm-line perm-link \
> @@ -1182,24 +1183,27 @@ python do_qa_patch() {
>              msg +=3D "    devtool modify %s\n" % d.getVar('PN')
>              msg +=3D "    devtool finish --force-patch-refresh %s <layer=
_path>\n\n" % d.getVar('PN')
>              msg +=3D "Don't forget to review changes done by devtool!\n"
> -            if bb.utils.filter('ERROR_QA', 'patch-fuzz', d):
> -                bb.error(msg)
> -            elif bb.utils.filter('WARN_QA', 'patch-fuzz', d):
> -                bb.warn(msg)
> -            msg =3D "Patch log indicates that patches do not apply clean=
ly."
> +            msg +=3D "\nPatch log indicates that patches do not apply cl=
eanly."
>              oe.qa.handle_error("patch-fuzz", msg, d)
>
>      # Check if the patch contains a correctly formatted and spelled Upst=
ream-Status
>      import re
>      from oe import patch
>
> +    allpatches =3D False
> +    if bb.utils.filter('ERROR_QA', 'patch-status-noncore', d) or bb.util=
s.filter('WARN_QA', 'patch-status-noncore', d):
> +        allpatches =3D True
> +
>      coremeta_path =3D os.path.join(d.getVar('COREBASE'), 'meta', '')
>      for url in patch.src_patches(d):
>         (_, _, fullpath, _, _, _) =3D bb.fetch.decodeurl(url)
>
>         # skip patches not in oe-core
> +       patchtype =3D "patch-status-core"
>         if not os.path.abspath(fullpath).startswith(coremeta_path):
> -           continue
> +           patchtype =3D "patch-status-noncore"
> +           if not allpatches:
> +               continue
>
>         kinda_status_re =3D re.compile(r"^.*upstream.*status.*$", re.IGNO=
RECASE | re.MULTILINE)
>         strict_status_re =3D re.compile(r"^Upstream-Status: (Pending|Subm=
itted|Denied|Accepted|Inappropriate|Backport|Inactive-Upstream)( .+)?$", re=
.MULTILINE)
> @@ -1212,9 +1216,13 @@ python do_qa_patch() {
>
>             if not match_strict:
>                 if match_kinda:
> -                   bb.error("Malformed Upstream-Status in patch\n%s\nPle=
ase correct according to %s :\n%s" % (fullpath, guidelines, match_kinda.gro=
up(0)))
> +                   msg =3D "Malformed Upstream-Status in patch\n%s\nPlea=
se correct according to %s :\n%s" % (fullpath, guidelines, match_kinda.grou=
p(0))
> +                   oe.qa.handle_error(patchtype, msg, d)
>                 else:
> -                   bb.error("Missing Upstream-Status in patch\n%s\nPleas=
e add according to %s ." % (fullpath, guidelines))
> +                   msg =3D "Missing Upstream-Status in patch\n%s\nPlease=
 add according to %s ." % (fullpath, guidelines)
> +                   oe.qa.handle_error(patchtype, msg, d)
> +
> +    oe.qa.exit_if_errors(d)
>  }
>
>  python do_qa_configure() {
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#221879): https://lists.openembedded.org/g/openembedde=
d-core/message/221879
> Mute This Topic: https://lists.openembedded.org/mt/114715380/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

