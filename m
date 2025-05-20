Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C59A3C3DA6D
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 13:06:22 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web11.20480.1747746379826371848
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 06:06:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TX2j9usU;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6f8c3db8709so41079186d6.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 06:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747746379; x=1748351179; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7uMhBcZ6zn+ZSaE7EjkYaynsW+hGwo73iSBktBm6L/E=;
        b=TX2j9usUbcDmq6a7if4cfBtHAfCAJJOOmUQGdpe0waTIVQwRlHl0d0rUQwqBR9+2iZ
         GRjM5ymNJkTFhpt9CPc0QS414faAYRfI2wkfkxXSBle49yYv+5BSlK8OliIPeiUHaE2k
         Z22KqEnmZCGyI2jEpxyby9bIId9OfCWo/LxWBdP5mtUo5k4EYumzAQTvJL4Qdu8f9saA
         +nVvOmrwI7Y9RFr6JUTuUkQ9LzqdrZQY6JijaGPVMMXSY0z85H/nAJbVvSg51R1AkpwK
         a+Ah1mhfrJsSQPp6DkcqIkbyzNdJxepl2dKc3U/OC/woj1J1W3rexfn+qS8Co+w+6G1N
         oFlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747746379; x=1748351179;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7uMhBcZ6zn+ZSaE7EjkYaynsW+hGwo73iSBktBm6L/E=;
        b=PhkiUK/uFpYqR11YDhggc2B5gCV6CeCcD359mMBi+gKu/RasCeih5nwdJB38mA/b+9
         MPKDHIYXIwwJ6u18eMgQ5ufotflZsUMkDjX82bxOR4tkqiYTKFT/IaA5dlH/K8VbcbmE
         PaemrKhOWXeYRbqg4RgL9pv9mLmJrlF/+FlDiVQT+cWkgE1lX3qWkrN6n+A8RkIlUolm
         NYjXsiHI92VgF4ZBOMfxC9rc1fdaLJQl3nwcjW6VwEK2E+9w0lsCJ6fnniKlfJ+hfQ9d
         k7BeACUz4dtOFXbt+u50FoKwtkmtfXUhBZvmUVXk8Z07vh7BrvB5kxoKBB2JS12BeHSY
         Knfw==
X-Gm-Message-State: AOJu0YzCEApOOjRexyh/k03RNFFrqYGyPl16iYaf0UJAi/Hhs6abU8zv
	SH60BA75womIC522L1lIEzxAdXJC+4bnok6YksrzWYwlI5qWwcBBSL6KZRsfoo8vI22AY41flQS
	MzMMtinRvzkwUY3zWEQMh8aFlYK4da6w=
X-Gm-Gg: ASbGncv3u+GJslr6nbQAM/oBp5jIRzIfJsDml+zA+sWl6v3tOx8iUEs8eKh92APXjnx
	gFUftOKaLZYyp0Wtii6d6nqCojPoTQMlxkNy9Bz6TSvwRs182SOto75dfcFLUtSjNpyjcokahT5
	MhAd9Joi1+FqM4NeU0cw6Bx5gMoBJl82Myuw==
X-Google-Smtp-Source: AGHT+IFAzArrPKNnWTLQV4YDsv7OCsoDDUrDiuTlXCbWyLjnpaYshPB4MxR/vb0+nPxb4oAh6YDAemA0clz2RBzPvy4=
X-Received: by 2002:ad4:5bc9:0:b0:6f8:c773:26e with SMTP id
 6a1803df08f44-6f8c7730babmr155208496d6.18.1747746378690; Tue, 20 May 2025
 06:06:18 -0700 (PDT)
MIME-Version: 1.0
References: <23322.1747649580665167105@lists.openembedded.org> <23322.1747650258056298980@lists.openembedded.org>
In-Reply-To: <23322.1747650258056298980@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 20 May 2025 15:06:07 +0200
X-Gm-Features: AX0GCFtIsLampa2ngsuWaBAVCOGfuEjsyvecX46n2X4xCxRFNZ9E7R3vbeh2j98
Message-ID: <CANNYZj9mqhhwvr145RCzR5NULK48_SmphXyiprLFbK9dOGnyhw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] package: disable renamed dependency error if
 allarch is overridden
To: ohnatiuk@cisco.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 13:06:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216908

On Mon, 19 May 2025 at 12:24, Oleksandr Hnatiuk via
lists.openembedded.org <ohnatiuk=cisco.com@lists.openembedded.org>
wrote:
>
> Also, consider this
>
> packagegroup.bbclass inherits allarch.bbclass - except when PACKAGE_ARCH is set before inheriting packagegroup
> in order to do so, a nativesdk packagegroup must inherit nativesdk first
> there is a native-last QA check which strongly suggests inheriting nativesdk last
> nativesdk is inherited last via inherit_defer in nativesdk-packagegroup-sdk-host
>
> I see all of this as either very misleading at best or a mistake at worst.

This is probably true. It does look like a pile of ad hoc fixups
rather than an overall design and structure. Maybe it's possible to
clean and simplify?

 I'd say if you resubmit the patch with all the extra research you did
in the commit message, that would help review. I don't have objections
anymore.

Alex

