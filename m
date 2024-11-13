Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 647BAD41C3D
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 12:49:51 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.10984.1731502184905733327
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Nov 2024 04:49:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Z013VTDY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43159c9f617so55267155e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 04:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1731502183; x=1732106983; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WwrDb2/4iOINfcooHVkJuqnKuissUFGCKaCwgAYAphA=;
        b=Z013VTDYubiCrc52p18UNca+fvcZhLdDg1XwnlIIahW2gvcRi2Y4RZhDiBjCngI4XC
         3YE5vNJErHZgPLwd02odkss6AOfYXQjgoPoiBe0JhRwfNLrsdiM4DLUCSo9+2Na4QQ9b
         O2ACvnuxjjlvkJ2EjCDVqlqZJNh8cAwZOdv7Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731502183; x=1732106983;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WwrDb2/4iOINfcooHVkJuqnKuissUFGCKaCwgAYAphA=;
        b=AFFJ6LWBuXq1LMDuTYM8Wz5SaGbQ4EzXqIlV6y1CWiApDVhL0XqtJXbOwvjHYkBFrZ
         TcCSx0O472p1GMgIUdZOqL3J/e38H/iZxE51tQLWSghGkfBIYj29UWeUxCBmLenjvTxn
         dvDHpKQSh78kezo9BFZzL0icstDhyK6cUpxoLl0VH0n4K36K2JNFBwZ6Jl8n7DHasCwZ
         kPYfpYGKZKh1yyDVpqBr/DbD1hRUdvXrdGaGY+9qxm/sXGnamwh1sFQ4CZvpZIMCKTXa
         FrkFvL7i9vgR6FVhf7TxC/xMr3dunUdlLuEKj2XJjyjAk9os6GjnfcJelNP5alIfZQsi
         DF/A==
X-Forwarded-Encrypted: i=1; AJvYcCVoEMG98IoogDqU8GfveTUozFwIsvlgZmA1sqYMXiFgKi5Bmq7HZCznXw68IMJoAsymDIqn/kvWTIPrfSZYdFEWrQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwNZjbq6DYa9/DdGds3kgYiWQ6QyCJt5C4YA7wsoJ+GutD4KqMr
	ALx/VN2A9EMuEA4WmdG12mm6vyzf9PmwzuV8SLbTTuxgS4gncsfQLOQy1Vj+h2g=
X-Google-Smtp-Source: AGHT+IG0yyxcGMzrMawjYN/DXRl7nKGh0xp0ninpInvFqeaRGZdTLgeUFdvjiZsZnXv78O7lDdmTkA==
X-Received: by 2002:a05:6000:1541:b0:37d:5141:ee91 with SMTP id ffacd0b85a97d-381f186b3ebmr16744638f8f.18.1731502183313;
        Wed, 13 Nov 2024 04:49:43 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:ab73:49b3:d413:b355? ([2001:8b0:aba:5f3c:ab73:49b3:d413:b355])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432d4788c2asm20249075e9.0.2024.11.13.04.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 04:49:42 -0800 (PST)
Message-ID: <d2d018af97eb31eccef77e18c991cc4e689e4549.camel@linuxfoundation.org>
Subject: Re: [OE-core] PREMIRRORS ordering seem wrong?
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joakim.Tjernlund@infinera.com,
 "openembedded-core@lists.openembedded.org"	
 <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Nov 2024 12:49:41 +0000
In-Reply-To: <5e358010917ca8fd59bd2d31bdcc12adac6ed478.camel@infinera.com>
References: <5e358010917ca8fd59bd2d31bdcc12adac6ed478.camel@infinera.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 12:49:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207097

On Wed, 2024-11-13 at 10:30 +0000, Joakim Tjernlund via
lists.openembedded.org wrote:
> I have set:
> INHERIT +=3D "own-mirrors"
> PREMIRRORS:prepend =3D "my git pre mirror expr."
>=20
> looking at:
> =C2=A0bitbake -e my-image | grep PREMIRRORS=3D
> I see that "my git pre mirror expr." is last in PREMIRRORS variable,
> that seems wrong?
>=20
> To me "my git pre mirror expr." should be before the entries added by
> own-mirrors

INHERIT in conf files is deferred and not immediately processed.

Cheers,

Richard

