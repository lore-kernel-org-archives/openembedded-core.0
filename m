Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A255EC48BF6
	for <webhook@archiver.kernel.org>; Sat, 24 Feb 2024 08:39:21 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.15599.1708763960769281453
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Feb 2024 00:39:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IYKu955i;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2d0cd9871b3so10742531fa.1
        for <openembedded-core@lists.openembedded.org>; Sat, 24 Feb 2024 00:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708763959; x=1709368759; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=f/OWORFXEF7vwudiHHEY++T8b1O8TTFIo9sRFzsXMt8=;
        b=IYKu955i2OqrKBmFrpMcMqMxmn9DxXrK0lb+EWIN4Vd9VoOfELCoV1MtLhCL9NI9ps
         O4n1G64uvtCc89M1e4Z2yVbVwHICEaAy5BwwJhxkca1GzxpNww2P5+7SN+mOYIKvvGvQ
         47jVCWFnsLvzGu2EQDmts9CYEyVlQ3PE87oBeTQIJuTS5krQ0POyB7+MKNL7e4wCkc2s
         h3Scgia0BLsoO5bEspfEwRATVBZGun5bZyeUiwA8BcsMzhDyRk3Ep5FdHkFVFw0O3bBU
         kb1Ns8BTimk75ls7f93Maap9Wlk4IyZTzkqG2l1MzQyv1ajHjv15n5DcuNfolbn1inqV
         wzmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708763959; x=1709368759;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f/OWORFXEF7vwudiHHEY++T8b1O8TTFIo9sRFzsXMt8=;
        b=GZfsuhAW3NttQ+2aRrdFU8VOxcjBtm7SCEZxzlUDOEEZadwG8RdHkCWF3kI3UKYg09
         pgRKShAMZhLZZUGSo8nPWBMFk9oLVwTyJc4S3YjF30I2s7rbllZHmoyD5Oa/oLIqwQ+Z
         RxLpifYs/gf9pbj/m1DrU2cpXiBWRSt45x0So4N7t0g9twmw9Yfsj23sO28ffwmIU+0y
         /2YP3OHpTaLxZq6zIxCrrfeIIqLs1nXSqy8BevR1m6Tf7YgbqHuOhF4CtxLBYBp5/eDS
         RSitI7/ZTkgl4bHwXBE8JTqviX3w3MA+EMbW3Ihy7PfwyO9k+A2QGCT/GFKhdXZmBfHz
         1b8Q==
X-Gm-Message-State: AOJu0YzXTiiiHVvuuj67ouBfveXs3Dchnuo+CF742V70tt01sqKXpxzw
	k/5M/5ZcUp94/UShK8NMYfVAZQgxhNVbvuZ6EAthq9SUtx1Q2Jdl54OYVCOlqrsMrk823GkVLX9
	jnDgEbU4dYmBORY63vEb1OPCCbZeBNP+u
X-Google-Smtp-Source: AGHT+IH/WAqblKgIbms/K850LucLAtoFPgB+UOweEq5YM4LoD9M8h4g03vsRYLvdCuhn0in8jfNfyKbiCrH305taQ1c=
X-Received: by 2002:a05:6512:3ba6:b0:512:a84f:697 with SMTP id
 g38-20020a0565123ba600b00512a84f0697mr585650lfv.2.1708763958453; Sat, 24 Feb
 2024 00:39:18 -0800 (PST)
MIME-Version: 1.0
References: <20240223203051.1575654-1-jpuhlman@mvista.com> <CANNYZj8JykJuL+Q4hsM_xut_=7E45Bbt-W6NEQZRPP6R_HfSCQ@mail.gmail.com>
 <54ac6f59-e88e-4226-8c4c-ea2928cfa829@mvista.com>
In-Reply-To: <54ac6f59-e88e-4226-8c4c-ea2928cfa829@mvista.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 24 Feb 2024 09:39:07 +0100
Message-ID: <CANNYZj_wQJN+MjDrF=phXx0CmnyeEJ4f6WC_5t5R8i2hZa1mhg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] package_rpm: Fix backtrace on missing directory.
To: Jeremy Puhlman <jpuhlman@mvista.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 24 Feb 2024 08:39:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196124

On Fri, 23 Feb 2024 at 23:58, Jeremy Puhlman <jpuhlman@mvista.com> wrote:
> Is there a preferred way to do that? I mention in the commit message
> that is not
> the right way to handle it and followed up with a reply to the patch
> mentioning
> as such.

You can simply use 'git send-email --rfc' to put [RFC PATCH] into the
subject. And have the word 'workaround' in the header too.

Alex

