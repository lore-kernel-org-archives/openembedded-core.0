Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22A18C369D9
	for <webhook@archiver.kernel.org>; Wed, 30 Apr 2025 13:23:51 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web10.16903.1746019424938559369
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Apr 2025 06:23:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=BzugekCC;
 spf=pass (domain: baylibre.com, ip: 209.85.219.45, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6f0cfbe2042so13296566d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 06:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746019424; x=1746624224; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oDl9hjX3OCUzwJb0emYFSP3PYB2gJBix5f7+wtmacTY=;
        b=BzugekCCTMjhhDb0t2ZfGMsmw+8Q6G0AQLCvjxnmngxU/V3KBhF5oH4hxLcnZUfMw4
         Aky9sm51FlDsCLRoV2nihtjsYd1flBVZyExZuzdZqW+OyRPLt2OAgVprsf46qniIHnWQ
         8Fps9BIKX5rcfo6MazhT22fy7yliIxgRJA3PI3Ga4db1RwN4PQv4AvpLpG9R5Y53ngdG
         cgchZMnF/JUaFTA4rafAkRgxWV0ha5JSTy6WaNKduoQWSgcDLE41m2/iuNY38cGx7kI8
         xSpX7yMZwzc+A0RG3BDQAKCjw1j0sMafeNZIWqlKYRf2nxuOQcu2AttXVC0vN7VVqJuJ
         2Hug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746019424; x=1746624224;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oDl9hjX3OCUzwJb0emYFSP3PYB2gJBix5f7+wtmacTY=;
        b=qCVSH+3LamJz1shwbV9IE+NgzFOyeMC7xSAUCoTnxTaE95vHlWnKvkqaMLJdTwXdeg
         eZH0Qgoq3pUY4vhaXBPQvJfRy9RapqpBgtCf+uqwcEL7ec4612gdeQVZAYEpuglShcW7
         kGPY1FmrnkpdV/ByTdy2fCDr7XF7Cm4kPRcRto9mCHHJsa4mJUF3+bdeSTz6QeqhQHkB
         qpIuBtp6ToQTSNvnyhnZC3cc0vfmhjU9ZaKsIlKDJzN+ZC4rHJyimehbcuQqHJOm2dWI
         FYtxEd7U971LfxaoSniOYXMBM7Bingk6UPEW0V+JzpsmozsvV1zdO/tOp7wOSsTzCh9t
         mBgw==
X-Gm-Message-State: AOJu0YwAAXbdufxzM3huB8Y5oFZYOjXM+zdJC7oQa4KwgyJwWtAfxgo5
	UewETQpNSte7q101h8MY2OIXHcqlOHdPeCupLlHwSVs88+NHfWKotmFFqDB/9o8=
X-Gm-Gg: ASbGncv0tjJ26wtdlX+3L45wypIBtYlKXku1FBNZy6sQNWQ2w+Peyta3beEl+JJKqti
	pk8JcD4jqdj/2dFgiGyX+oC8vS/S8mL954sPGTU/OorFTYSOlszHJlCPe3aqVz8B+ggJOrTjFyL
	U2192H5UMhYZwh4hbpb1/Chsooh72puhC3kJNjCsvjWpN1ge6L78XWRcXOPX5NQXLwRdOpYNKVX
	56cAeet0Z6MDU/bvS29kcyuCwieNpDjiWVgXRJp9gnDnNNTG+d51Z60TLT66jHZvGxh/XWQmSGq
	/qtLL4W6+mCkrQmc520oUi8Q6+FAoxlbL09AFSi42udpiS/4vxTf/mEmwRt25uAzOC30vvthgvL
	Ra07CAyul
X-Google-Smtp-Source: AGHT+IGx/NJFPP4jftv3dgxNnawBXHVNikL3DTFIQYTM5CYYMM+xX3OjRf2JNaYRTW6PfWhI0/nLPQ==
X-Received: by 2002:a05:6214:1308:b0:6ea:c5be:f21b with SMTP id 6a1803df08f44-6f4fdcb4025mr42320336d6.13.1746019423843;
        Wed, 30 Apr 2025 06:23:43 -0700 (PDT)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47ea1d8cf1bsm91821491cf.78.2025.04.30.06.23.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 06:23:43 -0700 (PDT)
Message-ID: <429d7b7c-9205-4ca1-a7f3-d8399eba9551@baylibre.com>
Date: Wed, 30 Apr 2025 09:23:41 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH 2/2 v5] python3-numpy: fix ptests
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Ross.Burton@arm.com
References: <20250429183801.1125000-1-tgamblin@baylibre.com>
 <20250429183801.1125000-3-tgamblin@baylibre.com>
 <CANNYZj8N0LnX131spYUn2Z+HoXTZck_ZpgvsftTmtHjeMakJcA@mail.gmail.com>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <CANNYZj8N0LnX131spYUn2Z+HoXTZck_ZpgvsftTmtHjeMakJcA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 13:23:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215748


On 2025-04-30 05:57, Alexander Kanavin wrote:
> On Tue, 29 Apr 2025 at 20:38, Trevor Gamblin via
> lists.openembedded.org <tgamblin=baylibre.com@lists.openembedded.org>
> wrote:
>> +# test_mem_policy fails if there's no C compiler present, but we don't want to
>> +# include gcc as a ptest dependency, so skip that. test_big_arrays uses up a
>> +# large amount of storage, so skip that too.
>> +pytest --automake -m "not slow" -k "not test_mem_policy and not test_big_arrays" /usr/lib/python3.*/site-packages/numpy
> Sorry for not replying earlier; I disagree with Ross here. It's okay
> to require gcc and we shouldn't be skipping tests that want it.

I'm indifferent about changing it back, to be honest. From what I said
in the previous email chain, it's only 9 out of ~48k tests (after omitting
slow ones) that require it to run. It seems if we were going to enable a
compiler, we'd want a Fortran one too, since there are a lot of tests
being skipped there (but I haven't tested out what difference that
makes yet, so there could be extra issues that arise there).

>
> Alex

