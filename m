Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1AB5C282DE
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 18:06:02 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web11.21753.1741889157341058254
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Mar 2025 11:05:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d7zbWZ/4;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6dd15d03eacso14450836d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 11:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741889156; x=1742493956; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=a7XlP6R2V3qURmGJM49qPBcthV1IsHdxXibK6UPNeM8=;
        b=d7zbWZ/4Fgfbkqu7yqYrtgy2jRS8FT+KcpTqJk+1VH6gg31hrJ1DgDN9cgEHCU9gCt
         Vx+Vw0IGtuA8K2rc+0YML78YwF0rCRXMvmcesD7y5gyTjWiTFRVPap9J7aMfbemVf81N
         d+1j08tc16vSinkw2y6tAJK6XFuA8SVJAI62CcAuR8gsVcikG8SiW47Ip+WGcypTRfta
         kUwphdnXX1g3vsPAJ/+8xjNtmoacMYQjXIBliR+Co8BtPiP3iRxcyTNbqTFUmgrad2go
         oCUHxqwBbvSplCkNy11MDo+78UOaYJeQJRl8qHVwrUIi30/wQpQ3LOtavRppKwnCHrms
         XbWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741889156; x=1742493956;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a7XlP6R2V3qURmGJM49qPBcthV1IsHdxXibK6UPNeM8=;
        b=O+ddXfZHOdTohJclzN3o+Dv565dUbrk7ugBpDWShmEncaaLOv5hRyO9/JCq7/2hDf8
         XuovuURVGKFjj8taCTPxn1PL+K6OLygh25UyJpfyZwT3b4nSe/dkTXR5GMiHTmdvqAxO
         pMrrQJ6+27JUGV9QdO5mlowAa2WeuBdMGk/prne3nTqJtCwVbvTxFu4XNkRoIiQZJtj+
         ZL7wJYnCrpd4ZeRDsFX/orqraNZbMbWMN24X7P8AUxVC9Z7PYChxITrCQLcKSPpLUll/
         /jhzNZhV9mvz0GpAfMcBeGBjXq5VGH5Ot2m2V/EmmSl7cVdXFvwcFNkFT5Zz4GCeOHSz
         uf8Q==
X-Gm-Message-State: AOJu0YyoLRUZ7FmpnNFBiehO1ocNnF5YFVb87Q8CTS2Ld8b7nop08UfX
	aXglWewe3FTCNvGy8sb5Sdxvmeuccbt0DKXRJnRv5AGzTgCGorcXDDVGKjZIbgoFPo5oZTLKN1j
	FOyLVVY62+9ZrrQ+vBUzYDtyHmRY=
X-Gm-Gg: ASbGncvmlLlhCrOzk6gYfOtlKnlTynaklhf5IINsd3V92VGC+mBvoixejwPkLx/koJY
	PMadO029XkcpMffvmKQcGABGM78JcOpfeWm48eOmFNdbFp83QWFb/4FfyPYjCvmCGt1mPjzbiWp
	pUjDuN+MjzDnlnWxmGHeeOXDSnxPhe+UsXuvsbGpfXHCTbqBJiFCCMMhhm5i6eKFQOsfuea4c=
X-Google-Smtp-Source: AGHT+IHPBKOTbYihaPsR0ji8hAa5pZQDHM6yRNZuUdeAUZvHJQFR70y9rF9KbRpVXYkNjrjtco94vNO0Yvjb5gOndc8=
X-Received: by 2002:a05:6214:a0c:b0:6e4:6a67:2d12 with SMTP id
 6a1803df08f44-6eaddcfa2cdmr48802846d6.0.1741889156395; Thu, 13 Mar 2025
 11:05:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250313172223.3407902-1-alex.kanavin@gmail.com> <182C6C97729B99DE.16826@lists.openembedded.org>
In-Reply-To: <182C6C97729B99DE.16826@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 13 Mar 2025 19:05:45 +0100
X-Gm-Features: AQ5f1JoXETP4JDsmP_d-VDxLVJQDRJplkSUrYrYWCx4E-jQCgH68-1gZ6cyuQNs
Message-ID: <CANNYZj8QKbzsGsZGxdkS0s-jk7B_yXBK+oHr+sn=5N-ZGtwOcg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/2] scripts/install-buildtools: write
 download URLs to files for traceability
To: alex.kanavin@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 18:06:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212800

On Thu, 13 Mar 2025 at 18:22, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
> $ install-buildtools -D --keep-downloads-directory=.

--downloads-directory as of v2 :) I forgot to tweak this commit message.

Alex

