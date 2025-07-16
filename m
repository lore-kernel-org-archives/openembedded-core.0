Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C68ADC87FC9
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 12:19:31 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.18899.1752662265126311813
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jul 2025 03:37:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=PpMVbPLe;
 spf=pass (domain: linaro.org, ip: 209.85.221.41, mailfrom: krzysztof.kozlowski@linaro.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3b60565d5f4so302402f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 03:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752662263; x=1753267063; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6XnqCTUVDxXqLw605VpQiOmmAr4VEm5DLMnQo1CAZWc=;
        b=PpMVbPLedXSlhJ0wrI8cMndBoAj3HlmRgPuldb9z6IFSbS2mgcC2zZOc/nawR+7Xw8
         /Y3LmjUgNVOJS1DYFnXfzMafEPkxaJP5x0+Yv3d4mr2HjoxEXPD+PMYK6On8sNLIqJNa
         jZyAGZzi0kNV5nx0K361za2xUTPujXUTc0bTycp/yeYjx13+YbTj7Rzrj3Tpv0qGJ8Sb
         bi3rjGogVguvmPbe41njtFhSitz2NOicTxa4Nuhhhcpvh3/TDWIyUhxshx/SpR6ILgXu
         +sok7ZcsrH9EzZqsr01cK7N+PfuTXV4HiGWuoE9mNYtKWW8K3nOenJUNbwWlD5aZmntl
         N7UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752662263; x=1753267063;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6XnqCTUVDxXqLw605VpQiOmmAr4VEm5DLMnQo1CAZWc=;
        b=cZm/aaAoeVVrCfW82JAkZEW1Gi6p4GPxensYqmbCsdaWar3OIujHVVsUNYI+K7fwPa
         HGYPh4lVLBe4HE5ceZ6NQUnzrUmHf3kdAZx0BQ6CL7GiFay86Cchhd/6ulf7MBgXI40N
         tKAmZsbVJJihRreEC6HGSRGKEYMujMwtM8atr0HgZ11lS0qg6nWd4VVgEN9y0WPolQX+
         f5Fle/gmhvwdbAtr1nfwyy4A7WgRmCGQX6UYenyVEEjpMxKXCQf9ocWVVwGkHGM8bZFc
         IxohizTrfVFdhj7JNyZ7c7s7pUNfSNIcerc/pLZg/xn2zRW9wjsUf83QqWI6f417TV0R
         P+hw==
X-Forwarded-Encrypted: i=1; AJvYcCV7YMpuVSqo/c5SzBhhta2X687A2KhIVavmaKxlBIUwEhZluCzVvujJ8JGDUvlruGaisNsjn2WxNL9g7RCeDr/sIQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzuaa3OhFleVhiIoVkf4Etl/ldHrW5KJqYbZwtPG7tk1tGtqEtL
	1JmwPRp73VF5OSyUrkmozrwo8ak4/EFwGsLMzJOnKwqrhtRJsXN3xxmamHnidRDqo9220sW+Z4b
	hl9z0
X-Gm-Gg: ASbGncsWZs1k45lUsmYrtG9qEWnynWtdvDN2jc103XvmQihHzxaXozW6cA61yQC8lRh
	dgVVKRfDdn66LLjN2+iWRjZIiunKsaQn48Wtk30H9DlD+rN+jDMYGMkR1wyXapuGJEWSCLQLkHf
	VGdSTlsSRUHyMtWSWw0FjaOMC6F3g8cP3uWMdVjy1UYdhV6H1KJuvC4kOLmPGxoh0fXji1s5qEb
	wc50MxGKAg0GepM46U1rj5aaO7f/hJXDAqWPo5mg/LERtf/Pxs8Brqfn35JpTwJFe8+Um65nCt+
	xlyKGqkC3Si/IB2+Ntr2sWG0buWIBDXNZ1htd3uVZZx5EMbC3dac02BoqC3/V9ye2oWSIbkxRw0
	ArUZOGRsus9IHbTGFGp9xOjlsfdfD+S5xkiF/4q0nyg==
X-Google-Smtp-Source: AGHT+IEWEOxnRmsY7CW6qzxqOxUEAfhDQBThVtGYsxYdHnrMvbBgNTYPuxWQrQr9DcPA8NVplhCfqg==
X-Received: by 2002:a05:6000:40dc:b0:3a5:3369:52f3 with SMTP id ffacd0b85a97d-3b60dd4a834mr810416f8f.3.1752661822704;
        Wed, 16 Jul 2025 03:30:22 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8bd15bfsm17790152f8f.19.2025.07.16.03.30.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jul 2025 03:30:22 -0700 (PDT)
Message-ID: <8698f842-a464-47b8-8c47-97cda016e227@linaro.org>
Date: Wed, 16 Jul 2025 12:30:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.12 2/2] arm64: defconfig: enable Maxim TCPCI driver
To: Macpaul Lin <macpaul.lin@mediatek.com>,
 openembedded-core@lists.openembedded.org, patches@lists.linux.dev,
 stable@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sasha Levin <sashal@kernel.org>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>,
 MediaTek Chromebook Upstream
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Conor Dooley <conor.dooley@microchip.com>, Arnd Bergmann <arnd@arndb.de>
References: <20250716102854.4012956-1-macpaul.lin@mediatek.com>
 <20250716102854.4012956-2-macpaul.lin@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250716102854.4012956-2-macpaul.lin@mediatek.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 12:19:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221062

On 16/07/2025 12:28, Macpaul Lin wrote:
> From: André Draszik <andre.draszik@linaro.org>
> 
> [ Upstream commit d2ca319822e071423ab883bc8493053320b8e52c ]
> 
> Enable the Maxim max33359 as this is used by the gs101-oriole (Google
> Pixel 6) board.
> 
> Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> Link: https://lore.kernel.org/r/20241203-gs101-phy-lanes-orientation-dts-v2-1-1412783a6b01@linaro.org
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Link: https://lore.kernel.org/r/20241231131742.134329-1-krzysztof.kozlowski@linaro.org
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>

No, that's not a fix.

Best regards,
Krzysztof

