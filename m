Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8E09C64ED8
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 09:32:21 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.86384.1677490331708167184
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Feb 2023 01:32:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iUpZozZv;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id m7so7643787lfj.8
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Feb 2023 01:32:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677490329;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jAYeC7nvIH8O33/YMT2ChPbNE8Ir//xSSMI0FTZ5IoA=;
        b=iUpZozZvwWvDFC/qkT6qnAdB+aVKvqdE5ASUZp098XTM/wxCcHzw01wgX44PQlmuwZ
         4YL2/Ut3oary3h+x4EMyeuwcRwHoOAj66fn+2CjXlIxjRM7fGlfS18wBEYpozt7dSqhu
         nNvwq+EaeFthCiWurmY+QnUgV1vJPdSk3IbZIqKgwNJHn+K236yhNZvrKOEv5n+ro38X
         HcOW+DC6CTXcgmzlQHwDWXCWhG+eoattLckkXRrFjWH20ggDd/DOiZ7JRz1+7EgDR3YF
         a7+72Lin3Piha28LEgpQk59aO56WEPcjpu1lIsXa9SdgQSkoV5ZqNeH4tjONn31aNses
         JXlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677490329;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jAYeC7nvIH8O33/YMT2ChPbNE8Ir//xSSMI0FTZ5IoA=;
        b=VS3KSaGQls5M5zb0AlvF3nDaiF1JaXGxLXEelzc96t6K4ybvJbfPdQ/jVDLL+ODXWA
         CLlZbbqxl7Tubb7tsQzQcleHnR+xQ+yNLfDkDFjp0N/cSRDNDF3qu2OEDz8PmHoTm72n
         jRfIxl4PFA60DNF+5CqStPc9/FgzmW+ISAoa12fCngcX2PKq3sSbz1/jx3u1Uk2wdxVF
         LK7WBjV/7VRpTapbpGsgekerRkIReskVkMGBWw62HMMHzX2/efKTtKmkZFnzwfvN2Thb
         Iiiwf9rEd8Nqf7CXD61vHTkYjUcr41D1VBrgCBwUVBzwxv1X0fpohok+5TUFe7ybyEx9
         WU6A==
X-Gm-Message-State: AO0yUKWTtA5mrPBop3HsNvF9ZjwAUsmvmAQxk3y4E6bnJ9/LMf/LCnFI
	MoeKBgJnB9VUNG/UeMn9JsgpQvJD1muyRCR33pM=
X-Google-Smtp-Source: AK7set+xZmBSJTHBEA4R/q1a36+yGT77XEKKzdxBAhYRaZkfw3lzghIY0LcnLEkPwrmIMQplwNz+tYA5w50aKLy9N9k=
X-Received: by 2002:a05:6512:118d:b0:4dd:9eb6:444d with SMTP id
 g13-20020a056512118d00b004dd9eb6444dmr3568995lfr.4.1677490329620; Mon, 27 Feb
 2023 01:32:09 -0800 (PST)
MIME-Version: 1.0
References: <20230224093850.3393567-1-zboszor@gmail.com> <20230226050814.929055-1-zboszor@gmail.com>
 <20230226050814.929055-4-zboszor@gmail.com> <CAO5Uq5Qcyr4tywhEgJbFeONrrQW-W10i5Bp7iGHph0xGBeznUA@mail.gmail.com>
In-Reply-To: <CAO5Uq5Qcyr4tywhEgJbFeONrrQW-W10i5Bp7iGHph0xGBeznUA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 27 Feb 2023 10:31:58 +0100
Message-ID: <CANNYZj_5LJAp9RaVWh__NPG6UcAHf6SwxoKqg1w+c4fwA7ZeCQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] mesa: Add PACKAGECONFIG "rusticl"
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: =?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>, 
	openembedded-core@lists.openembedded.org, Ross Burton <Ross.Burton@arm.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Feb 2023 09:32:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177783

On Mon, 27 Feb 2023 at 09:04, Alex Kiernan <alex.kiernan@gmail.com> wrote:
> > +# Building "rusticl" runs bindgen.
> > +# This setting is needed by bindgen to dlopen the correct libclang.
> > +export LIBCLANG_PATH = "${STAGING_LIBDIR_NATIVE}"
> > +
>
> Could that be part of a wrapper in the bindgen recipe?

Specifically, take a look at create_wrapper in
classes-global/utils.bbclass and examples of its use in meta/

Alex

