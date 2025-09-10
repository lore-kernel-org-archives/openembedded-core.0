Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23742CA101F
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 10:55:41 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web11.14495.1757501733707959737
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 03:55:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GyDsUE3G;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-7251e6b2f9eso38098506d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 03:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757501733; x=1758106533; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=c5n7itaBqfMyNiUmMQ1LJMexHwcopRW24JUSHwL9dnw=;
        b=GyDsUE3Gi/bkmMQgkFDYcApG8ie88JQ+3t2wOnna9+r91wwS8J0hP3gv9sGhw0ERL7
         +38h0+KqbjoqWS1qmRaOMgddLi7yUCdH0XKTOqkcJqVN2AYKsNe/IFFrGYmL9AvVKJPM
         CSWBxau2lTsJlMrhslN8m1BlnYSzBAXCCNs6Ho9UZBemFxBLZ8D1O/2xPx7qa5KiAfco
         XP2ZI6haRHngxOH/Wu5wdl11n/YO+3lKi41O1UN1AtoR3eucikMh2e13IU/jwoVT9LWS
         s3/g9msruPB9cHMV3JAxOi0UhbTfoogaVjBBONEHKQYVPHJ/ddFQBmK5t+uuMd9N4peC
         jY9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757501733; x=1758106533;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c5n7itaBqfMyNiUmMQ1LJMexHwcopRW24JUSHwL9dnw=;
        b=VwPiDimPuZxWJBdYMukkEbdBjY9ByX17UswGYH3kWIcaQqw0D9Ry6SamSRpNrvH7zp
         3tVl5sI9EllskJNN6GGQoRqAkg9eEdQbUjE8y4DxABmIJ99FGCVHZbmtOEMJidH/UoyY
         HvUSz304pfK2ATyxNQlWs7fEVL7nnR09SmBbLvSLizTfJxLKsytRzL8PWNhEMdKShxQD
         eMGMt6fPP3rWmcRxvf+AFHenqOA9/j94aNm9iicYw7/0Yxnt5DC1qxT5HwXmQN2lG/K9
         HVlMwdHa0aGROb1LqAnX1tjQT//p2NEeWIa2DlUTuqaFoWomixi7oUVe1J7/+aGT4Kgp
         HdDA==
X-Gm-Message-State: AOJu0YyHAjqueDrj0wtpH3ZStuqKeF1XWN5Facbxp8NHJEHbwwr9/Im4
	cExVuRNi/f+9BXCalbJ/0qxKU1VvVq7lp0kQikvqTE2kx5RYe//mHdQPRmP0C+GO054dmAK5wyj
	jiorzU25S/LrgbKd57MKyhQsD5rvLH+8=
X-Gm-Gg: ASbGncv/BJPrvHlB7M2cdBbBymw0V36v6h4ZeVS6cMrtbOzJ1vmlTgNJzL1P+bmQJlq
	zF3uiawtu2uMlhdP6flna9C6gvO1qgs2JRnJyTgEHVQsiC7tSarSPJYX+fX+Z/vx9xshJLcgfC8
	b8uvvw1QkVNlxHuBePd0E1djm5/kTkwU/InM8YxalsEDdjjEhNWlXEUFhv9wqYgtS4y2L1fOn08
	/kJAF01VHTN/UyplVx9abkbxX0RZuPjfIrepRQaVyaIaOw5H/TXprM+2w2ttxkHO36vRyqatx2m
	iRX3EQxwwwTz/cUy84tWW4J0PvYHtaLsHY+8VZYw4Tz8NXCKAd0=
X-Google-Smtp-Source: AGHT+IFxTpDSRgATGdbGJHzCtKncndUxi1X56abfen0BANUFmUjH5seSrgjXilpc1b6H/xNF9fFgBuAvyg8A1S8Hy7U=
X-Received: by 2002:ad4:5bce:0:b0:72b:ee04:6356 with SMTP id
 6a1803df08f44-73940035d28mr162609186d6.43.1757501732595; Wed, 10 Sep 2025
 03:55:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250910105053.315379-1-alex.kanavin@gmail.com> <1863E645CB301A0B.10180@lists.openembedded.org>
In-Reply-To: <1863E645CB301A0B.10180@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 10 Sep 2025 12:55:20 +0200
X-Gm-Features: AS18NWBPtuwlA688bZysI7eJYUhtaNoWt1k8ypFMPiJ586a9UmwOfzKtTguFn6Q
Message-ID: <CANNYZj9UAp3zXs1OLLizuoi7Td1reykuLaXqD0TH9YaSKkCTpw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/6] maintainers.inc: unassign Frederic
 Martinssons from cargo-c
To: Frederic Martinsons <frederic.martinsons@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 10:55:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223200

Hello Frederic,

please see below; if you do not wish to be unassigned as the
maintainer of these recipes in openembedded-core, please speak up. But
it is expected that assigned maintainers update their recipes to
latest versions in a timely manner (which has not been happening).

Thanks,
Alex




On Wed, 10 Sept 2025 at 12:51, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
>
> From: Alexander Kanavin <alex@linutronix.de>
>
> Same as previous unassignment: no activity.
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/conf/distro/include/maintainers.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> index f98009a1b33..c44d67d4490 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -91,7 +91,7 @@ RECIPE_MAINTAINER:pn-bzip2 = "Denys Dmytriyenko <denis@denix.org>"
>  RECIPE_MAINTAINER:pn-ca-certificates = "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-cairo = "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-cargo = "Randy MacLeod <Randy.MacLeod@windriver.com>"
> -RECIPE_MAINTAINER:pn-cargo-c = "Frederic Martinsons <frederic.martinsons@gmail.com>"
> +RECIPE_MAINTAINER:pn-cargo-c = "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-cantarell-fonts = "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-ccache = "Robert Yang <liezhi.yang@windriver.com>"
>  RECIPE_MAINTAINER:pn-cdrtools-native = "Yi Zhao <yi.zhao@windriver.com>"
> --
> 2.39.5
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#223194): https://lists.openembedded.org/g/openembedded-core/message/223194
> Mute This Topic: https://lists.openembedded.org/mt/115167229/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

