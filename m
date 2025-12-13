Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 449BED5AE45
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 11:22:00 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3742.1765624917372856968
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Dec 2025 03:21:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IRbq6nFB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-477bf34f5f5so16042835e9.0
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 03:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1765624916; x=1766229716; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VfRxh7hbpGnBLtg5T187fL2I3LOQaJnVH0hl/LpBC4k=;
        b=IRbq6nFBpRCNCfUbXm/imrNXFkSHafcxl0uTpZCo/jBXG6IS668oGx3jd8somf1gW3
         jl7jsAZaromdkUOG2E1Wt2rUJbXAUz0PAbtdTLMlF4Tz5Zbosx+81SNa5piVOLl7e8op
         B6zIU9XSMIYqQXXe7QrgfbMmuqOJvwf0bQ+Ek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765624916; x=1766229716;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VfRxh7hbpGnBLtg5T187fL2I3LOQaJnVH0hl/LpBC4k=;
        b=d2mGnXv2wudYbcshMZ/o3wN0gbbEIqLMfl1m7n/7J0ZV3bgadMEaWZFpXIJqcg3+jP
         GkUX8pPwqIlRMxfWWNYF+46B2RT/MQTEICH6KJ1adkHTTxEferhy0O3677iu+pdLTDAi
         KpAO4WzVHA/Je12VWR/CoxHEnamzxbBD+27Pww18utc2JHg1CsOG99oy7ow4VnqkvbcZ
         +dzdnNJVHDxuYB5nMfNSZtMPwTKtNlaPwE700YsxTd5KTLEMzMDm5/oIUzxpAQ/LRDX7
         Xy7V1fKWbPG4NJ82rZfHfvWS259JZfPBvziw2pnUEtk6rb/GOy0PwGDbs4P3kcDuERy2
         Kmtg==
X-Forwarded-Encrypted: i=1; AJvYcCV1qRjySAobTTpzsgZGlBT3donOrbn8czx1TiMXywbVRgRGHCDSY08R90EoqdrzDYQprDBCzQatt51vnCLHeqfqhA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzgOVBvTgwOwVlFQz+NSmAYR4lI/gIbtXUTHj5FVPTol9Sq1bym
	Pi6FO2LseTYrsVNwpodolo6q1MQlLL3tKY7fCRs8RNVFWr4rWosgPzLX0hLGntvOAXI=
X-Gm-Gg: AY/fxX58Is6psti4uLVSZDGT1412OLQmfLRzFDICL0p7ZsDpvx1JlPKvfTHRI9k7B+s
	gH2JolHzuoOp3HK3ThiwlFbNonYn6HM1+1roNP9ZQDXJQR0ZLWQaHQ7YUrrDVZBrbU9AUzQa5TI
	1s4kjmWU5qwIVqlAOnuGvXca0z5H2EMVfEO2KzZqSzRNesO0EIRMfApOnVPvZxTdCR4xbVr8vmG
	zytqj69U56UsaVNw8DwHYzR4vzj0NSHmMUlF5GPbiMZmnieeNCzqsOL9j95NtaYvz5DIiPwfCMu
	AMe0McCBvb8SrF2XVHbp5+2rUSxSO91dCZRSXyp2GWDjYEFkAx2rAS8bfTfWYoWbtDzT0djk/sK
	saeJhNYvy2gsfGkF+InniafV3r6DA0mGeFDmQVzp9y9OQzptQFe4xHNtuUxxTApfx+3szNzISi/
	9vMPhP6y0RvHfBAit3Bqg8m9Bc6ftbENROZOYnSb5pQjM7BbNWtoj1YkYNQi/M3iaQrko5b9Emb
	5S04zu/Cs4=
X-Google-Smtp-Source: AGHT+IEPDYXi97mOnemfxtBMeyD/X6gHHzB363eugZxZuVoAlaWT276tFpdsUDOGIqb8n/TsxwNPdQ==
X-Received: by 2002:a05:600c:19c6:b0:477:5c45:8100 with SMTP id 5b1f17b1804b1-47a8f906decmr49088565e9.24.1765624915623;
        Sat, 13 Dec 2025 03:21:55 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:b58:105a:9d9d:c6ff? ([2001:8b0:aba:5f3c:b58:105a:9d9d:c6ff])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8f8f39c6sm76997195e9.14.2025.12.13.03.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 03:21:54 -0800 (PST)
Message-ID: <1ed25eb81b19a2c92bbb2d802fccc2afd15a8ace.camel@linuxfoundation.org>
Subject: Re: [OE-core][whinlatter][PATCH 66/67] mesa: upgrade 25.2.5 ->
 25.2.8
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ankur.tyagi85@gmail.com, openembedded-core@lists.openembedded.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Quentin Schulz
	 <quentin.schulz@cherry.de>, Mathieu Dubois-Briand
	 <mathieu.dubois-briand@bootlin.com>
Date: Sat, 13 Dec 2025 11:21:52 +0000
In-Reply-To: <20251213095931.2571498-66-ankur.tyagi85@gmail.com>
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
	 <20251213095931.2571498-66-ankur.tyagi85@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 11:22:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227686

Why 67 patches to whinlatter? Half haven't arrived in my mailbox yet
but it looks like a copy of what was merged to master?=C2=A0

You need to say why you think these should be merged. The don't look
like stable backport material to me.

Cheers,

Richard

