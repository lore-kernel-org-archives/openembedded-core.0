Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93ADEE77197
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 13:50:48 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.20508.1736257842350479246
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jan 2025 05:50:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IwwugHI2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-436a39e4891so55861105e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 05:50:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1736257841; x=1736862641; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l+f8oo8LHYxXN/EEwnnG8DloI8bKkdvHiKXEzIFIAYY=;
        b=IwwugHI2kqM2HNvXLAB3SWTuQeNl9LBJAffxG0K+Uer07QWGxyou1g09Ab6XDKsKMu
         eYAbzXVTfJNwGyiXDbxrr8O9tYFRn/5zX9EfX6yszE1zDA0FU7Gwjxt1evkzA0W0k48P
         dFWZKH+h4oLx3b0ir6bOzFQMVjLNSFjd2hEk4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736257841; x=1736862641;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l+f8oo8LHYxXN/EEwnnG8DloI8bKkdvHiKXEzIFIAYY=;
        b=ZV95f+Ccaot9zT9Fb3O+JoXtSqeaB6sLAbjY0d8L4Zqn29gn/0BqxouNPbgBLEnJlW
         jgduWKElR5Is3HRzqS8T+DvcdP4dBtiYMz87+vV36xzj/mtHU9R0NtiH2OGQAGQY1/wc
         U16OdCwVSrP5NdQJeCwky3TBVa4UBs6fJREnIrkWXS8sGPDY+dtjDstoWuN5I9CacVbf
         ly5mM9gXYiiEurzjgELRHNRv0ZB8rs3IVQlbictttWrrAl1D6/ga2sKxch05TXyzrr1n
         McTxMFoMtRaI/xRzdV/dlfC2sNafGu2FVBVazDk3Mvb3YjO7YNsluOx0KOiwe25oFOKQ
         Hkwg==
X-Forwarded-Encrypted: i=1; AJvYcCWJedoO5Vqpb2lmd3gCBcMA4W4qdjWlu271BmJuBcthwPdyJHVQZYTGjCCaniH+pDpSkPmw+onxXttl/rK67UwPJA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzBKH+lGHhqcdHLclnZaCId1GTejBGQZlA95D52MmD9eKp2rr75
	Qvb/jLDC/tGt9gP6GKImc3215vfjAwe5PO8g4i/VYHbi7Ei72625HPYMFfk+6AQ=
X-Gm-Gg: ASbGncur2J+D9tnagIATeOeB2IDxMyK8yaThnHjt1iduhvMQClrFYKbeQ0YBD8L9fCT
	Hl4tpG/kEnpNa/biFAU/0jjF1KeqU1Suh/f9HRYS5v3kK32kdM1pIWfhRa0U3Do2lm+rYVqibtn
	I6t1uZ7+ZMv4dxMpYBFYAvdh9prHl1GDDH/zIrU7WO9BAsa+xIlbxA+sbbor4CiLRHXp9COjRQP
	rF2onNPf0KQuYqRBrIjhtpQPh1chyHLpDz/DMdZwxjq1xBW7DMgZdf7FEa4j+2KdIVTe1lRJzO9
	w1dbFRI4S+Fwo1jjSvLDufrgxV7FdyAniDmq7ufUli05CQ==
X-Google-Smtp-Source: AGHT+IG+7Ya36BGp0b8hSSGjpegzadLKzn4PYnxhGfLhG1xw0HdxT9HnD3VQNPDlFXFcKtSWUbv24w==
X-Received: by 2002:a05:6000:1543:b0:385:f195:26f with SMTP id ffacd0b85a97d-38a221fb043mr57075326f8f.19.1736257840735;
        Tue, 07 Jan 2025 05:50:40 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:a621:21b2:eb2a:5bdb? ([2001:8b0:aba:5f3c:a621:21b2:eb2a:5bdb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c832e69sm49962990f8f.35.2025.01.07.05.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 05:50:40 -0800 (PST)
Message-ID: <89caec1689b31e2d13def8fc5137f35328f94431.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 04/19] scan-build.bbclass: Add class to enable
 clang static analyser
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: raj.khem@gmail.com, openembedded-core@lists.openembedded.org
Date: Tue, 07 Jan 2025 13:50:39 +0000
In-Reply-To: <20241105184540.3450302-4-raj.khem@gmail.com>
References: <20241105184540.3450302-1-raj.khem@gmail.com>
	 <20241105184540.3450302-4-raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 13:50:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209468

On Tue, 2024-11-05 at 10:45 -0800, Khem Raj via lists.openembedded.org wrot=
e:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> =C2=A0meta/classes-recipe/scan-build.bbclass | 60 +++++++++++++++++++++++=
+++
> =C2=A01 file changed, 60 insertions(+)
> =C2=A0create mode 100644 meta/classes-recipe/scan-build.bbclass

I think this class can wait until later and shouldn't be part of the initia=
l merge.

Cheers,

Richard

