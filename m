Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.2594.1630354775107751025
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Aug 2021 13:19:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OnoHpb8M;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id g138so9605601wmg.4
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Aug 2021 13:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=U40xxPRZrLqL81ndoGGsSvHyhl6sjvKewj65l4pOgmY=;
        b=OnoHpb8M+QGmCR9C4BYkDdyupQl+0LRBEZx6TZzjbOJulkFAuc8fSmbRgMJOqUDoZF
         MmTVGponTvESSmBQxw+w5xa3EBztajxwPE1OFJgwVKq9wf9G+gkPWk4VJC80sSOUWS4g
         4uwL+eRNGf/9FItL2ROPeHDVXcKa9CP3doAbA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=U40xxPRZrLqL81ndoGGsSvHyhl6sjvKewj65l4pOgmY=;
        b=SxmNqOFYuXAt/MrKhaONJTGjEM+2zfGhJWTChJ/X8IZva9buEN+wRW3W9EeQ8u1dBX
         ZRghuyhluOz5Qa4V6n1ldjrLrADUqTe2k+YONcco1mFbiTH5Uz42+tt47j29s8LkGnff
         efc/zXmfS1+rPBP0lxwXyK0a3T9jWeLW/oks/sULornzAsnAZMq586J9Mq7gylg962zF
         EdmrVuNTbF+JEARKbueJwrpKeHtimrL9ngBNY92LdNLGx/d82fW55MwXlpQPlBn9sNDl
         kwPJm7dT9D/n+ghdGayV6LtJuun6BU8sfxttj8Kfrj+b3zCaSiywgnPXfdsNMM3qAKsN
         mYlQ==
X-Gm-Message-State: AOAM5332Jojdgflj6UCBhy1memm+zyyRFkRR/RGQFlZkF3nbed8yfKqa
	NrfIzIQj8NrqP4mpW8yLoKvBbx1JgjoQUA==
X-Google-Smtp-Source: ABdhPJy5BhhWiA0NiI2/lbbq62WEZAhOXPVVmRvEP9TkaZ4WabZt426Vunva6CoiM+Tni1qmPAb0ng==
X-Received: by 2002:a7b:c353:: with SMTP id l19mr787555wmj.122.1630354773767;
        Mon, 30 Aug 2021 13:19:33 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:e840:dd4f:b947:28bf? ([2001:8b0:aba:5f3c:e840:dd4f:b947:28bf])
        by smtp.gmail.com with ESMTPSA id k16sm16630422wrx.87.2021.08.30.13.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 13:19:33 -0700 (PDT)
Message-ID: <ec56dc17f8303ccc907d859014d88c1b808c7e47.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] quilt: Only package guard for the target
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Saul Wold <Saul.Wold@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 30 Aug 2021 21:19:32 +0100
In-Reply-To: <20210827215743.2027466-2-saul.wold@windriver.com>
References: <20210827215743.2027466-1-saul.wold@windriver.com>
	 <20210827215743.2027466-2-saul.wold@windriver.com>
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2021-08-27 at 14:57 -0700, Saul Wold wrote:
> The guard binary and documentaiton should only be be packaged for the
> target class.
> 
> Signed-off-by: Saul Wold <saul.wold@windriver.com>
> ---
>  meta/recipes-devtools/quilt/quilt.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/quilt/quilt.inc b/meta/recipes-devtools/quilt/quilt.inc
> index f85de384d2..41d30e89aa 100644
> --- a/meta/recipes-devtools/quilt/quilt.inc
> +++ b/meta/recipes-devtools/quilt/quilt.inc
> @@ -73,7 +73,7 @@ do_install_ptest() {
>  	cp ${WORKDIR}/test.sh ${D}${PTEST_PATH}
>  }
>  
> -PACKAGES += "guards guards-doc"
> +PACKAGES:append:class-target += "guards guards-doc"
>  
>  FILES:${PN} = "${sysconfdir} ${datadir}/quilt \
>                 ${bindir}/quilt ${libdir}/quilt"

Again, why?

This should be fine/ignored for native/cross and applicable to nativesdk?

Cheers,

Richard

