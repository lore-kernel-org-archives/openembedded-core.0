Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB25CC7115A
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 19:29:57 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.4636.1750274997161448862
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jun 2025 12:29:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PGiLBAaH;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6071ac9dc3eso12754461a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 12:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750274995; x=1750879795; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PUESr8cbuMnXd11IRcqeMe/zbH0icUt+/+5NtAnxLlg=;
        b=PGiLBAaHFia4E/37oDRfFqvxKUx91DIwkfaAkPuBFY2fOoUi3GgzK9yMVk8oG3swIT
         +hVzVO+s71CfQ4ZoQ+h7uTqwDITnXhZe3vLlMpRWzbNwKaR3mRxYICkiV6MlQYQ/VJHA
         yMHkkpmnzzNdJH9IlPqxhQnNK9qNp9zognSJGChbtQFts1mc1p8f21AlL5+yqpD6efC7
         x906h9WR8ACftsGLohfEo25NOAffCF/QigY6TNKHasbXHlOuR2MB1zBsFvpr/YGXi537
         1h2a5SD6HyuHH+uXvvgivhFIz7Hj22TZIf0S5wm8epkv4jZPScv1u7sEUI8+xg6daeIe
         t4LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750274995; x=1750879795;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PUESr8cbuMnXd11IRcqeMe/zbH0icUt+/+5NtAnxLlg=;
        b=wDH8L/jCBzLVI50wbRPjP8nuOqRQNSUJBYll40HEfW/pOnGWTAH6ADp3kbbW5Nu16E
         w42/UJTOwsfW0jlFEvfcGLXKRVEqXTOKEmb5OjlGWn15quQSEp9R7luO8EAMDoq6weX6
         enSfg1R24wwr9juYiqnIifdd92ZmCb48c8ix1oXMLjUltyq97cB2fRw5J0XWRZh2cVdy
         /fQ2gvQ83yS2eq+Vw9P2Q1yVGhyDGWdpcgvGAn4Oe8rb8bfsejTII4hY5Kc6PbBG+xF8
         6f437nERmUfDYDI2du6dsjfVkUkF0MdCQxtOCQYpulo8JebQSpLGAEGaSs7u+qRL2Mdi
         rPoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvYEVIa3lyY2gNV7ryL7YXvDixitQnr3tZmT9Y5rAYXv2aPKg90M65TtBLbydG2fT/TOvnvb+sX1G2jvOEPeBptQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz6q5TslHNq+PqwBUqCtEQBywMfzgaGiC3EqhWMaaRpPisvQ02D
	Q3D1VHDEgcKsfAn9UQVQCz3GM5dy3bi8Z3qxUuWGwvq56DtoHtDs+Q2X
X-Gm-Gg: ASbGnctEohh0ZQbyANeqnjlb/LHNZ8w3nDY/ap7BJ03dj3WiEgMKp8zbSiWwOz4KQvo
	Lt0v461h3rab41nD6jOfkMyxqX7OhdRwRT4jZVKgBSXXKEANSPc49fmkIZ7nAjxRj9IY4cRl7qm
	KaKKXsxrllqkCsnZgEH4LrKXazcej5//m1I/1WHkIFQvNMkCs7hGDw4tsHpusxnRUnYt79zdWsL
	1PfAnBdn+IjzvS3dKGwhjIfuMh+vEjNWXBOVGhDe17UFPaPbvCKfUi/ISLL/X8ddShDiQzzwYGq
	Ojacd7n5mvQZnkAhbYboWFHycdpCl15NZkzKMoNx241uFppQ9YdHlNamrPpJMo2cXqwQ0Q==
X-Google-Smtp-Source: AGHT+IF/CATg3NIJyN6FalKTMKjnea4DbfrZ24rOvDhIjs1aUb2cJbMSegGDWSqnLFfdIUfeg8DduQ==
X-Received: by 2002:a05:6402:440a:b0:607:206f:a25 with SMTP id 4fb4d7f45d1cf-608d086430cmr16399213a12.9.1750274995186;
        Wed, 18 Jun 2025 12:29:55 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4901858sm10006513a12.36.2025.06.18.12.29.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 12:29:54 -0700 (PDT)
Message-ID: <b13dfcb3-db22-40ad-a07f-139df14fe0e9@gmail.com>
Date: Wed, 18 Jun 2025 21:29:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 0/7] ISA based RISC-V tune implementation
To: mark.hatle@kernel.crashing.org, openembedded-core@lists.openembedded.org
References: <1750203584-32065-1-git-send-email-mark.hatle@kernel.crashing.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <1750203584-32065-1-git-send-email-mark.hatle@kernel.crashing.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 19:29:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219035

On 6/18/25 01:39, Mark Hatle via lists.openembedded.org wrote:
> v2:
>
> - Note: the linux-yocto change still needs further rework (noted in commit)
>   (if everything else is merged, it will still work fine)
>
> - Change the TUNE_FEATURES check to kernel.bbclass per review comments
>
> - Add 7/7 patch for RUST configuration.
>

Just to update my previous note: I managed to build my image on
qemuriscv64 with this series, and it ran fine when I booted into it and
executed my application.

