Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72DDEC7EE25
	for <webhook@archiver.kernel.org>; Mon, 12 Jun 2023 10:06:12 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web11.54758.1686564368054341598
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jun 2023 03:06:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=CVQwsn8H;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2b1bb2fc9c6so46515341fa.0
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Jun 2023 03:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686564366; x=1689156366;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AHpGx8imCgysUusnwU4It9Oxti1lGTzO9KyHrF+6HAg=;
        b=CVQwsn8H2L3evaD+I7cATKju/b0m8I3K8z21L/IjL09rY4BJpNjs103YJfFGlT63BM
         rm6FRkIjf187JuH1JNa3F05KueSSAXuwS+bW80/7qPJcAklhFZMlT+UTJdnQ8gnl++Bf
         +S6gTCBWNPkLIttm0ZBt9wQQwn5dScvSks69VyDg+mfpCuqrV64U/+BdpAdbNmQ6zhPl
         lJ3YatYMHKTv8VFIVb5ZuQGY9jQuEaCYCGwPmaHou2mjNIN2PDxjRxMnkP/PI9KXcp8/
         1zGKynA2ymHw477NIrw1YQdOaGl7O9Zm2Djpb0KG2o9Myl/0p9x22dXvOgIprlRdOid2
         FnLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686564366; x=1689156366;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AHpGx8imCgysUusnwU4It9Oxti1lGTzO9KyHrF+6HAg=;
        b=htSNXIRDJ7RAkL2V23gA+KoDnfXNo4xFsO/WQjiWOM5ZeFBZLrser+DSvfjAjiLT9c
         NxFUwJsTSPA03fNFUwJ3xq/gU6UngpRMIAje6WEKHkxOGIOkO/Wfdi7BYT5y58hY7KJR
         eHe7Am3FBT3Mj/OtA7j+DFTPkJGwG/eeYyFx+YyH9PXDxvDWGnUjS++HjSU/rIDGA3g8
         ysYswLNmCL+dtzhQ3PfmxcKRo877LBhHGpsJR7EWlNVcrsylTuO+AW5JEixFI9Q9XyWj
         d0iu/B5tOZgSlVgJ4Pe+eZuaxhpJ9G+ly1VlqXHqRkkdXxbP6LcaEXB7+3dQz9VqsfTj
         4CvQ==
X-Gm-Message-State: AC+VfDxS4ueQnCJJ1LB89A2um63hxyl/BwVsA743GJkSKe/peKahjNLO
	NuU/OnVAodnVMScIQAhLYpHDHBD2xCuiCaStXG8=
X-Google-Smtp-Source: ACHHUZ5TTUbUhQhTtseO6b2v/9zlxU+5nJ/hWJIQuWuD5oEWj11P7EFApSOv9LW+3oDcXid7j7Sjes66R5W25Si5Y2c=
X-Received: by 2002:a2e:9d8a:0:b0:2ad:95dd:8802 with SMTP id
 c10-20020a2e9d8a000000b002ad95dd8802mr2302688ljj.38.1686564366028; Mon, 12
 Jun 2023 03:06:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230610011339.3716428-1-rs@ti.com> <20230610011339.3716428-5-rs@ti.com>
 <DB5PR02MB102136F50D6C9E9121C9FD08FEF57A@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <CANNYZj99QKDuDc7oPaytFOUAeaiSL9y6WMT2Dmo5nLUTNNOLKQ@mail.gmail.com> <DB5PR02MB10213D04533C11ED783E5335AEF54A@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: <DB5PR02MB10213D04533C11ED783E5335AEF54A@DB5PR02MB10213.eurprd02.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 12 Jun 2023 12:05:54 +0200
Message-ID: <CANNYZj-UnVQmJYeYY=zHq2xEKXZXoSNJtraAor1HEkdGVqJFGw@mail.gmail.com>
Subject: Re: [OE-core][PATCH 4/6] weston-init: fix the mixed indentation
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "rs@ti.com" <rs@ti.com>, 
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, "reatmon@ti.com" <reatmon@ti.com>, 
	"denis@denix.org" <denis@denix.org>, 
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Jun 2023 10:06:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182662

On Mon, 12 Jun 2023 at 11:58, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
> Well that is of course an option, but then it may get messy if different
> people have different preferences and start changing the indentation back
> and forth...

I suppose changing indentation needs to be justified by for example
achieving consistency in the same code block (as it does here, which
is fine), and it never should be mixed in with functional changes.
What I don't want is lots of empty code churn that doesn't actually
make things more readable than they already were, and is more or less
an exercise in pedantic neat freakery.

Alex

