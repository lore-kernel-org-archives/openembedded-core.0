Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EBB4CCF9F8
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 10:29:09 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17715.1762165744883434560
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 02:29:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eq2lxOGL;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-429c4c65485so2760754f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 02:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762165743; x=1762770543; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YDZWmgcBWFCIre/WiVxDEkKSTsVV7ONJ6PMlfINeilQ=;
        b=eq2lxOGLSd39q8eHz89JW73IYFEnzv4GyefIf/1M5dC+qjkUsNxmZPQSdDGiN28P2b
         WD29L/LzHwm4ZkwdubHmLlSITx2BbWqK8F16B8kcym35BuSpkM027VXKxi6WJXJMuIfI
         zVyJVnbHJ8mgCdm86AK2dTagGTF/B4lRJM78bLT48eE6PTizwBGVQ80nv/DAqWsfKTDM
         R5/IKHD7gKaxKwR+Rg+d6b65eEGxb3Zr/R5Jftlra6wv6/dA00hXhNygCvvt8XKDLR1R
         /b7wDPdWzhWnu2zqvxUYTuE6RzxRo9VXyzu7JJNiw1AhozImJcP8AW8Cibf/LU39RSOs
         BSlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762165743; x=1762770543;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YDZWmgcBWFCIre/WiVxDEkKSTsVV7ONJ6PMlfINeilQ=;
        b=gU2EbN/8rYZYgQ03r4tdPjVrtGecOTUalB979WB3m2XHcyMYAl+c+ODZvXvPDit7r0
         cIZhfiVZxIiPt2oXTvUb8ASDIGBUnOUJ0XPnWZA2eMrWIlOYfEtwWf7nSJjspe8Cz6cO
         ouLPSfLRPQ08afuzpckYxObp+V/6S5IkM2h+rYhOBYGe3vmwFbHfd9tS4tw1TItKBhFW
         xSdhnln8zgeSvrHKhlQGbPwS0tk/iRNcUaaGMkVTsBLjropz9jyy+iAnVjwV4MIKRYw5
         4xCbPEkd1OVqDhhr5bY4QsjaSY0g15sqZV+XzLS9fFjRGK7U3ItksPv69xuiSSuOpKVN
         j6Cw==
X-Forwarded-Encrypted: i=1; AJvYcCVPBgRRwbmhgcKovTBDWZd8jNvLagGxhQgovGY2m8RGqWOltNeUdt5Tx/ALmrZWfh8hBIp8tK69le/hcfp1YXdCew==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwQWtfXkQp9IiPai2np+yDhofz1HFJsKfnRLHMBp5qz9LHGr5hL
	KaJY6VkeEuiQsNogYWqbfoeh3XQh35CcjYY/ow8fQ08fCcAqVLo1UmSy
X-Gm-Gg: ASbGnctUmaHJF42wLp7rienl0t2j4Pop55lxY1eroII5Mh4yIt+QZ6GvdTKAl0b1BC1
	5kAgABoVkj7ZNTOFowXKUwpMyu6nHM+AYz0TxlvxUKyTiVwMYeAKZTZbiiMAo2yLG8F5UIQRBiG
	9PhSDYYmy6xMQjWx52ze/T6jcxToAegzmvt0DfboGqKHm4r+ze1kFwVaAjchKTjHFzV81Yz6i5g
	lzWBtZZ5VXC5/f9Dtsds5lerXo5+AwPSX2wcWJlMt+bWJz1OBYPHAJB3KkhHv+BWNoU+qBpnMgv
	m/hoKQPzq9NcJTbXhRV4hgpX/t5yclJeGeMvs3rU9Jeb5+WmFROzGHLOAh6ZD8yi66ExeGXDKfU
	Hxn9VyS8CQYa4FL3nh1g3mJiRq/d1JntnWTEbGc353+5GgQZ9sX/FlvQ4KfX8qCApV6olNz++qf
	iJ3cRuYIcFh+IwKMEMDOJNV0ww+OrhcQ==
X-Google-Smtp-Source: AGHT+IFr8VGaiujbeCyMPiChSjujV/J2Wwtu380240jiUK9XqmESmN/rcya6q7/3jj78X3LCzgiVxQ==
X-Received: by 2002:a05:6000:400b:b0:429:cda2:a00e with SMTP id ffacd0b85a97d-429cda2a356mr3028479f8f.6.1762165742976;
        Mon, 03 Nov 2025 02:29:02 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429ce80ded1sm9010699f8f.4.2025.11.03.02.29.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 02:29:02 -0800 (PST)
Message-ID: <2b15dd7b-717a-453f-9e43-5cb640db126a@gmail.com>
Date: Mon, 3 Nov 2025 11:29:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [kirkstone][PATCH 05/19] gtk+3: add PACKAGECONFIG for
 libcloudservice and tracker; fix cups backend
To: joerg.sommer@navimatix.de, openembedded-core@lists.openembedded.org,
 f_l_k@t-online.de, alexandre.belloni@bootlin.com,
 richard.purdie@linuxfoundation.org
References: <0d34bc13973f2ff1567713e5de053dfa3d202802.1762157680.git.joerg.sommer@navimatix.de>
 <b39886c6d1d39e893e639a60e368249ffc95941f.1762157680.git.joerg.sommer@navimatix.de>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <b39886c6d1d39e893e639a60e368249ffc95941f.1762157680.git.joerg.sommer@navimatix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 10:29:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225641

Note that libcloudproviders doesn't exist in Kirkstone meta-oe.

I guess it's a matter of taste, but in general I think changing
packageconfigs in a stable branch can be dicey.
(I get that these are cherry-picks, but maybe adding custom patches to
update would be less invasive)

On 11/3/25 09:21, Jörg Sommer via lists.openembedded.org wrote:
> From: Markus Volk <f_l_k@t-online.de>
>
> Add options to enable support for libcloudprovider and tracker
>
> If the cups backend is enabled, the mandatory file backend gets disabled and
> thus configure fails. Fix it by not defining the print-backend and just include cups
> as a dependency. Additionally add it as a runtime dependency.
>
> Now, if cups gets enabled, it should include the following print-backends
> by default: cups,lpr,file
>
> (From OE-Core rev: 5ac88d032968f4d005a61fc34f7e3e6e55426ccd)
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Cherry-pick-of: 2725d99b79b4caa9b301d206a2b1a7851d2b74cc
> Signed-off-by: Jörg Sommer <joerg.sommer@navimatix.de>
> ---
>  meta/recipes-gnome/gtk+/gtk+3.inc | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/gtk+3.inc
> index 1d726b5696..8d01e6077f 100644
> --- a/meta/recipes-gnome/gtk+/gtk+3.inc
> +++ b/meta/recipes-gnome/gtk+/gtk+3.inc
> @@ -41,8 +41,10 @@ PACKAGECONFIG[x11] = "-Dx11_backend=true,-Dx11_backend=false,at-spi2-atk fontcon
>  # this is provided by oe-core patch that removes epoxy/gl dependency from a X11 build
>  PACKAGECONFIG[opengl] = "-Dopengl=true,-Dopengl=false,libepoxy"
>  PACKAGECONFIG[wayland] = "-Dwayland_backend=true,-Dwayland_backend=false,wayland wayland-protocols libxkbcommon virtual/egl virtual/libgles2 wayland-native"
> -PACKAGECONFIG[cups] = "-Dprint_backends=cups,-Dprint_backends=file,cups"
> +PACKAGECONFIG[cups] = ",,cups,cups"
>  PACKAGECONFIG[colord] = "-Dcolord=yes,-Dcolord=no,colord"
> +PACKAGECONFIG[cloudproviders] = "-Dcloudproviders=true,-Dcloudproviders=false,libcloudproviders"
> +PACKAGECONFIG[tracker3] = "-Dtracker3=true,-Dtracker3=false,tracker,tracker-miners"
>  
>  prepare_gtk_scripts() {
>      mv ${D}${bindir}/gtk-update-icon-cache ${D}${bindir}/gtk-update-icon-cache-3.0
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#225619): https://lists.openembedded.org/g/openembedded-core/message/225619
> Mute This Topic: https://lists.openembedded.org/mt/116094469/6084445
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


