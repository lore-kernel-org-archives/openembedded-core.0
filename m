Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32B48CAC5B8
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 14:03:48 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web10.9523.1759413822935650934
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Oct 2025 07:03:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IU5UDblZ;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-79390b83c7dso9375926d6.1
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 07:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759413822; x=1760018622; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TfzKmFH/y/Cc2MDpgDBQjXIoJcC1y1Z9ClNU1A4gy/w=;
        b=IU5UDblZjEWRN3+4LlwdsiWCi6+/JVxCt4W5p8j4/22jaVqt0nz5oS9Alv8PKelHOX
         X82Tr6sNpq3e8/LNR808Lfgb1PcOf1A4Cd5Gdm6espItYs6YFQK4iIYW7a09IF1Kf2uW
         l4/sRvtYkEDHpgPpsEvsaRxnWR8ePzN9L1it71QJ8mT/tMG6Y2RrrmwVhIB8y+VMc/C4
         2ImzNL6KxVqYkT/HaqcOQ3OvuLdn+3hwCEzmy4esVubGO8o6maq8Zow1wFkVPJLSp2ud
         D3fpWqT8FqJ7385/sHNcuNkn80JJ6rayxedwNT0pEOzRgGD9ZAiReN3ztb4bggGXNx5D
         Q2mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759413822; x=1760018622;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TfzKmFH/y/Cc2MDpgDBQjXIoJcC1y1Z9ClNU1A4gy/w=;
        b=bXmuPAEJwSPBovhzzR6fb6G5xY3uTZNUrgu3PkQhtQM66sK+zInK/picBh2k7ou/am
         NfZ7km2s/sqm1pFs2FaIF/v7YmQ+d1jHvUBzo0e9moi+B3TSgCE39xmqRSRxcIBzJKTI
         SPPOjAA23qnCRkjZALSgJc7p2l9QTjxWVZXAjLiK35N/TOEcKkqXXQAbUGOfDpz6Adu8
         zRhZsBJoYzKly7xdx0ZY75RrX0aqRONFDwobL0p3v+A7nHn+PblBsehbdczqKCSk8f/2
         PpEhDMN4EOrq2JqqrnVMsmiT1RQ2FrrgtAVMZA1qHlrKrv6janUiyAuAq1R31hidufAj
         PxqQ==
X-Gm-Message-State: AOJu0Ywl2eZAC6CuvYuAGgR7Q1h/6LFELTTQbxODitPHAtR52hS6xlJB
	vYXYF9UXqzo/nhxnxjOHXQ6OUggT6mBOg42oEHsyQVaeitIAU6ekGxA4JXvQwM4igVLu62/KBrb
	RZHK9bO/0ItU/pCB5KMYWwxDJtj7ft/s=
X-Gm-Gg: ASbGncuj5PWNeIPAPbEgFbOxbMwOG1pu01i58+b4IrZ8FaXu1trb6VjwuzgTEwQUMGA
	WCScKKotWOP9VM0t4Kv5ksCbhig0zuQjPyPKvBcE9BVQjVjH86XEc9H6y3Av6735D7FqQpEBz/Z
	Hz65ljWv4l2RR8Yrnih3vKUI41e0HRhFbD2FVRPD5aS3mpTlxG+HS1fhatp175MWIohrsFO5lq9
	dtG1G0Tcb6xRNRYgy95BOBgHEJ1TNniC8Ewank2b1xEmxDZRQc/dLj+qZSZDqx10qnUotmkDO5C
	dTpjB2EwziAWGBOTPPZkvi0QHo7NggkFEtVCR+qID1dWjxIh+exgqi4G3Lah00qq
X-Google-Smtp-Source: AGHT+IG6Ak86GBo7rGjbKQ4MoqKLcIUdeu5ak+GrC0H3zyTXsHxmLuQueoXR0jusFlI85rJQO+BO80pvIsAN4iQh6S0=
X-Received: by 2002:a05:6214:d87:b0:80c:67cb:af29 with SMTP id
 6a1803df08f44-873a6a8df50mr96992166d6.53.1759413821753; Thu, 02 Oct 2025
 07:03:41 -0700 (PDT)
MIME-Version: 1.0
References: <20251002113526.23868-1-zboszor@gmail.com>
In-Reply-To: <20251002113526.23868-1-zboszor@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 2 Oct 2025 16:03:30 +0200
X-Gm-Features: AS18NWBF_8v8ljHq-kULR2emYY6z8h1fbZ14f43qYnfUrksOI88_u8Yo_rBwj98
Message-ID: <CANNYZj_+RfipvMPLkkPQKp+77nebodtE0cjYHX8Yc_wueNMqig@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mesa: 25.2.4
To: zboszor@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 14:03:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224358

Please adjust the header:

mesa: update 25.2.3 -> 25.2.4

Alex

On Thu, 2 Oct 2025 at 13:35, Zoltan Boszormenyi via
lists.openembedded.org <zboszor=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Announcement:
> https://lists.freedesktop.org/archives/mesa-dev/2025-October/226554.html
>
> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> ---
>  meta/recipes-graphics/mesa/mesa.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
> index c3751f3414..7046deeb2b 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -19,8 +19,8 @@ SRC_URI =3D "https://archive.mesa3d.org/mesa-${PV}.tar.=
xz \
>             file://0001-freedreno-don-t-encode-build-path-into-binaries.p=
atch \
>  "
>
> -SRC_URI[sha256sum] =3D "f2d6b28562f1d6cb9c17ee8e58eeade7aa5faf927ae71065=
eadb41e17f92b4f8"
> -PV =3D "25.2.3"
> +SRC_URI[sha256sum] =3D "a370b4c549cbfbe646b319e34d73edb50ed883978f5e9513=
3f282f0eae39ab52"
> +PV =3D "25.2.4"
>
>  UPSTREAM_CHECK_GITTAGREGEX =3D "mesa-(?P<pver>\d+(\.\d+)+)"
>
> --
> 2.51.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#224355): https://lists.openembedded.org/g/openembedde=
d-core/message/224355
> Mute This Topic: https://lists.openembedded.org/mt/115550439/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

