Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75FCEC4707B
	for <webhook@archiver.kernel.org>; Wed, 10 Jan 2024 13:59:49 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.11969.1704895180379584013
 for <Openembedded-core@lists.openembedded.org>;
 Wed, 10 Jan 2024 05:59:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dnElDzrR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40e5a5b0fb5so828135e9.3
        for <Openembedded-core@lists.openembedded.org>; Wed, 10 Jan 2024 05:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1704895179; x=1705499979; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eL6Y9OZLSzJ7PINmdjUwd8IkL4KYEWLzMOkhJvsu0Xg=;
        b=dnElDzrR1pzf7l/7lSMVQYDD2rhhoCt/4uzfjdhp9qcoEInsr/yX2PkjT61iFw502N
         EPFe+vxdJmWPngeZhH6TtgV0zHQaXRgCgDcMLNb1+hNjWhF4UL+DBtCbojLGM1y8iE3Q
         And5FmyyJKRe0nPnRAKQsebhLxWvxsExgb6rs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704895179; x=1705499979;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eL6Y9OZLSzJ7PINmdjUwd8IkL4KYEWLzMOkhJvsu0Xg=;
        b=Ip5WKgZQcgfg5Zq7HlDzdZMP7OUrn0TlU3Yhno850pHNRC0D0EP88rbnZCbp9cHOc9
         YUiC40kZ1ruBlj3Lf/I1a87P2dB7dSfMczJSTjxTPM693pOEDoct7Lh65qC58d3e4XRI
         Mz3td/7vW72pFK9sch7vsiJvNuBerS/szg/yZjw+RLr7BygbwY2F1Hx5Hez0mtyyvnMu
         BMBIHqUJGsRiNUVY8KG3u80Kz/3nrQhoH8zh3v4KPTm2SaNyIh6G6qdekmwu3K3lqPuc
         461B1Y9DeNwM/V9zt2b4qFn6ycuggslrAwBi6KDMsTfqnIKxZLpPNvGGWY0+sOkin2E1
         rTJA==
X-Gm-Message-State: AOJu0YyOL8Og5OCbMrirx58cJo7/5w+PCwG7B0VrP8u73l8DSXz+PbCs
	7mpohWEgW0ouw3ZwucZTX/ek7iZxMCZwhg==
X-Google-Smtp-Source: AGHT+IFC5nyjYLpd5CM0Npxa7ZCBU6qQxZK6nl3pQUYb6PxAFif1eZGEvTNf1lkOvWVB369TIgtzog==
X-Received: by 2002:a7b:cc07:0:b0:40e:52ed:ef84 with SMTP id f7-20020a7bcc07000000b0040e52edef84mr560297wmh.149.1704895178878;
        Wed, 10 Jan 2024 05:59:38 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:bd40:945a:4f08:4810? ([2001:8b0:aba:5f3c:bd40:945a:4f08:4810])
        by smtp.gmail.com with ESMTPSA id q20-20020a05600c46d400b0040e395cd20bsm2287946wmo.7.2024.01.10.05.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 05:59:38 -0800 (PST)
Message-ID: <8a756432917f8120a8e2d0d5b1e8ee9daebd6132.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/3] recipetool: Don't fail on local go modules
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Vyacheslav Yurkov <uvv.mail@gmail.com>, 
	Openembedded-core@lists.openembedded.org
Cc: Lukas Funke <lukas.funke-oss@weidmueller.com>
Date: Wed, 10 Jan 2024 13:59:37 +0000
In-Reply-To: <20240110115335.92914-1-uvv.mail@gmail.com>
References: <20240110115335.92914-1-uvv.mail@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jan 2024 13:59:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193510

On Wed, 2024-01-10 at 12:53 +0100, Vyacheslav Yurkov wrote:
> Local modules are usually referenced with a 'replace' directive in
> go.mod file. If that's the case, remove them from populating SRC_URI.
>=20
> Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
> ---
>  scripts/lib/recipetool/create_go.py | 32 +++++++++++++++++------------
>  1 file changed, 19 insertions(+), 13 deletions(-)

Do these changes mean we need to improve the test coverage in oe-
selftest for recipetool?

Cheers,

Richard

