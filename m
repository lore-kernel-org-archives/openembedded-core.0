Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EE2BC47077
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 02:50:39 +0000 (UTC)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
 by mx.groups.io with SMTP id smtpd.web10.11016.1705027838270291396
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jan 2024 18:50:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lgUVNiOg;
 spf=pass (domain: gmail.com, ip: 209.85.166.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-7bed9f3ca97so117730739f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Jan 2024 18:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705027837; x=1705632637; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F/m0WZKZIAkf3efqu2fneO+Aio3anCPQa+6KULYVa1M=;
        b=lgUVNiOglkCXunVbqLHpbvEsafwCQF8ZykFDO5Wex3RO+P2cX+lhuqqAfO1bDtZQio
         BY0jzauZ/k0CI4UP20syNsaDqhtW00QNbAGy9LzmPXZJeCgIA6wkj6nlGgA66EquErc+
         HBrGbZiJwdzkgbe+2pvADaWn8BZ5Bz7D4iOaisf2Bzw2OVfH7A0jNhN/Sv/7B2KnXs/F
         b9Vqq6GARm3Lw55dRBaBdt472WoSlPYqQPpInsXzPidaegsTffFh7zyOyyxnyYQt0JcL
         3YnXWJaDEHc4vGImp+1tevaSeSbWzpcBgIe6krRdOsAhVq4PQK6cgbeQLNKorYW2PLf1
         ZYGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705027837; x=1705632637;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F/m0WZKZIAkf3efqu2fneO+Aio3anCPQa+6KULYVa1M=;
        b=ZuWLuXGpzI6kv+CFJMlT/WTPBEoXC7xd9/q7+0mzZ2JAjYln1IKvcy+KfTMefOuZOS
         4sp45Oq/q4uEZgADcCuOKQ/c4mazn1MHI0uNv0atd0tVAnpEuFMqP5WOqSqiHKLjsf9x
         YNHeScA3xp8jJH9Hio/aLoi+gFtXdCi/9DPP2+CvTZMuBg7fmMRo2xCNY2nPLlbj/x9v
         ULUawX5X/hgZBSZA+ulJ99TTtI/Fg92GIR/sJEi8ypSQugG8NekyDevt0CArjI4xFYlt
         +aDnDPaQDePtNq00VlBrlMRfnBkH2dGWxIBcy/wKvjSy5XGaQu6TNb3KrANgcus7JTYC
         gOTA==
X-Gm-Message-State: AOJu0YzOkLse8ows6hkh/p4QyxY+rPXo8do1OChpacSbupy1FRtThu5I
	1S49jkg3KNNLIefdRCnZhDFhfwds1rZdXiOKZys=
X-Google-Smtp-Source: AGHT+IGwLEcyPefFOqaARFCjw8BE1r0bRchVpXVFco4ykY2IQgboXsWMtRBnFW+bkqfDeT1HrfswOLsHn3oByofaDQM=
X-Received: by 2002:a92:d68e:0:b0:35f:f139:e114 with SMTP id
 p14-20020a92d68e000000b0035ff139e114mr359933iln.28.1705027837356; Thu, 11 Jan
 2024 18:50:37 -0800 (PST)
MIME-Version: 1.0
References: <20240112024357.2656128-1-Qi.Chen@windriver.com>
In-Reply-To: <20240112024357.2656128-1-Qi.Chen@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 11 Jan 2024 21:50:26 -0500
Message-ID: <CADkTA4P7NZGEpe4t=PdG3e0558xr9+QcuM8wsv9wQM6SN6rOzg@mail.gmail.com>
Subject: Re: [OE-core][PATCH] kernel-devsrc: copy source files under tools/
To: Qi.Chen@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jan 2024 02:50:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193564

On Thu, Jan 11, 2024 at 9:44=E2=80=AFPM Chen Qi via lists.openembedded.org
<Qi.Chen=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Chen Qi <Qi.Chen@windriver.com>
>
> The source files under tools/ also need to be copied because in
> some case, they'll be needed. For example, in case that the
> CONFIG_DEBUG_INFO_BTF is enabled, we'll get the following error
> without this patch when doing 'make prepare'.
>
>   No rule to make target '/.../tools/bpf/resolve_btfids/main.o',
>   needed by '/.../tools/bpf/resolve_btfids/resolve_btfids-in.o'. Stop.
>

Tools has been excluded on purpose, as it is relatively large
(and complex) compared to the rest of the curated files.

Figure out just what you need for bpf, and copy only those
files.

Bruce

> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/recipes-kernel/linux/kernel-devsrc.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-ke=
rnel/linux/kernel-devsrc.bb
> index ce5777fbe9..c2aeb8e216 100644
> --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
> +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
> @@ -62,6 +62,7 @@ do_install() {
>         cd ${S}
>         cp --parents $(find  -type f -name "Makefile*" -o -name "Kconfig*=
") $kerneldir/build
>         cp --parents $(find  -type f -name "Build" -o -name "Build.includ=
e") $kerneldir/build
> +       cp --parents $(find tools/  -type f -name "*.c" -o -name "*.h") $=
kerneldir/build
>      )
>
>      # then drop all but the needed Makefiles/Kconfig files
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193563): https://lists.openembedded.org/g/openembedde=
d-core/message/193563
> Mute This Topic: https://lists.openembedded.org/mt/103676210/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

