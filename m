Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9E51CCA480
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 10:07:15 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web12.52074.1658311632670525245
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 03:07:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=D2LIZ/8f;
 spf=pass (domain: gmail.com, ip: 209.85.167.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id u19so20607895lfs.0;
        Wed, 20 Jul 2022 03:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pucQyJV935U3AQvkBaC3CQuk7eoi02EU4sBmYl54VKw=;
        b=D2LIZ/8fmZKEguZmsXMtE1aAwyXxtUCDtgl4f9/XWrCmLkf0t6wilaL7oTTPTmtz1Y
         WfiflkhlKrj/r6NTXjeVef6Fhp2zR9EKxoFdo+TGa7ohsaPXqpcNBiLzFF/9CI1dYJCf
         oBaHJByljNEes6oMxLn4eal8jSthc5sWtobwQOlljR4j9eDT2VZsG/tGWmCufbUDULIS
         xq1EM7xT12jstmrXT44yQV2uzVGVBAGJLQrAsWi7Y2dQ7tsI/KHqDao8IwvKYiiNZVdF
         Z/4CgUEsp3OQgyjJA4RQzqCoz0VvXu0yOC6/IW3Y6bHfE0EX2Xnzub7T82s7jKFCFijd
         LvTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pucQyJV935U3AQvkBaC3CQuk7eoi02EU4sBmYl54VKw=;
        b=ko0Cpu3WlkEOLHkj68tIFHfFgrjx2K2o2h4k94yE3/31PyIXnSErvzE3GD/p5DTSAW
         JbZ/sMrCPmt32V9YwWNbyZwzg/75cK6LdE93Rx69XSx2b7CCxfq1NRUVuwOR5zY2ZfwD
         Q5rF59CNMO6cp1eWVaJ1jbgTkChWXw5hOqg+ZI/CqKFXlL4ezUH8GntXKw8MiLSFlvYc
         e5SwrOqB15McidX/igviRI7TcAGdZX1HBEJhM8I/dWMZkyazqsGdnhxNDoXPQVvI3sQ0
         nSoxJ/+mOm3PyhTXHSMLEi05qxKls6Iz+q5iG+aawoU1kyOUaaiHzvsWGXjmPTZrnXpw
         1SMA==
X-Gm-Message-State: AJIora/1oKCjc5SyBbyRGY5mPTc5P98Er2quJythkt3Xq19RertuEhot
	g6xed8PGg5M/TOAv/rht/zh8ELY37TR9/Xg/7DQ=
X-Google-Smtp-Source: 
 AGRyM1vEJy2yFp1/F2h+CE4GaI+2r91vgm4FUJj6qrFYEI2umfOMhwCX4WRbt3VsS/Eb2HEHyZ8v0AZMznV93SlQsuQ=
X-Received: by 2002:a05:6512:3409:b0:489:c549:4693 with SMTP id
 i9-20020a056512340900b00489c5494693mr18705389lfr.26.1658311630715; Wed, 20
 Jul 2022 03:07:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220720084442.2940187-1-alex@linutronix.de>
 <17037D268C38CE83.21682@lists.openembedded.org>
 <CANNYZj9KKfqK8fH6HB3mLP8Vhi=U-VCMOus1uAq9kUQ7+6D74A@mail.gmail.com>
 <ee397d3552782e6fd969a497e55396ff474fee92.camel@linuxfoundation.org>
 <CANNYZj8EVF79=r4agVTa_5rfqtsU_mdBu2bD8eLv9TbD8U3fHw@mail.gmail.com>
 <0A7591F9-3D0D-49E2-A067-67485A8B3B0D@arm.com>
 <CAF6bG8cvrkhXbRLYaJh5Lmi+Z=0txpJfiGJLY1Ryn8qt66oOzg@mail.gmail.com>
In-Reply-To: 
 <CAF6bG8cvrkhXbRLYaJh5Lmi+Z=0txpJfiGJLY1Ryn8qt66oOzg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 20 Jul 2022 12:06:59 +0200
Message-ID: 
 <CANNYZj8Q5cmiiQUFAx5e=26tnfum3h_Mmd+kUXnSxVS3_wGS7g@mail.gmail.com>
Subject: Re: [Openembedded-architecture] Let's drop x86-x32 (was Re: [OE-core]
 [PATCH 05/51] rpm: update 4.17.0 -> 4.17.1)
To: Marko Lindqvist <cazfi74@gmail.com>
Cc: Ross Burton <ross.burton@arm.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	OE-core <openembedded-core@lists.openembedded.org>,
	openembedded-architecture <openembedded-architecture@lists.openembedded.org>,
	Yocto-mailing-list <yocto@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Jul 2022 10:07:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168355

On Wed, 20 Jul 2022 at 12:00, Marko Lindqvist <cazfi74@gmail.com> wrote:
>  How much difference is there between x32 and riscv32 in upstreams? As
> they would trip on the same issues, one would assume that if the issue
> is fixed for one, it gets fixed for the other too.
>  But might be that relevant upstreams need to have much of the code
> duplicated (fixing one copy does not fix the other)

The fixing is often wrapped in target-specific conditionals, and so
fixing one does not address the other, until the conditional is
expanded with additional or statements, or checks are done from first
principles (e.g. actual type sizes).

Alex

