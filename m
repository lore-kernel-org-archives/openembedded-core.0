Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A0D9C77B61
	for <webhook@archiver.kernel.org>; Fri, 28 Apr 2023 11:55:08 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.17369.1682682898324879526
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Apr 2023 04:54:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=dYVugnlk;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2a8ba5f1d6bso95417181fa.2
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Apr 2023 04:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682682896; x=1685274896;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pmF97Sc9O/DoX4uN9rgbxW+wejEeUqZxghWlvDwBVjo=;
        b=dYVugnlkFFzFYj4vxqEKxBkakSZdrsBaqZ3IP3P6n3JRalhwGGJ0rUr4YN2AaFZeTR
         45FR7Ctj5HRoG2z5npTxCk0jU2pU/QPG2wduUObzJqtkeTNN/RkJEH97JuHE7/FtQCTP
         gxkbtvcBa0ioGjE/LJFJnud88wsW9aViVog/IKOMSlK8rzt+P/6WakqOpk0TZEUL+tLA
         8M6/RvKOTvJ6OQUkcmJlexdXNdUzbKZsAM5J9ymgduaFBkAO4/nEA5737vH/B2o/dvry
         isg3BmVpYf4OfjNbL7qoSylsnlcabAeuYLg1EpTAfVS8cTP4loZ5yD424d/46odmDZmB
         gM9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682682896; x=1685274896;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pmF97Sc9O/DoX4uN9rgbxW+wejEeUqZxghWlvDwBVjo=;
        b=RZOmtN5O4JZwJYrvtSFgr9GCt7SdEg75omgAG548kfSRjKcrQqjh03PHswdFIVvdhF
         6k886Yl3v52VE8Qd2gk3nePXT9EtqkL66WlOu/RBOpr2aZW0fkTT+fgV1c9hZAjPFDr8
         4B1Or+JxxR6pyJCbnjUpccn4p6EVF5fIyxcEnk/RSF9auPeFNJJ7o+lS/Q7+X9J1itwy
         OwpEztn6WtXaZkzWzjonLJdAFafKl4pjFx4/tVe3889hzR5AiW/cHsAwTyRho2xOAcie
         rfyW4TlVsY5syr9+DihABVUYUDEpBfvlyrAcVxH9ZYjKJ2myW4xmlnBhyCI2KiWDSvNV
         4Iiw==
X-Gm-Message-State: AC+VfDwMo+SBjrKJSYJeg65mGHy96+54VK19/8tEIdesib0PN6ZQJAi8
	9saD+4oT4sumYtlLfUR92eN+3te3glM/hNKvH5U=
X-Google-Smtp-Source: ACHHUZ4RWQhVAixBP8XEy1gbvEusIkhvf8svWkNaRlFHy+avvhdxrF/3xzol1kDRVgl201dC7KOMq3NmZjSotl1Qh9k=
X-Received: by 2002:a2e:8082:0:b0:2a8:e5b7:71aa with SMTP id
 i2-20020a2e8082000000b002a8e5b771aamr1358728ljg.20.1682682896145; Fri, 28 Apr
 2023 04:54:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230427073528.3956414-1-alex@linutronix.de> <20230427073528.3956414-3-alex@linutronix.de>
 <CA+chaQf+evL-UwG4RComw=y5zQfxbSN0=aXzVNQghL+ra_usAw@mail.gmail.com>
In-Reply-To: <CA+chaQf+evL-UwG4RComw=y5zQfxbSN0=aXzVNQghL+ra_usAw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 28 Apr 2023 13:54:44 +0200
Message-ID: <CANNYZj9HwdjA__9+e-3jbAB07HPjhhmuwWCzBJC4VE0p3bruFQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/5] insane.bbclass: add a RECIPE_MAINTAINER
 check (oe-core recipes only)
To: Martin Jansa <martin.jansa@gmail.com>
Cc: akuster808 <akuster808@gmail.com>, openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Apr 2023 11:55:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180527

On Fri, 28 Apr 2023 at 12:37, Martin Jansa <martin.jansa@gmail.com> wrote:
> I've seen many errors triggered by this and was wondering what's going on and it's caused by meta-security layers which provide own conf/distro/include/maintainers.inc:
>
> meta-security $ find . -name maintainers.inc
> ./meta-tpm/conf/distro/include/maintainers.inc
> ./conf/distro/include/maintainers.inc
>
> So this doesn't work well with:
> meta/conf/distro/defaultsetup.conf:include conf/distro/include/maintainers.inc
>
> as it "replaces" the file instead of adding more RECIPE_MAINTAINERs.
>
> I think this should be fixed somehow before this gets enabled in oe-core.

I sent a patch for this to yocto@ list.

Alex

