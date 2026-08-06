Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66DE8C56208
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 12:30:25 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18649.1786019419737870998
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Aug 2026 05:30:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=b+Mn269i;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-495437bb891so8379755e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 05:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1786019418; x=1786624218; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=isq5e1a0AVQ33heoC9QhEkMAgelscgXInYV65Nbj+jQ=;
        b=b+Mn269iO6v05aWGEcKoXVUcBdcscm/c0RuumEIz/MMZoMpB2kfag0k2VuOyZIPGGg
         GLAoqGGxEciH1OnWpKjFBYhb7TYIUdhAYR0bNwYYqZDhVT3uV/yYhpj+amboSJB/9Ypw
         n9ae/HmS40zFwFIZ9ZWLUrpLjW00jnddI1SZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786019418; x=1786624218;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=isq5e1a0AVQ33heoC9QhEkMAgelscgXInYV65Nbj+jQ=;
        b=Par27EgD4TVh+p+m4hHKzVJ8ww2OZx1XV+XBTwX8oVSm09Ahoja1CAAr3/I/0vZQJV
         5DCIvrAJt78tV0YKAEyNcyyzrsNIbmz8JIOhGH3iQPXu3hSuo682Y3wfN3G3WXj1D+4T
         CQpMBhHjpnixyxrVuYIYrm/0rQ6mZ9KZxQsEOR9RezFmYM/xaN43SRSd2SFyYGPJXABo
         tLs9zLY95ZKamfahepweLrr2tw7eb1bMNnBLl8wxrsTxVRjHs5ndOJeYCme6iSYlolqY
         bTiEnPhVtFwHRX6clj7MpeWBFLBY+DynH2x3RpPGCKQ1nQNNmfY+5jD/378KvLehKEwn
         9xIg==
X-Forwarded-Encrypted: i=1; AHgh+RqDm4jEc8gb6ODgau9NMvkiagp9k5/qF8VR8Qu2O6pVPQQXhys65cwPKDGm7fMFW2xbvAF1etL6OEIg4vWhmz5mqA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyp6pTQ1mhUqlzUDPqYafte69eCwDkSN3VF62hYx+qOvp0rB9un
	Tq1kt54lnoyz76zycRP4ghfh/Kg26idebI2dsXdMr5kQp4JT+aeQHCAzhJmLUDWOj8zsvsQHSwv
	HWdk6MEE=
X-Gm-Gg: AR+sD11plMkw2+RLqQ2fmHJS+mw9wW/dbXtprPtA/PuEQZnHUAC5Xcc4gg2mhJAAGto
	t6JNHZ9ymNL0Exwv/4BqPtA7fpgUIK8aWAFY7OMoaCzhA2ZdJ38pUcLed5yr0O7enfhWjPqlsTq
	HTyxHmTqoUUZj+kiwnVuoABjHBzO90vzMv5zBBpumeeV0N96uUy31VX9OOuEEhToBvQV8cn5Ite
	qOv5G1EbpcQmbzMOdKbHl16HTUkJtB53C945bJ1uIkWdgPO/THfGhJX1F1N7yDHG/p57sMgc/4H
	OTAzawmzOXEw+s9hBd4m77qWSlQ3wsHUZC4D7WLyg9lvCGvn/CUGpUAo3PRk/LueZiB++zfmU3v
	W06LXYPoWrxvO6MReo+INpVDebbznVqDhV/k7PfNJxojexPuOCdHOBJ4Nk2/hdV0GwGnKgBBwgg
	lIKe1hWPJaXUtifdkmLBBOGHOfeRZ5ZJ9yxKRY8mC3WELUMYs04Kng/BQjmfsH9CpzdGZFz3v/k
	rPrwz1HIDgRoAaYqphrNs/yf9pBhu82etinBsFPqRvjxbaVSet5ppo=
X-Received: by 2002:a05:600c:811b:b0:493:f478:4c71 with SMTP id 5b1f17b1804b1-499553e60d8mr40137385e9.7.1786019416962;
        Thu, 06 Aug 2026 05:30:16 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9366:921d:f7c4:9ad6? ([2001:8b0:aba:5f3c:9366:921d:f7c4:9ad6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499542241cfsm58375865e9.10.2026.08.06.05.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 05:30:16 -0700 (PDT)
Message-ID: <a5f9084c7e6427dfd1ac0765836ab3a44612f01a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] sdk: fold SDK_TOOLCHAIN_LANGS into
 SDK_FEATURES
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: twoerner@gmail.com, openembedded-core@lists.openembedded.org
Date: Thu, 06 Aug 2026 13:30:15 +0100
In-Reply-To: <20260805070136.3499233-3-twoerner@gmail.com>
References: <20260805070136.3499233-1-twoerner@gmail.com>
	 <20260805070136.3499233-3-twoerner@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 12:30:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242938

On Wed, 2026-08-05 at 03:01 -0400, Trevor Woerner via lists.openembedded.or=
g wrote:
> Selecting the toolchain languages for an SDK is the same kind of choice
> as selecting any other optional SDK content, so it does not need a list
> of its own.
>=20
> Make "go" and "rust" values of SDK_FEATURES and mark SDK_TOOLCHAIN_LANGS
> as renamed so existing settings are reported rather than silently
> ignored.

Thanks Trevor, this is going in the right direction.

> diff --git a/meta/conf/fragments/yocto-autobuilder/autobuilder.conf b/met=
a/conf/fragments/yocto-autobuilder/autobuilder.conf
> index a9ae99a451e6..601cf269ab04 100644
> --- a/meta/conf/fragments/yocto-autobuilder/autobuilder.conf
> +++ b/meta/conf/fragments/yocto-autobuilder/autobuilder.conf
> @@ -9,6 +9,6 @@ IMAGE_CLASSES +=3D 'testimage'
> =C2=A0SDK_EXT_TYPE =3D 'minimal'
> =C2=A0SDK_INCLUDE_TOOLCHAIN =3D '1'
> =C2=A0ESDK_LOCALCONF_REMOVE:append =3D 'BB_HASHSERVE'
> -SDK_TOOLCHAIN_LANGS +=3D 'go rust'
> +SDK_FEATURES:append =3D ' go rust'
> =C2=A0PTEST_EXPECT_FAILURE =3D '1'

Can we not just stick with +=3D rather than append?

Cheers,

Richard

