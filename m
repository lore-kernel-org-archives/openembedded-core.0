Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D81B6C433F5
	for <webhook@archiver.kernel.org>; Fri, 13 May 2022 13:52:31 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web12.8566.1652449950070022868
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 May 2022 06:52:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Op1Trq1v;
 spf=pass (domain: gmail.com, ip: 209.85.167.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id h29so14685840lfj.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 13 May 2022 06:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=CVUOhi/jgUsHLvg9QwIsqChYu12xwmLx5ITtMZA3gUM=;
        b=Op1Trq1vd8VKPnwM4J7PkkEMarIvspp+BCyi8VB00xR1iqqD6DYuITCM0PHZE2Z1LX
         BA6cSM63gUCMUhIIq1tARkvMrbr7tlins5h9y5rlufGj3VdQBD4ru8SpBJqT9QUr9KnB
         DuayADkkhETegSIMqrbsITN0vSOJO6ssVXjezb8GbeyjhL7ZFaJDwgfB7B64w6DtJp9B
         pixvzG92xnY4DSoYnzTFYDsJLXVQYqUkWhWYcai0VhI3w/GYsieLnI9vx6ooPcSti5Vw
         AemI8ztnPsnIp9ylkp8Fr+4kyiWIoBTufxfsP3tpJF6jHO0yIlo4khH+8bRs+FittTV3
         7fkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=CVUOhi/jgUsHLvg9QwIsqChYu12xwmLx5ITtMZA3gUM=;
        b=woVpE97sz6r1Jgt72Nk34wbsl01y+6dFSCiXx3HtG4eu3xqgshfwNe4i7nqhiFGcdS
         bKGYBew7XFpVnxp4/YCWSoX+xqc9NYbZ1E9HAG89OlXoVgCddxYMd0s3r7e0k3O4Gvad
         2YzDTqKZJaE0flH2RLlj7AX4ij08u1n4uqUe07iK4su/DZMXUC4sXiuJCOkxCbywrOIV
         691HSr+q42m6gsJt2GLFlZO50H9GXTRaqdwMivdW6oKWGNNcXGg4kpb/jiCj2BdTe4xE
         Ba7u1G7bmztGnDxM51Ozm64/g2CHy7wKSbEkOp1HhdQul6d6agDwhB7nP7T139uQBSUA
         332A==
X-Gm-Message-State: AOAM531XIpoycVa5ivCTcDUgbMh6jTbaqssp/ut5NYCxpGUIio7OnaHg
	uqekmU9ozcx1gvpDZanK4/j8G4jBfKXgTIOeZw8=
X-Google-Smtp-Source: 
 ABdhPJxWydIBSKT51WSbuP2mQfwOwQRZ4UNWG5w+J53Si/+yEEEQnW04SqEgMPYeg7deBKDdtp5hAKZTxIAI6b/ZN0w=
X-Received: by 2002:a19:504a:0:b0:473:b6da:52ee with SMTP id
 z10-20020a19504a000000b00473b6da52eemr3345168lfj.665.1652449948175; Fri, 13
 May 2022 06:52:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220513134829.1895574-1-zboszor@pr.hu>
 <20220513134829.1895574-2-zboszor@pr.hu>
In-Reply-To: <20220513134829.1895574-2-zboszor@pr.hu>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 13 May 2022 15:52:16 +0200
Message-ID: 
 <CANNYZj-xfo4PQLRQdtTfcY-8UFONNuX=6dHQF7kgn0afMqfWpw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] npm.bbclass: Fix file permissions before
 opening it for writing
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>,
	=?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 May 2022 13:52:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165567

Apologies, 666 is not right. You shouldn't grant rights to 'others'.
Besides, 6 is 110, which is rw-, no?

Alex

On Fri, 13 May 2022 at 15:49, Zoltan Boszormenyi via
lists.openembedded.org <zboszor=3Dpr.hu@lists.openembedded.org> wrote:
>
> From: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
>
> Some node module archives in npmjs.org contain wrong permissions.
> I found a case with package.json in the archive being r-xr-xr-x
> for which open(..., "w") fails. Set the manifest file permissions
> to 0666 just in case.
>
> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> ---
>  meta/classes/npm.bbclass | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
> index ba50fcac20..7f52ec6061 100644
> --- a/meta/classes/npm.bbclass
> +++ b/meta/classes/npm.bbclass
> @@ -202,6 +202,7 @@ python npm_do_configure() {
>          if has_shrinkwrap_file:
>              _update_manifest("devDependencies")
>
> +    os.chmod(cached_manifest_file, 0o666)
>      with open(cached_manifest_file, "w") as f:
>          json.dump(cached_manifest, f, indent=3D2)
>
> --
> 2.36.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#165565): https://lists.openembedded.org/g/openembedde=
d-core/message/165565
> Mute This Topic: https://lists.openembedded.org/mt/91080992/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

