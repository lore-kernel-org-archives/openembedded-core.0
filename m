Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E55FDEE4999
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 19:15:34 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.70790.1767122126627026476
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 11:15:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y4uE5bk6;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-37ba5af5951so93496511fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 11:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767122125; x=1767726925; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SD2bhwC7r21+RmidtH+IPTp9jBRdV6b64RBiEq9CgIs=;
        b=Y4uE5bk6/e9KudEGLa3LmomsNg4a/sYyJb3r4vMaZgzcxX6dyHsB/mbAWWhTpbkga5
         V1zyjaPnzvh8SY0D0T7WUbO/KVFyGccT3m8TZDrU0GAwvYOkMHZIg9yc2Fs9XWTJwwOe
         SXJ8hGJWpItkBOj6kvR4knzJ6qOAV0s6t/Al5n6+2qoZAvgwSr6noTBNrDPZGIuUYuf4
         SYRMp4T7vO6VJo0/n0HTZw3EF3Y/Jt0khO8jVzbO00araw4zdyZNamx8drSlhqSQw6T0
         lS9Won/C5QkjcsfXQVbmkk9Gewj/b9qohEVSZRNWD8EQK7+xDA+oe8DeTc3yJATu2H/g
         y4hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767122125; x=1767726925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SD2bhwC7r21+RmidtH+IPTp9jBRdV6b64RBiEq9CgIs=;
        b=kLaTD8Zv5F9/2/SCriK10EvIsrC3R603xnVQimSS5Sfi/4UWQ8VVjaPGn2nOkqZkr+
         e2p5jLHOd9UtklVl+w0GY+NYMvZNqgEY9jMfB6AaOTFx6Un7r3NZrvaHjSRFFFkmhfs4
         ccxPjNjY869KlrrdgeDRr5Pte++Diw5yw0J2RESr+jO9y889APjZhrvnvqltKFygPZmk
         FPfwA3Bu4UECSRhfj7a681h+yJ2fKR5RcIXeyKqvcOKJj/myd8p8qqUL3XnMNw5mOgQ8
         ChcgyGNAv2R+aeMY+myU5AdnsBx6fEN/K8Lsv9A8hqWC+ZNCyOk9L+utBQPE41HaIMOu
         dUng==
X-Gm-Message-State: AOJu0Yyyk1Fu+puUPSCUZtLLcGNoX1N0Rsj6lRwMQng9/GhnvRYjrLRN
	mU+28gQHzEvRhEE42vgk0bo0L82oFGC5QQX8hnfzj2JHHGos5XSvk6oj9YVnmrqbukKh3p0dbJZ
	61nbESiYZwcWGItrvojZf4yT01fB/Tw0=
X-Gm-Gg: AY/fxX4bnElqTK5ZKma7LIDWVJpFpZO8gSJO5i2D/fGXPul3H0DCQAiQWDn6LLNK48K
	JB3OEYYIMsJ2mHLbeVfHOwlrI1I+68VeMCLiy/M+w0flpO+gXlaNFins5WNQKVxrQ8T+cZ08ewB
	+GupysHOmQJc0LtD3ySISEOoH5Baa4apEXRE2tgphSMYyjRaSfN4S+Pg/mVbIdeXy055387QKHn
	CnEacNL+7JksbRFuwRh+/24GzrE1He5zebpXWjHU6YQQIc87OjSw3eQk4rZaBzkIQDzhz66/Q==
X-Google-Smtp-Source: AGHT+IGai8If/37+C/vKYgcOAIr4eblhKH5nnRdatV6XOPgo4SnWf+I8GXAAC34EbYckUL0NmWntqZsKTEC3PY0YV8k=
X-Received: by 2002:a05:651c:150b:b0:382:51cc:d25c with SMTP id
 38308e7fff4ca-38251ccd608mr72692381fa.27.1767122124366; Tue, 30 Dec 2025
 11:15:24 -0800 (PST)
MIME-Version: 1.0
References: <20251230190510.1097045-1-dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20251230190510.1097045-1-dmitry.baryshkov@oss.qualcomm.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 30 Dec 2025 20:15:14 +0100
X-Gm-Features: AQt7F2oV8TfojMZL3MSZgmZd4c9b0G5eFatYc8QfGGJ2sOec9GjbPIu9tHzB6Bw
Message-ID: <CA+chaQcqZB8veE7bwLZXnpKumibFc_35zqcmg4WmDeFwoaw3HQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] systemd: fix excess systemd -> ukify -> python dependency
To: dmitry.baryshkov@oss.qualcomm.com
Cc: openembedded-core@lists.openembedded.org, 
	Koen Kooi <koen.kooi@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 19:15:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228691

Thanks! That's what I did locally after reporting it in
https://lists.openembedded.org/g/openembedded-core/message/228460

Acked-by: Martin Jansa <martin.jansa@gmail.com>

On Tue, Dec 30, 2025 at 8:05=E2=80=AFPM Dmitry Baryshkov via
lists.openembedded.org
<dmitry.baryshkov=3Doss.qualcomm.com@lists.openembedded.org> wrote:
>
> The systemd package contains a symlink to ukify binary under the
> libdir/systemd. This symlink forces the systemd -> systemd-ukify
> dependency, which also pulls in a set of python packages, which might be
> undesirable for the small isntallations. Move the symlink to the
> systemd-ukify package, removing this dependency and preventing the
> excess growth of the rootfs / initramfst.
>
> Fixes: e92427496210 ("systemd: package 'ukify' seperately")
> Cc: Koen Kooi <koen.kooi@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  meta/recipes-core/systemd/systemd_258.1.bb | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/systemd/systemd_258.1.bb b/meta/recipes-co=
re/systemd/systemd_258.1.bb
> index 70414b03a481..410396f30834 100644
> --- a/meta/recipes-core/systemd/systemd_258.1.bb
> +++ b/meta/recipes-core/systemd/systemd_258.1.bb
> @@ -633,7 +633,10 @@ FILES:${PN}-udev-rules =3D "\
>
>  SUMMARY:${PN}-ukify =3D "Create and inspect Unified Kernel Images (UKIs)=
"
>  DESCRIPTION:${PN}-ukify =3D "ukify is a tool whose primary purpose is to=
 combine components (usually a kernel, an initrd, and a UEFI boot stub) to =
create a Unified Kernel Image (UKI) =E2=80=94 a PE binary that can be execu=
ted by the firmware to start the embedded linux kernel."
> -FILES:${PN}-ukify =3D "${bindir}/ukify"
> +FILES:${PN}-ukify =3D " \
> +    ${bindir}/ukify \
> +    ${nonarch_libdir}/systemd/ukify \
> +"
>  RDEPENDS:${PN}-ukify =3D " \
>                          python3-compression \
>                          python3-core \
> --
> 2.47.3
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#228690): https://lists.openembedded.org/g/openembedde=
d-core/message/228690
> Mute This Topic: https://lists.openembedded.org/mt/117001955/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
rtin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

