Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 704EBCCD1BF
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 10:14:07 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.7873.1761646437227922495
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Oct 2025 03:13:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Sb7X8oMv;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4711b95226dso71875325e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 03:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761646435; x=1762251235; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+YbMCBUQb3B8Z9CeQcJgPhjiWjTmrvQt8uF1oL786wA=;
        b=Sb7X8oMvFbW/zPrNVdEUjc7OyXbAuuLKM8ypYvVABuj7kceXnPL7kXb3nzoLJ6yXhX
         iA1BjbJ0SDlgaldS57d0OkcIaUI2xQmpPqrXZkb0Ttv8XPS72KW4DpEtO16gO/12WfzB
         JqcRwJ763uQl8zP8QxOR7n3ciDSNMVPz6SubcTVnIMCQhvZWBgTfpObHZZhoPBjLj+hM
         Fu5kJxenYU/f2HmnOZM/n/PjEo0iukDe55/LqnptTfZHfCdNQBKB9qOCNcQdmI6SMsKK
         CDd4pYc3wdN2aK+rbWJnxGmq2vm+TJu0UFro6AyM3Wgs5v4IKm6bA9cBX57/N4eqUM4M
         ABYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761646435; x=1762251235;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+YbMCBUQb3B8Z9CeQcJgPhjiWjTmrvQt8uF1oL786wA=;
        b=JPBhXDTNG/ejj3A6IMeC+GgpkfFtW8RihzVqnH7J/beLwLVgFxVFLQR4RcpKnvuODV
         vF1UVRuNmddhWFg8gthCW7CEc56/VVVWlBpk9pw6CLjkTeeOnTvXG6rvnsC48CqXfFIo
         +/wsTVRJT5EFByS0aspRhq+SNcNPCFrtUhlck11xYB9e5NZJeH0akRD0fKL4rijk1iTa
         skuurVhejxnT0nrRQWWE9GK34oaSfrdNL2eItbwqie9zCFvsaLEAWOQamCNkSV3F7670
         7Cu9e2lBjqNvBzHal1aXFXzvFCmZSg9XHhhrAMWl80tcJCOnWZbK7D76wY3q6WGnQmgf
         aZaA==
X-Gm-Message-State: AOJu0Yw+MASkZPe/9jWBjl66DVfPuh3tf1dR9B/VE9IW1E/bBzfLOMmn
	rPcUAEaSaDyTcpOGgMqvLjvzwz7VWdRMp1P6rGJoDLxJhhROgESBtbUf6nUqgA==
X-Gm-Gg: ASbGnctytjJ11gZtI3fARr7J47Yqq4eZtwzzrDe/hj9M7m9/HjIbwgTkhmSHKEN/zOT
	h3BfcNtQg6S5ijne3TBojKPioMzXHfbntjL5nQi1cz0/kOi5/X3itZan317hmlaX9c8W3F4GdCB
	egPhlRcQBk9DqIiXrS9Q09Tcy/FnLZxMFhcPiySLv2vNvgD/3Okz+KVQt4TXUXsasSGdFX6lY3/
	m7ndGwQaoLlFyr0QBs7Ams51XSMsBYpMr1UXgb+BRnM+FsVaSZ4gUWh1J4ShpdoLu6cdamIUCHc
	YiqrEc5V1LmIqJ8jp5nZrONvF2XXAkI/8DaT6P1D3OQ0iQN2DQBgx/8upTU9a3jLNOb5Mw8bNnA
	0yNPOmLRRzzKKaZ6AAqo7e1n+RBccdygLr03nj+mN6xizhospasyTVRmkUMcMXL8rg+m0n9kFuo
	MUjWRYUXgG
X-Google-Smtp-Source: AGHT+IFW8vZ8lqUDMQ7JRhevVLlm3uUcsocbfasESJYJ3taqbPP03ecOGFT7AHWepDSTRiBOYBMoKQ==
X-Received: by 2002:a05:6000:2912:b0:427:376:2f81 with SMTP id ffacd0b85a97d-429a7e4ebc2mr2819448f8f.5.1761646435179;
        Tue, 28 Oct 2025 03:13:55 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952da645sm18667070f8f.30.2025.10.28.03.13.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 03:13:54 -0700 (PDT)
Message-ID: <2c0f4b40-7519-4ea1-9ff9-02a0e959d60c@gmail.com>
Date: Tue, 28 Oct 2025 11:13:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] core-image-weston: Add wayland as required
 feature.
To: openembedded-core@lists.openembedded.org
References: <20251027164236.2324092-1-contact@schnwalter.eu>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20251027164236.2324092-1-contact@schnwalter.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 10:14:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225385

On 10/27/25 17:42, Walter Werner SCHNEIDER via lists.openembedded.org wrote:
> Signed-off-by: Walter Werner SCHNEIDER <contact@schnwalter.eu>
> ---

Little bit offtopic, but is the patchtest job down? It supposed to catch
empty commit message. (And thinking of it, there hasn't been any mails
since a few weeks)

