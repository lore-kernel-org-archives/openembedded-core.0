Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78E77C61CE8
	for <webhook@archiver.kernel.org>; Mon,  9 Jun 2025 19:31:18 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.68697.1749497469954463312
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jun 2025 12:31:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hTWJKFK2;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ade76b8356cso51195866b.2
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 12:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749497468; x=1750102268; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JcvRxiruPhEMN8dURshsQxlfAkAbvzjbZDoicR8u1qE=;
        b=hTWJKFK27oOb0arEtS0sH9r2X5F5FKXauUeMqdP1q8yBrqfGrbZVsjgTPc5OF4PPl3
         CDuWzNiEAfLYNA1C8ra+1baCEmIJQg5IdkQAlS1+DAyarC4wsDIln53V5GmA/9Qq8G9C
         4cPPoFZlkweh5oIOu6ETlPdGbiZcyW5REdNMl92U9sk/BPpB4bLHJ14lfpmkyv8Uj6IQ
         /eQ7W8X0dt7M33idQcEE7z4afdx+Ozs/Tz++oIiVdCWu2t84TY4vLgjdbGABrm8z2YZd
         t+Yvr+I3GsWZbS3oi7HtUnFlEn+lLrxSvl4jcNBOKoIxQWkG7TL8TlUPAO/CZG9i2GcT
         JdPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749497468; x=1750102268;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JcvRxiruPhEMN8dURshsQxlfAkAbvzjbZDoicR8u1qE=;
        b=Z+wPnfrch8AhEn7/UJtgOwiylB2p+oGHKzb5LH/22jmX2uWN0IRs+FOgmOKKLcIKXi
         RJDmnZerKCVUsyMY3BzFifkTcxActdAvL6AAu6UOiLpQqJirTErkIK6aavlmInT6Zjl9
         5cqg09/bJPbU6poFgcjlLciHel5BGrTwQ8WfGgrITYs3cNg+0lacqtmRyfldwcU2H13a
         r6BHn+/NiSj9CKZwSDUq/IVysevZTGtzvfOCxmKvRbDCFzcXGLr6XnKh2W0v7sEWQjw7
         rFLwmzIRTK3eaL2lBDpUJixf28S9jSRcYN0TueLYJwjxcb09IxdFz7Sl8Yz5IKnsl/HN
         AjAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWqmj3+WMuS4nauqrJMayNAmOBUPy2TTiNlaraGscAgfgOcfEmXBNvRNMy9SV1tueU4I2LoLjL/83E0+1B7SjL5w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyKgu4M7HiwFlQzMK0GoEFQ2Z0BsmbWMvwgv6IsHJ9/+BqPWtCn
	lgC19XolmF37A+r3AXENXQ2Yua0RU9oqUGPecNMK8OiawECf37oKIHC0
X-Gm-Gg: ASbGncsqXwgyrk/lM+g2JXRC1gMY8qkxSa/+Q50mf5vni3IQAHa2VHKQ0FTl+3JYb29
	Q/iUxtQg4fB7ul77bfVUAv96SScA83sv9HLG2566AmlncmhnrIIuOBuMSo+1P53ZU0mOWhMQ5ww
	OmW8vZM/tzbNLDFCW77TM7KWYHA2jpj+pDGoqixD2VDvn+ZoK+tdGgjZ4/hhan5imTMFgyopdDp
	jlxcv4LCZeMkkHMbmNh0QOY+QJFu8LfEI4MlzAhq95dtKhbKoQdwM4PlPQ+rjHUET30orceirxX
	trq0HCQpDcI9MVSpoBSGecYP0dmc+DPbPJvWYE0KkJzQCdLPCtxDMdm/H+wRVu5ncKBGcQ==
X-Google-Smtp-Source: AGHT+IE087c3hcEGNeHatPBz9Q/Q2dcgF6hqoY0CaDgbJ4JFmbdtEGDYOwZHaPCYCZ9KK8Lod0avwQ==
X-Received: by 2002:a17:906:9f87:b0:ad8:a512:a9ea with SMTP id a640c23a62f3a-ade1a8d9ab4mr1193324166b.8.1749497468027;
        Mon, 09 Jun 2025 12:31:08 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc38d0bsm591073466b.120.2025.06.09.12.31.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 12:31:07 -0700 (PDT)
Message-ID: <523f3550-8e8c-4132-875f-debc4b253cb4@gmail.com>
Date: Mon, 9 Jun 2025 21:31:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [walnascar][PATCH] systemd.bbclass: generate preset for
 templates
To: mns@gomspace.com, openembedded-core@lists.openembedded.org
References: <20250604110022.210041-1-mns@gomspace.com>
 <17159.1749496239400929759@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <17159.1749496239400929759@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 19:31:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218304

On 6/9/25 21:10, Martin Siegumfeldt via lists.openembedded.org wrote:
> Friendly ping
>
It seems that your patch has been added[1] to the walnascar-nut branch
(which is a staging branch for Walnascar). It has however most probably
missed the merge window for version 5.2.1 by a couple of days. The next
Walnascar release, 5.2.2 is expected to be released mid-July.

[1]:
https://git.openembedded.org/openembedded-core-contrib/commit/meta/classes-recipe/systemd.bbclass?h=stable/walnascar-nut&id=ea207dce1f5f8579d8ddde487ac9852f50bfc792


