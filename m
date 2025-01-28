Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C001C0218A
	for <webhook@archiver.kernel.org>; Tue, 28 Jan 2025 11:52:17 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web10.15800.1738065133629425704
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jan 2025 03:52:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K/nZTQsN;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6dd5c544813so57713576d6.1
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Jan 2025 03:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738065133; x=1738669933; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RPew5rbn3QVRu2GmMOfX8JCMc5c0Z0nocMb0bZR/IZ0=;
        b=K/nZTQsNEG06ttUR32h4sspFjRFA4pnlcL4a/UrNRJIw6tzklq9WTsD72+5fGISdQB
         Icv+nXjEOQC2Ucd4Mmi96f8g61Rx1Hj3+TY/iDczDVRC8mMS85ZzVg7lLuXpY4mwytKD
         jS4F4KWky7qp2VAhTJi1GVMXtRCTwPhqd0cGTaopwiE/r/HHNf1sHQvPdFFgiTW0fWQO
         fYJKBbZY5Pd7T2xlHF+12rjVe1opZjoH5GY3TiHGLHBg925MZmslfftx7tozOaCLab8F
         5TnRjfxSod9FVD6p1y5W9bUsy/lFdEF9z8PZNCCrPPM1NV7PjkQzfOqAqk3sFesVss3j
         EZqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738065133; x=1738669933;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RPew5rbn3QVRu2GmMOfX8JCMc5c0Z0nocMb0bZR/IZ0=;
        b=dbU4HeF1KBNrTiu7UX+rzE8mH1DbUvYCpILdgZaiZunYPON+S7EpyuiJlp5mZI43jE
         q+pPpwnC2gtHLwpU3fuOwrmcQbMLiaN+CIfAosNpu0IEtzocNieZ4fcRPmU7bRhGq7AL
         P8ffYYNgL0UxrE7sKolZzpOdcibFYy2tGrhVG6R4ZqTGE1WFWGQ416/g0LO/hpKEn9GT
         GsNy77J7kmmmtrf/cYZv4kvqAXGHuGHjTxe55vmbhVENjAMKe8WAg29HEedExkrYZXpO
         cj9O6bsinbomdi/ThYyAYvupVYO0qlXHdGrafKIrhxZ6K3Pqa/T9cfkTpXPvnPMGuKWN
         pEYA==
X-Gm-Message-State: AOJu0YxzblkRxmqgg+mJQLEpljn+ihxaP0p7Z4GELSz4mLEjNMQ5cxnO
	O88OK7IXV2Y0nVmHqQp5+9YtEmcRaQRCLYtThaRTtmkP6E5WjhyCSMC+USkowjyCSWd0HSs8Bu0
	kaD/F8HHdHAgp2qxLzKjAsu0hIVtPsA==
X-Gm-Gg: ASbGncsOQjmd8mYkuTpMA/z8WRFcXh97esjRwtwOFlZXsfMKcSXDgKIV4l8qXNkEE1T
	NfCZz2mot3K7akxO9SWLN3Qluqy7FMCCOT9CoDbsZv237pR4pnUnV7ZuSDdqBv3UpnOYEnK57TA
	yGnOoFNpcuokORj0xZ9nNusWRZI+RCthc=
X-Google-Smtp-Source: AGHT+IGysMP9Ko1/vfAtWfiJvPwXNAIMh236V2kBEVrJX+0PKmuKN9o4XTDLULf9DC3wkd+SWPu+4wqA1Zsdeuj7yF0=
X-Received: by 2002:a05:6214:240b:b0:6df:97a3:5e76 with SMTP id
 6a1803df08f44-6e1b21d13e5mr722255946d6.27.1738065132687; Tue, 28 Jan 2025
 03:52:12 -0800 (PST)
MIME-Version: 1.0
References: <20240726133559.1124668-1-sundeep.kokkonda@windriver.com>
In-Reply-To: <20240726133559.1124668-1-sundeep.kokkonda@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 28 Jan 2025 12:52:00 +0100
X-Gm-Features: AWEUYZmpXYKSfLT9bU07SPjfYUMPhERxAfEjYYaxthCepGOGAj0iZUNXjW_gaPA
Message-ID: <CANNYZj9V8K5upKxUdA8U4OXsdvt_+TTen=MogiVjJfqkV7jOOw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rust: rustdoc reproducibility issue fix
To: sundeep.kokkonda@windriver.com
Cc: openembedded-core@lists.openembedded.org, randy.macleod@windriver.com, 
	naveen.gowda@windriver.com, shivaprasad.moodalappa@windriver.com, 
	yash.shinde@windriver.com, deepthi.hemraj@windriver.com, 
	harish.sadineni@windriver.com, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jan 2025 11:52:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210319

On Fri, 26 Jul 2024 at 15:36, Sundeep KOKKONDA via
lists.openembedded.org
<sundeep.kokkonda=windriver.com@lists.openembedded.org> wrote:
> +rust: rustdoc reproducibility issue fix
> +
> +rust: rustdoc reproducibility issue fix
> +
> +The 'codegen-units' option split the crate into multiple compilation units for parallel compilation. Currently, this split is causing the rustdoc to generate differnt binary between the builds.
> +To fix this the codegen-units & the lto options are disabled.

I just ran some benchmarks to see how much disabling parallel
codegen-units affects build times (the parallelism is only at the
crate level after this change), and unfortunately the increase has
been significant.

As of current master, rust 1.81.0:

rust-native 527 seconds -> 853 seconds
rust 1123 seconds -> 1688 seconds

I presume the codegen-units parallel issue can be fixed properly by
adding a sort somewhere for determinism, but finding that spot is
probably very challenging. We do need to get to it though.

Can you please point to the request/effort to set up reproducibility
tests upstream?

Alex

