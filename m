Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 297B5CAC592
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 19:14:57 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web11.4447.1758050089345245808
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Sep 2025 12:14:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YcCwPbZu;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-770db3810a7so31526956d6.0
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 12:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758050088; x=1758654888; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Gn4uPi2ZFvgiqcuicMheKXIZbIH+WQcKtZQqOaIexUU=;
        b=YcCwPbZuNVP84AWKi+z6dt/Z/ggP3ITTci85YxjZHIMtF1OmR5TZb7khN+nuH6ngKo
         cEUjOfizzMt8WmrXHqMTXTQCkICg8qrCiMXUCeSyEWwcYJlBaTcRLxBWYYPVpSl7gK33
         J73+6SRp9u4EFRWv8XNYFOtCZn45cTYgdehR9IWV6qPrmLVXBllOiH4TaACc/4kzLwfF
         IZTGQ45Hoo+AcebYB8NzBufwUFJTzOGWlCKrwbk1r688D7eFqzCn/7sy9atM/UyKb0OL
         GNxYuOySLXOdIUvJbvSnY3aNS9upRJcPw8DeKt6iRI9XB8GNXwOTHkIDsSxrdeo+M08U
         0ttw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758050088; x=1758654888;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gn4uPi2ZFvgiqcuicMheKXIZbIH+WQcKtZQqOaIexUU=;
        b=dD+fUU5AAUrcMfoSyrqGVNnlGNFB9Jq4hc+kXBGAqEOL4/lNNhwTRhemt207TgaM5G
         Wn0BFMVfpt1XcOzznZLNUryTCGTiIf/7lhao8ST7NU8/3+TBGnH3cRMBShoRMrvk1Jf2
         vVVMnxf/GKCXjzGccHln0rMMLWzSAJHGqEUG749jqS61uKRvgcHim+S4IaUgjvy79/Ht
         Ok8aKaKN833ENlUYx8DC41pLCecAIltctzvOz1PDHwzbBt6411U8hMYtxBYCVG03bPxh
         DCSB9bjbio7xZ3JvTxpRrH7LjtKaQcJjrgREzQ7eHqononprIXcqX3p5RF1vOC6u/bAA
         BOgA==
X-Gm-Message-State: AOJu0YwA5K770sc2Pk0hHciR6gHvKyQtM5eGGBhfOOq2NjdcacgLxL1z
	gBbifVrgMq1DunZuV12V8DvnzihaFzgjE6QI6H50CJy8A14CQTgqZ6ETtey7QW0iYChTF/Nj20o
	ueSoQowTz9YxeYCU4YzvyXWskoRkEK+0=
X-Gm-Gg: ASbGncsbwLCBdq2e1ZWZS0pEyqa7uDUHuYOvSOQQUAjYIov1+rmgwK4ecx5LR9q5D37
	WILPjryBN0vdEmDiNxogkgdJ0mzSUxYerpc5V1whcth0aKXkQ5OPLmsEQoxDMWYDRCM6XcngDBh
	qeEvePke7JaVzpJVSGbu3j9EDE0X3SRrihrOCVfJ8hSkTsWBMfI6IFzLhcKj5B7lIF6oZi4Xrse
	66G+Rts3aaUR/NI/tz4srzhylUu8Q4j+7XRfh+U4zBQ0pU5coHWrO6PybD3Ves5cgXyctCUshqP
	tCpntArDo9PE0maXipYzMWfhXMgpfazJN/Z17Yc8V8faujWzv7c=
X-Google-Smtp-Source: AGHT+IGNmGhCF0Fvga0LHTfHysnfIwGn13MgQOSD1EeaTo2Wk3Fkyd+lK0zGXVicZRD/ykmYCm4InZsm2KOwj6U7uG4=
X-Received: by 2002:a05:6214:e4e:b0:736:bfb9:b27e with SMTP id
 6a1803df08f44-767c5fb85d2mr213797846d6.61.1758050088320; Tue, 16 Sep 2025
 12:14:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250916155800.3860178-1-f_l_k@t-online.de> <CANNYZj964ZPDbN7HjhCCkxS5a9dPR7-uVewK9pcrpcZp9ZVGLw@mail.gmail.com>
 <1865D16D5AB1B07F.13540@lists.openembedded.org> <97YO2T.IKZQF19TC8BH1@t-online.de>
In-Reply-To: <97YO2T.IKZQF19TC8BH1@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 16 Sep 2025 21:14:37 +0200
X-Gm-Features: AS18NWD17ZQpT4sYsSx9v-r5efke5QAHs2z-DXbgSOlsWrIh3BIXuNJGYro-GdY
Message-ID: <CANNYZj-3Wq9_pkuCznrYVOqhG6rV9J=xOEDsPK7FBUrNS-wB8w@mail.gmail.com>
Subject: Re: [oe-core][PATCH 1/2] introduce virtual/ffmpeg
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 19:14:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223580

virtual/ prefix is meant for recipes that are genuine alternative
implementations of the same function, e.g. pkgconf and pkg-config, or
systemd udev and eudev.

If you only want two different versions of the same things to coexist,
then name one ffmpeg, and the other ffmpeg-7, and adjust dependencies
as needed for the things that need the older version.

Alex

On Tue, 16 Sept 2025 at 19:06, Markus Volk <f_l_k@t-online.de> wrote:
>
> I think that was because I had to build Kodi and mpv with different ffmpeg versions at the time, because mpv was updated to ffmpeg 7 but Kodi wasn't ready yet.
> Similar situation like today with ffmpeg 8. There exists a patch to add ffmpeg 8 support in kodi but to me it feels like its a bit to early for this step.
>
>  couldn't find a way to use two different system versions of ffmpeg as long as they only differed in the version number.
>
> I only remember that I had issues with using it but not exactly what it was.

