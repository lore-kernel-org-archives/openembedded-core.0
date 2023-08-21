Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17CD6EE4993
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 11:21:24 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.8594.1692616882587975788
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Aug 2023 04:21:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=dhbOiKdA;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-50079d148aeso1834590e87.3
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 04:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692616881; x=1693221681;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=35LzMudckc25452DXOo3Ufz2+vI+/Ia0GORtswG0w+c=;
        b=dhbOiKdAl0Wxf6mGbRfsziz1WkA5118E1cLnz8ZENPSdogvFMRAzXG7HsSdRRGASB8
         RPKyH2vLjZiA/zf7LJsVEUAqHF7bgHXbGz5Bb4nH+6H/QFo4F6Mx/4uguLvIEBWhvAe5
         sKL6ZPrpmcOeQP4TCJ9FC7EOGD86JFxRaipv6SwriELLhf6gEHxaTCnh6lXFTaTRpIwt
         qWAVNgmZHasG9TPOon7y9213qRpHfxJE6Xu+UYRd8HGL6QMUsFDKtsNXgyotJ6YELhkG
         r8EcxQVHku6rKQSeKmsxCVcD0sAxivq5KCH4vR2VZgtPAylRH57LbOh7xbej1ppBWxiL
         5xlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692616881; x=1693221681;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=35LzMudckc25452DXOo3Ufz2+vI+/Ia0GORtswG0w+c=;
        b=PAftcGKwyDpks41XLQAXn0mjAZW7BmaeVLA0Q/A0BvtxWUu22tjkXEMuzaSgEYHY1D
         Pe22Tt/89Ve+D+SKbbb9NSfd/cL+7e76wV87egsZEtnEnOfjzNyf6rfG2c8XRUDuS7Z7
         1oRlF/6muz7aDhsyqsPCgOn81NW3LcF1VmVWv75vLGPG83l3AG7bHbMW6BhMSoPD6hqw
         KizNeDyN52IfyrjwRjBCZbjnr3jDacrO6oMizgDc4O3iTBgrXMz5m8T2k9ePbFe3gUaw
         cF+Sy9bRh/hKPcBdcrrCOK0QUKAKtmFaUjNwjUqzM9mxXO20kFBlhtcoDCGjhxW8wbF2
         L0mQ==
X-Gm-Message-State: AOJu0Yx2e0uBpOt5kERAq/DpwHFoRcrigqxLXBDkzupU0VfEfS8PbVIy
	wjHWL5RJzWvZBgBD55VnBJeFDS8PUyTRHWPPz60=
X-Google-Smtp-Source: AGHT+IFDl8KY4BGcib3f84p/qJdx1csOfZIlTE98m54JLrtxnQq7ZLQlaskajqGSN8MCPKZvpIRQgx2SluSNF/QsByg=
X-Received: by 2002:a05:6512:785:b0:4f8:49a7:2deb with SMTP id
 x5-20020a056512078500b004f849a72debmr3903947lfr.8.1692616880537; Mon, 21 Aug
 2023 04:21:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230821111803.67598-1-pramanik.souravkumar@gmail.com>
In-Reply-To: <20230821111803.67598-1-pramanik.souravkumar@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 21 Aug 2023 13:21:09 +0200
Message-ID: <CANNYZj_ag6JOP69UhebmPrHRjpp+BTcvTfjpq=Q+7oK8gDtOkA@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][dunfell][PATCH] rapidjson: Avoid usage of nobranch=1
To: Sourav Kumar Pramanik <pramanik.souravkumar@gmail.com>
Cc: openembedded-core@lists.openembedded.org, ranjitsinh.rathod@kpit.com, 
	Sourav Pramanik <sourav.pramanik@kpit.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 11:21:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186432

Thanks, the correct mailing list is openembedded-devel, not oe-core.

Alex

On Mon, 21 Aug 2023 at 13:18, Sourav Kumar Pramanik
<pramanik.souravkumar@gmail.com> wrote:
>
> From: Sourav Pramanik <sourav.pramanik@kpit.com>
>
> The usage of nobranch=1 in SRC_URI allows using unprotected branches.
>
> This change updates the real branch name in place of nobranch=1.
>
> Signed-off-by: Sourav Kumar Pramanik <pramanik.souravkumar@gmail.com>
> ---
>  meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
> index 04ac93e92..bc90bffe5 100644
> --- a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
> +++ b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
> @@ -4,7 +4,7 @@ SECTION = "libs"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://license.txt;md5=ba04aa8f65de1396a7e59d1d746c2125"
>
> -SRC_URI = "git://github.com/miloyip/rapidjson.git;nobranch=1;protocol=https"
> +SRC_URI = "git://github.com/miloyip/rapidjson.git;branch=master;protocol=https"
>
>  SRCREV = "0ccdbf364c577803e2a751f5aededce935314313"
>
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#186431): https://lists.openembedded.org/g/openembedded-core/message/186431
> Mute This Topic: https://lists.openembedded.org/mt/100870655/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

