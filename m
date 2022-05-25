Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89413C433F5
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 10:22:35 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web10.5139.1653474145212116747
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 03:22:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.17,
 mailfrom: f_l_k@t-online.de)
Received: from fwd89.dcpf.telekom.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout02.t-online.de (Postfix) with SMTP id 5B0CC69EB
	for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 12:22:23 +0200 (CEST)
Received: from [192.168.178.83] ([84.154.171.111]) by fwd89.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nto9m-4fxFMv0; Wed, 25 May 2022 12:22:22 +0200
Message-ID: <c5920e89-ad4d-c553-2b00-fec55f1e04b0@t-online.de>
Date: Wed, 25 May 2022 12:22:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [OE-core][PATCH] libsdl2: add back xvm and xinerama options
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <20220525055556.31026-1-Qi.Chen@windriver.com>
From: Markus Volk <f_l_k@t-online.de>
In-Reply-To: <20220525055556.31026-1-Qi.Chen@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TOI-EXPURGATEID: 150726::1653474142-0000F5B3-D0EA55F5/0/0 CLEAN NORMAL
X-TOI-MSGID: 5904fc6f-ef87-4974-9399-79833384799a
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 May 2022 10:22:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166113

xinerama has indeed been removed. unfortunately the commit doesn't seem 
to be in the 2.0.22 release yet like i thought it would be

https://github.com/libsdl-org/SDL/commit/7d7ec9c95146c44d4b4643ed552796bf07937057

Markus

Am 25.05.22 um 07:55 schrieb Chen Qi:
> When building libsdl2-native, and I met a do_configure error as below.
>
>    | CMake Error: The following variables are used in this project, but they are set to NOTFOUND.
>    | Please set them or make sure they are set and tested correctly in the CMake files:
>    | XINERAMA_LIB
>
> This error appears on hosts with libxinerama-dev installed.
>
> Looking at the CMakeLists.txt file, I got:
>
>    set(SDL_X11_OPTIONS Xcursor Xdbe Xinerama XInput Xfixes Xrandr Xscrnsaver XShape Xvm
>
> We an see neither Xinerama nor Xvm is removed. So we should add back
> these options removed by a previous commit.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb
> index b112d63784..8519e7f732 100644
> --- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb
> +++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb
> @@ -43,7 +43,9 @@ EXTRA_OECMAKE = "-DSDL_OSS=OFF -DSDL_ESD=OFF -DSDL_ARTS=OFF \
>                    -DSDL_PTHREADS=ON \
>                    -DSDL_RPATH=OFF \
>                    -DSDL_SNDIO=OFF \
> +                 -DSDL_X11_XVM=OFF \
>                    -DSDL_X11_XCURSOR=OFF \
> +                 -DSDL_X11_XINERAMA=OFF \
>                    -DSDL_X11_XDBE=OFF \
>                    -DSDL_X11_XFIXES=OFF \
>                    -DSDL_X11_XINPUT=OFF \
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#166094): https://lists.openembedded.org/g/openembedded-core/message/166094
> Mute This Topic: https://lists.openembedded.org/mt/91327899/3618223
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [f_l_k@t-online.de]
> -=-=-=-=-=-=-=-=-=-=-=-
>

