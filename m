Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C1E1C46467
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 12:39:30 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.22595.1673440769457798883
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jan 2023 04:39:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=O7nw198Y;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id bp15so23277673lfb.13
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 04:39:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RcgA/DmU5COq+aDNFsC2Jphrr/gukeRm4lSscim27VI=;
        b=O7nw198Ys3RjKO7MVojd7nZiUgGUYHzL191UWYbzmwlvzqMmHFges2jZcExY4r3A2I
         z1qOZ5vj+xqgyP7qsVOgYkpF3GZFtXCnvWu/+D5sTqcRwn9quSpSYya56QcSV1E7xg+d
         th27ap1c6jX5Lf6ZjllBY79R++NYP14VHNm843XYTMqoHWtP9mJXYGIZwDy/AsFNjn1z
         1oVPfmLIpOBZUvMVRKhRUD0K2sIC4mTwznpVPIQfV5VXNqM+9gyJ6PvmuxrjuEQLGiZs
         fmEFF0QXxYTdCsDyu7i+P1OtsRRJvDvjqdcXHXzhRlLSF3QTxvYT3hfEKS1cvjpqMDzi
         BpMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RcgA/DmU5COq+aDNFsC2Jphrr/gukeRm4lSscim27VI=;
        b=Hx2JuXw2CwapIwa/wh1SJTzSj9Huimcr5OzguBcOwVdK+76KzHGWhMjAVmUyynGWaF
         ixw5x2xz8SnxvTx4WydcvVrYaaYNWQ8pzKyRA/RBf8QRob57ywJAvf65VetMKuUVETNB
         KolTG5Iqq4LVaYqQ38VJ93Fi8Qpcxe2rVQzgzKBpFmbSeS0HL4PKqbee7gVsFfTgCIgS
         lFJsf6fIvOpzc3TXj1sfe2Pq7kfPJxFbZM9km2YBBJ7/8bur5QtMJ+A+uRQjbT/T1y3S
         b/p6BAm/AjafjdoW/+jhIeK690IVtPlKdWb5Ow0LIvFSQ8/ZD+2D7up75r9HpApEQi5Y
         ojzA==
X-Gm-Message-State: AFqh2kqIvu9lJCuUqUtXQ4x1TsWggafrDicIvHolS7rwLW9tFyR5QkSJ
	SKCiOfNjZ/+RzHIYFrTIZC3J2tXL6F6WsqmlB0U=
X-Google-Smtp-Source: AMrXdXtpQ038RGU5ajXFIC5lo1o0WdgqOBUuQfgflE1Qmo3zQcn91PzirnbA0UCPiBJ6x5hyF5rNjl+Su10E2uBGfSM=
X-Received: by 2002:ac2:4bc9:0:b0:4b5:4502:1323 with SMTP id
 o9-20020ac24bc9000000b004b545021323mr4300562lfq.345.1673440767375; Wed, 11
 Jan 2023 04:39:27 -0800 (PST)
MIME-Version: 1.0
References: <20230111110330.1507634-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20230111110330.1507634-1-richard.purdie@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 11 Jan 2023 13:39:16 +0100
Message-ID: <CANNYZj_h9cfcAUsH5-b-m-uJ1OAH1aLH02EVJWDH=Va4U2LSRg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] qemux86-64: Reduce tuning to core2-64
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 12:39:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175738

On Wed, 11 Jan 2023 at 12:03, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Much as I'd love us to use the latest tuning, we do have some autobuilder
> hardware which isn't ready for this yet which breaks KVM and some qemu
> user mode usage as there appear to be TCG bugs too. I suspect we're not
> the only ones with such hardware.

For reference, the TCG bugs showed up only in meta-clang testing:
https://autobuilder.yoctoproject.org/typhoon/#/builders/142/builds/10
particularly, BMI implementation isn't entirely correct:
https://gitlab.com/qemu-project/qemu/-/issues/1370

Alex

