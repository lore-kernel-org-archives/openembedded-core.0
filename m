Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BA95D3B7E2
	for <webhook@archiver.kernel.org>; Mon,  8 Dec 2025 10:40:01 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5573.1765190392385931603
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Dec 2025 02:39:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c56E5/kr;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-88043139c35so42550116d6.0
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Dec 2025 02:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765190391; x=1765795191; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Lp6tagZwUx8HOkvjkxwfUusw41kRLGbIzMKCKvCT40g=;
        b=c56E5/krbh8+Z/16dmIovnzwRfGIGvtUO35i3Fr3mxRqoxtbKMMT6BXBaXCyAE7Put
         pyrrl1T+EF3XzsAEnCsl1kMdItRkokDNaxi5EicH173pVvQHEUegxzVYX51jBTV0YWT7
         G5+EROaPCUeSXawEuGLo40KIN91oCoVuSeWFVz3lQv1GTQCgaj1sEzPE51T3JJ4+kGr3
         TUVwLtyy1sKZhaLy3gDTZFvrYDO18x2jyBTvqeRkegueLJC9KqqDe3ocJK2chTYqyOok
         GcSst7CMW1LdxX0vSY5m3B2G15Shj5sFNdpw4SlESepxEeIABugFprLidJYX0Oya8Q9r
         /ibw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765190391; x=1765795191;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lp6tagZwUx8HOkvjkxwfUusw41kRLGbIzMKCKvCT40g=;
        b=dNSH7NfbWUIoRxOZkmH7SDYFXSnOdLtQJ0CHfE7CmzDyNRM0h36k1dHsYMdLkiNMzY
         CcbSD/dchFAXmXKhr6XTeX51KAIrfRZv+qYXY4cb9dD7Jy/cGLZ+am8LHA1+QWwjBKn6
         nFGY4AwMzO327Hv5Ra/san5fnDLIMNlBwkQqUaX2xu99EKaw+KMFgPhRHp6hJdrb1j/W
         Vo+VQiZjymSYDmCDtF/hI/bQWd0CeeXmpGVYrBGP3s/A33CsVSj15MionCrm49eFXuAx
         xyezJkxd3oYaPVKnjGyPZGed+SKT3kpQuyrnZCnWZndqNvpE64Z/4E0nnuA0OvWY93lM
         2UoQ==
X-Gm-Message-State: AOJu0Yx7wSo+bWfZbL18H1d3CMdiTMS8CTKYSXHg2iXYi3/Zo9TcUkad
	V5QQW3ViM6tqjZd0i5ynK6zFS8MadRUEMchCIo4qnTX0RIlDCqF9L4G3KWh7y1MteJ8PVDs5Y+h
	KAkB07VuM03C1koYRVfnK/tF/ZOqhBahy+g==
X-Gm-Gg: ASbGncsrZV82kqQ2DyuPjgP2laMjANgG91yti9735sRpPu5+700Sume2i9rethhi+0R
	mfPnayGWZufK4tC3NL4Ta4mTrixsweGN58e8maeVAY3/KHlGuB/95SOd6cvUzI9cPojXk4V0LEw
	UPqR8L1obuNrpxVw0bZ9+Sr5+Mhg0Aw1C/iwx6m7zmSIPGaRbrirducNQWR2nbkQgHKK7OIb8Oj
	ocoPUM1IJEFkYf8S1WwA5igNTuB9aYttbpkoogqCwvfTDA2m9+6ByADWW68DKbWCWRUG3d1mfhV
	TN7OUUEK8+7D6TLb3pGO50L8zKxkDpF+GvWF6Dw6
X-Google-Smtp-Source: AGHT+IFaWy7DrLVWoSE1kS0983jmbMQAbZqYUJJ92StoK8Jxm/WaTlltzAqWkPZujqQFCpewLc91SC/p5azQsfH35ao=
X-Received: by 2002:ac8:57d0:0:b0:4ed:b6aa:ee26 with SMTP id
 d75a77b69052e-4f03fef6bb0mr97579011cf.55.1765190391118; Mon, 08 Dec 2025
 02:39:51 -0800 (PST)
MIME-Version: 1.0
References: <187F32821D48D4AA.919836@lists.openembedded.org> <a9ad5699-2bfb-431c-84b5-a72907ba4bb5@windriver.com>
In-Reply-To: <a9ad5699-2bfb-431c-84b5-a72907ba4bb5@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 8 Dec 2025 11:39:40 +0100
X-Gm-Features: AQt7F2owrv8qknbSdUSarLyHY1fAMThrVwoBeCeGNBmPtEOggpWI0qQkRglZb5o
Message-ID: <CANNYZj_dF96XaooeJP90LMDCk5XMuw3swcyZtEBW46sS+3mfUQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] go.bbclass: change GOTMPDIR to improve reproducibility
To: changqing.li@windriver.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Dec 2025 10:40:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227387

On Mon, 8 Dec 2025 at 10:18, Changqing Li via lists.openembedded.org
<changqing.li=windriver.com@lists.openembedded.org> wrote:
> In the following patch, you said "Additionally, the top level build directory cannot be named 'go-something'."
>
> https://git.openembedded.org/openembedded-core/commit/?id=9985b17a30bb9b9f1bc82a44662687db5cead66e
>
> Can you help to explain why it cannot be named 'go-something'?  "go-build-tmp" works well in my env.  if it cannot be named
>
> as "go-something",  how about "gobuild-tmp"?

This was 4 years ago and honestly I don't remember anything about the
patch, other than it was a pain to find the particular settings that
work. You can probably set up a yocto build from the revision just
before the patch and apply parts of it to see why 'go-something'
didn't work at that point.

We should be careful with further tweaks.

Alex

