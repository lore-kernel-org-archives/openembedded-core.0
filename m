Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC6CFC3ABBF
	for <webhook@archiver.kernel.org>; Wed,  7 May 2025 22:43:38 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.2538.1746657804725704515
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 May 2025 15:43:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OPyMBs+u;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a0b6aa08e5so785584f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 15:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1746657803; x=1747262603; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eUuT5wbYkkZ+GILIulXkcxwyAjC8lxXdL83eEq6pMCE=;
        b=OPyMBs+up/QKtIVhK1igCISA+7P0bRG/Rz1rIMnYilUR/267Z1fpvI6l2ThSfUvwV1
         0Rg5idto5LbFh9YCRhJOVGppbCW1b7QuBlPPkdgld4XjiHHPHQ46rdC4zpscqnzo4j2B
         OIH4oMEpNLmTmvDMLDHfZjh301zy0Uj+SfJ6E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746657803; x=1747262603;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eUuT5wbYkkZ+GILIulXkcxwyAjC8lxXdL83eEq6pMCE=;
        b=YmIOzNKJmlaIDhlQTR6OPvizcnEk2yiOrDssn5rWbt/5W3YpymxYpRzgCZ8xXjeH0u
         1q6LZUsiw1UBH676Xs9mJ1hrqWiKX/906ANR6Gkr6Tq9+vQ+o+3ICEAirse7t3NXXupw
         7/njPNO4F6+aFPRaKQpJMrLQZNvrUh3X/Al0MJRo9GL32/hO7bPG/TLSUtUN6VN3mKa7
         BGF6iKNnidrdj7cfnsjirpOrZZEXS2S7+Zb59J1SNIK9heiXZZACTbYY/zAGaTg2Fzwo
         2xY7Znm8ZI8Q/a75NhMScpEWUB/rReokLynAyl5otaqFmH5AF3RyM7uJ/sgSp+esuVK3
         IMRw==
X-Gm-Message-State: AOJu0YwOubnWMp9ICdxiApaqbug12TPg2TmeUFeLLcyQpw9iRgUt5UMb
	CKPv0zaz5XpKQqSNM1ikgHLly2qGQAjKNN0v59N0nY7oV2dMGGqBZ+xQVmWw38g=
X-Gm-Gg: ASbGncv4zqah0MgXxOOZp/rrAcPxxRKKu7y4COi2NRIxbCidkjj4GOP7V2P2pts8koE
	mbaoRgW+hAv+93zY5aozUIXatbgLJXjKcYnnllJLZwZpZ+iLQrxqQx8JmOXyzjIqqB4Cmm3fG2d
	YIxG+6fW9arQTHoUdcFzXNUHz5yvha9E1esZEcfyjix0nWSIY0PJ6Y/2jFlO3FawOtvTPkfU0Me
	4btdI8cDag1mLURIe+PI+QjLiRXZ0V5uojNyml8llyuW9mZ0Td3H2zP7dqZfpyFkGIwCF9vZQyT
	zbs+TrNTlCgFk7g7ucuSfWLO0OM/fkd9qdK/jbQQbQd9Dx7g1lEpOdlX1tnYOLLbj6Hw/9kql1Z
	PtT4JSRTLsY3/zoWWfrchpeQPIF8fYef1GrLPcg==
X-Google-Smtp-Source: AGHT+IFpVL2l4cZQUgQ47xyS70XS4paO3VvO7QJQyzFE5UXeqFlVoyAgk2ttJ5pczda2GJiikpQJOQ==
X-Received: by 2002:adf:a1d5:0:b0:3a0:825a:cf8a with SMTP id ffacd0b85a97d-3a0b9941b51mr785306f8f.26.1746657803085;
        Wed, 07 May 2025 15:43:23 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:d80f:d6c:41df:9903? ([2001:8b0:aba:5f3c:d80f:d6c:41df:9903])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a0bb7c29e8sm200492f8f.7.2025.05.07.15.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 15:43:22 -0700 (PDT)
Message-ID: <cfeaebc6ac1c646e03a69e96d7a9561f48457d07.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] linux-yoto/6.12: bsp/arm: fix
 CONFIG_CRYPTO_LIB_CHACHA
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 07 May 2025 23:43:21 +0100
In-Reply-To: <CADkTA4NTYoqfESwHCg9hp2UqaEX2JqWsbQ5wqU5mwKLfoHmmmg@mail.gmail.com>
References: <183D4757C69BDCF6.4227@lists.openembedded.org>
	 <CADkTA4NTYoqfESwHCg9hp2UqaEX2JqWsbQ5wqU5mwKLfoHmmmg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 22:43:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216137

On Wed, 2025-05-07 at 12:16 -0400, Bruce Ashfield wrote:
> Ooops. I see the "yoto" now.
>=20
> I can send a v2, or if you want to=C2=A0tweak it on the way in. Either is
> fine with me.

I can tweak, thanks. I'll put this in for testing overnight.

Cheers,

Richard

