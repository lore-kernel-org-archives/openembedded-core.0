Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F31CC28D13
	for <webhook@archiver.kernel.org>; Thu, 25 Aug 2022 10:07:28 +0000 (UTC)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com
 [209.85.161.41])
 by mx.groups.io with SMTP id smtpd.web10.22097.1661422045999086599
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 03:07:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KG/f68S2;
 spf=pass (domain: gmail.com, ip: 209.85.161.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-oo1-f41.google.com with SMTP id
 g5-20020a4ac4c5000000b0044af7c8c4b3so3249399ooq.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 03:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=GA9UJ/SM6avhZfvus9SzwOcp2QlT5/jd82dAiaG7dtA=;
        b=KG/f68S2dm8ggb34N+swxmNAjX+CjkrW4uqsPH17iWVRwktjegkU8AUMK4tq70sLR3
         XsXsvbt/nBlH/vLt2NlKlvMs8jkMb3yamzdNo/HVFK/UURsXLtC+rpm4Iy5EiaXLjrbE
         JdVlG8/WktOFEmR+oGT1w6qlxfycJtwkx0PbpLJ0T64wZ7+Nf/tMIQ+6cclNg/6sq/Kz
         UNrHGSEXFpxMX3WYSuYV7iNI++ddHRqvkz9HKSLD/ZY942FCjbDX/4emDlnuWv7c02Vo
         rFpK9K7Ww4dwBmZrx0B8NPtIf7jNzpNSh1nKtJ1VTficSINr8GFOr4Gt/VbrLLi1VrSD
         dQrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=GA9UJ/SM6avhZfvus9SzwOcp2QlT5/jd82dAiaG7dtA=;
        b=AWOBnIESGzFxygY1d0YF50OP+xRW9msXodNuas/g9yi/R7t5BAEqQRPWb5ogXJaSN9
         p+AcrfMYmjp6ZPknb6kFs4Cw6i+hZUn17+YklvPsN4weNoyWE6pg6txPStpEG5Sn2iPK
         t/1VCaJx9YA+ZYKkjwzdMToWB/5kvPQ6+ViOzH0rIZx12ts4zm+jDHDq/IGaSWMu9fFr
         Fpb07X8npFVPQYlEyyOHLudm2wmV9/jHcPKV5mEN+f/VDsIaLnE0tQPcm0d/zfEJlPqy
         Dl0dQ1muHI3USOvvV7ZzC2jg4ImGNKEtLfyDzX4dc9XjMZC7+ftxiqadVVK053lxYsyE
         ZlDQ==
X-Gm-Message-State: ACgBeo0pt347wS3C3cd7MhwfIV9YQ1IwhsACJR2u3c9Wd7qjmnpDUmLY
	+TxQnoy+nSMgZxtvxtSIvOd74nE5ZEbI18sbc98=
X-Google-Smtp-Source: 
 AA6agR5u9xp8HUJ9ysGphNd0sxbJhESpwwFiSxsyxd2TU7On9nwKQYRVJTVZ2sC/WQ3kbfbjQMgqQFCQ18T/acy8A20=
X-Received: by 2002:a05:6820:541:b0:44a:907d:c641 with SMTP id
 n1-20020a056820054100b0044a907dc641mr977470ooj.65.1661422044981; Thu, 25 Aug
 2022 03:07:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220819072727.2236928-39-alex@linutronix.de>
 <20220820022910.173452-1-Randy.MacLeod@windriver.com>
 <902d4b02a35afb561892760deb3084221e688bf5.camel@linuxfoundation.org>
In-Reply-To: 
 <902d4b02a35afb561892760deb3084221e688bf5.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 25 Aug 2022 12:07:13 +0200
Message-ID: 
 <CANNYZj_-e1L+Umif4oA5Nz=Sj__VZ3w0DbNHvJ7H2z4L+v5ufA@mail.gmail.com>
Subject: Re: [PATCH] rust: conditionally copy tools like rustfmt
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Randy MacLeod <Randy.MacLeod@windriver.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Aug 2022 10:07:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169842

On Thu, 25 Aug 2022 at 11:46, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Digging further crossbeam-utils has a no_atomics.rs file listing all
> the triplets that can't use atomic or have limited 64 bit ones.
>
> Sadly those triplets don't match the ones were using as we have
> TARGET_VENDOR in ours, for reasons. That will be why it breaks.

Not sure if this helps, but librsvg deals with it thusly:

RUSTFLAGS:append:mips = " --cfg crossbeam_no_atomic_64"
RUSTFLAGS:append:mipsel = " --cfg crossbeam_no_atomic_64"
RUSTFLAGS:append:powerpc = " --cfg crossbeam_no_atomic_64"
RUSTFLAGS:append:riscv32 = " --cfg crossbeam_no_atomic_64"

(it's perhaps worth investigating how this flag is used there)

Alex

