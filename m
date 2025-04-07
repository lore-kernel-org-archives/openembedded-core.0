Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A16EEC36010
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 17:11:32 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web11.53130.1744045887843663388
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 10:11:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bvZffQf1;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6e8f43c1fa0so56867386d6.3
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 10:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744045887; x=1744650687; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QQx/M1Ic/mCvpAussLvv4Ig+OoDZYVha7xLyxIBeqME=;
        b=bvZffQf1CbLUdMUIfbIAt5XFc0BTn2/qTCy7NM+tpBqkvK97gpZMY9A0YbjM274Jt6
         YSM8+ceN4bmjvUmTiY9G8oV1R+mEVXGbELWBJkIvdXKARSGSZ4nS2eYqm0cFeSu64jhw
         2ihadoL3/mCABwOUeUDGCuwaLSx3dK7zngPIeFFnZpWI1BT1X7YYqQvsDyOej8XfdIVF
         a0hqV9HzZnHTzvxOrKldOKmzgYyybhR1+y507LTQlUSPr+8RgY9SSuohT0fTcQd2XCX5
         O+OomVNmF94FgoK1hbsq9zXvfLP8McoW02+skqaKusOBUwacF3Qi9fURYjvxRpOe8Jb5
         93aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744045887; x=1744650687;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QQx/M1Ic/mCvpAussLvv4Ig+OoDZYVha7xLyxIBeqME=;
        b=K3LWMdKIJ2avYSj9x41bm7y1cnYcvHI4L31QIsbNxnwQmTjsbSZZN3FOaL2ydvRDGF
         DW4XtB/tvIrjd4qHRzvPnpv+sfZ6cD1iOaygK/alm+8ozbfSBsmnMyFdb80bLCZrNogi
         WvCQB1DWEnODnE3xWF3DG9yYEOw48gGR4lU7mt3yQbQwS5IAobyhpRSTyxZ+oK4VNPje
         Y44pEVuCTi+0cc0pXRBlVJcTC6QFqtLofDaEC+6xWDjufx23VWNvIbF4IKzksP+gc0hn
         3bOjNF6gvHOC3ooPkNa/F0gQ2KXp+WVm7QALmNmyBU4LwlrjrU1EJcWDMXWBfqqKFW9j
         2S2g==
X-Gm-Message-State: AOJu0YzwwZ2fV7JSf1n1XEKPHQcfarA523pjSdnWy1rV3q+5Kh8RJ85j
	Ua/0GHoU36M52Tr5bcwsA5WbLYv1cBZOLPiZo6JCyyGsppx6qv+aafftJOGBsVPqt7Dp3U+JqxN
	E18BRMN5BQTXE/VrwZRSkvfqIt+E=
X-Gm-Gg: ASbGncufLKuZRoIHN1kgxXnt2HVSZOhRxjrLS8nD6NCDfzv8yirD4WSdFNWWqo4gLv6
	axA6aRXV3HUXLBXGndL7Dve2WqqngE6LpEw0v+bfkV+t0ugSYjPjLOHINo2ieQOMc82bLJ46U6E
	HvJ6ZiA6c8l71mCJi8458zIbZWMCyi2MiMQz7RJcY4YfCxGv9ir09vGGduW4ME
X-Google-Smtp-Source: AGHT+IFxfpgjNTwLMRpm/D40oEKdO91lPlPzkWivIAIn8zW5BR3IY4ebyMdpO8plVXINIlmc+UcotHVEZ3OLJQ3dxRw=
X-Received: by 2002:a05:6214:c64:b0:6ed:71b:30a0 with SMTP id
 6a1803df08f44-6f00de8c295mr161029616d6.1.1744045886850; Mon, 07 Apr 2025
 10:11:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250407170906.3514273-1-ross.burton@arm.com>
In-Reply-To: <20250407170906.3514273-1-ross.burton@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 7 Apr 2025 19:11:15 +0200
X-Gm-Features: ATxdqUFwuZ4qHDQbVTD46ismrMeUYkByE1lZ_Ct5TlKLQOW5BjeU95KHNG-9hg8
Message-ID: <CANNYZj9A+xrJW3qMYHCouFdv22POJGfGj+1ThC1nF+MijaeD2g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cmake: fix upstream release checking
To: ross.burton@arm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 17:11:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214471

cmake -> libjpeg-turbo in commit header.

Alex

On Mon, 7 Apr 2025 at 19:09, Ross Burton via lists.openembedded.org
<ross.burton=arm.com@lists.openembedded.org> wrote:
>
> New releases are no longer made to SourceForge and the GitHub releases
> are considered official according to https://libjpeg-turbo.org, so
> inherit github-releases and update the SRC_URI.
>
> This now reports that we need to upgrade to 3.1.0.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb
> index 4ff4cec721b..56bab4dacad 100644
> --- a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb
> +++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb
> @@ -8,11 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=2a8e0d8226a102f07ab63ed7fd6ce155"
>  DEPENDS:append:x86-64:class-target = " nasm-native"
>  DEPENDS:append:x86:class-target = " nasm-native"
>
> -SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
> -
> +SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz"
>  SRC_URI[sha256sum] = "22429507714ae147b3acacd299e82099fce5d9f456882fc28e252e4579ba2a75"
> -UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/libjpeg-turbo/files/"
> -UPSTREAM_CHECK_REGEX = "/libjpeg-turbo/files/(?P<pver>(\d+[\.\-_]*)+)/"
>
>  PE = "1"
>
> @@ -22,7 +19,7 @@ RPROVIDES:${PN} += "jpeg"
>  RREPLACES:${PN} += "jpeg"
>  RCONFLICTS:${PN} += "jpeg"
>
> -inherit cmake pkgconfig
> +inherit cmake pkgconfig github-releases
>
>  export NASMENV = "--reproducible --debug-prefix-map=${WORKDIR}=${TARGET_DBGSRC_DIR}"
>
> --
> 2.43.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#214470): https://lists.openembedded.org/g/openembedded-core/message/214470
> Mute This Topic: https://lists.openembedded.org/mt/112137334/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

