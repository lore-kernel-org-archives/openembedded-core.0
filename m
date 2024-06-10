Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C249C27C5E
	for <webhook@archiver.kernel.org>; Mon, 10 Jun 2024 08:34:30 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.14884.1718008464726810758
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jun 2024 01:34:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Eq84JWt+;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2ebe40673d8so9330751fa.3
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Jun 2024 01:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718008463; x=1718613263; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UdYg5onL6m77o17Wz+nF0J7wS5pz/zdCg0nBRwQQB+0=;
        b=Eq84JWt+vt/Yq/BjEhGBb0e9CE32RomgAuXZ8TDrweQavMy6lOPwYKnpGxbBRX3eR/
         q2hVQhK3JpG+Q/9Tw3NeHeYexBuhdDezmDtsIJUTMpcPycXU9XXrU8rrnWo4zEQBdWMI
         fak/2JYGrytQw3K5t8QY9kIv/xorAx8/+eX2aHafgOHL35+/O1eyQd802xm5CHzwDMoW
         N624lbrweGluAMvgkiKhNvsVuc+CANvdlfVB8SX/Z8eDICsZK4aAPIyH0Hg0sfXLZXXX
         0M84Mhh4b2Z4xtqw3+XDrO97OfGouEzPhQsq4xEmc8jOoSVJ0Kl+LDFHwydNqBy8MUlS
         UTwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718008463; x=1718613263;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UdYg5onL6m77o17Wz+nF0J7wS5pz/zdCg0nBRwQQB+0=;
        b=StqYEhSZ5AuAjoHO69ItUEbjkZ1ayngXypI7Zex29j+wH+IeSLhblSlQOTJ74wYHIJ
         VmKUpR7KNBrMStE2g5m4xNlXtIVopaGIzaROyFre/krvMpUjQTbnuDmY1heEr8UDGOb6
         07N8cWvdsP2PRBl2b52tAhnPGqtDekZhhjxTj7mXLvvc3u1hgPTEe187EKqKN/bvtW3B
         3S7wf24Gvt728fckkR5ixwG98uQgCs64A0cNfurgjIQlmWAsvRrrD5baNWPFbPZhCaIt
         7HcqeOa22+Kd0mJ4kouK37vfDAHRUDvCVXpxgcgfRJSFgyVvxBJYlz9nW+BMRRGpKe2I
         hggQ==
X-Gm-Message-State: AOJu0YzabfX441z7J5LWE2himRc/J8evxfl23xVhWdcmZ4oHO6lXwvQ5
	ZRf8BQFLInp+354Z3OvIb/VSms7RiDauwHTRqa7w+zPyn37VwV0f69cio0rniondMEb3cdbl4dC
	0OBFOUZTH/Wom87aM+U+41gpEwxo=
X-Google-Smtp-Source: AGHT+IGOOIGJ8jmOgfEJvFck+Gz2AKhJftb8au1PwG+G1otOF5rinUFgtkU7kbs8qT/Df+w63zNf5wQMXHoAm5GGbUY=
X-Received: by 2002:a2e:3603:0:b0:2e9:6e43:c897 with SMTP id
 38308e7fff4ca-2eadce82d72mr52527581fa.48.1718008462617; Mon, 10 Jun 2024
 01:34:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240609211413.955929-1-f_l_k@t-online.de>
In-Reply-To: <20240609211413.955929-1-f_l_k@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 10 Jun 2024 10:34:10 +0200
Message-ID: <CANNYZj93ePy3K4uqCijkaMZW0HZjb=JEQR=A_=x5ZH=c+2B4KQ@mail.gmail.com>
Subject: Re: [oe-core][PATCH] gstreamer1.0-plugins-bad: drop PACKAGECONFIG for
 sctp and srtp
To: f_l_k@t-online.de
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jun 2024 08:34:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200467

I don't think this is correct. What if someone wants to enable these
features but not enable webrtc? Before this change it would be
possible, and now it isn't.

If someone wants webrtc, they should add these two to their
packageconfig as well; perhaps there could be a comment in the recipe.

Alex

On Sun, 9 Jun 2024 at 23:13, Markus Volk via lists.openembedded.org
<f_l_k=t-online.de@lists.openembedded.org> wrote:
>
> - connect them to webrtc
>
> This avoids:
>  ../gst-plugins-bad-1.24.3/ext/sctp/meson.build:8:33: ERROR: Feature sctp cannot be disabled: webrtc option is enabled
>  ../gst-plugins-bad-1.24.3/ext/srtp/meson.build:10:33: ERROR: Feature srtp cannot be disabled: webrtc option is enabled
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../gstreamer/gstreamer1.0-plugins-bad_1.24.3.bb              | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.3.bb
> index dbd504e87d..a990faf3bb 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.3.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.3.bb
> @@ -74,11 +74,9 @@ PACKAGECONFIG[resindvd]        = "-Dresindvd=enabled,-Dresindvd=disabled,libdvdr
>  PACKAGECONFIG[rsvg]            = "-Drsvg=enabled,-Drsvg=disabled,librsvg"
>  PACKAGECONFIG[rtmp]            = "-Drtmp=enabled,-Drtmp=disabled,rtmpdump"
>  PACKAGECONFIG[sbc]             = "-Dsbc=enabled,-Dsbc=disabled,sbc"
> -PACKAGECONFIG[sctp]            = "-Dsctp=enabled,-Dsctp=disabled"
>  PACKAGECONFIG[smoothstreaming] = "-Dsmoothstreaming=enabled,-Dsmoothstreaming=disabled,libxml2"
>  PACKAGECONFIG[sndfile]         = "-Dsndfile=enabled,-Dsndfile=disabled,libsndfile1"
>  PACKAGECONFIG[srt]             = "-Dsrt=enabled,-Dsrt=disabled,srt"
> -PACKAGECONFIG[srtp]            = "-Dsrtp=enabled,-Dsrtp=disabled,libsrtp"
>  PACKAGECONFIG[tinyalsa]        = "-Dtinyalsa=enabled,-Dtinyalsa=disabled,tinyalsa"
>  PACKAGECONFIG[ttml]            = "-Dttml=enabled,-Dttml=disabled,libxml2 pango cairo"
>  PACKAGECONFIG[uvch264]         = "-Duvch264=enabled,-Duvch264=disabled,libusb1 libgudev"
> @@ -91,7 +89,7 @@ PACKAGECONFIG[voamrwbenc]      = "-Dvoamrwbenc=enabled,-Dvoamrwbenc=disabled,vo-
>  PACKAGECONFIG[vulkan]          = "-Dvulkan=enabled,-Dvulkan=disabled,vulkan-loader shaderc-native"
>  PACKAGECONFIG[wayland]         = "-Dwayland=enabled,-Dwayland=disabled,wayland-native wayland wayland-protocols libdrm"
>  PACKAGECONFIG[webp]            = "-Dwebp=enabled,-Dwebp=disabled,libwebp"
> -PACKAGECONFIG[webrtc]          = "-Dwebrtc=enabled,-Dwebrtc=disabled,libnice"
> +PACKAGECONFIG[webrtc]          = "-Dwebrtc=enabled -Dsctp=enabled -Dsrtp=enabled,-Dwebrtc=disabled -Dsctp=disabled -Dsrtp=disabled,libnice libsrtp"
>  PACKAGECONFIG[webrtcdsp]       = "-Dwebrtcdsp=enabled,-Dwebrtcdsp=disabled,webrtc-audio-processing-1"
>  PACKAGECONFIG[zbar]            = "-Dzbar=enabled,-Dzbar=disabled,zbar"
>  PACKAGECONFIG[x11]             = "-Dx11=enabled,-Dx11=disabled,libxcb libxkbcommon"
> --
> 2.45.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200465): https://lists.openembedded.org/g/openembedded-core/message/200465
> Mute This Topic: https://lists.openembedded.org/mt/106582373/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

