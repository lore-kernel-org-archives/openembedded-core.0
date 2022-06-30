Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45770C433EF
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 08:53:40 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web08.22632.1656579210135744176
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 01:53:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EA/sJ4t7;
 spf=pass (domain: gmail.com, ip: 209.85.167.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id a13so32493279lfr.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 01:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=bMD8ZL58aJpLoRy0aa+rrxyWun/NJLTvnfLoLOzX4GE=;
        b=EA/sJ4t71/SBHHuTe14PV4cOGYYSJ4Zyu5SD/noENatvby4XYYpnXLJOnr6OK1ExdC
         8Zhpc/osLY+1qXoc3wggcNaVHgJQ4kutDZu4z4EUUUwYw8layRhXM92lG7yqAIzM5v+d
         aUMuJJ77YWOEN70DT1V9wWUkGDcw3yBrRZrHXImDCcv4eJCm4bHZcIlHxtzWE2QDZDQq
         MgTYe/6Ha/ucoQQoEAq5eH6MtvtQSKQ2ndgj6+aJbJCt9i8+iMxDguUixOtZuLjSHeJU
         Cn8ItKOELmY2jx88JJexeAVzXB1+KEOB6e3TLvnqROEpMxswmHdKQCqitnSZRu+Yinf9
         eKWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=bMD8ZL58aJpLoRy0aa+rrxyWun/NJLTvnfLoLOzX4GE=;
        b=hHdvt6gp0tXUODMIB4QD6d6usBwNRNMAb4bZPYQO4jGwwLIuZAvDsGkMJPlzShh4KW
         crHeKRGUE+Xv3O/EmWP3KdQyZfqNu4d8sjve3pq3pn/AKh3DKURzFXDXBtnhMGo0r4JF
         dsdiZX8TF9DG1HoLt9X0A6zt/YSlaXODiBrPDMDqXcYv6/UmDiO4yvWZgpT9Wvf5y9LS
         ZbojscwWZ0qivmlisvOgElAgfrvpF56uLdHo+ekFKzfkL75ejDnE70HdhWz+VmsQwWFM
         zaJMq4JUBFNX/IKB5S38yQkEk5TpiAN45Z043DDKq9/b/XTUjP0VdPFu8E10a1/mq0bo
         2dgQ==
X-Gm-Message-State: AJIora8QUvxA8kqdIqIwHRH+wSjNiT9Z5P5TseshMT3MXXT2L6RJvFxZ
	Oy7E852SMPgfe4oEcoJRCYzhoj0WRcHxxw5kDWo=
X-Google-Smtp-Source: 
 AGRyM1sC0+FE6Jl5j134st5BBT2lCnXrfOvEnkrgmGTxjLg5DX2QfJEiYgLL7y6TAexVy2jSFZZRQ8lFCuAYs5gfq24=
X-Received: by 2002:a05:6512:36c2:b0:47f:9fb1:56ae with SMTP id
 e2-20020a05651236c200b0047f9fb156aemr4886576lfs.534.1656579208118; Thu, 30
 Jun 2022 01:53:28 -0700 (PDT)
MIME-Version: 1.0
References: <1656562773-11393-1-git-send-email-wangmy@fujitsu.com>
 <1656562773-11393-4-git-send-email-wangmy@fujitsu.com>
 <CANPvuR=4vnxmJPP2gPEFyatr85g8VkrR9iM-bc_FPNnSwiFDXw@mail.gmail.com>
 <OSBPR01MB18453FE42E6B1E5C79006679DCBA9@OSBPR01MB1845.jpnprd01.prod.outlook.com>
In-Reply-To: 
 <OSBPR01MB18453FE42E6B1E5C79006679DCBA9@OSBPR01MB1845.jpnprd01.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 30 Jun 2022 10:53:16 +0200
Message-ID: 
 <CANNYZj_nVJQ=kP5J=joBwqH+QmUpJaOwFjEL2XXZXMdt9e1itA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gstreamer1.0: upgrade 1.20.2 -> 1.20.3
To: wangmy <wangmy@fujitsu.com>
Cc: Jose Quaresma <quaresma.jose@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jun 2022 08:53:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167406

I think we can also simply wait for AUH to process the full set
automatically (which will happen tomorrow), then you or anyone else
interested can simply pick the patches off this mailing list, or see
upfront where the problems are.

Alex

On Thu, 30 Jun 2022 at 10:38, wangmy <wangmy@fujitsu.com> wrote:
>
> Thank you for reminding.
>
> I will upgrade the framework as a whole and submit it again.
>
>
>
>   --
>
> Best Regards
>
> ---------------------------------------------------
>
> Wang Mingyu
>
> Development Dept.I
>
> Nanjing Fujitsu Nanda Software Tech. Co., Ltd.(FNST) No. 6 Wenzhu Road, N=
anjing, 210012, China
>
> TEL: +86+25-86630566-8568
>
> COINS: 79988548
>
> FAX: +86+25-83317685
>
> MAIL: wangmy@fujitsu.com
>
> http://www.fujitsu.com/cn/fnst/
>
>
>
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Jose Quaresma
> Sent: Thursday, June 30, 2022 4:11 PM
> To: Wang, Mingyu/=E7=8E=8B =E9=B8=A3=E7=91=9C <wangmy@fujitsu.com>
> Cc: OE-core <openembedded-core@lists.openembedded.org>
> Subject: Re: [OE-core] [PATCH] gstreamer1.0: upgrade 1.20.2 -> 1.20.3
>
>
>
> Hi wangmy,
>
>
>
> This doesn't work, gstreamer is a framework so when you update one elemen=
t you need to update all of them.
>
>
>
> Jose
>
>
>
> wangmy <wangmy@fujitsu.com> escreveu no dia quinta, 30/06/2022 =C3=A0(s) =
05:20:
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../{gstreamer1.0_1.20.2.bb =3D> gstreamer1.0_1.20.3.bb}          | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.20.2.bb =3D> gs=
treamer1.0_1.20.3.bb} (97%)
>
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb b/m=
eta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb
> similarity index 97%
> rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb
> rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb
> index 3aa9aa7048..1f4576c3e1 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb
> @@ -23,7 +23,7 @@ SRC_URI =3D "https://gstreamer.freedesktop.org/src/gstr=
eamer/gstreamer-${PV}.tar.x
>             file://0004-tests-add-helper-script-to-run-the-installed_test=
s.patch;striplevel=3D3 \
>             file://0005-tests-remove-gstbin-test_watch_for_state_change-t=
est.patch \
>             "
> -SRC_URI[sha256sum] =3D "df24e8792691a02dfe003b3833a51f1dbc6c3331ae625d14=
3b17da939ceb5e0a"
> +SRC_URI[sha256sum] =3D "607daf64bbbd5fb18af9d17e21c0d22c4d702fffe83b23cb=
22d1b1af2ca23a2a"
>
>  PACKAGECONFIG ??=3D "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests',=
 '', d)} \
>                     check \
> --
> 2.25.1
>
>
>
>
>
>
> --
>
> Best regards,
>
>
> Jos=C3=A9 Quaresma
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167404): https://lists.openembedded.org/g/openembedde=
d-core/message/167404
> Mute This Topic: https://lists.openembedded.org/mt/92080526/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

