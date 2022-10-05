Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7058C433FE
	for <webhook@archiver.kernel.org>; Wed,  5 Oct 2022 08:56:33 +0000 (UTC)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com
 [209.85.166.177])
 by mx.groups.io with SMTP id smtpd.web11.21452.1664960184337696668
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Oct 2022 01:56:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=p3fccYyT;
 spf=pass (domain: gmail.com, ip: 209.85.166.177,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-il1-f177.google.com with SMTP id d14so8032512ilf.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Oct 2022 01:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=hhcPKUg0xrZiZ+4XGPGbPJDRL8DSi493jezVzJgsw3c=;
        b=p3fccYyT1DaG8QmBenohBh1Xg5ZPEsN8ySt8qGDL0Ota/toUCPWVDLEPul9PhZRRF+
         G1i2siCw36Ayu4KE+K4TICSdaBt+/Qq3iLb5BEegwiJrzD8JOmRNzzUru73JIFXP8H9p
         zqW9SSC+c1mIymWZnPxshA8fCi64d6tCTX5IlFd8fKPji26vLLLhOkJCKymLPqEgkLlq
         rWIdVDxfIbPMR9rPKnd8hLKZzjCdzFX99RHHjeD2H7vBD+3PJoxt16vHevjDlmDKjyp1
         hR/LnmxRjiHbK/v+bZJVNRBH3Kl2csS+hCIx9P/KCBH6rZu/fyvecLD+vUcH6i0rO30Y
         pvGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=hhcPKUg0xrZiZ+4XGPGbPJDRL8DSi493jezVzJgsw3c=;
        b=iwr4dAyKwuMBsHKDCbt/dO7tsuJXcmOwy+J7rYuNo1sq/Kgx+FoOLHYxuAk6dO7yoL
         UPdx7lb0Tq19x52OGu4d22wtrBGMechFlGqq/s/YmWS0l9B/Uxean0+nH+w4MOJRcAgL
         ZLOmAGDfSF7Gi98qRhw+Cx5FN/fZoqEZYCIxbB37SQdaMfZ4L1sEQ+rDLA9QywiQszC5
         W8F0TXoF2rOSsKqMQUC1cqzmavN7hd6i954xU06f1aNtyda6+2tV25Fbl1QuDq/lw68/
         PSsBCkgulYzyZUSGU3eNDz7Qy+aMvnRF9t1zLKe38PD9hqU358PQFfun+iPjZeQ5qvXe
         V+rw==
X-Gm-Message-State: ACrzQf0RIvUZDA1/e8eC/nNPz0SnBn7X25BZ4cyM8vQKh4m/4UkbUffQ
	sPSULm38YTNV7IeXofJj6hap2aKdHSKo3L+ZEjk=
X-Google-Smtp-Source: 
 AMsMyM6uQDeJQSFfn+PzGjAy2cRu7MArmSM5zIkgUvEeG199qCzWzSsmGZon6/V7o3XHuAMbkFh4h7YGPvxetcVz2Nc=
X-Received: by 2002:a92:da4b:0:b0:2f1:525a:90e7 with SMTP id
 p11-20020a92da4b000000b002f1525a90e7mr14390182ilq.307.1664960183573; Wed, 05
 Oct 2022 01:56:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220930175520.2850089-1-alex@linutronix.de>
 <CAB=6tBQza_dU6PsUsn4ND4WKE2vxAwa_8Lh3seVck7bC87Hrdw@mail.gmail.com>
In-Reply-To: 
 <CAB=6tBQza_dU6PsUsn4ND4WKE2vxAwa_8Lh3seVck7bC87Hrdw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 5 Oct 2022 10:56:12 +0200
Message-ID: 
 <CANNYZj-Y-obgA204+_04vAHpJkx4b2PKTZOVphvguhgMRX1YvQ@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 1/2] cargo-update-recipe-crates.bbclass: add
 a class to generate SRC_URI crate lists from Cargo.lock
To: Chuck Wolber <chuckwolber@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Oct 2022 08:56:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171453

On Wed, 5 Oct 2022 at 07:32, Chuck Wolber <chuckwolber@gmail.com> wrote:
> Can you elaborate on this?
>
> I only ask because we are using this[1] and this[2] to build this[3] recipe for hardknott.
>
> 1. https://github.com/meta-rust/meta-rust/blob/master/lib/crate.py
> 2. https://crates.io/crates/cargo-bitbake
> 3. https://git.yoctoproject.org/poky/tree/meta/recipes-devtools/python/python3-cryptography-vectors_36.0.2.bb?h=kirkstone

As you can see in [1], crate:// fetcher is not using cargo, it's using
wget - so the question of resolving and listing dependencies from
Cargo.lock falls on the tooling that writes and updates the recipe
itself. cargo-bitbake failed at the installation step for me (both
with --locked and without it), and in general I do not think we should
rely on external tools with unknown maintenance status. The lists of
open issues and pull requests are not at all reassuring:
https://github.com/meta-rust/cargo-bitbake

Alex

