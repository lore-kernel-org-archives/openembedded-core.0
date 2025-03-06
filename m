Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A6F8C282D1
	for <webhook@archiver.kernel.org>; Thu,  6 Mar 2025 10:31:42 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.9941.1741257101188300968
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Mar 2025 02:31:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ZT6QOwmM;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3912fdddf8fso52073f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Mar 2025 02:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1741257099; x=1741861899; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+kYcxAtROLH5jvaw+qBUya4likOB5NVa74+SaDi/6LE=;
        b=ZT6QOwmMBlVyDzyOntSDW4dlbxT+rC44e57EBSZfKfXyGEM3x5JFqg6lgIk/GwXPcP
         bC5/RSYhvLW1Avxykd67Rx0zo48mKIcKSfaPl1hTRRYz7a2306RwSUzj+WUB8K3NDPOn
         4otgLw7p9C7gTFsYroUFp1Ng2jP/sSc5fQaw4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741257099; x=1741861899;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+kYcxAtROLH5jvaw+qBUya4likOB5NVa74+SaDi/6LE=;
        b=MyaHwrZxVF6aIrrAoEsBBdfXP/t+XN4sVaDwRCZwjMoC9ibhAFh4ayLiDbJu5E1YuS
         EapbReEEe5kHgtHwGthW1bb+5beXWsDJY7/hki8EJQEaIfC5QrNMy8m4eXhwqMuHhdCW
         X1fBXayBg/lOP9SO6ndil3J4nwHxbIceg4BaHcnQQseda6c5WamkC1UFQ9ydZjDVqZ0h
         slDVyHgPpelQjL0at3BXJHrKr4GVXtIxetibYV+IrbW4ATR6IiLnIbImblGoHdPpA1Nh
         0jU+2YAg/QShkGmTbKPygfHaTS9CfB24uNMKsmsTwnRvxWld8ENmsut7I2zp0xEt0/PF
         KYyQ==
X-Gm-Message-State: AOJu0Ywv1Zk4CBh5ObQYTVwG2byc0hM92TH6DXtbSCfNnyVqmSzsd71H
	A+Wdry3MxCEaXw9s1GFsYgm68U2gphbdx1tEVKDXq/BE2ZYbEsaUZ3gNTMAIVCA9NfaKAFeuJ8x
	NoM7PcMTP4wVApkuEsBLtGgZxYTZ5mibilDXexw==
X-Gm-Gg: ASbGncvjnxW+U8C/QiamqtP0+LQC4w0EjhteGTiVgNDhwwUJRxeGJdxKgFT6i0j+Vzd
	EcSgrokeqZfwFNDUvyV/Urvms6ZvAVxPRwBGQYV2MHfYLt6qW6zV7aFQ/cCqHC1a2PDQPAZsvM7
	sBFqztitaTSgwyoqkAdiEP+20HPwn1
X-Google-Smtp-Source: AGHT+IE4z6l9QdRhjzaUDOpJCzkO+iYN79FrnOFqLgQfWt4JZwpGa+XhWylstkOGKTlWjXZUgIjkWSgNomIjwLuVV+Y=
X-Received: by 2002:a05:6000:459e:b0:391:bc8:564a with SMTP id
 ffacd0b85a97d-3912982ea65mr1727528f8f.22.1741257099490; Thu, 06 Mar 2025
 02:31:39 -0800 (PST)
MIME-Version: 1.0
References: <20250301094303.10707-1-peter.marko@siemens.com>
In-Reply-To: <20250301094303.10707-1-peter.marko@siemens.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Thu, 6 Mar 2025 11:31:12 +0100
X-Gm-Features: AQ5f1JrGUuAyCRzxwFWkt_2sARW9JmScWGm4803IBlmaBThiuVdfI9HEX2fKVOw
Message-ID: <CAMSfU+6N6xHjqxCso_09sb6ia7dYJbPDoh6pFYMFeHaMivkePA@mail.gmail.com>
Subject: Re: [OE-core][master][styhead][scarthgap][kirkstone][PATCH] puzzles:
 set CVE product
To: peter.marko@siemens.com
Cc: openembedded-core@lists.openembedded.org, 
	Steve Sakoman <steve@sakoman.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Mar 2025 10:31:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212381

Hello,

Le sam. 1 mars 2025 =C3=A0 10:44, Peter Marko via lists.openembedded.org
<peter.marko=3Dsiemens.com@lists.openembedded.org> a =C3=A9crit :
>
> From: Peter Marko <peter.marko@siemens.com>
>
> CVE reports now show 3 CVEs for this component.
> They are for "The Puzzles theme for WordPress" with cpe like
> "cpe:2.3:a:themerex:puzzles:*:*:*:*:*:wordpress:*:*".
>
> Setting vendor solves these false positives.
> Vendor is set per git path "git://git.tartarus.org/simon/puzzles.git".
> This may be wrong value, but since we don't support negative regex, this
> is the best we can do now if we don't want to start marking all with
> cpe-incorrect status one by one.
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>

Thank you for taking care of the CVEs.

For this patch though, another patch was prefered :
https://lists.openembedded.org/g/openembedded-core/message/212280 (now
in master-next, should be merged soon)
The rationale is: since there is no CVEs on "our" puzzles, we can't
predict what the CPE will be when that happen, so, in the meantime, we
explicitly ignore CVEs from the wordpress plugin.

Regards,


> ---
>  meta/recipes-sato/puzzles/puzzles_git.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato=
/puzzles/puzzles_git.bb
> index 677a9e291e0..df2491ec850 100644
> --- a/meta/recipes-sato/puzzles/puzzles_git.bb
> +++ b/meta/recipes-sato/puzzles/puzzles_git.bb
> @@ -20,6 +20,8 @@ inherit cmake features_check pkgconfig
>
>  DEPENDS +=3D "gtk+3"
>
> +CVE_PRODUCT =3D "simon:puzzles"
> +
>  do_install:append () {
>      # net conflicts with Samba, so rename it
>      mv ${D}${bindir}/net ${D}${bindir}/puzzles-net
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#212092): https://lists.openembedded.org/g/openembedde=
d-core/message/212092
> Mute This Topic: https://lists.openembedded.org/mt/111449818/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [yo=
ann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--
Yoann Congal
Smile ECS - Tech expert

