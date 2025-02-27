Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2245BC19F2E
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 16:12:11 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web11.14510.1740672728541933437
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Feb 2025 08:12:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EDc1pN1Z;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6e89c11fd8fso6595946d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 08:12:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740672727; x=1741277527; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2pyoEelCujVnJ0palKAQg0lhwc+FaGwUswqn++XMe0A=;
        b=EDc1pN1Z8wjGRf86ps2gfVsYbn0pNIXRH+9LuvnRGCxMJ89yNfs9MiYfg8jXbvIzw9
         uLnmiGXddLrS69IO9gD6XAvVN574Lqi3XN3lzVRY13kgaOGjtXPdF53P8SsPH/mpzh25
         dhwXabsmV9Yx1j4XzJR/Od4Fk/+KAk/68zv4Cme60+Cgn2aZaGU4D+2+3kDN1AvdfDLk
         XvRDf6mRz4pAy1Z3rzeCr8OmmJalEfsPxHBpTQCGSiJCVlpB9/hQRjkgPLTCsXAQGx3N
         eE9H2ieJB6/vLgmxHvmaUCWltCLq6wBc/dGBVT8+1+DMK8U3TlqgDTI5qBdmi1BYfeqr
         JX1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740672727; x=1741277527;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2pyoEelCujVnJ0palKAQg0lhwc+FaGwUswqn++XMe0A=;
        b=OWBR86X3SJvhldi2FeAwDxy4NPFKpHAlJ3sRf8Z8E2TFJxZ+KH7M4nv21XCXg5vlOS
         6SfxVGiNXCxYV7mFtFHTsvmtPBV93Jnwvb3iZKAkGiL5SzYaJCae3kJqwk/T8X4O4xXx
         RpdcKR5AjcO62XkqOhEkW/JaFvXh7rhqOCmPv/MpTdiSb19bBJ7jFn/QVDjBqBMBx++O
         E5t+tt7t4y9GH529uclEV5nR6/5DFH5ycP9EA5j50PNsAkN9DrUsSBu8Ij82Dlt+XjPy
         TQXC/48xtro5bsLLNYJpLuw2i97gw8qQu9ks8LFOffRdRCyDXm3eBGlewGQjBZ5+zVTe
         ej+w==
X-Gm-Message-State: AOJu0Yw7ygyj/SPhA+ZkdLq7QVyI7A/sLjrZFqN/PD2Tm0UqTVw1AXWP
	YSiBEIH9N3wLSUHAoeEma2n3/tiKqftBjJgDKvuyMeHZ3wrz1VotRuMgzpfx7iKDaovKkji3VeT
	I3cAyfjOJUTvY6iH0lIC4Vbms9HuF1DtH
X-Gm-Gg: ASbGncuhpnRz2xhlEAOgCiDQbPKfme4yAnG6RH67nu1fwqjxxfWpe0NnM3KrkjQuEKx
	mnpZ+CeoSral/msc6BinuPrrFh3P5ZvfRgPv5Otx0JuCcMz3MxHEcXEaxFFBk8FGc3975uCFUcY
	Vx23dwDCE=
X-Google-Smtp-Source: AGHT+IHYzpKv+6IH6cmcxVKdvUtxV3lTwhn1t+lB6kRus69CSNmvAko+/KfOf3liAP51s5DBRTcJfnzPNQxIeDtU7FY=
X-Received: by 2002:a05:6214:21e7:b0:6e8:9224:483e with SMTP id
 6a1803df08f44-6e8a0c7fd20mr125616d6.5.1740672727636; Thu, 27 Feb 2025
 08:12:07 -0800 (PST)
MIME-Version: 1.0
References: <20250227134340.144081-1-Deepesh.Varatharajan@windriver.com>
In-Reply-To: <20250227134340.144081-1-Deepesh.Varatharajan@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 27 Feb 2025 17:11:56 +0100
X-Gm-Features: AQ5f1JqFCvyp-6oqN03oOgTQIR7gvLsFVym2fwTaz7T1GUE5gJhD65L67ZPVojI
Message-ID: <CANNYZj_RQmowF90R631qOOkGMftSCo2ic20WemBC4m1bEpdh=Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] rust: Upgrade 1.82.0->1.83.0
To: deepesh.varatharajan@windriver.com
Cc: openembedded-core@lists.openembedded.org, 
	Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 16:12:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212020

On Thu, 27 Feb 2025 at 14:44, Varatharajan, Deepesh via
lists.openembedded.org
<deepesh.varatharajan=windriver.com@lists.openembedded.org> wrote:
> --- a/meta/recipes-devtools/rust/rust_1.82.0.bb
> +++ b/meta/recipes-devtools/rust/rust_1.83.0.bb
> @@ -129,9 +129,11 @@ python do_configure() {
>      # [llvm]
>      config.add_section("llvm")
>      config.set("llvm", "static-libstdcpp", e(False))
> +    config.set("llvm", "download-ci-llvm", e(False))

Why this addition? Please explain in the commit message.

Alex

