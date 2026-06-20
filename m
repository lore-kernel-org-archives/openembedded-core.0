Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7857BCD98E4
	for <webhook@archiver.kernel.org>; Sat, 20 Jun 2026 17:45:00 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10401.1781977495572746773
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Jun 2026 10:44:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=VanI0lxh;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-8dfd7b11e1eso5683926d6.3
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 10:44:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781977494; cv=none;
        d=google.com; s=arc-20240605;
        b=TF2NmoQf8gi88j52X8HIFN0sACkZjA5NnKJQiRABzgayndggoVzi2erYAFOSkmawt9
         i6s9LGKJJH8g6NFawb2IkkT8pQMnhPCqeTCjnpcxLJoOOVFWCLTK/na79Wol3SlosfFD
         BqAy6Ydx6OpOlqfuAtuR4d1cUepi2R+Xkp1WPn6IB/+UFqBNALTDcnqmhpWTp4NIDjig
         izA8S3fAVyWtPw3n9WA2nSn6vQvnehM7hKZ7PUFXTWXNNj+sUu5hWK18du7OffiFHbfE
         AiAtdDg8vXX2RSezNbeLfwOMyc7MczskuugWX8CtRKS8x9rV8sZtwjn+3N6ZFPqBV4wo
         wTeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=oR6iKvodSclGJ47cNWS/gLSwGDvD79WQ0h3y2/kpepA=;
        fh=3v717uFJNr4+xuf+Wz69RL6wEJfn54tSSdOKZHzPuIY=;
        b=PuZA/afwqVwhr+YUjmAkF3/r1iTRWIxUYgsxhu7bzByd/lD/RpyEqsIGctOIbLp52H
         wGc4/BetS2gSVEKoDJxCkIGdOj57efBkdsDQZr6WrWAslVmTLtrHdH28+USQhJDQ60Oy
         GWQH10eGmbYKT40Fhm9zswzv91+uvB2mu3gXtRP3E0I16cUTTXLYR9KJNNFzKhx4IcfN
         3Jp3EhkIIb75GBDPoAhvSIdePtO9iDd3loKwJT4nV16X/6SArZN9zKkhJZP2ij3U9p7g
         RKO81bhMDRqNQp3U3kpilMYMuT0Ww+HOvD1u++kkqwTD8AnjocVaFOz5lyyvyjWSms11
         jlpQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781977494; x=1782582294; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oR6iKvodSclGJ47cNWS/gLSwGDvD79WQ0h3y2/kpepA=;
        b=VanI0lxhOvP1ZhCnSqxuJRwaMLfnUnl6FSY8MW1RQeLgNIwq7O+lyWiHOg9Kny6tNf
         mUebf2Ysf1ssOGHoJbvUSv/3QI6Wzu9MookyvviU4QRuZ3oZtRRb1n2xLh9RiKFagSSE
         Axi4iNgPgSKVOdSKb0J2Sc0G5lDGCo7lNRVb25RfqgZwQMxrNxaQHpPKbzXwZN3lI8YU
         6oX6bb77xYJTGetto9zxpl2jXuw20zC5T+19XSbgXz4DMK+vci506PU9y2e/kMsP7/mO
         1fg+xlq3uUtDYmEiuq1oIhwjwdT3NxagF+XgK/iBBRpRPhR9+FCMEdDvw/ADQgTJp7/p
         kllA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781977494; x=1782582294;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oR6iKvodSclGJ47cNWS/gLSwGDvD79WQ0h3y2/kpepA=;
        b=OlHVi9iMi50pPbGs6z7PZx+htR6YoHGFkELYG0icO/q+jV0p2/uY+zFqYP3UY0kBe4
         xSMDKudqwXKIXU+KJ8jSBJKCmHFhrOjblgtN1vqxyaXy8G5ILSuy7a+Oqtb6O0cEPWY6
         qfZOzj3k4G4HmM/WeNlKtwPhg4tynVuH09y8xw9nTtgAyfM2fNHNiTbFCRnuLmeK2/QD
         fiFMLTca8wrvSO/Jh8Jg0z9u8aqXrT9Kiee9rwncG+/hynxm0wTL4bO9VoD7BEMiU8X0
         sgb9Rdp1oZjDhOlZKObSAN6GXlu4dhVUf5+F/5H2O7jXzBPkxY+hgIDtU3y+m5Y8vI1Z
         ufJA==
X-Gm-Message-State: AOJu0YyldDNV6ZjVmFe2JJpBNzkb5krLMvnPZMW8Y+WX5neIPnpVP2x5
	diTQyhd8fsHfq5oL8xbUj8zOLkVWgI+2Ht2acOg8q3PzGhj1WIeUsOIoJGdbg9ZTOmAQNHmwVdO
	EbsbIs+IUrOa/m1BulvmWcE92q+eGwJE=
X-Gm-Gg: AfdE7cktdDA/pIodin3j86TpyXOzA0t5Tbg8KZx5kY/eKkEA56UXs4I92MTrOLeYhuj
	83H1Ae6tyUURz9iK832QDcH1EyvLb+Xxu52rHC75UmPR/Yvnzk41SaASWyftFtUlq4foE8A5mM6
	zlVEi4cGuhRjZsdfNiofLjsibPpkOKchFAqBHMXEM5MkPutsUS+lDVZjLSTumxwPqXlAaaY/+7p
	pSjMDohPgQOa1M0vzP0JE3z5MO1t6iqDi5neWFH9ufeq9hpiu1NNzv2BNLuoftvHGJB1iz8rHp9
	IrVZB/dJdYcGrxCYGZccZQpWzlU=
X-Received: by 2002:a05:6214:600e:b0:8ca:164c:a85c with SMTP id
 6a1803df08f44-8de407172eemr133321836d6.34.1781977494447; Sat, 20 Jun 2026
 10:44:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260620111501.8465-1-jan.vermaete@gmail.com>
In-Reply-To: <20260620111501.8465-1-jan.vermaete@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 20 Jun 2026 19:44:46 +0200
X-Gm-Features: AVVi8Cc9AQelANPsfyIkelR7id2b3YrxWC3aAdo9WFTbv_z4M8oove_C_tXsVow
Message-ID: <CANNYZj8WMkUzhg_NxWczE4hXs68uQFP-1PPGSgrFJk_2fKYXvQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] u-dma-buf: new recipe at version 5.5.0
To: jan.vermaete@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Gerbrand De Laender <gdelaende@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 17:45:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239247

On Sat, 20 Jun 2026 at 13:15, Jan Vermaete via lists.openembedded.org
<jan.vermaete=gmail.com@lists.openembedded.org> wrote:
>
> Add a Yocto recipe for u-dma-buf, an out-of-tree driver that
> provides userspace-mappable contiguous DMA buffers for FPGA
> and other DMA-capable devices.

This needs justification for inclusion in core. Is this widely used
and widely useful? Why is it not in the kernel tree? Does it come with
a maintenance promise?

Alex

