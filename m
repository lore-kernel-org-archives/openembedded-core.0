Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 777D4C2FC27
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 13:33:59 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.187399.1692279234324856943
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Aug 2023 06:33:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OeBRpzs1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-3fe167d4a18so72861795e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 06:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1692279233; x=1692884033;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=w+awI3QFQWMB06fJm85CFxY43Yaya++83b9/kiGQ0SY=;
        b=OeBRpzs1aAwNhTmlbmD7a5yI2IlFeE+h1MoOfLqwl8v5Q1puIFYqXD64vKr/csmysT
         9jtrBx3k4G9BJMmRCU85FjLhTzDGyIj+NFEM2Bsg84y3YKOue5x9kwpByXGiwaAarQyM
         nCNdTKvf7GkBF85S68ohPGj7DYmIQJRPRsAQQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692279233; x=1692884033;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w+awI3QFQWMB06fJm85CFxY43Yaya++83b9/kiGQ0SY=;
        b=YQP5BHl9ELITpOb5ZNfGrb+51bDU8NhSvXnESwyIG3QCNHw5Cj5TGgMRUqmNj6jO7B
         GwwEgw49/PMp2DEpnxK29vmVXgokiutLpp2kHtPRXGy1ZQy6B3mrRL1vraunICuxt7Fk
         sOb1jMLP05FzY2TnifzBMe/a8WO6eld6aKq7Uf2o1ExMFG/aRkO9R0HXZQ7gTaSJ/8TY
         8flk5ei5ylb3i9JQ4/fp1WF27DA6usjJGf4VFjSTlqAMscjzn5xICdvBTG9b3wvn8mJV
         mERqP4ssf2myQmClVvkdVNfJxM1gIsZWL6AScz44NpYr4W+y8QchUpF4cw+SzDurnaCw
         c0/A==
X-Gm-Message-State: AOJu0YwUiuC8TvpcrY171+ub3V9pzS9fHMJVCbo0y1+MpaPkbFqS+V/n
	C9+nbJ+9dOaHZlSOpVQej+uUpQ==
X-Google-Smtp-Source: AGHT+IFjWgjv09RX7eFQUzIJT8Ne1tsZfuJYePEsVnDmt9BRSlFwxFmWFglZAaaXiW8buYFXM/O18A==
X-Received: by 2002:a5d:51c3:0:b0:317:3f70:9dc4 with SMTP id n3-20020a5d51c3000000b003173f709dc4mr3680082wrv.31.1692279232675;
        Thu, 17 Aug 2023 06:33:52 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ce81:b365:d63f:4c86? ([2001:8b0:aba:5f3c:ce81:b365:d63f:4c86])
        by smtp.gmail.com with ESMTPSA id e6-20020adffd06000000b003196b1bb528sm18146409wrr.64.2023.08.17.06.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 06:33:52 -0700 (PDT)
Message-ID: <22190ab493bbdf84ce1ebaaa6633750ef10b1839.camel@linuxfoundation.org>
Subject: Re: [OE-Core][PATCH v13 5/8] sstatesig.py: fix hash calculation for
 timestamp
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Piotr =?UTF-8?Q?=C5=81obacz?= <p.lobacz@welotec.com>, 
	openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Date: Thu, 17 Aug 2023 14:33:51 +0100
In-Reply-To: <20230817124612.1043464-5-p.lobacz@welotec.com>
References: <20230817124612.1043464-1-p.lobacz@welotec.com>
	 <20230817124612.1043464-5-p.lobacz@welotec.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 13:33:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186316

On Thu, 2023-08-17 at 14:46 +0200, Piotr =C5=81obacz wrote:
> Passing timestamp as an integer was losing precision, which led
> to problems with badly recreated sstate cache.
>=20
> Passing it as floating point number fixes the issue.
>=20
> Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
> ---
>  meta/lib/oe/sstatesig.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
> index 633a0fd450..f7ea3d366c 100644
> --- a/meta/lib/oe/sstatesig.py
> +++ b/meta/lib/oe/sstatesig.py
> @@ -588,7 +588,7 @@ def OEOuthashBasic(path, sigfile, task, d):
>                          raise Exception(msg).with_traceback(e.__tracebac=
k__)
> =20
>                  if include_timestamps:
> -                    update_hash(" %10d" % s.st_mtime)
> +                    update_hash(" %f" % s.st_mtime)
> =20
>                  update_hash(" ")
>                  if stat.S_ISBLK(s.st_mode) or stat.S_ISCHR(s.st_mode):

As mentioned on irc, we likely need to record ACL/XATTR data in this
file as well, else well just have a different set of bugs in future.
Now we've realised the issue we do need to fix it.

Cheers,

Richard

