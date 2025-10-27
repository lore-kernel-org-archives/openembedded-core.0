Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE2C1CCF9E5
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 19:32:33 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.285.1761593549161178638
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Oct 2025 12:32:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GuZhwZn4;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-421851bca51so4707023f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 12:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761593547; x=1762198347; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fHoBBkfrs6SWmElOjgR4SddQ15HYOQSy+H5DFtuikgg=;
        b=GuZhwZn4hJmQsWEE1VtFxrK/u20B6GUYi6puAsioqj7CeFFn43J7tvGOpswbPjy810
         MSbPR+T/PqHGFNO4Lx4icOzzE43itTFIIFJDP+7dq/h2I0GVcpPtUMg0/Su7ZElQNyCW
         0+tvE2H9rhwiaPjpshJ+9GkTB1bVDmf8yNUfcRmTlB7fsAoHsNAzXp6CsPvCAtskZnLy
         +QHBMN+dUgck261cbnoBh02mx8/yFJKdinrXycct30hIBAonixVc8dzUTU0e3iTWSz4F
         enGBrcWe03DiwEEM3lfAQLp1EDXWp2PkjzQ1gRjJSXG+ZS89Dj26a+95CNaQfN/vWN96
         BQag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761593547; x=1762198347;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fHoBBkfrs6SWmElOjgR4SddQ15HYOQSy+H5DFtuikgg=;
        b=NDZIQc36X/vOpQUmayu/Ss/eZA5f8raf7WWL3+N2I7G62RmxzGbs1aeusgFwt95RvI
         kqPtYDNRPSxqaC4wo9VFx98kREZo0OTF/QbChUBJVpY3BmG+VOAnmxzbnB/Mo+xWBKbV
         fHKSkirYNQQDaSSKWo/jPrGgpxBBR1eeu50FbJ9mmERJsKJ6j15fpg9n8sCichdhI2z4
         5LPXqjAdJpOR5sJ/uLN3Hb7ukPpOp2GEYLL6RTSKs9uAPH2bqZ3iu0mM8WPRGIvmYPU9
         oR5sRXS8zadIaCz86lUa5BpICdU2yMp8r7rbOa6hCOJMhzFKp5CWK9hTj4Np/xu0xok0
         5RjQ==
X-Gm-Message-State: AOJu0YzaZIcowGF6qIPm8FKkNzpm/SBv7Z32m5xrzLgIOahfDjNJ/hD9
	ybLlAOSxNS4bawp+aEnYrk6X50n/FO9ihP/53a9FdRWQ9PjvTunk5w3J
X-Gm-Gg: ASbGncvICAdKpV+CUJlxBT9iht62seSZrXfzCFIAYddnRQfApSQj/JvvpwjJwH2/WiP
	9b+nybKcMCOGvJd37NcTfkd0NR4uYCiMksFUq05Nbun7nLFX+Ma3HYG7CcMtE++v/ayS9Unru+S
	bGfSYlXdLpEydYMZPxVfAszxlH/8Dbl9H2MpRHkM66SpqEGhr18SXqzlCj2Vf+xJsqSjACSEFPa
	hiPd821ttqfvqll1gzh9c9gyl453YQ5704MpkkK88L4igkTMXKuUrfkXly43NTLoK5M4a36Rmik
	P+zRc9yFvxa7HtRuc0j/WJ7bbTuQER9iUfcmenSzSG9lHOJ6GBP+Eoi/bH48HDtUeynz4MmBEwy
	Shha2iWkqTWSpVgpkC3n909CO4Iqqk7+kc0rjWFmA/SBQoLlHka+XDKCNByJsUnQ3I2ijVT4Nma
	R5rgOSOdhx/7clZQmy7jA=
X-Google-Smtp-Source: AGHT+IGoiPlY6J3psISofiElZme/jBV9zygFj+1q6riO9plnnp22SLbBr6EPHelTlNBuJpJemk3Cjw==
X-Received: by 2002:a05:6000:40cb:b0:429:8c31:84b7 with SMTP id ffacd0b85a97d-429a7e70bbcmr760845f8f.39.1761593547225;
        Mon, 27 Oct 2025 12:32:27 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952cb7e8sm16266582f8f.19.2025.10.27.12.32.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 12:32:26 -0700 (PDT)
Message-ID: <fd70615b-8821-4b2f-b994-ed21488fe883@gmail.com>
Date: Mon, 27 Oct 2025 20:32:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] tar: use diffutils for ptest instead of busybox
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20251022194628.2462629-1-skandigraun@gmail.com>
 <AD10B0FC-5551-4970-A2CB-544018F83F32@arm.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <AD10B0FC-5551-4970-A2CB-544018F83F32@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 19:32:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225351

On 10/27/25 18:38, Ross Burton wrote:
> On 22 Oct 2025, at 20:46, Gyorgy Sarvari via lists.openembedded.org <skandigraun=gmail.com@lists.openembedded.org> wrote:
>> +RDEPENDS:${PN}-ptest += “diffutils"
> From the experience of looking at assignments like this in a few years time and trying to explain why they exist; can you add a one-line summary of your commit message as a comment here?

Will do.

> (also, curious how busybox fmt is so slow compared to diffutils, considering “read files until they differ” isn’t exactly rocket science…)

Busybox[1] reads the files in sizeof(int) chunks, and compares them as ints.

diffutils[2] reads "bufsize" amount each time, and does memcmp on them.
Haven't looked into the exact size of bufsize, but at the first sight it
looks like it's the blocksize of the device being read, which is most
likely bigger than 4.

Haven't done a benchmark on these lines, but Busybox's version looks
more KISS-y rather than speedy.

[1]: https://elixir.bootlin.com/busybox/1.37.0/source/editors/cmp.c#L122
[2]:
https://cgit.git.savannah.gnu.org/cgit/diffutils.git/tree/src/cmp.c#n487


>
> Thanks,
> Ross


