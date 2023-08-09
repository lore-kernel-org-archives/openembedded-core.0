Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B699EB64DD
	for <webhook@archiver.kernel.org>; Wed,  9 Aug 2023 11:21:06 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.85783.1691580064525612933
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Aug 2023 04:21:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=pT38K9vA;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-4fe0e34f498so11106401e87.2
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Aug 2023 04:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691580062; x=1692184862;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yAzes9MTDLloqkjiN4szbpgdIH4v1ZkiWqvEhiseVMM=;
        b=pT38K9vAXRjdyW3j5xXpnsIpE3Od8ByZsDyHStwPpmRSeRFMQOt9uauKg9xda8q4RL
         cGT6sjyRCcHxYvBxvY/RiyzdPp919VCE+r5BRSKOdgwdczg/mYCaw1qQ5w/WbVzg/27L
         EZbN3xpBuzVzu0hqJQ0fAaD3f33qa5RTpqRtuo7QB5tTX992MgU6HtFDRZKlQSKnOYdA
         v+1E9c2/znCJy5zEiXuVUc/YoPjEytZL7Q37/itt642d48TIvn4sI/FekBnKWulPx9ko
         XCh1x381siPkw2ba1FN/n5j90i9ZEC6VhSDqpiRrzpl3FDXiKDYq2CYnyCQHUf8LSQ5d
         D6Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691580062; x=1692184862;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yAzes9MTDLloqkjiN4szbpgdIH4v1ZkiWqvEhiseVMM=;
        b=dC/mF6i2QmzilVePT4AVKZCosB0KGwLr8Gkx3qIDR9wEEC+BCAbv/rLVc8vn6yBLZp
         FNhcboYT7JOSHNsG6pl7rFHWvEGGc+e1oQRqkhkbG65DkyWXCA9csc5BXvs9hcAajtnU
         G8m1aarfMucE+1mKZiNHAgPAM9XHTpY+pL415ZYD0/BvoYtN5nTALALFePqGSZkn2U2L
         /DZTIuoXJ5Jh4X5AItk5sE+nwPGvgXl4+5Hdu58NPKucfShF0QhdG8MXiVSZuGWIBv98
         5pv9E7gsxuo6yHYcsvdKUqvyll1fOclM/b1imXOE+0btw+2jK4Z6/3nRKaqLwo6POf8u
         R/iQ==
X-Gm-Message-State: AOJu0YwlkxlatvRoLtwjw7UFsQtO2TTUPLXFy4rRvc2duOFllQXNHk1n
	WkzzhnCEqHpMHk8gt5oxMh4xZle93MoOgWC13Xs=
X-Google-Smtp-Source: AGHT+IGv3v1720uEVprnBjw59P4Vku210tqdhqb481bUrY0ZR8ax9skc2Mrgtb58A9Guw7tq/ezLHLiSP9xGWhxsdTs=
X-Received: by 2002:a05:6512:31d3:b0:4f8:6ac4:84 with SMTP id
 j19-20020a05651231d300b004f86ac40084mr1918290lfe.8.1691580062379; Wed, 09 Aug
 2023 04:21:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230809084550.9390-1-sudipm.mukherjee@gmail.com>
 <CANNYZj_L1BHsg-9cV9LS84d6e7tgt_yQsqNOkUC2E2k0xepRjw@mail.gmail.com>
 <CADVatmPXY4MxwNaios=2AGOLKPn5vPPreuoSOLp1989xEnVOOw@mail.gmail.com>
 <CANNYZj_ziirujoVk+rPr1+zbg9xyHTsPYaLMbQF8QJa0djNstg@mail.gmail.com> <CADVatmM4PuUygcPU-e1GnYVXuxhfo8Qxey0evE___iHaA-NwTg@mail.gmail.com>
In-Reply-To: <CADVatmM4PuUygcPU-e1GnYVXuxhfo8Qxey0evE___iHaA-NwTg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 9 Aug 2023 13:20:51 +0200
Message-ID: <CANNYZj99Op26qQPrEVOSZgpE=HJ_6twzqsi+6O0_asPDfBc6gA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] kea: upgrade to v2.5.0
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Aug 2023 11:21:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185697

On Wed, 9 Aug 2023 at 13:08, Sudip Mukherjee <sudipm.mukherjee@gmail.com> wrote:
> There seems to be no way to submit a MR or patch. I have used another
> email (non-gmail) to register, but it did not allow me to fork and
> raise MR. So I have opened an issue -
> https://gitlab.isc.org/isc-projects/kea/-/issues/3007

https://gitlab.isc.org/isc-projects/kea/-/blob/master/CONTRIBUTING.md
explains how to do it. The key step is:

"ask someone from the ISC team to give you permission to fork Kea (ask
@tomek, @vicky, @ondrej or @godfryd or basically anyone from the Kea
dev team)"

I suppose they will do that once someone reads the issue, until then
you can refer to the ticket in oe-core submission (but pls roll back
to 2.4.x).

Alex

