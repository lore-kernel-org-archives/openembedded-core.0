Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADD98C47088
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 09:08:22 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.6650.1669799293348426966
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Nov 2022 01:08:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kOo19XfS;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id g7so25938866lfv.5;
        Wed, 30 Nov 2022 01:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lO9IEKmIB1NW17KFuN2K5T6lshfuAO4fy59ZqBtBfCQ=;
        b=kOo19XfSFiwS42rbz8KaOFE7W5v5dfz++rGx6RfqZKwEKq+r0KreFSEbRkXRFyKqNY
         AJoaX3vRVY4mIXSR/5VGWd0eN+rylCI/bmpws9cZ11xGSUv7q3KzExqbW62kZJnV6GRw
         U3K+sd3PQ6BV575K69t/VQnHmgbcWoKOeJbN+fuVRK+eAkDLf8VFo5PGSkI5TM3pmg22
         Wrrqa4VEdGdx9Ks4Zk50NmNUiuvVlURN4y2PNAWSXayk/A+mydCoZCXKpA5cpM3l/ogJ
         B1p6/1St8Bi0f/mwYN741mhVXKJrA6zZvzz/yMKGsx4Oxdt/IgHraM747alSO7uNI5RN
         Ey8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lO9IEKmIB1NW17KFuN2K5T6lshfuAO4fy59ZqBtBfCQ=;
        b=dAV2IyhjxX3q7Ava4fs3dylKiMsEisfyGymoM0iPxx7KJrkPuLPZmw+qok7vF1Hb7n
         9KSeqL+BreDzfnedeivRj8qS2pav9049NtUIaDpHwE+5BxL0ui1CMXxXgY8IiLUMOZsG
         Wd02V4CS9D3HTdhaLATfKLLrDXZRZ0QFDaDYwP469HVJvuoXT252+N2YggMklgR3UGN9
         vGFF0rGu+cs8QlgepQhNHyt4gd8IUh804ibwFLCkaYWkCNMYB+6Ng/F0Fky3WsZ38mdL
         rOPhZdHm2lJD/3mkKq4uZzxnX+6BNZwCHAw7y8EB+yLuu5J5d2RYKbjFfTK9PPPrSDZM
         sV9A==
X-Gm-Message-State: ANoB5pnfSRyj0OU82SQF27QGJSuRHV9O6wRR8dxOMW3Rxk235mcnG2Hh
	oLm5Iv+9dGXXulDTIIgS9fGHxqnSHf2uzQmTwNM=
X-Google-Smtp-Source: AA0mqf4B8eaM3eJdH9jilh+TuRFzGLZ/OCBlVaxTF1MGO/0oCbfOaYLmlf0yi1rkrFX2jUFzpLPNtmowXuMGmMakf+0=
X-Received: by 2002:a05:6512:3b9b:b0:4a2:4aad:8fff with SMTP id
 g27-20020a0565123b9b00b004a24aad8fffmr19204789lfv.445.1669799291284; Wed, 30
 Nov 2022 01:08:11 -0800 (PST)
MIME-Version: 1.0
References: <0b6801d90409$885d6860$99183920$@gmail.com> <CANNYZj8Y37+s6Jzo1XvX0uCYNFc=NqOH8PWrFSL9_=TOS2ja7Q@mail.gmail.com>
 <20221130092832.62067104@wsk>
In-Reply-To: <20221130092832.62067104@wsk>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 30 Nov 2022 10:07:59 +0100
Message-ID: <CANNYZj-31p1n_f_oh3+Le4O4vYrRLquvYxzdAk4uY+EOeS_V0A@mail.gmail.com>
Subject: Re: [yocto] Y2038 proposal
To: Lukasz Majewski <lukma@denx.de>
Cc: openembedded-architecture <openembedded-architecture@lists.openembedded.org>, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	Stephen Jolley <sjolley.yp.pm@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Nov 2022 09:08:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173997

On Wed, 30 Nov 2022 at 09:28, Lukasz Majewski <lukma@denx.de> wrote:
> Please find a few comments:
>
> 1. There is already provided meta-y2038 [1] to test if 32 bit systems
> correctly support Y2038 problem. It uses qemu machines from OE/Yocto
>
> 2. There are ptest available [2] to validate if the Y2038 problem works
> correctly.
>
> 3. Support for running ptests mentioned in point 2. is already
> available in the poky repository [3].

Thanks! So there should be a

d. 'glibc-tests-ptest' is executed across all architectures - probably
as a machine-specific selftest, and as well with qemu time set into
the future.

> It looks like the meta-y2038 can be used out of the box (after checking
> if it still works with newest poky) when added to the Yocto Project
> build/test infrastructure.

Unfortunately I do not think that layer can be easily added into the
test matrix. It has its own distro and images. No, we need to maintain
a poky branch where the same tweaks and fixes happen. Besides, those
fixes would need to be merged into oe-core proper eventually anyway.

Alex

