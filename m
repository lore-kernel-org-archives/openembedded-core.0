Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55B12C4828F
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 09:15:56 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web11.14243.1707383747861054894
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Feb 2024 01:15:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aBd7Y2Zs;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2d04c0b1cacso19670901fa.0
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 01:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707383746; x=1707988546; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6DcxDt/yj8g0HNcYdqFOUfAFi/bdcL0h7x9e5kXrdwo=;
        b=aBd7Y2ZsYnC51plHdLf8vWe7LWZE84YNF8JKkXXGDKkizOgkeOqSTN6KAkrvX3a4Z6
         7C1zcAcC7nfQeHC0ktmInLVs501S1YSwmK4FAKT5w/CxhgNGntQfTaO6WaAqqXHrj2wL
         /refa2AGRtf5avFkB3DG0bhSVDJ72X16PKCEA0ogtf60ykFPhOzA/tgAwcxEtrh2m8tN
         Z1G3wpwcYOHojKx7dbsDqjWpS0ls9Kwq8urEMLLbNW/j3YefnpSgHRgiSJ+5KptJM/SD
         DEptO5IrCzIo8Mo+a9awlwJNBTVsLJHiNpE2bwlcQo3bfDKY2LfE4rwij26izdFK+lla
         wISQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707383746; x=1707988546;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6DcxDt/yj8g0HNcYdqFOUfAFi/bdcL0h7x9e5kXrdwo=;
        b=mj0yRh9I0cp88vsvQrQS+KaDsICDXpkagd4VaSYw0FWThvuy77f/XNusKUAS2L/3aV
         mFk0+c0wJTAzM/Y3npUfGf3JiwN0LOb+XqjIhHnER/etGpiyX3PyY335HXJ4LoehmCTK
         NGqODMNK0linuDYM2wkPFQqhxX9ADqJsGsaY7qFx/KVvQgmTBRzF8NgqvmkSaA2UUFQl
         um47J4/Mov5Sb9xxknWyoSUcaA0WYfGVQW9OmfOpxpKWgKtYnoHW8j/Y3q3QJ8fByaia
         KLva+sPgAFea6xc93w6Q03t6vV5uMAhaP+yTpCixaT/NEjowiBArDJIKqeAO5LZLY4y6
         djWg==
X-Gm-Message-State: AOJu0Yy6byk8DLphoAnQHDRD4VgOJg22OYuPBLgQA67aXYz+xEXmlREL
	nTfYHOPqZjiqoptisTaON2MZ9GlMistSpEHoUfevpkcPGoMqbuFlzzJoRmRD5ZHfGwUsozWKKul
	FKKq/4FFvROKm4lJi/n2HKOP9zug6hOPS
X-Google-Smtp-Source: AGHT+IEp67M8IS5Eu677tAyjfJ9qVnm95NDzRpRtLzVJFNc7HLSnMT6BWVZom5hy10gF7qeLOFGZzQrYE1WOh6r8nWw=
X-Received: by 2002:a2e:9102:0:b0:2d0:b003:95b7 with SMTP id
 m2-20020a2e9102000000b002d0b00395b7mr5854968ljg.13.1707383745716; Thu, 08 Feb
 2024 01:15:45 -0800 (PST)
MIME-Version: 1.0
References: <20240208082821.430510-1-adrian.freihofer@siemens.com>
In-Reply-To: <20240208082821.430510-1-adrian.freihofer@siemens.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 8 Feb 2024 10:15:34 +0100
Message-ID: <CANNYZj9_BtkgYOuu0YaemJK5fONV4CoERvCYquRtCL6=moc5Eg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/7] python 3.12 related fixes
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Adrian Freihofer <adrian.freihofer@siemens.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 09:15:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195123

On Thu, 8 Feb 2024 at 09:28, Adrian Freihofer
<adrian.freihofer@gmail.com> wrote:
> - runtime_test.TestImage.test_testimage_virgl_gtk_sdl: FAILED (1454.58s)
>   No idea why this fails.

If you can show the error that happens here, I can take a look.

Alex

