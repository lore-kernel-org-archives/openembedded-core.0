Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 185FBE6917C
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 16:24:27 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.28663.1732292665473525789
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Nov 2024 08:24:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i8al4fY5;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-539ee1acb86so2666757e87.0
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 08:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732292663; x=1732897463; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fm54zbNK2AAeXyU6ejx6i7YLLt42YDraHjZ3cDy2n1M=;
        b=i8al4fY5k4NXqupUERzEG7BZhs6LibBUOAGuBlWlM85eeJREeWRUHtmTBVJaunPpEo
         NItTr3mJxT8QvPaXL5A2M4G0Y04cBzb5h4pBXAHXx1BNsacgKt/ds5S+mbFBEZGhaiuW
         F+Oymaw5r2AsGfqYhbCZ0k3j5I7We3oNvDY1m7a3tL533pu3EP6mQAmWd6O/Sj5VO9kJ
         cyNCiGBrdLLAFvXyZIJs68nK/OPB16AshgsW5833S5aI0o88mMLn/KqXp9VsiJIHG/t1
         jeZy8XXtbYHkHrsPzrXD4S+HrPyz+IW5usS9GolhQHGSsGaqpg1jZtNket1oDMbS9Xfw
         WEeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732292663; x=1732897463;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fm54zbNK2AAeXyU6ejx6i7YLLt42YDraHjZ3cDy2n1M=;
        b=ebw049jDFpo9YhKFVdEjS3lP6WmPOV9ZscjFObYRMl7fxqtwZqOxawtpevtwyN43cS
         pvcazKAHA3CPCG8L6WFb4YS91gXePFnXdx0IMZ0aVzVfm8KyFw8enaZfREaOAxF9pHRj
         67GLSGl12Zy9yUrHY4dPNLSyK7n9P8hfpJjc20bPhh296TR8f1o4uPVdObsFHFJ+u7Px
         MOUQ94LqQKtKqycH27y7RObIqTIy0Qv+Xeb9nUTKpPK4/qZnlBjojkPzlpLF3UpulX1k
         w0UVKVJ+ODvnJYIPC5uxW9TBcSi/RDIvynkKd+FTAI/x9COZyK5aEgyjwpSylQlTyoTv
         5uYA==
X-Gm-Message-State: AOJu0YyR8cDUIS03qX9o8PIgq+KSVgkxpw1sr+4oWk1zFdsQ3Sj7cah8
	vPt0l+LJEX93IpqbsV0gvA/gXpYZcRZkpRc5mPOghOL8QRYEOYw60o0A8k0eqtncZ8EKfpd0Fvy
	parZ6udvndj+6iQ2AUua2i16cK/Q=
X-Gm-Gg: ASbGnct0Ka4ffxGq/QdSOBk9PqqgRGCKeWOXXF1TKyWoBRvpKUOc+lzp1EgBvCrDdNW
	lS/AkYjDP2IcTd+3hq2E7KWhsC8JJfVo=
X-Google-Smtp-Source: AGHT+IH5cD6xp8yNKHkR3lrrfLlUZHqLIdf/e5FYkLe6lBaIPvyyEOdmVG8t5gaFPvMBgY4g9VEwpRLQHBICeBReaaw=
X-Received: by 2002:a05:6512:b97:b0:53d:d12c:2f02 with SMTP id
 2adb3069b0e04-53dd36a0421mr2170783e87.18.1732292662913; Fri, 22 Nov 2024
 08:24:22 -0800 (PST)
MIME-Version: 1.0
References: <20241122154939.2133845-1-JPEWhacker@gmail.com> <40520d80-5548-4195-9c70-bc7fbfbd8ab1@cherry.de>
In-Reply-To: <40520d80-5548-4195-9c70-bc7fbfbd8ab1@cherry.de>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Fri, 22 Nov 2024 09:24:09 -0700
Message-ID: <CAJdd5GZAvH9J85MY22vVaiq_Wo0SLWQi7v16+iETvWoRt75h1w@mail.gmail.com>
Subject: Re: [OE-core][PATCH] spdx: Fix SPDX tasks not running when code changes
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 16:24:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207637

On Fri, Nov 22, 2024 at 9:22=E2=80=AFAM Quentin Schulz <quentin.schulz@cher=
ry.de> wrote:
>
> Hi Joshua,
>
> On 11/22/24 4:49 PM, Joshua Watt via lists.openembedded.org wrote:
> > The SPDX code makes heavy use of python classes. While this works very
> > well, the bitbake dependency parser is unable to understand how to deal
> > with them, and thus changes to the class code do not cause rebuilds to
> > occur. To correct this, add the library files that include SPDX code as
> > file checksums for the SPDX tasks. If this method works well for SPDX,
> > we will look at implementing something similar in the bitbake dependenc=
y
> > parser that should allow correct checksums without having to explicitly
> > add them to each class.
> >
>
> Oooooh that reminds me of this very issue happening at my previous compan=
y.
>
> I'm wondering if we shouldn't just add this file-checksums dependency at
> the global level somehow? Since one needs to call addpylib
> layer-dir/path directory in order to be able to import those modules in
> tasks/functions. Maybe there's something we can hook there somehow? The
> issue being we would either blindly reparse/rebuild all recipes when
> those changes or we need a way to check which task(s) import those module=
s?
>
> Another option could be to forbid addpylib on a conf file and force it
> inside recipes only, but I guess this means we cannot use those in
> inline python in conf files anymore? which we do use in
> meta/conf/bitbake.conf.

Ya, Richard and I talked about this on IRC. The plan is to do this as
sort of a PoC to fix SPDX for now, and if it works out we'll try to
figure out a way to make it more formal in bitbake dependency parser.
I have a few ideas for how to do that.

>
> The change itself looks fine to me though, wish I had this idea at my
> previous company :)

>
> Cheers,
> Quentin
>
> > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > ---
> >   meta/classes-recipe/create-spdx-image-3.0.bbclass | 3 +++
> >   meta/classes-recipe/create-spdx-sdk-3.0.bbclass   | 2 ++
> >   meta/classes/create-spdx-3.0.bbclass              | 9 +++++++++
> >   3 files changed, 14 insertions(+)
> >
> > diff --git a/meta/classes-recipe/create-spdx-image-3.0.bbclass b/meta/c=
lasses-recipe/create-spdx-image-3.0.bbclass
> > index 18e6cf6dfa2..51446162857 100644
> > --- a/meta/classes-recipe/create-spdx-image-3.0.bbclass
> > +++ b/meta/classes-recipe/create-spdx-image-3.0.bbclass
> > @@ -36,6 +36,7 @@ do_create_rootfs_spdx[sstate-inputdirs] =3D "${SPDXRO=
OTFSDEPLOY}"
> >   do_create_rootfs_spdx[sstate-outputdirs] =3D "${DEPLOY_DIR_SPDX}"
> >   do_create_rootfs_spdx[recrdeptask] +=3D "do_create_spdx do_create_pac=
kage_spdx"
> >   do_create_rootfs_spdx[cleandirs] +=3D "${SPDXROOTFSDEPLOY}"
> > +do_create_rootfs_spdx[file-checksums] +=3D "${SPDX3_LIB_DEP_FILES}"
> >
> >   python do_create_rootfs_spdx_setscene() {
> >       sstate_setscene(d)
> > @@ -53,6 +54,7 @@ do_create_image_spdx[sstate-inputdirs] =3D "${SPDXIMA=
GEWORK}"
> >   do_create_image_spdx[sstate-outputdirs] =3D "${DEPLOY_DIR_SPDX}"
> >   do_create_image_spdx[cleandirs] =3D "${SPDXIMAGEWORK}"
> >   do_create_image_spdx[dirs] =3D "${SPDXIMAGEWORK}"
> > +do_create_image_spdx[file-checksums] +=3D "${SPDX3_LIB_DEP_FILES}"
> >
> >   python do_create_image_spdx_setscene() {
> >       sstate_setscene(d)
> > @@ -72,6 +74,7 @@ do_create_image_sbom_spdx[sstate-outputdirs] =3D "${D=
EPLOY_DIR_IMAGE}"
> >   do_create_image_sbom_spdx[stamp-extra-info] =3D "${MACHINE_ARCH}"
> >   do_create_image_sbom_spdx[cleandirs] =3D "${SPDXIMAGEDEPLOYDIR}"
> >   do_create_image_sbom_spdx[recrdeptask] +=3D "do_create_spdx do_create=
_package_spdx"
> > +do_create_image_sbom_spdx[file-checksums] +=3D "${SPDX3_LIB_DEP_FILES}=
"
> >
> >   python do_create_image_sbom_spdx_setscene() {
> >       sstate_setscene(d)
> > diff --git a/meta/classes-recipe/create-spdx-sdk-3.0.bbclass b/meta/cla=
sses-recipe/create-spdx-sdk-3.0.bbclass
> > index ea01a21cc59..855fb3d09f9 100644
> > --- a/meta/classes-recipe/create-spdx-sdk-3.0.bbclass
> > +++ b/meta/classes-recipe/create-spdx-sdk-3.0.bbclass
> > @@ -8,12 +8,14 @@
> >   do_populate_sdk[recrdeptask] +=3D "do_create_spdx do_create_package_s=
pdx"
> >   do_populate_sdk[cleandirs] +=3D "${SPDXSDKWORK}"
> >   do_populate_sdk[postfuncs] +=3D "sdk_create_sbom"
> > +do_populate_sdk[file-checksums] +=3D "${SPDX3_LIB_DEP_FILES}"
> >   POPULATE_SDK_POST_HOST_COMMAND:append:task-populate-sdk =3D " sdk_hos=
t_create_spdx"
> >   POPULATE_SDK_POST_TARGET_COMMAND:append:task-populate-sdk =3D " sdk_t=
arget_create_spdx"
> >
> >   do_populate_sdk_ext[recrdeptask] +=3D "do_create_spdx do_create_packa=
ge_spdx"
> >   do_populate_sdk_ext[cleandirs] +=3D "${SPDXSDKEXTWORK}"
> >   do_populate_sdk_ext[postfuncs] +=3D "sdk_ext_create_sbom"
> > +do_populate_sdk_ext[file-checksums] +=3D "${SPDX3_LIB_DEP_FILES}"
> >   POPULATE_SDK_POST_HOST_COMMAND:append:task-populate-sdk-ext =3D " sdk=
_ext_host_create_spdx"
> >   POPULATE_SDK_POST_TARGET_COMMAND:append:task-populate-sdk-ext =3D " s=
dk_ext_target_create_spdx"
> >
> > diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create=
-spdx-3.0.bbclass
> > index bc23d2d2115..640f5490bda 100644
> > --- a/meta/classes/create-spdx-3.0.bbclass
> > +++ b/meta/classes/create-spdx-3.0.bbclass
> > @@ -122,6 +122,13 @@ oe.spdx30_tasks.get_package_sources_from_debug[var=
depsexclude] +=3D "STAGING_KERNE
> >   oe.spdx30_tasks.collect_dep_objsets[vardepsexclude] =3D "SPDX_MULTILI=
B_SSTATE_ARCHS"
> >
> >
> > +# SPDX library code makes heavy use of classes, which bitbake cannot e=
asily
> > +# parse out dependencies. As such, the library code files that make us=
e of
> > +# classes are explicitly added as file checksum dependencies.
> > +SPDX3_LIB_DEP_FILES =3D "\
> > +    ${COREBASE}/meta/lib/oe/sbom30.py:True \
> > +    ${COREBASE}/meta/lib/oe/spdx30.py:True \
> > +    "
> >
> >   python do_create_spdx() {
> >       import oe.spdx30_tasks
> > @@ -137,6 +144,7 @@ addtask do_create_spdx after \
> >   SSTATETASKS +=3D "do_create_spdx"
> >   do_create_spdx[sstate-inputdirs] =3D "${SPDXDEPLOY}"
> >   do_create_spdx[sstate-outputdirs] =3D "${DEPLOY_DIR_SPDX}"
> > +do_create_spdx[file-checksums] +=3D "${SPDX3_LIB_DEP_FILES}"
> >
> >   python do_create_spdx_setscene () {
> >       sstate_setscene(d)
> > @@ -160,6 +168,7 @@ addtask do_create_package_spdx after do_create_spdx=
 before do_build do_rm_work
> >   SSTATETASKS +=3D "do_create_package_spdx"
> >   do_create_package_spdx[sstate-inputdirs] =3D "${SPDXRUNTIMEDEPLOY}"
> >   do_create_package_spdx[sstate-outputdirs] =3D "${DEPLOY_DIR_SPDX}"
> > +do_create_package_spdx[file-checksums] +=3D "${SPDX3_LIB_DEP_FILES}"
> >
> >   python do_create_package_spdx_setscene () {
> >       sstate_setscene(d)
> >
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#207626): https://lists.openembedded.org/g/openembed=
ded-core/message/207626
> > Mute This Topic: https://lists.openembedded.org/mt/109724577/6293953
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
quentin.schulz@cherry.de]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

