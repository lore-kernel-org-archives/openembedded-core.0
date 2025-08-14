Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40FF8CA0EE4
	for <webhook@archiver.kernel.org>; Thu, 14 Aug 2025 11:26:52 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web11.20380.1755170802279705454
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Aug 2025 04:26:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P30Hj2Fk;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-70a88ddb1a2so8537686d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Aug 2025 04:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755170801; x=1755775601; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2g6XGTw+de8SslpHouNVNyrK6Ud4Zwkj8CnBLwIYpGg=;
        b=P30Hj2Fk+yF5hBgg0mSDX6vXpDkuLjOAA8jgjHL+TKVBn+GS9qdejumOTgWtWe2rqw
         DMT9lyLs3XAxFDpaYlincbEpp5xoj5O2v/N02OkmKe52t4toVjenpOzHOokNzyWEzrep
         zCassKyl43ZHftmiuPomeg0w/eXawA7OLwSBAE2N33RAsyyCR/V9MUJ4pBrt2Gw61QV+
         E0r/1r+xXU7j6/MlSIc4Z0cljWUlznusha+VqFp+iEF/Th9j4VZ4KTQW0ZVXAeMVIN52
         7zNpaVzJZhqW5a2yzE4jqoI9sW5traIYohxTqOqcSkoVydhphWhVr0RRg/1gINOuAhzA
         PmIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755170801; x=1755775601;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2g6XGTw+de8SslpHouNVNyrK6Ud4Zwkj8CnBLwIYpGg=;
        b=Mxxn5fjiD696CZDECuPTJ6Dtx8rNXgdsintSAin8d7CtynHazvhoCIBALpVPw1BARG
         XLSUkM2TroFfgJNd7gIp3OYM3yVrFDHj2Qxg1RyFMW33S6JZhx7UMyY06vpojYDylR2b
         xXWEqSRyu6MZC4vZ6Nu0K/T5tXOySS31+E3rKOhGy2YzCIKHgTLd8icV1YPxl7qwjCpA
         Z7fzP7Gy1Yg2Wiluw0V9XMt/7V4c65/qhezJHaIWbl0XG+SVN1qaSE9edkGG6pD94Bgf
         2/ITAvd492F0tSsDg5j/jboAMxHwi2wAP4oQdTDrT6FcpFc7Lc5E+WAScO7srm+ZxgK4
         Mjaw==
X-Gm-Message-State: AOJu0Yyjo2vV75yphKOgJn2VgGLQISMQUjYP96c5sIZAkBygpHlWbZXA
	LBG8CPpc5vpu3a6ZuIPAbvEZfPIitxPo1ru7Ik6M1Ve0dYsH40Fodmr0RRBfuOL1tFYmK8oNyvb
	Os4XLTgUrCzUixQKGLs4YYERz/xPvXLw=
X-Gm-Gg: ASbGnctLjvd8aNArLQN74SGyoC4msgzEZMdIVAjoQ/BmigSZMgEopO/JdXiph2Hta7U
	QotYrubQ2A5TK7XOBjoZVNsRJhwPb4uVyyyXpGYKlyXMUmUA+VIg4FujM5b5enzSbvdVOsYFdLW
	U4WLP+S2IvjuBhn1y2p624r98Fgv68TXqs1qRrGV6b+K12Jlh4VTFsNS1/SWqJHtC+j4eiShYmt
	dPyXEhf1A859KaIX2ViEXuo5Q000HOBQub0fejFxQ==
X-Google-Smtp-Source: AGHT+IGZZOrHfp7+1ImG6d5HwbSImizOgO5ZmQpYx6TemfYYGqNm8ZS8v8gHSS/ny4vO49btQzRzA+8lWPGeFaZ/U4Q=
X-Received: by 2002:a05:6214:20a2:b0:704:d268:4978 with SMTP id
 6a1803df08f44-70b9829f07amr25789626d6.15.1755170801205; Thu, 14 Aug 2025
 04:26:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250812205050.13599-1-osama.abdelkader@gmail.com>
In-Reply-To: <20250812205050.13599-1-osama.abdelkader@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 14 Aug 2025 13:26:30 +0200
X-Gm-Features: Ac12FXwGhy_IgrDi_QoFrunKHVPoY_yjaLCgn6XMOkkYwA090cakCKGACwd82Qo
Message-ID: <CANNYZj9LZ+9OFBCh6uND7fPRMEO370ji8koc3sCyWMrepF+vCA@mail.gmail.com>
Subject: Re: [PATCH v2] go-cross-canadian: fix binaries install and GOARCH
To: Osama Abdelkader <osama.abdelkader@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Aug 2025 11:26:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221859

This has now merged. I have also sent a followup that would build and
install go toolchain into SDKs in yocto CI (so issues like this should
not reoccur):
https://patchwork.yoctoproject.org/project/oe-core/patch/20250814105604.3586651-1-alex.kanavin@gmail.com/

Another followup would be to add sdk/runtime tests that actually
exercise the toolchain and check that it works properly (we have that
for rust and gcc, but not for go):
https://bugzilla.yoctoproject.org/show_bug.cgi?id=15953

If you can add such tests, would be very appreciated!

Alex

On Tue, 12 Aug 2025 at 22:52, Osama Abdelkader
<osama.abdelkader@gmail.com> wrote:
>
> set GOARCH to HOST_GOARCH which is set from SDKMACHINE,
> since GOARCH defaults to TARGET_GOARCH, which is set from MACHINE (wrong arch).
>
> Also fix do_install to correctly install all binaries from
> ${GO_BUILD_BINDIR} by using 'find -type f' to avoid issues when the
> directory contains subdirectories (e.g. "linux_arm").
>
> Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
> ---
> v2:
> - Fixed commit message
> ---
>  meta/recipes-devtools/go/go-cross-canadian.inc | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/go/go-cross-canadian.inc b/meta/recipes-devtools/go/go-cross-canadian.inc
> index 39330fc98b..4a6f2f4c36 100644
> --- a/meta/recipes-devtools/go/go-cross-canadian.inc
> +++ b/meta/recipes-devtools/go/go-cross-canadian.inc
> @@ -5,6 +5,8 @@ DEPENDS = "go-native virtual/${HOST_PREFIX}go virtual/nativesdk-${HOST_PREFIX}go
>             virtual/nativesdk-compilerlibs"
>  PN = "go-cross-canadian-${TRANSLATED_TARGET_ARCH}"
>
> +GOARCH = "${HOST_GOARCH}"
> +
>  # it uses gcc on build machine during go-cross-canadian bootstrap, but
>  # the gcc version may be old and not support option '-fmacro-prefix-map'
>  # which is one of default values of DEBUG_PREFIX_MAP
> @@ -51,7 +53,7 @@ do_install() {
>         install -d ${D}${libdir}/go/pkg/tool
>         cp --preserve=mode,timestamps -R ${B}/pkg/tool/${HOST_GOTUPLE} ${D}${libdir}/go/pkg/tool/
>         install -d ${D}${bindir} ${D}${libdir}/go/bin
> -       for f in ${B}/${GO_BUILD_BINDIR}/*
> +       for f in $(find ${B}/${GO_BUILD_BINDIR} -type f)
>         do
>                 base=`basename $f`
>                 install -m755 $f ${D}${libdir}/go/bin
> --
> 2.43.0
>

