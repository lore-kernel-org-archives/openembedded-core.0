Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AC5CC7EE24
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 05:28:10 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.5886.1685683688492329895
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jun 2023 22:28:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=ADianIOE;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-4f4b80bf93aso2167466e87.0
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 22:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685683687; x=1688275687;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=U9syFeiaXGo2fdDHx7XW1UUwnWGGX7TDLtlMSsYfkAY=;
        b=ADianIOE+w6U1dg8Fie3sX7oUeyiCxIoFJosM1WVckU0VvQoBDjttISebJ+mZrpFx5
         mQkcbuy2o/9D/vtX8hAzQLkn2MnQu4vjyebTO77X+7Id125AdaCmDcpMBD8WJ/YeDCtc
         n7W28XLpENDdaUmB7ukrkb88cxG/3Wxb6iVcKoDST+QAXfeSbqkoPgaJioZHGlY6k0RU
         naUDYzt2n7fGeTfm6ghWK6ouGAHOPL9qUw9XZHHKjKLX/3WzCFyTZER9F//CnQyNRr8i
         C5MTQvCZF4/r59JwdXnPRCII+Rk2GqGUIK/UIu9F4wyL+WQPPvOaxhkRRx0329ddWaxh
         hOew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685683687; x=1688275687;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U9syFeiaXGo2fdDHx7XW1UUwnWGGX7TDLtlMSsYfkAY=;
        b=BG54osd3dZp4TIWaxcJ4KLNao4sVAT0pTlMtEmTQYqFPV4M8mIA2maqKizREDg1nMu
         +GNUnMqMnT/mguGVnXVXNJJ7IbQg+pfrcagDPPcTBN0vBroh3pYRfIHblrBaXEFgCYm5
         yI1mWi3yF8agk6Dzdq2hj4b+66KULkqlBXCtlanHkpJi3PggQomjSSb3Zm4UgoE1LbxK
         /9v2cIRxVnH7ujUBlnlXaLNmZzxvVuQ6ta1U1tNF0q0ZjPDSRa9fbrA5oRjtMSuG6/SA
         1nDaryqOiHIyzhXrYi4I0l3Lq7Vr2RBTidO9yudVzfc6SZtPAO3o5SYyNKounw143XVY
         nDog==
X-Gm-Message-State: AC+VfDxAt8Z1Uzlt70Y2SilywT71bE8vQD/OxgIsZRhaHnZ1ysRMCIJ8
	iHl5BzMI9mJYHISwgq8IqwDCb5++GJNuK8ju8nU=
X-Google-Smtp-Source: ACHHUZ7BrqjyfpygkjfIEztPU8fb8dAROqTqckz8vMic43bbtPF+grvELQOb71UPqgbav/10NVJf2GQaiJdvS0pSY2Y=
X-Received: by 2002:a05:6512:62:b0:4f4:b28d:73eb with SMTP id
 i2-20020a056512006200b004f4b28d73ebmr1065363lfo.12.1685683686403; Thu, 01 Jun
 2023 22:28:06 -0700 (PDT)
MIME-Version: 1.0
References: <TYCPR01MB61918B757CBA93C6AD0BD80EA0499@TYCPR01MB6191.jpnprd01.prod.outlook.com>
 <fcf04863048c9e529df03a0bc034a8f86e468865.camel@linuxfoundation.org> <OS0PR01MB6178318FC4E138CE82A7D60FA04EA@OS0PR01MB6178.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB6178318FC4E138CE82A7D60FA04EA@OS0PR01MB6178.jpnprd01.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 2 Jun 2023 07:27:55 +0200
Message-ID: <CANNYZj-D9T0kiJGc6uY2CU-GAxrQBMF111kUCPsxBMTTG=n6YA@mail.gmail.com>
Subject: Re: [OE-core] Is aarch64_be under maintenance?
To: leimaohui <leimaohui@fujitsu.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 05:28:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182140

On Fri, 2 Jun 2023 at 04:36, leimaohui <leimaohui@fujitsu.com> wrote:
> > It has worked at some points in time but isn't part of our automated test matrix
> > so it looks like it has suffered from bitrot :(
>
> I have no idea about how to fix these bugs, Can you give me some suggestions? Or can aach64_be be added into the work of next release?

There's a hint above:

A full log can be found at
/ubinux-dev/ubinux001/build-ubinux/ubinux-202307/build-poky-test-arv8be/tmp/work/aarch64_be-poky-linux/fribidi/1.0.12-r0/build/meson-logs/meson-log.txt

Presumably qemu usermode has regressed in big endian mode because
nobody tests it, and you need to look into how it fails and where.
It's not simple, but it's not impossible either.

I think what gets tested on the autobuilder is decided by YP member
companies, and expanding the coverage also requires adding hardware to
the test cluster. So you can't simply ask to test more, your company
needs to join the project first. I'd love to have risc-v included for
example, but it's not happening yet because of that.

Alex

