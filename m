Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDDDAC369AA
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 16:51:24 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web11.945.1744298253998756433
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 08:17:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=cLir4qdG;
 spf=pass (domain: linaro.org, ip: 209.85.128.180, mailfrom: ilias.apalodimas@linaro.org)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6feab7c5f96so9525207b3.3
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 08:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744298253; x=1744903053; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WWIMyihSyIipIO/OY3aHPqT6C3YGFq06H4dy4dSQ0as=;
        b=cLir4qdGlvwa8EbBJpjaYbtoWA1RuFMeqOTRRhTv1LS95GaRSLEcAWPmzKQ1S0tKwj
         had2hQMqaM3i/SOOuHmXdY+HuAbYqLc1+ta82xfoSzlLolQMTe4FxUZyqjutPbPpnDOp
         KFmcal87WJcgh5QgkTfAusoiilw/X2FsJ4YlLO9Z7/nk9AVHalBBEFoA0VjOxJ2ruRyQ
         p5TFGq3LiPAEoAYgGBzVjjileHCxgVOXwGFMXhH5COyx9UVJkMrcKWyA99vaMUSEYnPh
         wo/O0GR5Q9OdqLQA6c3J76+rl22yK/cMkOFxWsM29p3cTwaj+yRF2P9ppDpIbLDkgGCB
         FxSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744298253; x=1744903053;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WWIMyihSyIipIO/OY3aHPqT6C3YGFq06H4dy4dSQ0as=;
        b=oq5ppmNIDcl5UBRHegEfvS7CJ7gFiP0iCGMPQCxoM7oQX2ggzAI2i3HKGm2s1+gUQA
         uJ5IlIsb4M5JKitiIj8s0jyndB5j6gmVua2PRyyUQgqty9GtrZ3NhZor8YSBXMCFpldY
         E4qpZc3MUiXEMyoaECtL29BghfQuLWuvWb2De2x9s7fX4fqyyzcIh72fm7oJIlWwcJKa
         JD2Ep4gtmGrGGaVLVCXzGUoaeT2rZNJPOx3vIBuuEeFd2KfiuH/dCoZ+CZ8axybNE38I
         MiCQoNoL3lF6cRH0+yPQv/KZHCh/i3WInxVWVT8hw6qDRsmldWU0knDnsPthl9p1H6or
         mMQA==
X-Forwarded-Encrypted: i=1; AJvYcCXp0qjqVWY+dNhrMzsqHSVHZAnioMzZz/XEvl3NQAuEr0n9baWor9X34xcMR+WgYFyMH6Ef+Qjf/LJe81O6iylgsw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw0lFDvKBPh033voHDfoTzTSUYaA+8AT/cKYiFEsJh7CnQZpN+z
	QdDDZZ7PWO/UlKb4cT1QTw+5KiVU88NRQNp35GsFolDtmTAAchu5VmgCzHe7GFfB5qyruRwoWZo
	I7qWthQkmhfEqp5E1+avm/ei5q7m67Vyt31JrjQ==
X-Gm-Gg: ASbGncsItoOGSjYfz6CIAlRgWv8gSHNhoyfrfHszbPvdCB/8VgMb3fey4wuDocJ0nE2
	ei2NjJdcoNa1Mp0ClobPOdcKtVPTcoHekH9Fj4MAs23zY01QDpwsfkxXCSwXf/CLUS2US//ZrZb
	i11Ppwn7Z8IneUNI2Qmdjrnk0=
X-Google-Smtp-Source: AGHT+IFtCSeUdzumO4qvcEZXOigMlUNA+Njw93eVk0qk/DhL1jtqMde7hWva3csTupuM9PrtAkeWVTdrfOzF83J22S4=
X-Received: by 2002:a05:6902:a91:b0:e6d:ee8e:876c with SMTP id
 3f1490d57ef6-e703e200053mr4868639276.43.1744298253091; Thu, 10 Apr 2025
 08:17:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250404162932.447699-1-mikko.rapeli@linaro.org>
 <20250404162932.447699-2-mikko.rapeli@linaro.org> <f84af1a6585338787539ee5be5826adbe434e8a9.camel@gmail.com>
 <CAC_iWjKTmSEOe6HUcPFUZLaBuA2+6ZwOYaYiqK0_R8KGNPU1Ug@mail.gmail.com>
 <CANNYZj_eA4k+pRLG=8-V4WEmsthkh_o75fZKOcoTf+00QW2x2A@mail.gmail.com>
 <CAC_iWj+80LnSOJ=ZeMos4psFwQ4zqt8fo-e13+8sPuBtsmp5Dw@mail.gmail.com>
 <CANNYZj8rsSWX7GL_mqQz3h==31wKsA_myVAHbGXdUDv+O7YsXA@mail.gmail.com>
 <CAC_iWj+vw=wUJYb4MDWJ3KoPrECwzr4wNbrJNpDvC=o=QWFJqg@mail.gmail.com> <CANNYZj9dJyOavS3ag-jbfyTd8q252RFU3smmFtFpKa_yEkKsqw@mail.gmail.com>
In-Reply-To: <CANNYZj9dJyOavS3ag-jbfyTd8q252RFU3smmFtFpKa_yEkKsqw@mail.gmail.com>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Thu, 10 Apr 2025 18:16:56 +0300
X-Gm-Features: ATxdqUGImY3B7z22y1txCmq9MMBiFF_iBWR_AFgAYKjJsojoZxJueg_ztNywYRw
Message-ID: <CAC_iWjK1FYo93kJXhuo4EY5y+DTKT6urA1mMf2FrPX4joB71xg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 01/11] systemd: enable efi support by default
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Adrian Freihofer <mikko.rapeli@linaro.org>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 16:51:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214687

On Thu, 10 Apr 2025 at 17:52, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> On Thu, 10 Apr 2025 at 16:39, Ilias Apalodimas
> <ilias.apalodimas@linaro.org> wrote:
> > I am going to assume that by 'boards' we mostly target embedded ones right?
> > The majority of those work with U-Boot which has a pretty capable EFI
> > implementation nowadays and supports a variety of filesystems.
> >
> > P.S: I am pretty sure that EDK2 and servers support more filesystems
> > than just FAT, but I can double check.
>
> We're talking about UEFI firmware, right? The thing that reads the
> bootloader from ESP/ on storage and runs it.

UEFI is a spec. There are various implementations of the spec. EDKII
is one, U-Boot is another one.

>  Is u-boot or ovmf used to implement that? It's that firmware that I have scepticism about, not
> the bootloaders.

We are conflating things here. OVMF is an EFI implementation for
virtual machines coming from EDKII. U-Boot also implements EFI, you
can boot a kernel directly, or grub or any EFI application you want
with any of these.

/Ilias
>
> Alex

