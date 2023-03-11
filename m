Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 272F5C6FD19
	for <webhook@archiver.kernel.org>; Sat, 11 Mar 2023 01:40:53 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web11.37048.1678498850232722704
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Mar 2023 17:40:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UpcF0Lej;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-17683b570b8so7847854fac.13
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 17:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678498849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yfnPNNfTHCqR0wsa96D3iv2JwCgXRwP0owTxJ59+Snc=;
        b=UpcF0Lej/bR6Tzzn5HvuYMQe7Eican0GXWwEyVQ+FscEh1wcwoT/OjUqy/LQJe253W
         IkQ96mk2JeUSv68xItAnAuVE5hiWASILti/vZwxZr6vt8bVSf7h9ibn0w6Ye9cxz7K2L
         BIqceSke7W+aDcik2Li93Rcew6Hy3NdSoa++aRrTFyKgn9gmoRgxN4adi6+vOENvZzYF
         IHwGwNbuROiA2D3ZrlV/9MQKLYB7UrOPhoQIxe9lX/r9TkhoJsxC5hrICyLAqidfkB8F
         kOiZE9e64DtXyxgEkye7y+vTc+/PDOV9yVIDoDWEtiSC21s3Wg5JgKXGO2bC7oeKfRzX
         kReg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678498849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yfnPNNfTHCqR0wsa96D3iv2JwCgXRwP0owTxJ59+Snc=;
        b=urXLYj0Igl8ChkZcQQpZ5zA3E1cuxeoQyrKs5pw7ECZAXiCke9+WP5JPQUggWyKKX3
         SfAuiWr25ihPMPLW8G99agRMMMPNVp9PyV9QwAVUcNQcmZdyoHIroJoFrPdSvsAJWXLE
         yGHFjpr0Xf3iruI5P+m1nF++k9zWkrj/zyf0UWuERkeYU9c7cviuaZm5cN+7DpYN/mgW
         4NMQ9EdxJFKe1cz84w6cblDMFo2Kxl++1Z1jer3aOlUZ+W3WmJ6lK3ZjMZYnv3uzEjLj
         /SH/e8Mnh8aheKfhB+khYKBmTQnyisK3H0ttPcNrqhRMrfPxil1qoG2CKViikb765P3f
         Rk4w==
X-Gm-Message-State: AO0yUKWtsQ/IQVphI30qKmmMqz/+RCYheVdI0cp+B8AB1MoIdpKikxji
	Fjsq/SMDRIjY7ULtvOYM0VB7seycwl0+zU2isks=
X-Google-Smtp-Source: AK7set847Ha92ujtoTanTU1qTju9gcDTqwe24DFhi8yl3ffvlyM+59lVjfEgLd7GvXzYYxLHDsTTyepK+avr3xIgpjQ=
X-Received: by 2002:a05:6870:7735:b0:16e:8dc0:3861 with SMTP id
 dw53-20020a056870773500b0016e8dc03861mr9212399oab.2.1678498849416; Fri, 10
 Mar 2023 17:40:49 -0800 (PST)
MIME-Version: 1.0
References: <20230311002722.3211118-1-richard.purdie@linuxfoundation.org> <20230311002722.3211118-10-richard.purdie@linuxfoundation.org>
In-Reply-To: <20230311002722.3211118-10-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 10 Mar 2023 17:40:23 -0800
Message-ID: <CAMKF1spi4ZPAS2uqmvRezKPm9mi6TQfeRefoWn4MFH0==EKdqA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 10/16] gawk: Fix ptest dependency
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Mar 2023 01:40:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178361

On Fri, Mar 10, 2023 at 4:27=E2=80=AFPM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> The gawk ptests need some locale information, add the missing dependency
> so tests work in minimal images.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-extended/gawk/gawk_5.2.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-extended/gawk/gawk_5.2.1.bb b/meta/recipes-exte=
nded/gawk/gawk_5.2.1.bb
> index fbe6e7040b0..d13110ddbec 100644
> --- a/meta/recipes-extended/gawk/gawk_5.2.1.bb
> +++ b/meta/recipes-extended/gawk/gawk_5.2.1.bb
> @@ -62,7 +62,7 @@ do_install_ptest() {
>         rm -f ${D}${PTEST_PATH}/test/timeout.*
>  }
>
> -RDEPENDS:${PN}-ptest +=3D "make"
> +RDEPENDS:${PN}-ptest +=3D "make locale-base-en-us"
>

I think it should be added below so it does not break musl builds.

>  RDEPENDS:${PN}-ptest:append:libc-glibc =3D " locale-base-en-us.iso-8859-=
1"
>
> --
> 2.38.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#178353): https://lists.openembedded.org/g/openembedde=
d-core/message/178353
> Mute This Topic: https://lists.openembedded.org/mt/97533194/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

