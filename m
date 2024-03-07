Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97206C54E49
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 08:18:48 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.18559.1709799525060043426
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Mar 2024 00:18:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AZgmviXq;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5132010e5d1so829598e87.0
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 00:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709799523; x=1710404323; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=g8tGtgfSFSS8RbZUJZlvVO/ZUuDlSdsEzAqkF0aCbGc=;
        b=AZgmviXqiO/FXLQ5NFitkTc8dlk0n72ju4OtY+Wf9lOfuCsBChBOMS0PafBbTsPM6s
         MKd3D40iBft5BFJiY1zsEfEmDtCvl0NJEfaW30h8bT8+ExOBVmtMgZYyn5n6gRYmPTNZ
         HfSj01Y+FmozlYRH3jk2xEiwFO8DnaMb6IXT8htYx0aSMF1fJUN6j6zWQeiMfL5esztq
         D2oeoJBWtQwMiLOgoUEggUTcTjMlMljHaGFe77maXa5JZ252vlfNM8Bnuyh9fubZflKo
         lttKkSVFyId73B7JbyF7ioUDLbxnzbMA1Acgv2On3gnf8RDA2bmloHWFhXIZHOCspdVi
         q7VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709799523; x=1710404323;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g8tGtgfSFSS8RbZUJZlvVO/ZUuDlSdsEzAqkF0aCbGc=;
        b=p1Nl723cfx0z5o5FaCfjQLJSrpVJh3YaUyfUhka09VlNOh4HDbh3443dhlI1YLlgIz
         IYS4u70X+PM9OiYxDjXblxnY93cU07IQMsbsM7MEJ8kzsy1W+lvQrQ0hY/gn3kjjx1ES
         u37M+S4w2gNnItIdCAqNZLsR7iQUdCrzfW0agIXZ+eQxmWh/q/CO3p7Rmqe3FtMAH20T
         D9UfMu3AS5wP5uy7OJNOw4n4j1QxfIrf4OzHaxf4zgjQw3gi/CUKGeF5YFDX9gwcTJ/U
         AVQtGHycl5/zFtTzLd3AarM5/QzEuOT7ioKLqk8STBgYta6ya3f3ra2H6gdoNEcPpCJo
         WlWg==
X-Gm-Message-State: AOJu0YwrRq0kBcy8rE4ZyR/YqOFF133rHT+2MG85LA1lPQjs55dIzDfR
	7aaLZMF0saPBClhCkAnvcg3zbdgfcjMoWYTLQU84C1/eX+dfoZB6btt8tMTyI5aX9brNEhqu0tX
	E6e5DMX9+O5PFRExY21q0gmDLqq879mlv
X-Google-Smtp-Source: AGHT+IFrAxhBsSnIo+jY5zaJ7OLzNRwC1TXNMz4m0xl6iZ0XyY4DydAIMsX5ggYZTt53nr/CmX4MW+PD4dDAuEkjhEQ=
X-Received: by 2002:ac2:5f69:0:b0:513:fe6:6003 with SMTP id
 c9-20020ac25f69000000b005130fe66003mr790072lfc.11.1709799522918; Thu, 07 Mar
 2024 00:18:42 -0800 (PST)
MIME-Version: 1.0
References: <20240307065030.962191-1-changqing.li@windriver.com>
In-Reply-To: <20240307065030.962191-1-changqing.li@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 7 Mar 2024 09:18:31 +0100
Message-ID: <CANNYZj_TTfW-YpyMMtOQ4e3fUHZbetP13=aoO=0qyYWSaD1r0A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V7] rxvt-unicode: Fix installing of terminfo
To: Changqing Li <changqing.li@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 08:18:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196777

Thanks, this is fine.

Alex

On Thu, 7 Mar 2024 at 07:50, Changqing Li
<changqing.li@eng.windriver.com> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> For cross compile, TIC will be native tic in recipe-sysroot-native, and
> the terminfo path will be native path, the rxvt-unicode terminfo will be
> wrongly installed to native path.
>
> install terminfo to correct path in do_install
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc b/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
> index e7d520ebef..016614b19c 100644
> --- a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
> +++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
> @@ -6,7 +6,7 @@ terminal emulator rxvt, modified to store text in Unicode \
>  output. It also supports mixing multiple fonts at the \
>  same time, including Xft fonts."
>  HOMEPAGE = "https://rxvt.org/"
> -DEPENDS = "virtual/libx11 libxt libxft gdk-pixbuf libxmu libptytty"
> +DEPENDS = "virtual/libx11 libxt libxft gdk-pixbuf libxmu libptytty ncurses-native"
>
>  SRC_URI = "http://dist.schmorp.de/rxvt-unicode/Attic/rxvt-unicode-${PV}.tar.bz2 \
>            file://xwc.patch \
> @@ -53,6 +53,9 @@ do_install:append () {
>
>         install -m 0644 ${WORKDIR}/rxvt.png ${D}/${datadir}/pixmaps
>         install -m 0644 ${WORKDIR}/rxvt.desktop ${D}/${datadir}/applications
> +
> +       ${STAGING_BINDIR_NATIVE}/tic -x ${S}/doc/etc/rxvt-unicode.terminfo -o ${D}${datadir}/terminfo || \
> +       ${STAGING_BINDIR_NATIVE}/tic ${S}/doc/etc/rxvt-unicode.terminfo -o ${D}${datadir}/terminfo
>  }
>
> -FILES:${PN} += "${datadir}/applications/rxvt.desktop ${datadir}/pixmaps/rxvt.png"
> +FILES:${PN} += "${datadir}/applications/rxvt.desktop ${datadir}/pixmaps/rxvt.png ${datadir}/terminfo"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196772): https://lists.openembedded.org/g/openembedded-core/message/196772
> Mute This Topic: https://lists.openembedded.org/mt/104782953/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

