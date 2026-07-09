Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C74AC43458
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 14:22:58 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10580.1783606968930157606
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2026 07:22:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=yYHlXSbw;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so8117465e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 07:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783606967; x=1784211767; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pJ5NC0dlIeZ0HGh1PJd3gTTO1qssAnT0N6OJ9YIFWDg=;
        b=yYHlXSbw1qn3qtPaYD40jSjeX0YhrS/2A30jYeFLARP4nagB9yb2LT06R8+q9RAvfT
         yXoVLfDEXKEMrXWsp5EO7n+nzQfC6vrLgmCFo2X1yzPvY2CSNTXd2bFJOBHdWrquYk7x
         wjc+057Sq0n5Fu9R1hdURuoLNo+GmXrnsqmZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783606967; x=1784211767;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pJ5NC0dlIeZ0HGh1PJd3gTTO1qssAnT0N6OJ9YIFWDg=;
        b=QtTikMu7j2KcdA/AHg9gpWm7hKkz4v8o1EuMwsl2xL7XAsho8D2c3YNOXCQ3nWv7+l
         BJdv0Zxq2XLrGQ4eAPG/xUUj9nysK3mSXBM1wsfMsAut7VZlHEN7/dH+w3wb95tnjw5a
         fmiIYjgkbKLkjcm8Tk9N6rrsHTjO4uDuHDN+F7hkdor4Apnx2QlYzef6DTgJcVOy5Js6
         /HQVAZJjactgNvfMQsGBf2FuSp0rG7po7PNY6/wXVO87Hg7wl9T6oizgjr22w833GFNg
         RvMQonREHa23Vo6YbVrr2HrGeIvQpQb6L4gJQUjixBYjxfRalNv+6Q3a8dBPHXPuzA5S
         jgKg==
X-Forwarded-Encrypted: i=1; AHgh+RqYzChBnQURUuiHXYCRQ95PFvZgtP68dpY3k9RDNcvHW4VkOHKA68AkjrHMeroOJQ444kuZPy3Idpm+l1X5VCgQYg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyKpWIg/tW2CZSm/kUhd9ZGGa0oIwvoZBJLFssiaVqlm+SEqvMz
	COvHFq9z9ixD3Fq/YzkaobKapHcwhJzn9ix3sijkAVD5GwWGxxGtHC6DRqBDet+Moi8=
X-Gm-Gg: AfdE7cn1ig3wQv7nu5SdvzXw8lf7OOWQh40q/43TG91OUERa4z9z/6ghb8pjSwmITpS
	1z1liY6xV0K/mrLfiYS2xQrt2BTVCb+8Ug6Hvoia2tv0e0N8pkZtF3RyqxICw95cYZRv0ucd75y
	eEjQEC7MjqTt8lJyAUPs/xv7c9PaOKOVchF5W7VDKu2PkYexaiRTfmK1s8eX8LH8eDyKK5hkjwh
	R6f3dut5YS9aTfN5G24SZfOD68x463aylH3/6Jbus2dpZQqBSm4yxLXh2wlguCU0ZMbSXFmVFZk
	xesNOdxAHIX/i1SZtaEg5jlrE+zo4CDW6eQaDpsxU5lRPeTjKAgSRZNgR/mtXxTHVdQyymWaEX1
	CPQt3w/2SVJXhAV5nonNqLX/9uyzSab2gVDkEGI3jPY+vni2RKhu9FcqcU1peTkWYbBvT8gRshY
	n0xGL4O3Uj5UyyVyg4iOrj98gwf87xlRQTuc/ZyRe1lwc0I1JbDQgNsSUK9vN2N4+Np2Gdh06DQ
	RisaA==
X-Received: by 2002:a05:600c:6286:b0:493:b7a6:3dac with SMTP id 5b1f17b1804b1-493e68f0746mr67358315e9.33.1783606966872;
        Thu, 09 Jul 2026 07:22:46 -0700 (PDT)
Received: from localhost (2a01cb001331aa00fd88810a86c49142.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:fd88:810a:86c4:9142])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb74835esm72188685e9.14.2026.07.09.07.22.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 07:22:46 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 09 Jul 2026 16:22:46 +0200
Message-Id: <DJU3WGKIEAI7.JFUSWLLIAW6T@smile.fr>
Subject: Re: [OE-core] [PATCH v2 1/2] [wrynose] expat: fix CVE-2026-41080
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <amaury.couderc@est.tech>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260709140651.48230-1-amaury.couderc@est.tech>
In-Reply-To: <20260709140651.48230-1-amaury.couderc@est.tech>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 14:22:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240582

On Thu Jul 9, 2026 at 4:06 PM CEST, Amaury Couderc via lists.openembedded.o=
rg wrote:
> From: Amaury Couderc <amaury.couderc@est.tech>
>
> The existing hash flooding protection (based on SipHash) only used 4 to 8
> bytes of entropy for a salt, when 16 bytes of salt are supported by the
> implementation of SipHash used by Expat. Now full 16 bytes of entropy are
> used to improve protection against hash flooding attacks.
>
> Introduces new API function XML_SetHashSalt16Bytes and deprecates the
> legacy XML_SetHashSalt which is limited to 4-8 bytes.
>
> The fix is split into 2 patches for reviewability:
>   1. Main CVE fix: migrates hash salt to 128-bit struct sipkey, extracts
>      16 bytes of entropy, removes dead get_hash_secret_salt function
>      (copy_salt_to_sipkey accesses the struct directly), adds
>      XML_SetHashSalt16Bytes API, deprecates XML_SetHashSalt, adds symbol
>      export, backport feature macro, tests, and documentation.
>   2. Windows/cmake: adds the missing .def export for the new symbol.
>
> Note: the prerequisite commits that Peter Marko needed for scarthgap
> (clang-tidy misc-no-recursion fix and WASI getpid removal) are already
> present in expat 2.7.5, so they are not needed here.
>
> Backport patch to fix CVE-2026-41080
> https://nvd.nist.gov/vuln/detail/CVE-2026-41080
>
> Upstream fix:
> https://github.com/libexpat/libexpat/pull/1183
>
> CVE: CVE-2026-41080
>
> Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
> ---
>  .../expat/expat/CVE-2026-41080-1.patch        | 517 ++++++++++++++++++
>  .../expat/expat/CVE-2026-41080-2.patch        |  33 ++
>  meta/recipes-core/expat/expat_2.7.5.bb        |   2 +
>  3 files changed, 552 insertions(+)
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-41080-1.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-41080-2.patch

Hello,

Is there a patch 2/2 to go with this 1/2? If so, it is missing:
https://lore.kernel.org/openembedded-core/20260709140651.48230-1-amaury.cou=
derc@est.tech/T/#u

Regards,
--=20
Yoann Congal
Smile ECS


