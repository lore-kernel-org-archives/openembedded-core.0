Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FC60C369A0
	for <webhook@archiver.kernel.org>; Thu,  3 Apr 2025 11:19:51 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.10908.1743679181595480591
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Apr 2025 04:19:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Iaq+hEdF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cfecdd8b2so5519915e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Apr 2025 04:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743679180; x=1744283980; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QfT3oASeRLTjlSgU+jYEgZ/qnwka1OaIPCN8pXxzwZ4=;
        b=Iaq+hEdFgCljsODy45KD8Ykb8m3L3tQlfSpLBHziip41gKys1/d6obgoYwAfMerHAk
         y7ae/HhY9I61naHKsXSbWDou0gBpIUpF5Ic0e3Te3DUBz+qUaBCycAA0BaeV1lLEHYv0
         04pE4vbUFAnB1xYdwVvuZT9nqNNixMR9tu0FU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743679180; x=1744283980;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QfT3oASeRLTjlSgU+jYEgZ/qnwka1OaIPCN8pXxzwZ4=;
        b=fbTgWmmAaYfA6jGhpKIjO0gSIMDIBJVCe1zP3q5msCYvL6qStHWfWlDzr5wmssJflP
         Q7/0wpdfaddrDklyn+StnumDce1EjndQCMnycxNfCePugNPSwGmKdsbYTGPaVsk4iVWG
         aJBSYMED/iP4TGcwyV/Zh8KPz1BT7KSwJyxL2VH9GRhQZYj1MSGmokU8FNO2Hh0u14eo
         hB4KIARcpYm9CF/8wc/KeFQ7/Z+zYH9NBHN5JFAljXVAAgHRUmZVsBqCl6DZX7MiB8Pg
         BvUJZp0eKnybbCqgwjAga/JUTtjf0yM7DxkA2+bntRqsNN2hsu9S+0vrhZkU7e68L7uY
         1oqw==
X-Forwarded-Encrypted: i=1; AJvYcCXlqROANUqcDNZrTiKHujKZQDhiqxyOsdvS8F46MkoGBtXynXpnsFrPBwfTra5OorBbLn09aKI5MNGGLzxYFolW/g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzTLz1UeqFO4ztXrfuCG0Hp9WUVnw1P6Wfm6O7Et44/FQh9+MyW
	AKkEO7O/idqm1eC/NbXl/dvw4/LzmV0pZZRUvhK0uCnfMw7/grynAkmJTm9/9lo=
X-Gm-Gg: ASbGncuSFxUI2Zwcz6NhfVaeszeYHGNls6yPMqjEMx4fbTiQm6vtfW8fzYAet60sT1J
	MD/uJD5Olwp+aSuK3XlF6pQDSKBowmfUFFqQgi2ogFxQcuh8ZNxG6awNY78/Kd0eCH4HLfCjACv
	e8oIB0OvXL+FOO35VY9fEHO4zRkumU6LX3e0JdT8C3oXSJfre5MaN+Hf+g9aeA/7RAUpJtwm5Nr
	OxJlLbqJyXSiGMv0TGszql4vK9cUqUzSIq+7EyXhqfbgGS1LuwUeLlqLLfqKVVVH9oHJSqk7xa9
	nEs4oOnwO5ucrRBlYdbIiko1EJadVyMu23ujREv6TxpI4HgeAR+fovjVFCTEtheGcvtGfLTA0dT
	16aYpqnKRAavCAFtKdDN3wD2eNQZNoL0ALA==
X-Google-Smtp-Source: AGHT+IHDfUSz1d13X8IOmwlHIUeT1Z7IWVsSDCY/17B2tgLmfHC8s6F5ephsIQ0UH/LIwSRoar0EgA==
X-Received: by 2002:a05:6000:270d:b0:39c:1257:cd40 with SMTP id ffacd0b85a97d-39c1257d4e5mr11886229f8f.58.1743679179914;
        Thu, 03 Apr 2025 04:19:39 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:4b5f:9de5:8de7:7270? ([2001:8b0:aba:5f3c:4b5f:9de5:8de7:7270])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301b69c4sm1519779f8f.43.2025.04.03.04.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 04:19:39 -0700 (PDT)
Message-ID: <a299f47c16bcac1624099c99d29e84bc13e01d69.camel@linuxfoundation.org>
Subject: Re: [OE-core] [scarthgap] multilib_header class: issue with custom
 multilib setup
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joao Marcos Costa <joaomarcos.costa@bootlin.com>, 
	openembedded-core@lists.openembedded.org
Cc: Thomas Perrot <thomas.perrot@bootlin.com>, Khem Raj
 <raj.khem@gmail.com>,  Alexandre Belloni <alexandre.belloni@bootlin.com>
Date: Thu, 03 Apr 2025 12:19:36 +0100
In-Reply-To: <21e0daef-2b05-4c33-afb8-3a45ebd97fbf@bootlin.com>
References: <5746f47c-7e5d-46f5-b089-c613b7275d2b@bootlin.com>
	 <6c36d9830745cb739f1dcb968d74a43395117fa1.camel@linuxfoundation.org>
	 <21e0daef-2b05-4c33-afb8-3a45ebd97fbf@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Apr 2025 11:19:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214319

On Thu, 2025-04-03 at 13:06 +0200, Joao Marcos Costa wrote:
>=20
> Thanks for your reply.
>=20
> Even with the cfi suffix set correctly, the actual file raising the=20
> conflict is the generated template, no the header with the suffix:
>=20
> file /usr/include/gnu/lib-names-lp64d.h conflicts between attempted=20
> installs of libcfi-libc6-dev-2.37-r0.riscv64cfi and=20
> libc6-dev-2.37-r0.riscv64
>=20
> In my previous mail, I should have pasted this one instead. My bad.

I tried to explain how it should work but I can't do much beyond that.
The two generated template files should be identical.

Can you share the contents of the two header files so we can see what
the conflict is?

Cheers,

Richard

