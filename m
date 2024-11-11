Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53B8BD2E9E2
	for <webhook@archiver.kernel.org>; Mon, 11 Nov 2024 12:05:59 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.57486.1731326751266555202
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Nov 2024 04:05:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nE/8GrEg;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539e5c15fd3so4379859e87.3
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 04:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731326749; x=1731931549; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4y65Cld+T97xxky7IdI2/y0Z4jeIoTTCMZrMlo76ZK8=;
        b=nE/8GrEg+Iz2fgbh9frOXyL4qZq7C7vEws7QXKGu8b/av+KDAjJ/T/bvDgd/tIvsjQ
         X/cnPs+ZffXjuIG32P4bs9uyjiOnoL9OnnFk0fCh1FK+vdHRgFhF5lCl57Fs2YI9t70I
         hlyRTaSt33Ed5gN864XnbHP3gyt7A9HFNk1+lhYqzMFZ08lCMaLwJ5lOvOfRqzf7WGeI
         ntejcg/RFuqkZM/2iGuo00tMtrRTid8H+ytnKxC0OR1GcW0l2EQKK4jwdIzTu8EiXvNt
         ElM1HBfXiAEZZfaGiT0kZfELisk/P/dXGwtswuaLd6RYC6Igcpf5pQrM14CQqtouGwwb
         QZ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731326749; x=1731931549;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4y65Cld+T97xxky7IdI2/y0Z4jeIoTTCMZrMlo76ZK8=;
        b=IMV3MQiZe2EDWvw4h1ZtujrpDSWFhxhAitvAylcf6M1NzrYqUZ4VMwXe+Ag8+NEQb4
         FHLo9Zvqf28OqwubbXvTHPAch9LMxv7X0HZMverxxkBVSdmPH+g3shyRLCFd2gOS1AnZ
         H0ZedtKWaR38n1wXXI6M5cr/qtAN/falONDpF2G8iV0xlSC2PKCX46HaUP+zh1TqWZvz
         BcaeoQVGxmgVBUApbZrfk45n538AtJVXzfKs/VRfC6VcW0n/0VsxEb0a30CYB9CMwlQm
         9hLirvvXeAzQeLIymRh8Nynqqj8lusp9OYQPzxmZHKwn6eMh6WbJzLgC8RfPh+Dj/vcL
         k0dQ==
X-Gm-Message-State: AOJu0YygFBoBNquD9WgVOYhHGl+KwViY068jNmotLL3ISRmtiriXuPK0
	5J3onMBeAkqTuZw3LA4lkpJh7ISkBnhFWoz6JyErCfiv8LFscA6Et/Dofz4g7frsZ/Kpb1PTyUH
	Cz0NipifKQ+0gDRP+GOCzOFla1D0=
X-Google-Smtp-Source: AGHT+IGdxjwaHvqREomcWa4L0uCDBF0fSadcy+FvsnGU1YwfrG/yFHeNK11o/92rKfUnFM5oqdjR24tPbzcL64KUpxM=
X-Received: by 2002:a2e:a914:0:b0:2fb:50ce:ce94 with SMTP id
 38308e7fff4ca-2ff200858a3mr58061591fa.0.1731326748532; Mon, 11 Nov 2024
 04:05:48 -0800 (PST)
MIME-Version: 1.0
References: <20241111120212.173440-1-changqing.li@windriver.com>
In-Reply-To: <20241111120212.173440-1-changqing.li@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 11 Nov 2024 13:05:37 +0100
Message-ID: <CANNYZj8_h-HKtiRt1fOHzHLcj8_ctCavEJ3pe3x0QbiYZrdGrA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gdk-pixbuf: enable other loaders by default
To: changqing.li@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 12:05:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206949

This should be a PACKAGECONFIG option.

Alex

On Mon, 11 Nov 2024 at 13:02, Changqing Li via lists.openembedded.org
<changqing.li=windriver.com@lists.openembedded.org> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> Refer [1], upstream gdk-pixbuf disable some loaders by default from
> 2.42.11, this makes some format of icons not works well after upgrade
> gdk-pixbuf, report error like:
> matchbox-deskto[501]: Error loading icon: Failed to load /usr/share/pixmaps/xinput_calibrator.xpm: Unrecognized image file format
>
> Fixed the same as some other sdks and arch linux, enable
> these loaders by default, refer [2][3][4]
>
> [1] https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/commit/e052a112075a19fb75f1f2ff3de4c82923de13f2
> [2] https://gitlab.gnome.org/GNOME/gnome-build-meta/-/issues/846
> [3] https://gitlab.com/freedesktop-sdk/freedesktop-sdk/-/commit/3ab7810255c64ce8aa2ae3ac10250148588ab49b
> [4] https://gitlab.archlinux.org/archlinux/packaging/packages/gdk-pixbuf2/-/commit/4fa2d98a197781354b66a9710c9d596d502c961b
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
> index 9f825a68ef..e48589dcd1 100644
> --- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
> +++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
> @@ -43,7 +43,7 @@ PACKAGECONFIG[jpeg] = "-Djpeg=enabled,-Djpeg=disabled,jpeg"
>  PACKAGECONFIG[tiff] = "-Dtiff=enabled,-Dtiff=disabled,tiff"
>  PACKAGECONFIG[tests] = "-Dinstalled_tests=true,-Dinstalled_tests=false"
>
> -EXTRA_OEMESON = "-Dman=false"
> +EXTRA_OEMESON = "-Dman=false -Dothers=enabled"
>
>  PACKAGES =+ "${PN}-xlib"
>
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#206948): https://lists.openembedded.org/g/openembedded-core/message/206948
> Mute This Topic: https://lists.openembedded.org/mt/109513172/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

