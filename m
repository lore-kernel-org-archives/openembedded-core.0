Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C193CD5BD1
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 08:45:01 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24009.1780303494455158773
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 01:44:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=V4p1TKVB;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-8ccd86df7d4so54133636d6.0
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 01:44:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780303493; cv=none;
        d=google.com; s=arc-20240605;
        b=ePqtze1Ovv5MKHX6J2gnreSCPyTyMsV/xPmshIpCCVVZHuAYLmf/HHq1YZZCZbTtnk
         RLANbug8iqZ+fxUVHHyYScvgXG7RTbNebY1IQQJjVH2ClbqPxUVclf0k/y8G98KdYMN0
         GSeJ9Gw5hAtVW2bs2e4w1gMjKmQdlnYYOxECie0+iOvifowA9/CzR2GFwOmW9QCtugRY
         GZMQBvI2NXEQh99svG2lkRACTxTF2hAuQxP5p55u1yvXa5gwPl1myLKRDDfabMSuPzgv
         VCN/m6+DMR0ny6MsL1C95hA+XMc6zZ4KI3qiAZkqMKq1bmoEpsGlG1OuQM6OZKEvethb
         b4ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5bs3OCnGu54pKu20CBiil7XESGAhtiLtsHYlx2awzUw=;
        fh=mknMAB465/bsbMm77BFD2bx8Fk8ciagIJ0ZJVcHYAd4=;
        b=e6MP/o9qJ7R6YA/Sd8wvq21fhy641wEX9o577mtiTy2iUZAgHg8Ec7UqQCWrbQSXGT
         pXnTBmr4VjQRTcRHtrTx5gXf1+dTajozNiCNL6oewRJDf2YFAr0dh3wKFKtHErXqTp2E
         KS2cz7PRtQY2q+ZtWWGFpcgcTr72PdPda8xy8jkMvOPwbXI/3kobHpeEjQu2DopHQUOW
         zxBbM/S5C8JD8fHjgmHjgGPjtLcIqDI/uw3RbdAkyDMy94whtJKY8ERQreX8XDanmc5/
         FqUdobfCxGjxgGrud/s0iY6E8OHZcVz6Q2rkq8Yu/aiATTV7xHtPXJb+Rj3ZgJDPz1Vj
         qYzQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780303493; x=1780908293; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5bs3OCnGu54pKu20CBiil7XESGAhtiLtsHYlx2awzUw=;
        b=V4p1TKVBGW+fIH5+Mp8NdGUC/v0jBS4fzNlbecMv9JkQoPExA4dne4a4v+GAAcFpRt
         BzVWjrRuKPkglMZLEQ7+oyz1XJWvyYFvHVOeXiFleKHacX77kqaLKozq5g7ENoffL0KP
         R3za70Q9cUnLMhbUizkFxIov1LfdkzIEbtaokQ4L4ip7tM3FJtqy/berqo+6K/N4m0Hu
         NNPyNrNB3HDaXwuaSgOTQDnwMZ5KNUXs/boSK02gLglxt6MjPh/7FPmFvktPpQX9saxG
         8NIZyViPCRvEKn2bNlQuANPk+suwkS4F2zBtZ7qsciKQjmdNrJ6sVOFyeOOn7kBAdY8A
         kp7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780303493; x=1780908293;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5bs3OCnGu54pKu20CBiil7XESGAhtiLtsHYlx2awzUw=;
        b=U+TeVMAjJBtiJwQqa38e1JjloH/Z3VWY/ZNgARvNyU5E0OO3OSGFF6Wio6DgmWWKXE
         NE/dzMEo6/2H9s/blIdf/iwJfDwDZu6pT5/EXKwoi85UXF9l/mZsvN5XnvSMdW8R5ZW5
         wIL3TPTxhEkrf6cSrQIIgsCX+3+1eL4/mVZQT6GobxnXlhhmRxF/Wx1TDjS+aSA8Kwls
         cA1yw/bvzqBWIJ6cXpZuMYVkbAW+rHYQLlj+WZR4HOIyI3V7U68uM0gTJOQvT5bDQBHc
         k10l0JWa32BC6tk2nSAPQ1wiD5jJxZWu3vLrSf7l9pjnGGfWMxqy6HwxbCE+CAB92nxu
         dCGQ==
X-Gm-Message-State: AOJu0Yxb+4Cj5acctVsG4nMVg0voLo9qNZdyMkI6+jF2C17Bd85ot/Af
	oA4yCEAQKHyVhKeHGjlIpNRr9PvvE8a73iePG1nhcK3R/aZu0bQL7YC9ZniPZjnLowuFe7yaCIa
	4szFmyRGlFQdJFrLX4PqflrRzPphDcXQ=
X-Gm-Gg: Acq92OGQtu8xcDrNvzUV9Wz7bhtbw7kUVt+RRrd5snIm8g6vr49o3KKRwsbbS0Dbxl4
	zT8PSPv5/ZW2VzhYWu7vugxRD3RH6VcT8cPvJSreWTbI6iCB3dZX82PGhlYwJodjPqil6xu/ph7
	i8YcPoBDQUf7gmbnIeDvd7+UDq54NC630q85/Bj8RB5w9hxWmYKIYDzMv9Tt/BZKRxdBeCQbTYZ
	tGgHGo35CBMvO8xftqr1Hm55Rat45osbUW5EWsi3AzHpay+0R3a3wQYiu7s9/OqD89C+U1lJUvK
	q4h18LacIqWBxlgHItFfLibbYd8trPF0E4KLHyRE1eqYAYkfuOhT
X-Received: by 2002:a05:6214:5d05:b0:8b6:7f3f:5286 with SMTP id
 6a1803df08f44-8ccefd62e73mr170665996d6.20.1780303493471; Mon, 01 Jun 2026
 01:44:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260601082006.1496-1-adityags2004@gmail.com>
In-Reply-To: <20260601082006.1496-1-adityags2004@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 1 Jun 2026 10:44:42 +0200
X-Gm-Features: AVHnY4LSEnJTUPyy56jrDKU9TlJK3ZpA3AtZPEjDqTrlZpC91A-UT8wBXBe1obU
Message-ID: <CANNYZj_V6GeZKVTpwaikLgeFO3h-9jVQwbM0Yj2Eyp8MWxED8A@mail.gmail.com>
Subject: Re: [PATCH] gawk: improve randtest stability
To: Aditya GS <adityags2004@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	richard.purdie@linuxfoundation.org, joaomarcos.costa@bootlin.com, 
	ross.burton@arm.com, randy.macleod@windriver.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 08:45:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237826

On Mon, 1 Jun 2026 at 10:20, Aditya GS <adityags2004@gmail.com> wrote:
> +++ b/meta/recipes-extended/gawk/0001-gawk-disable-randtest-in-ptest.patch
> +          file://randtest-fix.patch \

The filenames do not match. How was this tested?

Also the patch content isn't a backport, but an earlier test disabling fix.

I'd suggest you run 'git format-patch' before 'git send-email' so you
can inspect what is going to be sent, and to avoid mistakes like this.

Alex

