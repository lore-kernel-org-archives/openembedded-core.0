Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 065A3C83F1B
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 15:12:23 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web11.80466.1752505940939190900
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Jul 2025 08:12:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dZs5ruQw;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6fb0eb0f0fbso49272646d6.1
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 08:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752505940; x=1753110740; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zMdhvt8KYkvR4fj3eU9tEz7Gl7nwi4r6K0eurXbTqxw=;
        b=dZs5ruQw8ZHW34Cpw5qlPpVvWZihhRxagv+4kHP6teOELFvFUZUI8uu4o1daC0qZkb
         04p6Bus/0RxUso3hyRddkHRXSHIo0KHb9q6Y8kVQo1ITmYMPTEN/o6chh5ERuVPhDRNx
         IleopHI9D3K0OgiE/VV2xV+KZbMzZFfC2gyfjt07Dr8fBJCK+jpcLKRKWbTwDQnoJkkJ
         jtFv5d5XWOUv3i7VJjBQar89OgsHRt0KCgSDVcCS1gn79fShl4tKJW+Bxj6XozPPsZYJ
         nJsochq975IU0M1wcr0DoUnNPxOpl+MVY7rKiCfx6uUycfpG2QQ2IRksvOqfGkF40J6U
         DzhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752505940; x=1753110740;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zMdhvt8KYkvR4fj3eU9tEz7Gl7nwi4r6K0eurXbTqxw=;
        b=hI0d9fDjmAaHgjfA4zEoK8qsIxFNW5/xGmy8ItOR6Uhf7RqLQ2yG9VZqP4SN/u1d1C
         tUAUAmAd1Chspw6XQZ+ITpRPatZwwK5g4IdjgR1tZu6sd60hBJC/C0n4JAzORWYzRWGH
         n3L/6htgazWPhhhXbhOr6dzfbQ+2NEa64y/ILJy3m+sJXb55BSKXHQFBb7g1Tkv7aAp3
         9GezR5gnOkWDFcqe/TBIUXMHJrssmU06iTX0wBsGlk/VxAxFrTG8zmOV//6isQXM31WQ
         AffDhZTcm+jO2XSVhlsyoCVAjHpA0PWJp/a397eQAIRxN8PFcmhmvzS/ZqskouqAuepW
         25Lw==
X-Gm-Message-State: AOJu0YxxVx7wexuaF58FHlqSF3auUWg6T/e2mM0SLb1V6MympLg9Znno
	Jr/k6I9ZIwxxjsUBbK36cfahazSXqmpYaNX4VKP9Kv72d44oOEEn7A0xE8a5X8HDo5niHttGx2L
	aeDM/Eoj2SE1bgvutIs8hEsIFFWzSW/GY9g==
X-Gm-Gg: ASbGncsOY94F8/DGtKHcHMTa/4r49x7xPOm8KaP2Ytgshs/ZWuUjiSm6g0tB6EpYLo+
	mjVkaC7B0NttP20UL8cIysPDhrjyCsVk5Ttxll474y/Ks+hDOXV1x0R1l0pl7dGRYirFI76zUWs
	Af2Con4ZWe3AXdk+2OIyn9qCOB1yruyaechuzwVAKD9Cmwybr7ozhD51z/vKbbuqEItxJnePed/
	Zb6COftZhN10jc=
X-Google-Smtp-Source: AGHT+IHH8YMqtjqoPwsuwrg+EJOB6kGqsK0dGFjJrnSGdu7BdymYb7sQPAuUv2koeQhI7NPOyDHI9GYdEoQdX0BTzfM=
X-Received: by 2002:ad4:5be9:0:b0:704:95da:99df with SMTP id
 6a1803df08f44-704a401ec2fmr230952676d6.22.1752505939879; Mon, 14 Jul 2025
 08:12:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250714020900.1240597-1-vince@underview.tech>
 <CANNYZj_xp7_QMttJ3cjRnfErXoKvuQ-SR4kErQMu_XvAGPdHoQ@mail.gmail.com> <CAPQx_gNG3kum-xKnbAazGxC8U7-2-M6mh+g6BbeRkDWVqK2nZg@mail.gmail.com>
In-Reply-To: <CAPQx_gNG3kum-xKnbAazGxC8U7-2-M6mh+g6BbeRkDWVqK2nZg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 14 Jul 2025 17:12:07 +0200
X-Gm-Features: Ac12FXwvWpncDFlENkCGos5C2oV5lIoUF7AyZ8ZSJmNeVSZx4zB3WlHbZ3dnogs
Message-ID: <CANNYZj_OrTfY6m394mopWscAXe9TXKWnnhHaJ+ry+n4NZraTkQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] grub_install: add new wics plugin
To: Vincent Davis <vince@underview.tech>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 15:12:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220237

On Mon, 14 Jul 2025 at 17:05, Vincent Davis <vince@underview.tech> wrote:
> Examples and usage may be found in comments under class declaration. Are they sufficient?
>
> Will add more comments and move example comments to top of file.
>
> Per what I understand from GPT partition table format. If you want to hybrid boot you have to create a separate bios_boot partition to store core.img.
>
> I haven't tested this, but it appears bootimg_biosplusefi.py only accounts for MBR partition table format. grub_install accounts for both GPT and MBR. Hybrid or non-hybrid boot.

Without tests this is still not acceptable.

Generally, I would much rather see existing plugins improved, rather
than have multiple plugins (and only some of them tested) with
overlapping functionality and features.

Alex

