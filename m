Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56BEBCA0EC0
	for <webhook@archiver.kernel.org>; Mon, 11 Aug 2025 09:25:45 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web10.44353.1754904335166227582
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Aug 2025 02:25:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hvX1PkPk;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-7074710a90bso37107296d6.0
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Aug 2025 02:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754904334; x=1755509134; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uCDde5ru3BT4Vqdee9OvEdeMYKQl0Kl/+rmU3I55exM=;
        b=hvX1PkPkK5sa4LiJONEWkSSATa+poAV1fg/5dVGm150pBbnVTsgYBnZCCi9BwZzrAI
         4W9hp792PlK48+Na1k1eGrUYOvpJmBTsYCwX/FTWCOr9zH+3sRku5gRpKTehfxuEGxRx
         e039ADJY8jUz9cZNOZmXlrERXqourB5Ud80IHBiCtPv6jR7ofMlJQUGuPgIo/DWBSWjS
         i3nLszxTkQozcyqK5B7iMzefZa1jcjuaOirGfhUhFFiwjMl5GQSPsQZf83xpPlHSmwTT
         3s/qjDeYMovPGCjt1Ah30AaseSYF+r1dVZEiTcPLdHFwO6ac8OEYrIC8ypCyZi3C0XLG
         pK5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754904334; x=1755509134;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uCDde5ru3BT4Vqdee9OvEdeMYKQl0Kl/+rmU3I55exM=;
        b=ByVH7AL055cKMzbSB+JzFgQZ3+AU/XJVHvT0w534AZvmscpt0aTcdUsrQlVX7DzlST
         vrtDVwvpdbF0AgwVYeZCun8pxKcNKicr3ab341n/jy9pt5rdp1DPdkB1XUozuD+cYkAU
         XQc6kglN6Rofraxx2Q9GWR27GeElsuOY2tRnPN6z1pB+wcvSajEgTWJZTX2OiloiWO9D
         CtiQ4odMO2T8yeNEAEj33wh9nyhBAe+EDl0J/YeKC97lbGWan5mfnNctQX6fKXbVK9Cw
         T0S71lX+Is8czCNdRDFimqlVLx3az/Hmv7zbDRVPJe4g99OUmSJxu6ugjluF7GgtKA0F
         aEXA==
X-Gm-Message-State: AOJu0YwBUe96ww5lZE+nMkcJ7zqzyrqLrSbhpnPBgQ8WGhsLDSZcG7Mc
	w3yp8fXJfPUJMbCSlF+P4r3qp81+PwzIIMAlQOINxbJq9MaH4g3uv6yAjQ+ODGYWsi2xzfhoUaD
	bnuP9mqcVsqexyX6mZDKfn5RyOPAP+mQ=
X-Gm-Gg: ASbGnct6wxz2Lfs8eGLB2x3W6MPoDWXNcJrwDVEWoHMeeXrGRzpUnThc8exhmT51i1q
	eOVDiRLh0SD98SJYTQigj1BV13Jo/UeVCUoqg32PSHDq4KHy5oB7rsUKsF2ui6hazNZDhz5qTT/
	lrEFGWT6zd5Cvr8eknJXlsBk1KrngwelSgsJEMlKx+Z5IM3ml/IZxSXQGBZ6R43qZUNXtYTnDOp
	c8bDes=
X-Google-Smtp-Source: AGHT+IFh0mBR5zm9T8ZfQH2264pWWjTa7VIkatZ8nYktCLi5+Jas2IPfWCfb3bN4+FfLOwHsZTx5j8wO6yco8NEpzOU=
X-Received: by 2002:a05:6214:2349:b0:709:82d8:6c68 with SMTP id
 6a1803df08f44-7099a4a0544mr125933796d6.34.1754904334024; Mon, 11 Aug 2025
 02:25:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250810222523.2487072-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20250810222523.2487072-1-richard.purdie@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 11 Aug 2025 11:25:22 +0200
X-Gm-Features: Ac12FXzF4EkxSVBYXnA8DpZ2IzETcoirMhFRQo3vZMb2Etb_t6VQfDDxxhm7Z4k
Message-ID: <CANNYZj8e=BpGeFryh0+bn6sRT2jFRjJ=n=kwdVHMEaTx9YG00w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] Revert "qemux86-64: Reduce tuning to core2-64"
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org, 
	docs <docs@lists.yoctoproject.org>, Antonin Godard <antonin.godard@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Aug 2025 09:25:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221730

On Mon, 11 Aug 2025 at 00:25, Richard Purdie via
lists.openembedded.org
<richard.purdie=linuxfoundation.org@lists.openembedded.org> wrote:
>
> This was originally applied as our autobuilder had older hardware and couldn't
> cope with the newer settings. This has been resolved in the new cluster so we
> can go back to the newer tuning, which software is now more likely to need.

The other reason was that qemu's TCG implementation of these v3
instructions back then was very new and had subtle bugs which have
since been fixed.

This change merits a mention in release notes:

======
qemux86-64 MACHINE now defaults to x86-64-v3 micro-architecture level

The previous default was Core 2 era processors. This change means that
the toolchain is configured to build for that level, and qemu is
configured to emulate it.

v3 level adds support for AVX/AVX2/BMI/BMI2/F16C and other newer
instructions which are seeing increasing usage in modern software and
add performance benefits. Please see
https://en.wikipedia.org/wiki/X86-64#Microarchitecture_levels for
definition of the levels and lists of Intel/AMD CPUs where support for
the instructions was first added.

Note that if qemu system emulation is used on an x86 build machine
with kvm enabled, then the build machine's CPU must also be recent
enough to support these instructions natively.
======

Alex

