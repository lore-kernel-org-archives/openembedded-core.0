Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03056C7115D
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 08:14:36 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.2846.1750407271875600329
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jun 2025 01:14:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iuzLd1gt;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ad88d77314bso310258066b.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Jun 2025 01:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750407270; x=1751012070; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/1rq/JxsHvOKrvOSp8yP+/rwn4SNhmxp6aGDcoUX7bg=;
        b=iuzLd1gtQPnNwMpJB61u5VFDVdgnVj4f2aeHdFnwxby2shSexY6Edaq6k5mIlkYIW5
         HOl2RzUC6Z75tw3RczVjcmyPvfU9YBn1AObaIfUhMsuQ/qtPQ9gWByFEZJjaubtRzeT/
         fgKvaYiQl0i2XmZUhb5qw7pdEU8CZgPPmdRZeBOV4f2topoz9iwoJbvnJXu0Knvi40/h
         NR4zJy4PrDbgXhqcnFRlcW5yfsO2I2Y/s26OKWYHwOURmydNnIQcUT2QV3nUoh4kzXlL
         vCpXplkk6qpppRrDnc9nJCcFjOqlySB6cslXmnguVqnuKR0JLHKHhEFqjhKdHpVnHgAi
         e5Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750407270; x=1751012070;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/1rq/JxsHvOKrvOSp8yP+/rwn4SNhmxp6aGDcoUX7bg=;
        b=g04sLqeq4GXt/kkafjpt2SjY8n1eGXqvK+qL6UW9Agc+UaAF0avabl9krefuAK6Pi2
         GCdUwTzFx79zEp6Yu4Dtz1vmkPl/ltKmsniXKaAoBqbmiL4tss+6DPHH7NyfPFmBRiYj
         /8HLjLTOs543FiKCSVt/BRg0E+M71nFXy0qxS4kKekm8fY8WxpIp7tNblDoAr1sMn0/Y
         LoqTj+57gfZ83E03PgAubzg1EZcx1yuR947GWFckBd13Jam8Mk16s2Qzh6wjbn28btgJ
         KAV2snRUCoi/FucLYB7m2WUpBZXDWz7sBVcmfGaR3Ecs3bAMfvRAgTHjXYth2M09cDvL
         2kIw==
X-Forwarded-Encrypted: i=1; AJvYcCVPw8dFl6XP+FAFNeLKUPxXfHENFv0nE1B7BrUTrc+Eh6pIE/KEraJ66nVxZP649vVhg4ye7LbgPA/2oeOawqB4uw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxOgPh+pk9fyA84ekA6fRabuvnxSQa1s2A0pAwC2jAztmwPmk7G
	GLFEks9zlkHdWJmgsPNe3+LAEbfrWG3yhYfgIBXHWLPB1ePhck/WNjtM
X-Gm-Gg: ASbGncuq6Xfw7nNS9XCRtu5KKHp9BGAeLn6vEarfmUTLjbHvsgyhxCL0BZ8djV5UKJN
	UGlywuXiX6O/6GGW5S3ozhOxNOBa4jDVa01zYLt4Wh2ij+RNbvicog+KQ+9Voyqj3rYjzbKbVvC
	A7tOOX1yYnn5j5SYYny5DpeHpRSKwCFEJqz1uCaYMd4RDXHn0zoGzq3npU1Y/alemZZf7xamkgy
	aLIiW+6DQJ6+hLy6mFfI6ZaSe2dRPHIw9ybGk2tZdxvsXiJaCn3XmeKZEpIXEvcIVESD7qUXXBe
	kIYdrzouElGAvF2FXNC0IcolzY1bPIzlwEPEJiij5CAtnHRelZisuE2vD5v+DqdVJwASMLtjpmW
	A3Lf7
X-Google-Smtp-Source: AGHT+IFoCNxW0bVK8FtrGbUq7geuaHjG0QK/nNpuV5R4zl+8IxxEdpHh0oIFOOGwsMZ2DLZ7Jj5dHQ==
X-Received: by 2002:a17:906:f593:b0:aca:c507:a4e8 with SMTP id a640c23a62f3a-ae0579c4416mr158751566b.21.1750407269800;
        Fri, 20 Jun 2025 01:14:29 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053edc0c8sm123993366b.64.2025.06.20.01.14.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jun 2025 01:14:29 -0700 (PDT)
Message-ID: <81ea6232-76be-4629-8a0c-5e409710b551@gmail.com>
Date: Fri, 20 Jun 2025 10:14:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] cmake: Ensure find_package() uses deterministic
 search order by default
To: Moritz.Haase@bmw.de, openembedded-core@lists.openembedded.org
References: <20250620075818.3320026-1-Moritz.Haase@bmw.de>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250620075818.3320026-1-Moritz.Haase@bmw.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jun 2025 08:14:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219111

On 6/20/25 09:58, Moritz Haase via lists.openembedded.org wrote:
> This commit backports a corresponding fix from upstream, which was accepted for
> CMake 4.2 (see [0]). Documentation changes have been dropped, as have been
> changes to tests that do not exist on CMake 3.31.6.
>
> Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
>
[0] seems to be missing from the message.

