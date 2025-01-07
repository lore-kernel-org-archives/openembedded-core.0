Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3042E77197
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 13:52:28 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.20540.1736257943344256355
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jan 2025 05:52:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZDa6MGR4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-385deda28b3so10206864f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 05:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1736257941; x=1736862741; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mjQa4eL9fiSiEeIyufOqVbhrX1aY5VXRZOlqPBTgae0=;
        b=ZDa6MGR4BxOx36E8TDyASO75CjcWSdajiGR2PLrE+mqes0BY/jQVHYeLTkF3pe01be
         o5XRbMY4XyjQJHRewK2oueNVwVvU1lnvqR8BN+e+ib5UBB87SxKcExeUQWCCMrlrPJB9
         TLo9w3gsB5MIWDzHWCUcRXteRPD84o46Datt0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736257941; x=1736862741;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mjQa4eL9fiSiEeIyufOqVbhrX1aY5VXRZOlqPBTgae0=;
        b=bFDS8lSVvJdy2qkUUTN9u8F5A07HQhnU7pH27Wp8+g4FmnbCGxxJzCW5p7dyyVVYxV
         frbCcly6t7cgEUx5n1TY17X2WmQv1JTjdbeh9Lciv5zPBYiFmgPpdCEXPpxmMNNm9UGh
         gjVAe/eSkp900Cx5Z2fvRGmEWeoTKUFEmQTSDQz5fTI9hjQtYKkJpnB8+cBpdbhH/9Tm
         S+ZwlXiv/IZnxU6gyhYk8MeafEXhHdPJ/dJdaLfbxlfK1QwGhjEvM/zmdNAND7NXAIu6
         u29z5EZxrhADPAuY98EY11Fzo76JvuJC3W2wAaRxZxRH7XVPcf2P1I5drjUnZfDABCZx
         4D7w==
X-Forwarded-Encrypted: i=1; AJvYcCW2ZK0dXCd3gFZrnOiWwcTWkPutQNoC4gbJNIq+ry8Nh5Pgc3sXSpZBFlm9UkO2aMMw7H7hilAuXz51t5KE62yXNA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxM+R0n9uZ9W5CfTUjjxXl5e8IXztd46O/S5hccEQHKDbeZ97GV
	rm+rReub0tnTA0uAzQwUH76Pit6+MwXPfvDM+Arn47LOj7Ls3KP4gzAkM7wiAyK32m+LqCAS/Xw
	Qx9Y=
X-Gm-Gg: ASbGnctL8HGbpXeKUVMOHy58aWwg7grUbC2GPanyqEQqDoPNMKmeZzsBbudNZMwGXOR
	bWgiLXVpAI8B42ZQGR3VkfTroJZD0nxPGfUzBUOexAZlPn9lBK8w2AShyLAq/0B3NWkGSo5UXKn
	tvB3b7735xUvOwiSvniGUoCtFr+Gi3plipByor8Vgn85uMUIT3/T2V8a72GmkD/wW++8reQSGCM
	+nMJ9ewE3J5qNOvliLVoIPNb8OhTvDSpVar4rnJ1E6u/+NZFLLkcoqz7Jk6GHGqz58A/a39/fGa
	3iubHbMPPWAufl0Y1HjoxREF9rHi/jUrB8Lp/4mzjDplCg==
X-Google-Smtp-Source: AGHT+IFvJGSeLISQ91GTZcIg/FAR4Zz+Cf+6LzcGy12kUZcsjzM3AuqCJjc6oman0tG1Oz1cBIX+9Q==
X-Received: by 2002:a5d:47a7:0:b0:386:4034:f9a6 with SMTP id ffacd0b85a97d-38a223fd8d3mr47016898f8f.57.1736257941596;
        Tue, 07 Jan 2025 05:52:21 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:a621:21b2:eb2a:5bdb? ([2001:8b0:aba:5f3c:a621:21b2:eb2a:5bdb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436dcceb374sm17995045e9.0.2025.01.07.05.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 05:52:20 -0800 (PST)
Message-ID: <c3e2666f3e3f92e6afa088d16aff7230336e5c63.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 02/19] nonclangable.inc: Add recipe which can
 not be built with clang
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: raj.khem@gmail.com, openembedded-core@lists.openembedded.org
Date: Tue, 07 Jan 2025 13:52:20 +0000
In-Reply-To: <20241105184540.3450302-2-raj.khem@gmail.com>
References: <20241105184540.3450302-1-raj.khem@gmail.com>
	 <20241105184540.3450302-2-raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 13:52:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209469

On Tue, 2024-11-05 at 10:45 -0800, Khem Raj via lists.openembedded.org wrot=
e:
> Some need adjusting commandline variables and other parameters
> all get housed here
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> =C2=A0meta/conf/distro/include/nonclangable.inc | 687 +++++++++++++++++++=
+++
> =C2=A01 file changed, 687 insertions(+)
> =C2=A0create mode 100644 meta/conf/distro/include/nonclangable.inc

We should be able to add an include_all directive in the clang
toolchain config which means these pieces can be split to the layers
where the recipes belong rather than being central in core.

Cheers,

Richard

