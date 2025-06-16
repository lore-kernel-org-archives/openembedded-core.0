Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D31DC71135
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 10:12:04 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.27040.1750068717096012013
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jun 2025 03:11:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UucUF54h;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-450cea01b9cso19426305e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 03:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1750068715; x=1750673515; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kMv9fOBKKqAp4aCRTEa+aAs4VCin+EyxCoA1V4RKwgk=;
        b=UucUF54hbTu4zFt+sP/uKw9IUK3VNAlYDyP4d296Hy73yRFRbbbWlbHAy0l+pc30SO
         jP9WDmBwDSga4Z4Xqpmyfq+GPT56a3pXuhQ0xXZvyThe2k5w/vvMP1zmf0G0eeewZvL0
         l4/u26mi04C4YGt2/nAODVW4KpR+4jHKbS4k8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750068715; x=1750673515;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kMv9fOBKKqAp4aCRTEa+aAs4VCin+EyxCoA1V4RKwgk=;
        b=OAiHWvwqZpW/PAFEVCpubHB1aQkELaT//1JKQAxbHz5eCGsmA4xSXXGxF7GuCl8GCS
         SSI9GetwLY5vUAtMCmM2mi8jlAXhb9J9CasDiefy3RnP3xLkSh1ed4IciQhgVxSaI8G4
         ws+9jDBGxD4ZHvNGHpsaLYIZwUflrghTF8jSs0rOPPpwljzssPDiJoNIKteTRKwaqi+k
         rcnW/It+g3MezFQQnUSwLrg1pIrDh0s06TggpT9OU010XUVckPLgaF1WXLeIKyGwJk9x
         77ZdBvyy73tdNpTb6aqEsnBYCPeUFuorL1Df+KAmQllhQ94w2BoS3EJucdPzfv8eI63C
         UXyA==
X-Forwarded-Encrypted: i=1; AJvYcCVxZnxYc32yYStTtMmWjjc4bPaLN24vqE5rRBzmr5+A2KipmsdrxsN0Ufz/sl6Jrvxyo+fmFzwOOxHD5ayJ/yII0A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwbHN4r33Al9lPR+mncKv0kV8yJn+JgccecZfykWFJkB5rXiZPE
	2CMDITfvQH1CMVfMoa4tDDGJNikMbFeb0vU7G2craHSuZUzmITyj5/U8p8DmZ3wj88d6EXKKh4x
	kQFhkBQw=
X-Gm-Gg: ASbGncsWfRa/k1Da6Nu6La9KDpQLvFFetJAnnCj3YALRAupeH5ZvgwrI7U+MqjoMa8r
	T/rEsQLZfG3iI3wa/j5dqd99BRbCxxTo/S7BqdqUhf/5Y5NNtiKTSH2ohLbBDH0kfqjACXsjNlM
	lPVGfwOyJJkP883QlhpW5l1kdHGqWWc+y1AaygPuEerj8BfAEyymhniZ1wtWGxWFwT+jo/XFn5a
	33Atg5dxD9DCQza5LUvpUoGnZYYenGJps7DP3DMJTbUzOFrPqm0QtcuGutehy8nlre2MQOTPWxg
	msUu48gT+zeeCgNKb6Pot5dxx8ftUP6LGXbaaDOM04m+a+wItnTipsTdxJRgYEjQtIerSPkzg+v
	gOZfpYq19+yNfko6Z+JlyXK6t0JeYuPB1svPYYGyncJmERiP5
X-Google-Smtp-Source: AGHT+IEMzsMpb00E45D1YCNlky7DsjCScF2JHCMKG4btcWcWU1Oh5tq+w2dDyLjyYdZBb6r6yOIkvQ==
X-Received: by 2002:a05:600c:35ca:b0:442:cd03:3e2 with SMTP id 5b1f17b1804b1-4533ca58543mr82652635e9.2.1750068715133;
        Mon, 16 Jun 2025 03:11:55 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a03:fc99:2a4c:41a2? ([2001:8b0:aba:5f3c:a03:fc99:2a4c:41a2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532dea1b1asm143269765e9.14.2025.06.16.03.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 03:11:54 -0700 (PDT)
Message-ID: <8bf4ccf58f9d948a5501c7eecf1daabc98c64ebf.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/6] riscv tunes: ISA Implementation of RISC-V
 tune features
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mark.hatle@kernel.crashing.org, openembedded-core@lists.openembedded.org
Date: Mon, 16 Jun 2025 11:11:53 +0100
In-Reply-To: <1750040965-15015-2-git-send-email-mark.hatle@kernel.crashing.org>
References: 
	<1750040965-15015-1-git-send-email-mark.hatle@kernel.crashing.org>
	 <1750040965-15015-2-git-send-email-mark.hatle@kernel.crashing.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 10:12:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218810

On Sun, 2025-06-15 at 21:29 -0500, Mark Hatle via lists.openembedded.org wr=
ote:
> From: Mark Hatle <mark.hatle@amd.com>
>=20
> This implements the following base ISAs:
>=20
> * rv32i, rv64i
> * rv32e, rv64i
>=20
> The following ABIs:
> * ilp32, ilp32e, ilp32f, ilp32d
> * lp64, lp64e, lp64f, lp64d
>=20
> The following ISA extension are also implemented:
> * M - Integer Multiplication and Division Extension
> * A - Atomic Memory Extension
> * F - Single-Precision Floating-Point Extension
> * D - Double-Precision Floating-Point Extension
> * C - Compressed Extension
> * B - Bit Manipulation Extension (implies Zba, Zbb, Zbs)
> * V - Vector Operations Extension
> * Zicsr - Control and Status Register Access Extension
> * Zifencei - Instruction-Fetch Fence Extension
> * Zba - Address bit manipulation extension
> * Zbb - Basic bit manipulation extension
> * Zbc - Carry-less multiplication extension
> * Zbs - Single-bit manipulation extension
> * Zicbom - Cache-block management extension
>=20
> The existing processors tunes are preserved:
> * riscv64 (rv64gc)
> * riscv32 (rv32gc)
> * riscv64nf (rv64imac_zicsr_zifencei)
> * riscv32nf (rv32imac_zicsr_zifencei)
> * riscv64nc (rv64imafd_zicsr_zifencei)
>=20
> Previously defined feature 'big-endian' has been removed as it was not us=
ed.

I tried this (just 1/6) and it caused:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/58/builds/142
https://autobuilder.yoctoproject.org/valkyrie/#/builders/45/builds/135
https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/114

Cheers,

Richard

