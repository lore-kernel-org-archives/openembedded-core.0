Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32F04C4167B
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 15:46:50 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.2782.1701445600371198421
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Dec 2023 07:46:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Y0Sb5KKN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40b4c2ef5cdso19703635e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 07:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1701445599; x=1702050399; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/gqNBJkMeDj2iVP2U8IRfl3F1SjhRnLDHqYqrNjO2hc=;
        b=Y0Sb5KKNXk18pU7savYjKDl3Gvw0tDAkWhZ28StH9pHdtR9+YJkqPbHzZAvIwudrQS
         Jybsner4csJSoeZfrs/YDH7e8G82eFQqbSP+meNdJrlNhJJu8FeqpZI2BB91L03BNm6S
         zzRGs9Vyh/iAyFgWjK33kc5X9T1adScnpahaI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701445599; x=1702050399;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/gqNBJkMeDj2iVP2U8IRfl3F1SjhRnLDHqYqrNjO2hc=;
        b=VecaCw424EpXLwDlSg8VAa5m88ujhUacMY4YLb+vgL1mhlGwWSvO8/cKPEF8RLd5NU
         BgYMDGFu8xSMGisSe7/5oCwolpHwLwnRMlgpLa9DjRaoGR/vZ93Z0CBTll9rNukKcDgb
         BbcI5pFjDy50wDk1DQW2XPYO5+6Z5wMORxKBq6dUhlS6X3Vh0QfQr0cMnIK2dWY8C8Yk
         NTZJX6hMbxjh9cCvLELGVSHnMFpHgfron4oE8i80/2XwjZIjlcjrZ+pNSBdbb9NTIKQy
         m9OZlV/njVX0uwuBwpd31tRimeISqtpRFYfZkMYaImjvG6V5znNneVSTU5+bO+Ng/nip
         Hu+A==
X-Gm-Message-State: AOJu0YzSMLmq1dQkOrHCCn7D1D/Lep2cBme7zEPSENvsW8DM3fkrlyFo
	cAhokzOcocxVmOPFHvoDFBddoQ==
X-Google-Smtp-Source: AGHT+IGOZDCUpnRmshRXuJd+BCoZLP1TmEBYrEpWggkhWIncaqJ0ANg7j92ptHTb94/+ad8Z6/PjhQ==
X-Received: by 2002:a05:600c:2203:b0:40b:5e4a:40c4 with SMTP id z3-20020a05600c220300b0040b5e4a40c4mr386750wml.228.1701445598750;
        Fri, 01 Dec 2023 07:46:38 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:201d:dd04:f9b4:3c83? ([2001:8b0:aba:5f3c:201d:dd04:f9b4:3c83])
        by smtp.gmail.com with ESMTPSA id m8-20020a05600c4f4800b0040b37f107c4sm5822150wmq.16.2023.12.01.07.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 07:46:38 -0800 (PST)
Message-ID: <cb47aaf76a922f02b814842f324c5caeee3bfc36.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] classes-global/insane: Skip sstate creation
 for do_image_qa
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joshua Watt <jpewhacker@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com
Date: Fri, 01 Dec 2023 15:46:37 +0000
In-Reply-To: <20231201151924.874316-1-JPEWhacker@gmail.com>
References: <20231201151924.874316-1-JPEWhacker@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 15:46:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191674

On Fri, 2023-12-01 at 08:19 -0700, Joshua Watt wrote:
> do_image_qa doens't produce any actual sstate output, so it should skip
> the sstate creation (similar to do_image_qa)
>=20
> [YOCTO #15289]
>=20
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/classes-global/insane.bbclass | 1 +
>  1 file changed, 1 insertion(+)

The fact it has run and exists is a marker in itself even if there is
no content (package_qa is similar) so I'm not convinced this patch is
right.

Cheers,

Richard

