Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8854CC83F22
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 15:32:08 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web10.11807.1752593523296437867
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 08:32:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M496T0e6;
 spf=pass (domain: gmail.com, ip: 209.85.160.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4ab60e97cf8so31472751cf.0
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 08:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752593522; x=1753198322; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Pem078O5zITPcMhw/kujfZVWeRQtFPJ5uyjfBm8SYrg=;
        b=M496T0e6K2khQlzXuRCM77isFapOrgxG5vmj0KcI2Lhlz/MsHB9kpJjsyPWk0SsOSq
         dakfo9lZ0az1cfnCowNbeIpK1SnZJ5/GMJAtoFRpTgpblRrCgl4DqX9ycuQVaM4m6cz8
         XqbvFAiqCkzbTQD4HBOKM9AmDDSc8n6ueN/wm/AP+B+Beesaqnw72s7p3itgfmlE1N25
         0rEVlq3MME5E7nKNdkmMH2MGnb/wrTrE0CdF1B/VKQ5mFmZd4QATDpL2Rfq0OzvSZqWR
         ej/NsBEsRkHQbP54PJNm5dGeapaPG72zpxeiyF051x6ZbIc8L4Qz/9X0tst7HWtOdyfh
         zFcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752593522; x=1753198322;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pem078O5zITPcMhw/kujfZVWeRQtFPJ5uyjfBm8SYrg=;
        b=tLXoB08tEgSl9cQwuOuLC6LdZZONingcfhy/hV1svjGC7lVnsoDVUe7O+BWgYzv0O7
         95CFyXiYg4L7ILnoUDQpFRYreQGfLEC4UoZmbg4ByPBWJAsxuS7qEx+nhp53ov1b594U
         m4NsP7dlL1IlkdlG3dcLTUzFElFMKkdh3G9hA3F9pd4vm7blXo5WcyWV0XXA/bTmc45N
         /4Doi69WRsywRuNpIMWrF9lF75Ldj0TBWtIV3JFml48XHQbNCK1o3tDzAPo/F/RjKvVY
         Dq8JlurE5UdsBYROuGF0PvpjuT3LAOKbeB6l8rDXY5FDRd/Wxg5//5ajnNISIhFIrEtp
         24Qw==
X-Gm-Message-State: AOJu0YxqCYCptiCdWSQro9H7B/ladxXdOKDiNeK+zo/q21m59WJOf2Qq
	eDOjaaOfYMP+1Uxnnt+vPkYUyQ05iWohNu8yUo2FsjUpXcaRgJkCoaIUVRCDAHj2fZxMqF5H4vk
	yXVxpLr/Lnup9EKbyC2tCCWMLA1FT0v0ykzcs
X-Gm-Gg: ASbGnctI6k1TbQiLZngJQ+QlUOSosuYvplY755Irdt1N2DtZ2SsbgFsWbhm55xWML+C
	wJBOnv/+TJgNjte6fNwaItxcZEzbcfmlJnUirQ0oW3s436P+qmTDg1qb8/Il61wXXUuD3kmHa4N
	aNzCKtn5OAXt5NkJgWt78uXMANuo6J8b6IN2lHTl8vVLT1RAjjDvlEDYzSSq8MSBXC3zCv2nNjl
	MpNdFVSXu6OGzM=
X-Google-Smtp-Source: AGHT+IEMw83IsZxoanJbRyv5SKlSI4K6j5Uvc4E9JnR9SItHW8nb/3auVH9L+60CPSISE6ywmVJXC4Tsur6q9DNMFMk=
X-Received: by 2002:a05:6214:5091:b0:6fa:fe02:8229 with SMTP id
 6a1803df08f44-704a4308073mr211547906d6.30.1752593521895; Tue, 15 Jul 2025
 08:32:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250715080819.622-1-wangmy@fujitsu.com> <20250715080819.622-7-wangmy@fujitsu.com>
In-Reply-To: <20250715080819.622-7-wangmy@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 15 Jul 2025 17:31:49 +0200
X-Gm-Features: Ac12FXxcwozi3cnre94KNH_IwBtEHlZuTpCcYyl4DJhRv8Z47NewaAMr-7LpApg
Message-ID: <CANNYZj8+si0BGqEddMEsTY2Od9emDUsGOvsivAvpxqWKFncUkw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 07/19] libinput: upgrade 1.28.1 -> 1.28.901
To: wangmy@fujitsu.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 15:32:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220307

On Tue, 15 Jul 2025 at 10:08, wangmy via lists.openembedded.org
<wangmy=fujitsu.com@lists.openembedded.org> wrote:
> --- a/meta/recipes-graphics/wayland/libinput_1.28.1.bb
> +++ b/meta/recipes-graphics/wayland/libinput_1.28.901.bb
> @@ -15,7 +15,7 @@ DEPENDS = "libevdev udev mtdev"
>  SRC_URI = "git://gitlab.freedesktop.org/libinput/libinput.git;protocol=https;branch=main;tag=${PV} \
>             file://run-ptest \
>             "
> -SRCREV = "4f7b4ef0e4eb5d569df36be387579858eba349bb"
> +SRCREV = "7716954365a3fa2cc2b3948f21548a98085f16e4"
>
>  UPSTREAM_CHECK_REGEX = "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"

1.28.901 is a pre-release, we cannot take that. The regex that guards
against such versions is meant for tarballs, and should be converted
to UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"


Alex

