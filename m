Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41EEBC83038
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 19:13:19 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.4673.1751483592428578837
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jul 2025 12:13:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nO9fJ3oN;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ae3cd8fdd77so135086366b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 12:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751483591; x=1752088391; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LU5604aoxYHwl8qk1eAKW52aYGE4S+lpO2PJ2XlNa+Y=;
        b=nO9fJ3oN7bU4FvjI1XXXgndBQmGhWfEjzc+U8JrDNJD6qrJrMjQsDU7ewL2zoX67WF
         m/bI4KbjbOX7+GrtWqewA8A99aO1Nj7yUvqBYR5dF87WzPPyVbImWoqCqRueJ+ficNgW
         pr0W0HjbbL46oFpo+vioFPvYD6IRKs6dgfTqQGm9SYcTEhzUdSD/4QSEFJYjFSOWCW75
         fkfKAM1cSYhdAe1xdfB2kCmsxeoLOJ2W0LNFl/WhofQROboiid1vtCJxShdnVKkZqigh
         28b1MgTZiTNAn/NJtUsKfsVxbCXydxbhqJWtUKc4GhVWXcH/FlP6B88AXgvyEVr4VvVv
         csIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751483591; x=1752088391;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LU5604aoxYHwl8qk1eAKW52aYGE4S+lpO2PJ2XlNa+Y=;
        b=T4Jnryr452RqAbC+emipjGfefjDQnJ25SogiOLqMie4oNMtjxi4/jsSIRBFV5/8dez
         SHVVPSZi+l5fVj07m7kZslPBj/K02lqyJ4/lFfw08tDgo/9JrZI1W8jSvESZH74WC/O2
         3rz/EcB2n9kJx23z7bgmW11WaOd89TcqLXvPJ5kDlBy7Vsvo6F/q1NL28yHyMfkbcKIL
         /AYx2oAkXSMTETqozwbnZSAM5+V0cIaArVVYqinEYJyistv6TJv8CblNgjSFsVMsJjWx
         PsC2yBXomizmCLLE36iEG2t394brl52HjDGs6SGVjACDjdhd6eDGwDT7s40fj//pYjS0
         oxMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUztmQ/PxwkcwkH3wuweNDWVScGKnqPwYtGIvCH96gBwiYKyfQnheCUUUSfwHcwNUX4dh/fci6NnT5N24VYR/Anxw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwK6rfjHL+rNcfh2dHPgq8j1uZ+vzo1OXdMhF24lRVKDhbuPBKi
	l1ndJ/C1Ub2+qS+4IUiqO98e+Gkqu/Pj3gIAhecVzaeT6Iguzp9Ont93
X-Gm-Gg: ASbGnct+W9qgGu83q1bDIvjWA+cij9DBwb4b0DptlX7FggrZel31P3EYRpFh/Nqf8G/
	d8+rkRAlOCcBqUTU9HP6lFCNLHOmya3Pspiuk7vnmRq50D24R9L7L1G3cRnBItwASi80xxb+53c
	7VsM6ShzPRNiQkpgNXothuoRajTIYmL9LUAMrY4d9Br5Ne0a7Fx8pC1QtNMoR2S/qQDbT/b3UXn
	wRfXAV/mCkTkq6F2bnQEcRugGI72Vf6mfjHT7+n42dhdiA5rd31sEGWSwezJBmwBP/O0EuUhLeu
	t+WEFbgTrjwcC/TKEY8dt6sIa6BaZwhkgXYVB0Q2qpgXpZPFVTd0HMlVSnGPsN1OfSK7MQ==
X-Google-Smtp-Source: AGHT+IE1WF8n4uYLHC+y9bpwLrvIrOrM3cGrnGZboG+pcSwQn9pyoZL8bk6A1kaz+s5kG1t0cV7zqA==
X-Received: by 2002:a17:907:60d4:b0:ae1:1a30:6682 with SMTP id a640c23a62f3a-ae3c2ae34d7mr441251066b.18.1751483590177;
        Wed, 02 Jul 2025 12:13:10 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c01996sm1127733966b.76.2025.07.02.12.13.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 12:13:09 -0700 (PDT)
Message-ID: <6cacbb1b-08f7-4566-a04b-25578f91c3d3@gmail.com>
Date: Wed, 2 Jul 2025 21:13:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe-core][scarthgap][PATCH 6/6] xwayland: fix CVE-2025-49180
To: archana.polampalli@windriver.com, openembedded-core@lists.openembedded.org
References: <20250702154619.3765505-1-archana.polampalli@windriver.com>
 <20250702154619.3765505-6-archana.polampalli@windriver.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250702154619.3765505-6-archana.polampalli@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 19:13:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219852

On 7/2/25 17:46, Polampalli, Archana via lists.openembedded.org wrote:
> +
> +Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/3c3a4b767b16174d3213055947ea7f4f88e10ec6]
> +

I believe this commit is also part of the fix of this cve:
https://gitlab.freedesktop.org/xorg/xserver/-/commit/0235121c6a7a6eb247e2addb3b41ed6ef566853d
(unless I'm mistaken)

