Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 280C5C433FE
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 09:29:24 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web09.4183.1667381357562668184
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Nov 2022 02:29:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EqOVrJ9r;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id z14so23580549wrn.7
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 02:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OvUYQVWim0krQ30aCL/CBI2+pFIpvPzbq5pNNv0NU3Y=;
        b=EqOVrJ9rS7BFZRMJWAT3WtefnDzjfB+iNTF/7eH51Bc9a8Uc+0QgqAz+yRzUZO5XkM
         8YcKUTNO62sfYloxUtahs4yGoW96r/Xe6u6FXyOYO/acKxftjHmOFXVNsLQh5R+9d8r1
         cZb/EWa6gWkkJ284Nu/IQsJvJ9XWt5MgVWGqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OvUYQVWim0krQ30aCL/CBI2+pFIpvPzbq5pNNv0NU3Y=;
        b=4MI0v4nBQiGVl+jq8LHxk3T/X3cdpm8e7ZgT8eYQS2JJVw7Qgl6Kod0CP2tcusndRm
         mmvwpJIq2bWtTsMvJf3lZZo0IPAt5iXW7RYnLYBIiuPNx2VvWqrgs4CqmFrXWQgXh9l4
         C+0iGifOfuB2S6izK2fVfz5uhHauct4fKVvXQpZOmlDyWtmynzPGh+07cU0+NbdBj6hb
         7sxEtvb0RQ3pXAvgAwDaak/7dNqOAkLXL3uVXLuuOPwUtRfE5W30xXzqN8p4vz6O8taY
         mOp8p3K6tYAaxbe6mAVXrRnX8Iu4mPk+9/YaqeKFRV7B0ByVxbt42jOmsvq5C5geDGgM
         hxvA==
X-Gm-Message-State: ACrzQf0nyYQ3/1/zbGQFMesjphF2u6Ln15k04sR4Re5w/viPyQMN9jVX
	8f8cEngqbocS2O0qkSW2DWfmLA==
X-Google-Smtp-Source: AMsMyM59JhUllXIiUFS/8wKM/LuqXXiU63ZKMwdls+cei3wKFV7O2h9n/Y3j5Iuz4YHECY7TJaAH3A==
X-Received: by 2002:adf:df88:0:b0:236:ea45:1e35 with SMTP id z8-20020adfdf88000000b00236ea451e35mr3385233wrl.645.1667381356115;
        Wed, 02 Nov 2022 02:29:16 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:b8b1:19d6:e9d8:a61a? ([2001:8b0:aba:5f3c:b8b1:19d6:e9d8:a61a])
        by smtp.gmail.com with ESMTPSA id bx10-20020a5d5b0a000000b0022e47b57735sm12662304wrb.97.2022.11.02.02.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 02:29:15 -0700 (PDT)
Message-ID: <681b5a850dec436f41961b15df6743b683dfd285.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] rust: submit a rewritten version of
 crossbeam_atomic.patch upstream
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Date: Wed, 02 Nov 2022 09:29:12 +0000
In-Reply-To: <20221101201044.1034019-1-alex@linutronix.de>
References: <20221101201044.1034019-1-alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 09:29:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172579

On Tue, 2022-11-01 at 21:10 +0100, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/recipes-devtools/rust/rust/crossbeam_atomic.patch | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-devtools/rust/rust/crossbeam_atomic.patch b/met=
a/recipes-devtools/rust/rust/crossbeam_atomic.patch
> index 2f3f985243..13719ee9dc 100644
> --- a/meta/recipes-devtools/rust/rust/crossbeam_atomic.patch
> +++ b/meta/recipes-devtools/rust/rust/crossbeam_atomic.patch
> @@ -14,7 +14,7 @@ Someone with more rust knowledge could split up the tri=
plets in no_atmoics.rs
>  and compare against the architecture/processor, or replace -unknown with=
 a glob
>  to create a patch that upstream might accept.
> =20
> -Upstream-Status: Inappropriate [OE Specific tweak  but could be rewritte=
n]
> +Upstream-Status: Submitted [https://github.com/crossbeam-rs/crossbeam/pu=
ll/922]
>  Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> =20
>  Index: rustc-1.64.0-src/vendor/crossbeam-utils/build.rs

Should we not update the patch here to match the one we're asking be
merged?

Thanks for sorting that btw, I kept meaning to but hadn't quite had
enough time to learn enough rust! :)

Cheers,

Richard


