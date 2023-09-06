Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3A33EE14D3
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 19:23:45 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.8282.1694028225018170299
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Sep 2023 12:23:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ncx9cDPP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-31c615eb6feso198592f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 12:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1694028223; x=1694633023; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JzVT30b3jMcscPY3+nXXQ1+/wsw6GH0XHuFuTCNIXO0=;
        b=Ncx9cDPPnXeXaIn0q1M8MrOmSjV3tnjFtWe718ZZ1WssH7TcZGBGYEihHGqIaaYvPu
         Lt/S9NWQOhV9RgbEKfnKUCWACmvIhZ0p6R3n+CBQVdA7gO5Gl8az4+IcV1a8Zrjh/uVG
         SaRrBHhXF9m1QOigT1DOHfbfjQYD2heBkrzQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694028223; x=1694633023;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JzVT30b3jMcscPY3+nXXQ1+/wsw6GH0XHuFuTCNIXO0=;
        b=FA6nCRgAf4JtaAwDFZs/mTrJv4ZJNaAR9PpU6AQ1mb5c/O0VvtDEIU34/hNgL2jN2H
         vkhSvNQjPkDhpPC91CtCz2PRRFBhubqzEqX4MSi2uuRv9gV71gfyyFWO0/WJTueLc+B8
         QICUpy2rcaMJm9GBSfcvvmT8MtnSiFOR1+BgYoPbuCpt1DB30L9NmunZfPQT1ySrLM43
         6ZGeQ7zQeky7HortUzT9HNiD2jI9Fh1bg0beTwqsox2H6f3r9TdDRNwY5XOlxGgq+qRM
         LIiM/xeGpxOlU1DKyNd6c1P4lMGMQKOiEdcnCY5VLWkszT8SEid7H6mRFnUkYJRk0lQ4
         KwAA==
X-Gm-Message-State: AOJu0YwQnZH8fOR1nAZiwyneiFTPncoJoRCyBMhoHnfIFAEwPWRyUYLL
	MtS/yFJ5CE3fc3OnYW32dUcSoA==
X-Google-Smtp-Source: AGHT+IHYdjiGfo6PVlMFMqvU78A3uv0rp4dxnCT0Dyvlrc7xCINpRvoxxHr6I7LhlQ9gBBV/Kk/TIw==
X-Received: by 2002:adf:e2d2:0:b0:318:f7a:e3cb with SMTP id d18-20020adfe2d2000000b003180f7ae3cbmr3225472wrj.31.1694028223464;
        Wed, 06 Sep 2023 12:23:43 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5f38:2f43:a165:5f10? ([2001:8b0:aba:5f3c:5f38:2f43:a165:5f10])
        by smtp.gmail.com with ESMTPSA id p6-20020adfce06000000b0031ad2f9269dsm21425710wrn.40.2023.09.06.12.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 12:23:42 -0700 (PDT)
Message-ID: <18264a59f21e43aed1138bc58ffdf2471c5ccc05.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 16/17] build-sysroots.bb: run tasks one after
 the other
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Date: Wed, 06 Sep 2023 20:23:41 +0100
In-Reply-To: <20230906165633.2382629-16-alex@linutronix.de>
References: <20230906165633.2382629-1-alex@linutronix.de>
	 <20230906165633.2382629-16-alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 19:23:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187350

On Wed, 2023-09-06 at 18:56 +0200, Alexander Kanavin wrote:
> Target task is using executables populated by the native task
> and as they run in parallel, races can occur.
>=20
> This was triggered by shadow recipe update which added depedendent librar=
ies,
> and where half-populated native sysroot (dependent libraries missing)
> was triggering useradd failures.
>=20
> Presence or absence of useradd itself is a soft failure, and so was previ=
ously unnoticed.
>=20
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/recipes-core/meta/build-sysroots.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/meta/build-sysroots.bb b/meta/recipes-core=
/meta/build-sysroots.bb
> index 1a3b692a1b1..ac74dda22c4 100644
> --- a/meta/recipes-core/meta/build-sysroots.bb
> +++ b/meta/recipes-core/meta/build-sysroots.bb
> @@ -42,6 +42,6 @@ python do_build_target_sysroot () {
>  }
>  do_build_target_sysroot[cleandirs] =3D "${STANDALONE_SYSROOT}"
>  do_build_target_sysroot[nostamp] =3D "1"
> -addtask do_build_target_sysroot before do_build
> +addtask do_build_target_sysroot before do_build after do_build_native_sy=
sroot
> =20
>  do_clean[cleandirs] +=3D "${STANDALONE_SYSROOT} ${STANDALONE_SYSROOT_NAT=
IVE}"

This doesn't just force ordering but means target will always now
trigger the native sysroot as a dependency. We don't want to do that...

Cheers,

Richard


