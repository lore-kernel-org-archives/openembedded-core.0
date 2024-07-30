Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13F06C3DA49
	for <webhook@archiver.kernel.org>; Tue, 30 Jul 2024 14:24:41 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web11.18705.1722349477409004218
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jul 2024 07:24:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=X41ckq4w;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.175, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6510c0c8e29so31699347b3.0
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Jul 2024 07:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1722349476; x=1722954276; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DpxxFGDxhcw4JfQ3sSOGJAxmS6hmY7DOAuQFMpQ07Mw=;
        b=X41ckq4wCADQ2FD6X2dUOTq0Rnh41+vGMvJe+AYT1D5eSf6WcMNJTWRwi7GS/lhhRp
         fLXugJR6v8eFLJx3cQHgrp+SXphGo3fkdOBX3nDt4tLc9U1op8za498CCCoU75JDfSfz
         B+yZm5KXbSWpptCF5eIhIR0opsafwpfbU6DI0mNv2rIAbHXAcMSdURN8iWRWS/OSl3Xg
         GooKhREQBuAIt/vIDaIbg1ToyQjT9uAKbo6GLUoSH3CfJ9IA/sRuYTJ8B7Ec0TuleEZ2
         Hb1Apal/dQNnM/ZZrAu8IYwj5OK0FaGQUxCZU18t7XEGLIjJ4j+aeV28b8a/7HEYsVuE
         vjPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722349476; x=1722954276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DpxxFGDxhcw4JfQ3sSOGJAxmS6hmY7DOAuQFMpQ07Mw=;
        b=SVUNtnMUG/Ov4Vlyn5rcKYIdHqOYeNKgGEQmnsawKfYNjrduJbWVaHBM5YV6n2cH7Q
         /HcADq0A+aqxfhZaMaNnX9VaC+zDyYSh34cM4961MDRUmUmeZ6mJ9zrl2yPM/G1cAoJk
         5F/acMGToeCCATKTNnj7aluQ9DrtUgqkWYQv6pyt3uqwCAe8a/DUELykym1ZiqSx8qWQ
         2IEbrqkvyw31h8wAVZbVkUHdWqjc2K5gCUpwasOE3ZN3okAwEcE3JTl1LzwOEaDu9InK
         8Xjcmq1RivOPk/h18rwkqrrqgQJ3O8UZyMKIaD+qWj0cJ4pP4fS9qzLNvh2KR6h0oh6w
         TAnw==
X-Gm-Message-State: AOJu0YykYWsQVXRFcv3TVr5lm/lUzgDza0TYZhQqW8u9IhRBUoV1TCTS
	o4H1ce90o5zZVHxhOzGv17psF6dhYNsV+5/mvYEn2kNUCD6ZkOFhKMkhNV2aVj7pJI+0mKS/VaK
	2bkeLaf/swe/pEor9Um0+tKcR0NW7wvOaGCYSspJT7PC8KZ3j7hs=
X-Google-Smtp-Source: AGHT+IEDXHgV+FZxfyzLZpRb4ciqU3e+Soh5UpopCStS4Y/zL5En08QhThOS6+FiKkZKss/EQs28IwvmHE61CrztkOo=
X-Received: by 2002:a25:8505:0:b0:e0b:3e54:fc4b with SMTP id
 3f1490d57ef6-e0b545afcd2mr11102269276.43.1722349476531; Tue, 30 Jul 2024
 07:24:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240730104038.5894-1-asharma@mvista.com>
In-Reply-To: <20240730104038.5894-1-asharma@mvista.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 30 Jul 2024 07:24:25 -0700
Message-ID: <CAOSpxda6qZs5118X+3RT=tyBSVDwkuXKeQ_wg+R+P-rn_vfArw@mail.gmail.com>
Subject: Re: [OE-core][scarthgap][PATCH] bind: Upgrade 9.18.25 -> 9.18.28
To: asharma@mvista.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jul 2024 14:24:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202678

I can't take a version bump to 9.18.28 until master is also updated.

Could you submit a master patch?  I can then update scarthgap and kirkstone=
.

Thanks!

Steve

On Tue, Jul 30, 2024 at 3:40=E2=80=AFAM Ashish Sharma via
lists.openembedded.org <asharma=3Dmvista.com@lists.openembedded.org>
wrote:
>
> Includes security fixes for:
>                         CVE-2024-1975
>                         CVE-2024-1737
>                         CVE-2024-0760
>                         CVE-2024-4076
>
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
> https://gitlab.isc.org/isc-projects/bind9/-/blob/v9.18.28/CHANGES
>
> Signed-off-by: Ashish Sharma <asharma@mvista.com>
> ---
>  .../bind/{bind_9.18.25.bb =3D> bind_9.18.28.bb}                   | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-connectivity/bind/{bind_9.18.25.bb =3D> bind_9.18.28=
.bb} (97%)
>
> diff --git a/meta/recipes-connectivity/bind/bind_9.18.25.bb b/meta/recipe=
s-connectivity/bind/bind_9.18.28.bb
> similarity index 97%
> rename from meta/recipes-connectivity/bind/bind_9.18.25.bb
> rename to meta/recipes-connectivity/bind/bind_9.18.28.bb
> index cc35604aba4..ca2aef233b4 100644
> --- a/meta/recipes-connectivity/bind/bind_9.18.25.bb
> +++ b/meta/recipes-connectivity/bind/bind_9.18.28.bb
> @@ -20,7 +20,7 @@ SRC_URI =3D "https://ftp.isc.org/isc/bind9/${PV}/${BPN}=
-${PV}.tar.xz \
>             file://0001-avoid-start-failure-with-bind-user.patch \
>             "
>
> -SRC_URI[sha256sum] =3D "5a4a70432a33d009f0e6e9dbb328aae7a5e27507e98e28bf=
3c0c6b250ccb2ab3"
> +SRC_URI[sha256sum] =3D "e7cce9a165f7b619eefc4832f0a8dc16b005d29e3890aed6=
008c506ea286a5e7"
>
>  UPSTREAM_CHECK_URI =3D "https://ftp.isc.org/isc/bind9/"
>  # follow the ESV versions divisible by 2
> --
> 2.44.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#202671): https://lists.openembedded.org/g/openembedde=
d-core/message/202671
> Mute This Topic: https://lists.openembedded.org/mt/107625279/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

