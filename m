Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D459C3DA49
	for <webhook@archiver.kernel.org>; Tue, 23 Jul 2024 07:27:40 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.38942.1721719654969453538
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jul 2024 00:27:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CQDwuvSI;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52efbb55d24so4021382e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 00:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721719653; x=1722324453; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zmS70sim/FqNMsGu0CfZXRTupL/llqgvRaF1TBc4l44=;
        b=CQDwuvSIuu2rmONucu1nmGQLwpBxby+aMijhzx1r7wQrVp30IePoRGMhoXB3VnGB4o
         fec9mW3IcqEAVFVdnPf/6/XLxkKG0LYhyoRHUuxCcSdDSzYI2RinGBPVh861HbFlpKrm
         4Lm3Ukj9LUul7y13v0JjTgnabSjp3QB1mGEmbF8OKzyDQWuBO7X9lsG8n3CkMtBwtItH
         h8ndseT0SRWOJ8eTsmuywKeETm8rAL2RlLvU57p/4Mq2eAnqYx17Sb0WwDrvONH6e/Zg
         07ExlmlMynJZZdwsm4vojh1DRhQ9gVCNjhptFhLRJGeqNLxJ2IEfWlAjBzXfAt2cTqKD
         S9RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721719653; x=1722324453;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zmS70sim/FqNMsGu0CfZXRTupL/llqgvRaF1TBc4l44=;
        b=ByNvpII8qVtSmtnuCXT+50mGuBEbscQWQ6uEBgP1Cr11pTBnfSiubleh0rslmJHBMl
         J45zREQNPcB0t3397JBcE9GqPiNmAofYLne5r9foSfhdvhN1AyLIIcz3uBhmTQRVIl3m
         EZ0d1LeyJj7K8JviHXUpb+sNlVu0thsHLARUPaZfQopDYECI23csHaFCKaLFbHNFVQ0Y
         uAOqAoUaxS9V08Br07N8752TjuTHTb/gQdcAp4Epd3bq6pEnV8MLTPCAuHhiWeE6iZN/
         61FTQiOCR7gGHFN6V4CP9+X9gpS/7TOo1otdbMgJ657/kSxUCGZj6VIBNEousFsxjyCS
         aRHA==
X-Gm-Message-State: AOJu0YzNaGQr3d0tZeYkaru8JKnp+FQLCZyrAPFZV1K4PVJQxYPZE0TZ
	+e9u8LSuN9U2xMrfhFUnRlcj0MJ2uQQt5Gd85wxF4yeYm3jnUTdjTvy4pCXfV7bHe/b0fFDihsK
	nVOpJ0IT7lvMMx37AeRaclFpT/gc=
X-Google-Smtp-Source: AGHT+IGf4VTjm9Jeghb29MOF2yAYLP/voRz0Kh887ANKWmlFkMMNb+STXy+e/7Rn3Y79jGgfQN4Z8EqJu+apNBNJBNo=
X-Received: by 2002:a05:6512:2304:b0:52c:dcdc:f186 with SMTP id
 2adb3069b0e04-52efb644461mr6719758e87.27.1721719652714; Tue, 23 Jul 2024
 00:27:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240717182216.1661015-1-alex.kanavin@gmail.com>
 <20240717182216.1661015-2-alex.kanavin@gmail.com> <c52ad793f05ea2fd92ee97711dddb29c039a175e.camel@linuxfoundation.org>
 <CANNYZj9fxRzO2pwUaYuDCagMEmz2+sa=D_56p-pWr+fq0yNF_A@mail.gmail.com> <a1a5f23710540de0b194503c8511a7394c1f1a81.camel@linuxfoundation.org>
In-Reply-To: <a1a5f23710540de0b194503c8511a7394c1f1a81.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 23 Jul 2024 09:27:20 +0200
Message-ID: <CANNYZj-5-aQ6_8R3PUhYPds5jX4HdzwjGZSfszY3iUD0FCPFmw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/4] lib/recipeutils: add a function to
 determine recipes with shared include files
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 07:27:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202332

On Tue, 23 Jul 2024 at 09:21, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> FWIW, PV doesn't have to come from the filename. We could set PV from
> the inc file and rename the files so PV isn't there...

That's fine with me too. Let's do that then.

Alex

