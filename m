Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99C51C71136
	for <webhook@archiver.kernel.org>; Fri, 13 Jun 2025 15:11:32 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web11.12886.1749827491173491163
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Jun 2025 08:11:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=dSbumSGL;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.174, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-71101668dedso17504857b3.1
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 08:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749827490; x=1750432290; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SJPug5xjcFeDIutd/5QQKtLKw7CURgLpRrpeQZOx3rI=;
        b=dSbumSGL0HIhRti8SwsYeQauhOH3J8any+QzlH3FBV/AZX8gDmJFAkGBvnUqfTu1SB
         x1KSNTPKnWxbV2/1HrLO1Y7eNu0XCifNa5IOYRBSHrbgkelb8/haxXq9NRvHPsrrpL8P
         oDlMgsrAht6wHbdwiyQLDqkBWLfpWa+pu1O/qDRA4ZgryFdYXWiiwhyEehY/Wxz2LDJC
         l1QKKlCic/EjyRxeBM4fCdL5Sh3Fn7abE/72PsXZ7QcaMVtooUQ37YlB1Yv2ryIDfVlw
         pH28qDtzZLhcWWjz7Auc4DbnT+4msXnAC6JwTPi2PAB1Ndw6eqYODyCu0r9MO/ySalZb
         4g/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749827490; x=1750432290;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SJPug5xjcFeDIutd/5QQKtLKw7CURgLpRrpeQZOx3rI=;
        b=sVKtSQqXPHJyyi+AX+JBNzxPwrnhZw0kaSUpARkckMzmcN0/7/zBeHuzP7EVio7QH9
         fNO51DTjkUBPSkqchDqeR2VQdq4KayCzrMAE1w/yfVyP34u8My1to+L7Vy2Pnvt597v+
         GVkALI9urJymcYRGktOsB/3MFFFbzY7nSq3bwjJzJP9rdQ28R3AeaBqFsaueW08Uvxi3
         G+rIUcByBZLoIsklhTn0cqsi8fBEpofAHhbbLK+tHt7O6nVg0LU0wOQwCtSbrOUGiS5b
         qRgbs+znPXWC1v6P2g7pcs6RvPh6l7hCvFTT+dlRtGkx4ySmaeY+D6kLH2fMx6WvZYw+
         6fZA==
X-Gm-Message-State: AOJu0Yxg8etPYx8dF+6wLEla4g1CeNTrGzxZs3TmFaMQ1CaH18Bi40m9
	bBR3a8UZsk4KWp1M21ezmkcHFk127zocZ/Ftn7D0SRupRAJXauX9ZbzP25Drwzv1fvw6pp/m4Ac
	87fvrN0nTEPqsJqLUEdlfmYFya4+ldkTzeWEJ5PpJLQ==
X-Gm-Gg: ASbGnctORZNHKjEedAPiIXNWHnRMhpZa3vpi5tMho4vnEp4avawePy4vFIaaV1Ylkir
	VDq8INdaejc21ixgsPQxc/nAs/ZU+MrbSzi44Bh2RbF3rqIQ6iJR8UbJO7mnELnBJHgD7MjLTm+
	pToCDgKvN/8S5hsXgzKOJlRguCy+OD458VdwlX/OG8mi+jlXuRKyNR2/QNmxTt8zJu9VZ4+6Dce
	j4=
X-Google-Smtp-Source: AGHT+IFFA/n/Szi+sQcuIn/2+dDEkm+GhiyvyHkNO2QUvFX9cXzwb6cVqaTRPUml/aHlbN2+PC8ljRFetTwy1Ana6Vc=
X-Received: by 2002:a05:690c:b84:b0:6ef:652b:91cf with SMTP id
 00721157ae682-7116375f97cmr54170557b3.27.1749827490150; Fri, 13 Jun 2025
 08:11:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250613020908.2880888-1-guocai.he.cn@windriver.com>
In-Reply-To: <20250613020908.2880888-1-guocai.he.cn@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 13 Jun 2025 08:11:19 -0700
X-Gm-Features: AX0GCFuzrWyABvvnt35yezEBd9eS3BTJCNTO7251tUtI6gxzEAyDYS047pzO2Fw
Message-ID: <CAOSpxda2ZjC6Jiorrys4FrqUxYbd9=x3TkvyhW6pOSe0ZNKAhQ@mail.gmail.com>
Subject: Re: [oe-core][kirkstone][PATCH 1/1] babeltrace/libatomic-ops: correct
 the SRC_URI
To: guocai.he.cn@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 15:11:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218613

On Thu, Jun 12, 2025 at 7:09=E2=80=AFPM guocai he via lists.openembedded.or=
g
<guocai.he.cn=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Guocai He <guocai.he.cn@windriver.com>
>
> The old SRC_URIs are not available and need to update.
>
> Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
> ---
>  meta/recipes-kernel/lttng/babeltrace_1.5.11.bb             | 2 +-
>  meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb b/meta/recipe=
s-kernel/lttng/babeltrace_1.5.11.bb
> index fb62937819..d9c56d038b 100644
> --- a/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb
> +++ b/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D76ba15dd76a248=
e1dd526bca0e2125fa"
>
>  DEPENDS =3D "glib-2.0 util-linux popt bison-native flex-native"
>
> -SRC_URI =3D "git://git.efficios.com/babeltrace.git;branch=3Dstable-1.5 \
> +SRC_URI =3D "git://git.efficios.com/babeltrace.git;protocol=3Dhttps;bran=
ch=3Dstable-1.5 \
>            file://run-ptest \
>            file://0001-Handle-negative-time-and-offset-from-Epoch.patch \
>            file://0002-babeltrace-fix-bug-in-stream-intersection-option.p=
atch \

This patch will not apply -- the above two lines are not present in
kirkstone HEAD.

Steve

> diff --git a/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb b=
/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb
> index fad92df507..69d8a266f6 100644
> --- a/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb
> +++ b/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb
> @@ -8,8 +8,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fc=
e4486a80fdaf4a4263 \
>                      file://doc/LICENSING.txt;md5=3Ddfc50c7cea7b669358445=
87a0f7389e7 \
>                      "
>
> -SRC_URI =3D "https://github.com/ivmai/libatomic_ops/releases/download/v$=
{PV}/libatomic_ops-${PV}.tar.gz"
> -UPSTREAM_CHECK_URI =3D "https://github.com/ivmai/libatomic_ops/releases"
> +SRC_URI =3D "https://github.com/bdwgc/libatomic_ops/releases/download/v$=
{PV}/libatomic_ops-${PV}.tar.gz"
> +UPSTREAM_CHECK_URI =3D "https://github.com/bdwgc/libatomic_ops/releases"
>
>  SRC_URI[sha256sum] =3D "390f244d424714735b7050d056567615b3b8f29008a663c2=
62fb548f1802d292"
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#218547): https://lists.openembedded.org/g/openembedde=
d-core/message/218547
> Mute This Topic: https://lists.openembedded.org/mt/113618118/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

