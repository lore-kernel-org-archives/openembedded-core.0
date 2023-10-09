Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 364B9CD610D
	for <webhook@archiver.kernel.org>; Mon,  9 Oct 2023 16:44:21 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.67887.1696869854021267899
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Oct 2023 09:44:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=h2vzcYmM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40572aeb673so46117505e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Oct 2023 09:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1696869852; x=1697474652; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=U5wa8HUeL/RkeoNrOZDrCytyXc2+dGANQ7H8Su7HoRU=;
        b=h2vzcYmMOivPUGhG7Ei3csoxpuyjjEzMZogY1q7XqBF/xdINqtadIeFuxCH+kh2Hos
         LzZw+e80PDT6cknnLjLl+vbvFVVeRzON+BIfcm5YOMI4PVUimql+ppjqLhW1q334ZPMl
         oXK3Gi7q0EaHptiyiLUmxWXZIKI8D3PdUuhAo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696869852; x=1697474652;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U5wa8HUeL/RkeoNrOZDrCytyXc2+dGANQ7H8Su7HoRU=;
        b=HX0TGXCozaoxid8LfyT8zvHQFteiwslN3/OMxxtLAp8RuLpmZl0WlQL4DiZzZCcN7X
         ZR1daVzaOn9MSfCYJxQL4jX+4uFqUEmOcOfrA+kyWPOUW5C7go1N+ts2fO/sx1o0eH5V
         +FzfkpgSbG5ZJODmKJI8ow22BqFK20kj81JK+i3OhSgAaip/dF9znS/+tPV2fHbb0Z16
         E+b0/qB7CzmDqsekGZXVfrX8rrENHmcSPdnnbtjhf0B+QlPgxVb8rysZp7DapB8k0r8Y
         WWL7lvKhCvAc5r+fEWXsWbqx7sdNHT9F3wLFRPG6eEagU0YBd+NWWY5dy4L6GLhFOqO+
         1YEQ==
X-Gm-Message-State: AOJu0YyIQMP9Xj3nEkGw1vUGUmDjFgBcW1fmt7XfdoeYqacgGQyAfcdk
	5rvDhOfkGGkY8oWm8LYyoFBD/g==
X-Google-Smtp-Source: AGHT+IEhrUsfFck5kuLtFQq/LrKZMjnA8adR91In/D8DUJHM5jAnnaAqpVqUQ0ezsylrUbadebdHIg==
X-Received: by 2002:a7b:ca59:0:b0:406:5359:769f with SMTP id m25-20020a7bca59000000b004065359769fmr13887044wml.0.1696869852455;
        Mon, 09 Oct 2023 09:44:12 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8318:8840:ca53:f6f2? ([2001:8b0:aba:5f3c:8318:8840:ca53:f6f2])
        by smtp.gmail.com with ESMTPSA id l9-20020a1c7909000000b00401b242e2e6sm13891971wme.47.2023.10.09.09.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 09:44:12 -0700 (PDT)
Message-ID: <4eb39033effcbbcd8651f73632b94bb159fecb65.camel@linuxfoundation.org>
Subject: Re: [PATCH] ncurses: Mitigate CVE-2023-29491
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Marek Vasut <marex@denx.de>, steve@sakoman.com, 
	openembedded-core@lists.openembedded.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Date: Mon, 09 Oct 2023 17:44:11 +0100
In-Reply-To: <20231009163110.94431-1-marex@denx.de>
References: <20231009163110.94431-1-marex@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Oct 2023 16:44:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188851

On Mon, 2023-10-09 at 18:31 +0200, Marek Vasut wrote:
> Configure with "--disable-root-environ" to disallow loading of
> custom terminfo entries in setuid/setgid programs, mitigating the
> impact of CVE-2023-29491.
>=20
> This is taken from debian:
> https://salsa.debian.org/debian/ncurses/-/commit/1c530aad772f7aeef039b878=
0d51cd09bd5a08ac
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-core/ncurses/ncurses.inc | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/nc=
urses/ncurses.inc
> index 367f3b19f4..1bc07ec2d4 100644
> --- a/meta/recipes-core/ncurses/ncurses.inc
> +++ b/meta/recipes-core/ncurses/ncurses.inc
> @@ -87,6 +87,7 @@ ncurses_configure() {
>  	        --enable-sigwinch \
>  	        --enable-pc-files \
>  	        --disable-rpath-hack \
> +	        --disable-root-environ \
>  		${EXCONFIG_ARGS} \
>  	        --with-manpage-format=3Dnormal \
>  	        --without-manpage-renames \

Should the patch add a CVE_STATUS entry as well so the cve tooling can
tell we've mitigated this?

Cheers,

Richard


