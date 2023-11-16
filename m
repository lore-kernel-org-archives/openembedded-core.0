Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D6A8C197A0
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 19:44:40 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web11.16132.1700163874532828499
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Nov 2023 11:44:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CbD44S0u;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-1f4e17c1edfso627429fac.0
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 11:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700163874; x=1700768674; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iEAqWLnz9n/XlpEar2Ln4PMMqo4aqZWUzH8wpWeV5W0=;
        b=CbD44S0udYojCIVHpic3IwGyBfzYDXsaQqhXY+PFDuv3g2JsB6xT33LvrGJYbO/zCZ
         6e9UvwNqbjYAuU/QrEFTFz83dJdrRB+9lmi686fk65Gk7k1Rbqb5V0SLZcWCWJIbSbq/
         OgLFs068jSQxBC7J2lnQ/BqGF95hw9Ip42EmivSFLUk0y990A7HTGFCxWQaJbJDZpAL9
         jmt/AISCbPpU6W2NL2SxFDQijHTNh/23aG4OO1/vprgMQFwxN4hNcPNhpF5kMxgJff0c
         yIFAbPAAEem6XG11I5cEW62oe6mADMO6IaDqmP0g8KJHMpVz351uI+pyIwnsC9rE4oYR
         irLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700163874; x=1700768674;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iEAqWLnz9n/XlpEar2Ln4PMMqo4aqZWUzH8wpWeV5W0=;
        b=YI2m2U3v7owZRyqnTuBkxTIU0nE+E+UUmDImQ9niHv7FViUOeO0fZ20BWWKK0jEblm
         DKLdrbjDftYKXWBqZAms/DsdMoVdvH5wm4coWY7eKCrb+XgilHtnJs8VdesVW4eiGeNF
         oof24Y50wrJosMtBJVfYX6C1EWBxonNaa+aHhe4vTv7AOcoeSmkfuUyV75y48YVisOLm
         wN9MDEHZb0yjKeW2Fo0KFlNFizZJmb90tCHI00if7M7FdEf0rdnBDs0nHTfihIARAzdJ
         MjgKgKGjH21ni+eFXkZfwphmcVJK5G1mr+0tm8VopFf3ENEHXUm2AihrwWMsgQ4J9lFJ
         +blA==
X-Gm-Message-State: AOJu0YzODFV2G7C+kNbqgThSHBMe9bb5VGEPLniFCIPvjCcE/gSutH2/
	hK9lcKCASAgAAf6FsBS4IXa8JMRS6ThG3kyJD5U=
X-Google-Smtp-Source: AGHT+IEeYEjL/R0xx7cs8N/5+uThNcqUbEWDHDCFIJbssgqAKGpqxl2LZxiI4BPx8KIPj5kYKDSjAKViuvGTTTEicws=
X-Received: by 2002:a05:6870:7886:b0:1e9:896a:8055 with SMTP id
 hc6-20020a056870788600b001e9896a8055mr22679913oab.25.1700163873633; Thu, 16
 Nov 2023 11:44:33 -0800 (PST)
MIME-Version: 1.0
References: <20231116073650.2710535-1-martin.jansa@gmail.com>
In-Reply-To: <20231116073650.2710535-1-martin.jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 16 Nov 2023 11:44:07 -0800
Message-ID: <CAMKF1spKx_S3ORqC-Tek+DErRt1uwtybD2cja1eE+cnTpc53oA@mail.gmail.com>
Subject: Re: [OE-core] [PATCHv3 01/11] bitbake.conf: drop ${PE} and ${PR} from -f{file,macro,debug}-prefix-map
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 19:44:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190810

On Wed, Nov 15, 2023 at 11:36=E2=80=AFPM Martin Jansa <martin.jansa@gmail.c=
om> wrote:
>
> * ${EXTENDPE} and ${PR} was already dropped from ${WORKDIR} in:
>   https://lists.openembedded.org/g/openembedded-core/message/185818
>   adjust -fmacro-prefix-map and -fdebug-prefix-map similarly.
>   As we don't depend on PR in WORKDIR maybe we don't need it in
>   /usr/src/debug paths as well anymore.
>
> * The interesting side-effect of this is that for DISTROs which still
>   use PR (e.g. webOS OSE), the difference in -fdebug-prefix-map causes
>   all binaries to be slightly different when rebuilt with different PR
>   (due to this path, even when otherwise they are binary reproducible)
>   and when the number of digits in PR changes (e.g. from r9 to r10) it
>   also results in slightly bigger binaries (and more unnecessary changes
>   in buildhistory diffs).
>

these paths are for binary outputs unlike workdir, this change would means =
we
have same path to install debug info on targets which might not match
to installed
binaries Can you check if these paths are matching while debugging on targe=
t ?

>   For example this foo binary, the difference between "new" and "old" is
>   extra patch applied in SRC_URI (which doesn't affect the foo binary,
>   but was the reason for PR bump).
>
>   And the binary is bigger with r10, identical with r6 and slightly
>   different due to debug-prefix-map between r6 and r7:
>
>   $ ls -la 1.0.0-175-*/image/usr/sbin/foo
>   -rwxr-xr-x 1 bitbake bitbake 30182460 Nov  8 08:29 1.0.0-175-new-r10/im=
age/usr/sbin/foo
>   -rwxr-xr-x 1 bitbake bitbake 30182224 Nov  8 08:02 1.0.0-175-new-r6/ima=
ge/usr/sbin/foo
>   -rwxr-xr-x 1 bitbake bitbake 30182224 Nov  8 07:49 1.0.0-175-new-r7/ima=
ge/usr/sbin/foo
>   -rwxr-xr-x 1 bitbake bitbake 30182224 Nov  8 07:39 1.0.0-175-old-r6/ima=
ge/usr/sbin/foo
>
>   $ md5sum 1.0.0-175-*/image/usr/sbin/foo
>   8e3ab67d596f8cc2f9c6320dab10af01  1.0.0-175-new-r10/image/usr/sbin/foo
>   f6ff1e64fe6affb9ba0d8f278cf7ed79  1.0.0-175-new-r6/image/usr/sbin/foo
>   6469a0b10aac233911e63c5ea97b03c0  1.0.0-175-new-r7/image/usr/sbin/foo
>   f6ff1e64fe6affb9ba0d8f278cf7ed79  1.0.0-175-old-r6/image/usr/sbin/foo
>
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
> v3: added additional fix for perf (and changes in other recipes were move=
d to separate commits)
>
>  meta/conf/bitbake.conf | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 67ff769046..3836a389b8 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -648,10 +648,10 @@ EXTRA_OEMAKE:prepend:task-install =3D "${PARALLEL_M=
AKEINST} "
>  ##################################################################
>  # Beware: applied last to first
>  DEBUG_PREFIX_MAP ?=3D "-fcanon-prefix-map \
> - -fmacro-prefix-map=3D${S}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}=
 \
> - -fdebug-prefix-map=3D${S}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}=
 \
> - -fmacro-prefix-map=3D${B}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}=
 \
> - -fdebug-prefix-map=3D${B}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}=
 \
> + -fmacro-prefix-map=3D${S}=3D/usr/src/debug/${PN}/${PV} \
> + -fdebug-prefix-map=3D${S}=3D/usr/src/debug/${PN}/${PV} \
> + -fmacro-prefix-map=3D${B}=3D/usr/src/debug/${PN}/${PV} \
> + -fdebug-prefix-map=3D${B}=3D/usr/src/debug/${PN}/${PV} \
>   -fdebug-prefix-map=3D${STAGING_DIR_HOST}=3D \
>   -fmacro-prefix-map=3D${STAGING_DIR_HOST}=3D \
>   -fdebug-prefix-map=3D${STAGING_DIR_NATIVE}=3D \
> --
> 2.42.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#190753): https://lists.openembedded.org/g/openembedde=
d-core/message/190753
> Mute This Topic: https://lists.openembedded.org/mt/102623139/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

