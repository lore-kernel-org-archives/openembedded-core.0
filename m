Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4005DC77B78
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 00:13:03 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web10.38292.1683159178781155501
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 May 2023 17:12:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=g+B5hL+t;
 spf=pass (domain: gmail.com, ip: 209.85.210.43, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-6a5febde157so2157065a34.3
        for <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 17:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683159178; x=1685751178;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SCH0ViN6UFmG7i2fXAYHS17/yMCRgpsJU8u4Kp/md4s=;
        b=g+B5hL+tKCFXvleGvNrIq0Adjuu3VObVRj3tQtX72VefswJ+xlaw29nhE9rojocS/1
         85VyxG4hC6LYK5CeXXj5/yYeoqvtNZax4iQ06gbEl5lm3V2r6SyzkHrBPZBgDtMMXXw/
         Gwu06x4oUf9E3Zdtm3wkEGubfbbpwIBJm2PIkfmZjcMOMTgoifrXgMv8Ip8tkDNWLFzk
         8zF3WrB38yOnFSRZZpQXvXB2w+3Zfa3Fpfovn7YD4+64LBfMRj7zX/c7fA3/vbimnIUA
         DebJett0T5OFJ1eKzl9gqd/MrdZEiyvZ2JqDH6k638mCsOf75pQ78rtpij3cpfRT29MR
         3a1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683159178; x=1685751178;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SCH0ViN6UFmG7i2fXAYHS17/yMCRgpsJU8u4Kp/md4s=;
        b=D0F+NBExHl4SDt9DY+k/R7e69SGIUvGQkmF7B1SIDab1PyTskK0tvtu2xC7LpZj9xZ
         WR61nZawe0oFB7Svx1JaXJ9kJn58X/81KmytJy0jjuTlB9jTlYW+1nkUM1eEgkUZfKTy
         GZSdxfpq1rcK+1PW8Qk9DiaoSGHSLChff5h1Wz5FBYg8Yre7vdRDd8L1VSi+dFjL1bal
         6IYhkhuHgQcLGq/BJSTW6fKuI5q0lLJ+YGgqwlW9MtoLuSrp5QVy5x85X4sPDFk/7gS/
         5rIpE0mAB0agfD4QpPNM+5sHXbUlj/AtnBPJ5a5rh5zowl9WOP5NtjAqjp9jPPXjTtfp
         Iy9w==
X-Gm-Message-State: AC+VfDwYG6buTojRRfzAEb8+4wQi86dKR4U8hzqsl9fWF6UMr8nppRZT
	P5eWRq2tjPIvGriNOY0oJlmpBylrUoDA+CZDvng=
X-Google-Smtp-Source: ACHHUZ4hvTsDBs5p91PXEc6viMIboQXZROmoz2CPipx9kvS+e1d0HwdrHkhAsjg8dworbEqznFHGMgxxC3wROLVKl2k=
X-Received: by 2002:a05:6808:abc:b0:384:de2c:663c with SMTP id
 r28-20020a0568080abc00b00384de2c663cmr789413oij.24.1683159177869; Wed, 03 May
 2023 17:12:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230503141246.2087-1-jermain.horsman@nedap.com>
In-Reply-To: <20230503141246.2087-1-jermain.horsman@nedap.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 3 May 2023 17:12:32 -0700
Message-ID: <CAMKF1soAYAOWOfuQoejoKTqhxsa8NLShVe6osTyqnDvKzpEM2g@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] run-postinsts: Set dependency for
 ldconfig to avoid boot issues
To: jermain.horsman@nedap.com
Cc: openembedded-core@lists.openembedded.org, 
	Arturo Buzarra <arturo.buzarra@digi.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 00:13:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180840

On Wed, May 3, 2023 at 7:13=E2=80=AFAM Jermain Horsman
<jermain.horsman@nedap.com> wrote:
>
> From: Arturo Buzarra <arturo.buzarra@digi.com>
>
> If a package with a postsints script requires ldconfig, the package class=
 adds
> a ldconfig postinst fragment to initialize it before. Systemd has its own
> ldconfig.service to initialize it and sometimes if both services are runn=
ing
> at the same time in the first boot, the first one will work, but the seco=
nd
> one will fail with the following error:
>
>     ldconfig[141]: /sbin/ldconfig: Renaming of /etc/ld.so.cache~ to /etc/=
ld.so.cache failed: No such file or directory
>
> This commit adds a ordering dependency between them to make sure that onl=
y one
> service is running at the same time.
>
> Signed-off-by: Arturo Buzarra <arturo.buzarra@digi.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 4e9d812e127dc6743f52f4881e509e8e2e833afe)
> Signed-off-by: Jermain Horsman <jermain.horsman@nedap.com>
> ---
>  .../run-postinsts/run-postinsts/run-postinsts.service           | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postin=
sts.service b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postins=
ts.service
> index 7f72f3388a..b6b81d5c1a 100644
> --- a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts.ser=
vice
> +++ b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts.ser=
vice
> @@ -1,7 +1,7 @@
>  [Unit]
>  Description=3DRun pending postinsts
>  DefaultDependencies=3Dno
> -After=3Dsystemd-remount-fs.service systemd-tmpfiles-setup.service tmp.mo=
unt
> +After=3Dsystemd-remount-fs.service systemd-tmpfiles-setup.service tmp.mo=
unt ldconfig.service

should it depend on ldconfig being in distro features ? it may not be
there on all systems.

>  Before=3Dsysinit.target
>
>  [Service]
> --
> 2.39.2.windows.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#180828): https://lists.openembedded.org/g/openembedde=
d-core/message/180828
> Mute This Topic: https://lists.openembedded.org/mt/98662451/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

