Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF2B6C47074
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 16:54:28 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.33499.1704214463412469426
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jan 2024 08:54:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UdNfCvOD;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-50e766937ddso7543253e87.3
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 08:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704214461; x=1704819261; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=F5yXyTPQrATLpeeKIGufZpaOMTXU1AzM8krlfbYlzlw=;
        b=UdNfCvODBs9sYWXGNYQ5h+cvz0KAqPLI7hUmT4oGZuz6mlbMttPb2nHwIXHUP7gV6a
         P/jNUJc7oQiQnAqJ7vUD+lN6r8c8QrP3UhHHDl+T6dFsdGyfwTnrTotyM2a62kl5Cvqx
         wOLPxmnK9pb1xE4P8GT5f7xP1wQ92dU95w7aW1A5Cuaxinw+wak/IiiJm8zy+cRH9LiP
         FyBg3l8Lh/4rqMONIXa0Ftb+AlKJGquTe1mJBET2C1fYD0ylL0leTJPAFUaB2wEFahzU
         OGuyCF3H5tL7pehsx2UgzqDFEXPxebn339HiJfQo20s4cvfNuti4TyRbpdjcpHrCFU/r
         yHrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704214461; x=1704819261;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F5yXyTPQrATLpeeKIGufZpaOMTXU1AzM8krlfbYlzlw=;
        b=uZFNyMzdLegjQ1UY4KNJFDT6mcHbNlUFcqdFns0BNluYaj6SH+kmLY7L+RH8OuehPT
         pia0vZ/6i3WWlUJDcDoUEwJ9fGuDqIo5ZYu6noHHLAt8CejdzTEyFqu+n/YoG6w/oZZ+
         R3UF3NVBbGB92Cj0hHdclw2NqL4UGLAN2Dix77mtoTg7Hc34FIJV59MEP5uRvbgUJEui
         qhIKZaN1JbNj2GPCC8FQ1koyj3HS2WQA03FUGi24m0NRRkxGHiX3F405TKr9AZQ4phpK
         3Zk8G5PRMU+QryF3wE16Yc3LOTItZifjnPt0UDZOMdJsNFDFag9lG8YAxtogQg+QEYpn
         zw4w==
X-Gm-Message-State: AOJu0YygZxDCHk+MBF4/VDhzvTaiSvVKJhncQrZsPhdxWA4WwdTmm0PZ
	TAmQ/Pm8vyEn+a7RNg6SGKf52yRMc0jTxKjn8a1fDZObvOc=
X-Google-Smtp-Source: AGHT+IGN7EAHpNaxcUXGSmXt4n0/2IMIbNaOP27a6gG677yJ+uo9pIyk3Ib0/aOBzevSyYaSmVnU/21jDeOPYyHFBck=
X-Received: by 2002:a05:6512:2805:b0:50e:7f5c:521d with SMTP id
 cf5-20020a056512280500b0050e7f5c521dmr6401289lfb.104.1704214461347; Tue, 02
 Jan 2024 08:54:21 -0800 (PST)
MIME-Version: 1.0
References: <20240102083755.316126-1-Qi.Chen@windriver.com>
In-Reply-To: <20240102083755.316126-1-Qi.Chen@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 2 Jan 2024 17:54:09 +0100
Message-ID: <CANNYZj97wWSw-uyEUEppnkXQZ6XROr3BWoCz0KanmMknUTcF4w@mail.gmail.com>
Subject: Re: [OE-core][PATCH] debugedit: add UPSTREAM_CHECK settings
To: Qi.Chen@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 16:54:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193248

The check already works, at least for me it correctly checks both the
top level directory and the 'latest' directory:
...
--2024-01-02 16:51:30--  https://sourceware.org/ftp/debugedit/
...
--2024-01-02 16:51:30--  https://sourceware.org/ftp/debugedit/5.0/
...
INFO: debugedit                 5.0             MATCH           Chen
Qi <Qi.Chen@windriver.com>

What does devtool output for you, without the patch?

Alex

On Tue, 2 Jan 2024 at 09:38, Chen Qi via lists.openembedded.org
<Qi.Chen=windriver.com@lists.openembedded.org> wrote:
>
> From: Chen Qi <Qi.Chen@windriver.com>
>
> Add UPSTREAM_CHECK_URI(REGEX) to allow for checking new releases
> for debugedit recipe.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/recipes-devtools/debugedit/debugedit_5.0.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-devtools/debugedit/debugedit_5.0.bb b/meta/recipes-devtools/debugedit/debugedit_5.0.bb
> index 63ad7babd9..3a596f5fea 100644
> --- a/meta/recipes-devtools/debugedit/debugedit_5.0.bb
> +++ b/meta/recipes-devtools/debugedit/debugedit_5.0.bb
> @@ -9,6 +9,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
>                      file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
>                      file://COPYING3;md5=d32239bcb673463ab874e80d47fae504"
>
> +UPSTREAM_CHECK_URI = "https://sourceware.org/ftp/debugedit/"
> +UPSTREAM_CHECK_REGEX = "(?P<pver>(\d\.\d))/"
> +
>  SRC_URI = "https://sourceware.org/ftp/debugedit/${PV}/debugedit-${PV}.tar.xz"
>
>  SRC_URI:append:libc-musl = "\
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193220): https://lists.openembedded.org/g/openembedded-core/message/193220
> Mute This Topic: https://lists.openembedded.org/mt/103478272/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

