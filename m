Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5565BC4345F
	for <webhook@archiver.kernel.org>; Thu, 11 Apr 2024 18:42:18 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web10.26415.1712860930692603303
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Apr 2024 11:42:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IKHnc+wf;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-22edcfcd187so72501fac.2
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Apr 2024 11:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712860930; x=1713465730; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vn2TUCrYSA8NcFTuP6GvokdeV+N8yP8dVArmQUSbF4c=;
        b=IKHnc+wf7HYkSTZhbKOiYPFWUS2lMn6NwqzsxHjgD4ueQ8d3q3Gew7cuEFU6lrlowR
         Qxum53vGC6JYfkAjQKLr6ILGa3rpmSEK3vdNM3aX4BmvKqqPjVHW8X9umoPTHTf5NWxQ
         CnByJqNFGEzNm8uHHdI8q5+OKSIm7uAovorHWlg2gVbuRBxBcq5s0/OhW3fMlm7MducA
         f2qjoyAtA6U9KIu+XWARYkvzOFHzGm/MfEWzLQ3Iz2rdRlrGDVE5SdParQVH3+oc1+bY
         qOypO4jT7wtKSs4S2qp+ctCn1Pn5X6Dsm+OZIVD2m1njb+0xttfe1j5Tj/I/b3FM87DU
         ieRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712860930; x=1713465730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vn2TUCrYSA8NcFTuP6GvokdeV+N8yP8dVArmQUSbF4c=;
        b=aVxN/vK9+kYvZIDdn4S34F3Uqr4cvLoeWefZWuCehbLLaPVdDpIzYFRSeKSvcVwLuk
         39A53imPcr0Ndi3kWe++XrLU7U1NbRjjOL/ib+KNrbto5oSOWKMZRF7TcVOsg14Z4AlT
         dyKbTpSDXgnfcyhRczxQ/FCzDCgRjdBxun6Lhq4bCK67qBMxuiylwysefwg32bXUNZmB
         Arss6E1ZDDTQSfQuISLZkqn9mqYlUA0TL1Qqy5bHfb1MfK2elE0rRD/K4H5LoUMwEXKN
         vRjGQAPNb/a6Pxg0KSHzuMgU7+QyH/CO6GpQTF/oPZnnCgHm0zHX0XblpzyieK5/vGtW
         7Q/w==
X-Gm-Message-State: AOJu0YwxF64LbadjBicuROGsOUmE+l3p7dQY+DXlAPZPT3xN3eCsks2D
	ukEmHm0pX3U/JMrbO6ZHbD6W41LEK0Y/Eh5F+zeW1VB3e/S6LzvD++RjToFLHUC4RPg4GknGgTA
	0t4WKOzljIiHkHgCiOppuVnCRKpk=
X-Google-Smtp-Source: AGHT+IHEFpS1QWeEmuK5GKUVBafv74g92RKKp75mirhWhSJgdBV1dPPAF1UkaZ3BeQxy4sUxAr3vzcXmdNqyAD0fPIA=
X-Received: by 2002:a05:6870:65a9:b0:22e:9a09:77d6 with SMTP id
 fp41-20020a05687065a900b0022e9a0977d6mr395651oab.31.1712860929903; Thu, 11
 Apr 2024 11:42:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240411133255.3217812-1-omatiush@cisco.com>
In-Reply-To: <20240411133255.3217812-1-omatiush@cisco.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 11 Apr 2024 11:41:43 -0700
Message-ID: <CAMKF1spX36mHpJstADCt-gvdmTXE8Fh4JM4nymqY=N57Yn8+GA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] nativesdk-gzip: fix reproducibility issues
To: omatiush@cisco.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Apr 2024 18:42:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198140

On Thu, Apr 11, 2024 at 6:32=E2=80=AFAM Oleh Matiusha via
lists.openembedded.org <omatiush=3Dcisco.com@lists.openembedded.org>
wrote:
>
> There is absolute path in zgrep binary. It is related
> to the changes that fix an issue with zgrep on Solaris
> and other platforms with 'grep -e'. I'd like to ask here
> if Yocto supports Solaris as host architecture, and
> if there's a reliable way to detect the host arch.
> If there is, I'll place additional check to be
> compatible with it.

We do not have support for solaris build hosts.

>
> Original change:
> git.savannah.gnu.org/cgit/gzip.git/commit?id=3D60b3f4eb672a85de28ecaad47e=
d426f8c8fe6c32
>
> Signed-off-by: Oleh Matiusha <omatiush@cisco.com>
> ---
>  meta/recipes-extended/gzip/gzip.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-extended/gzip/gzip.inc b/meta/recipes-extended/=
gzip/gzip.inc
> index b32584033b..62b3e2f4f9 100644
> --- a/meta/recipes-extended/gzip/gzip.inc
> +++ b/meta/recipes-extended/gzip/gzip.inc
> @@ -8,6 +8,7 @@ inherit autotools texinfo
>  export DEFS=3D"NO_ASM"
>
>  EXTRA_OEMAKE:class-target =3D "GREP=3D${base_bindir}/grep"
> +EXTRA_OEMAKE:append:class-nativesdk =3D " GREP=3Dgrep"
>  EXTRA_OECONF:append:libc-musl =3D " gl_cv_func_fflush_stdin=3Dyes "
>
>  do_install:append () {
> --
> 2.33.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#198130): https://lists.openembedded.org/g/openembedde=
d-core/message/198130
> Mute This Topic: https://lists.openembedded.org/mt/105462485/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

