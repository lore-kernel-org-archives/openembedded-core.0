Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E489C71157
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 07:09:04 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.1071.1750230537998306667
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jun 2025 00:08:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DEyZjLzy;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a589d99963so1281580f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 00:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750230536; x=1750835336; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xjb5wy+DqAvEIxHqPxrfyy9pxUmn/lrOHLEPRxnKxZw=;
        b=DEyZjLzymkEzdOTFmid0R5cTRFWtNGtCSgD2bcJkNxDvA0BU2Pro5t8nsGqSih45ui
         +3pWgZ5s89nao0zpdPoQCKr5D0+ljDRBz2bi1aMPH6GENQG5pU9XPBEVvUtRwbm2C4fw
         Ml60I8N60LZsq9ME/Inoj0+1u6govzt+qDtF31Fkc2CbeyIswvnklOu8EBLLFRm1nyd7
         a0n2o5pmLzwUeDHReJ4M4XoxTwOkvKEO9YNRMel/akpg5LTDdTNVE4XmWBWy4rzEgtzX
         aEmUt0t8CEMQx1ZFrzptSxUwQxi0jy3AL40XBT1X3JaTkwiELMDBpvqGLS1eMoUseIVj
         5Lqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750230536; x=1750835336;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xjb5wy+DqAvEIxHqPxrfyy9pxUmn/lrOHLEPRxnKxZw=;
        b=q69qlaZq8kqEjESJrOFxl2ap0SmOMPo0MLzjmp90Uwz4zZCIOc1VtbsZ8UpB5NXhuO
         K+aFVoFrYLUctgW3DdK2UR+wrb9DrfdIjAjt3e+4UT/N3XmafEUfrE1ySb86AJ47DbFg
         2q4HhR8d5lhjjCMqwaU7J7D1UE8vomfObD6pGw4EMdBi40VTtoR17H1lu3mBpb6wFklQ
         hQoUJeNorOEyayGtBhMFgKqkAROUm/KD5fBcpgKZrk0O06JOICMgxHbbaSLoPj2tJvU3
         OUfUyIPEkyypnoUxozGZfIxNLphUg5HsDcg6KzvE8w33OtaZz7x605+9sorqdD14BFsI
         YrnQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3vedrhVqCkWZRPvWkKLTKfcgMdB1LLkz2ma1KD9DWtnQMoKk1+sPGUghIwwaoMNFTPh/7z0zfm92pbmrVC5j8Fg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxwoH7CguV5v0OxfxRiPstu8FlzA6x3LOxOBpNsRgElSy7MS0EM
	sL/4VPvJ8XmZ/+VGejoIGQ7GLvv+IbaySYOstik31IjLMZ49Of+a2EgX
X-Gm-Gg: ASbGncsaLYJ7VyEkJWZ1nbI8fnfYV8WfAy+NxBT+7MtFkdBiOXX0DV2ANPc0mNJetqm
	MtbvQQehQNqbdMaKnrZwS3qnuWiEgLBMpbUaM06FHadZV4tNgWLhwQdmO4qUe+a7mAXJh3JuJBo
	/mGY2zZ1DqPCtlvUXdqyazQ8Y10CyK/eecvmlqp87G+QjtJJz9E6iwqq3F3Zw2U+aqefGK0Rymt
	hm6X5EVdwbrdifG4wV8aCN0X6t5ya8hXQtXiH22/Mj2rDYxDsDDJwE79gXoCxqxDrDQU1L36E6W
	9ldJflB8R4ZuwC6BXQrKWKSUacas9C6hs9kOsSoVPLkbXmYE+0lS5uIge5zOV1RyUNmK+g==
X-Google-Smtp-Source: AGHT+IHt8SrUVND1Agk8kpU3UlYC0xRBnDRF0/bSFNW+Ae9YnMn39HOekZjDkG026LTfTdlL08BiRA==
X-Received: by 2002:a5d:64cb:0:b0:3a5:26fd:d450 with SMTP id ffacd0b85a97d-3a572e2dc2fmr13259616f8f.47.1750230535933;
        Wed, 18 Jun 2025 00:08:55 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a6389esm15778816f8f.27.2025.06.18.00.08.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 00:08:55 -0700 (PDT)
Message-ID: <3285382b-51c5-4ea2-9784-91267d1180ac@gmail.com>
Date: Wed, 18 Jun 2025 09:08:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][scarthgap 8/8] systemd: Rename systemd_v255.21 to
 systemd_255.21
To: steve@sakoman.com, openembedded-core@lists.openembedded.org
References: <cover.1750176125.git.steve@sakoman.com>
 <db02a4cc542d0e7e563ec46c91bf9a7313a71d02.1750176125.git.steve@sakoman.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <db02a4cc542d0e7e563ec46c91bf9a7313a71d02.1750176125.git.steve@sakoman.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 07:09:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218970

On 6/17/25 18:04, Steve Sakoman via lists.openembedded.org wrote:
> From: Savvas Etairidis <setairidis@gmail.com>
>
> The recipe was accidentally renamed with a 'v'
> prefix in 29e623b2ad00555788412fa520fbb9ffec794cbb.
>
> Signed-off-by: Savvas Etairidis <setairidis@gmail.com>
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  .../systemd/{systemd_v255.21.bb => systemd_255.21.bb}             | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename meta/recipes-core/systemd/{systemd_v255.21.bb => systemd_255.21.bb} (100%)
>

Personally I'm not affected by this issue, and have no problem with this
patch, but a few weeks ago there were people who were unhappy when a
similar issue popped up in Walnascar with autoconf (though it was caught
before merging), which makes me wonder if this is the way to go.

Systemd already has a PE[1], exactly because of the same situation: "v"
was removed from the start of ${PV} - maybe it's time to bump.

Anyway, as this patch does no harm to me, this is not a complaint
against it, but I thought it would be worth to mention it at least.

[1]:
https://git.yoctoproject.org/poky/commit/?id=f95bbe35b2aab929e50471db8ba50781d5027a01


