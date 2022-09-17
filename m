Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C249C6FA86
	for <webhook@archiver.kernel.org>; Sat, 17 Sep 2022 08:17:18 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web09.3964.1663402636301819305
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Sep 2022 01:17:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kTujjqDz;
 spf=pass (domain: gmail.com, ip: 209.85.167.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id w8so39044239lft.12
        for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Sep 2022 01:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=XF5GN6TSWpJp1f038T139hxpp4tnWfxh4dFLMdFWylw=;
        b=kTujjqDzQEzHeTLkSqkkmZltoMF4fQjqQiQ2c5PlN8hiTzXChyfkmJgKU5qgsdrANN
         PfYGHzSRWKesgOE+07tVHlNVyBsFHshhWKu+luHlA9dpUgATiQ51Isch95Jlgf0c72eE
         ALtrTDBtUxBPF1/ij6D8qW+n829qAmXur+QeGvMZWR2kHvLCg3ZD5dS7clClPbaYPvPj
         lojqcmLtBkDGxTgTO+8eHTWPMh0H2i9lZf1P/k2rzESvOf42KX1kUWZqpwjGYTD0s7yb
         2dQYtbGpQ1YXvJLSBTKFHP+JJmur3UFEK46DzbQZJvcsurf5B0F4I4P9R6vgGmLaIzuv
         LkSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=XF5GN6TSWpJp1f038T139hxpp4tnWfxh4dFLMdFWylw=;
        b=0R9dEGxd7EYA2L/ezhPh6RB+FuMQrfIIdImqud+0xGz2E80OGVFiNVg0H2cvgJC3x6
         HLdIj/QL7TzpmBWg1Uvt2VzzjccXtN3Z1x4rDNXmgYGvnFltYjX9pT3VZqpL3FAofPtY
         LyzfMGos3cX88dC7aJxTZKvALczKFZ1g7KIayTUGdoPLzKLD7Is0jhjgN/K6l+z5xd9D
         g0HAllt+Vz1AlzLns05bNznPnwb4I5D3YrgHInyFXR1PCO2HHHPVoi13wZ3DwhBOfadV
         5SVjNxhoCHJ+pKLUzeQtmpomupfemRWh6szQmt+yVA2/nryxc+SNjm5BUWjAUpF3zHED
         98tg==
X-Gm-Message-State: ACrzQf1JEUIXN0b1tTVB2J8kz5WxArFof5TRlDVwpuUCId4Cl7zXz8Jc
	t9kMKwt9Ek0vzA7vnbt4sBr435k98LCgXXoMcwQ=
X-Google-Smtp-Source: 
 AMsMyM6U3ITTaylOa/HEJVZMO1TheMywhm5CA+4rpwVJc8Cz2wtRx11DlfRqO4KNpNYi/omFkXvicT2OzDpULMd3O3g=
X-Received: by 2002:a05:6512:1283:b0:499:d0a3:3ca8 with SMTP id
 u3-20020a056512128300b00499d0a33ca8mr2757585lfs.665.1663402634186; Sat, 17
 Sep 2022 01:17:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220831111401.3330342-1-alex@linutronix.de>
 <e73f356f-87dd-2aba-7445-2f93ad6bf145@windriver.com>
 <CANNYZj-fLHiNEOLzp5etSQRwtNb55kHa4k02jzRRm=c3dohULA@mail.gmail.com>
 <6917e065-3b17-a57e-f862-90366717106b@windriver.com>
 <CANNYZj_OqjRgsQQwQditr1iHCM1RkZak-hFG-zEsqPmMfdNd_A@mail.gmail.com>
 <8e5b3cc0-bf66-fb7c-0199-ae6766c76cc8@windriver.com>
 <CANNYZj8owg_f1=g6VWVo-S6Qhq8VOgeYiGwQgNYQ5-GmbP8OTQ@mail.gmail.com>
 <8f083713-d00a-2393-3b74-35491e830bb0@windriver.com>
 <CANNYZj9nK6OXGEb0qHHSUz_UYn8QZt9ZSk5e_i-A76RPqMG8kw@mail.gmail.com>
 <e0a16812e51d41ada44bd388dea8a90b@axis.com>
 <CANNYZj9_wrEF7OvWYFX090ET1cG0cfK4w0J44a8zMHX6DRHYVQ@mail.gmail.com>
 <32f1549da2dd46e98476e2543be0746a@axis.com>
 <CANNYZj-tPjxFn9-BDDsr4vg4f8WTU4apVJo_=_TqKpuvjf93QA@mail.gmail.com>
 <e13500864aec4656b1dc14c92947a659@axis.com>
In-Reply-To: <e13500864aec4656b1dc14c92947a659@axis.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 17 Sep 2022 10:17:02 +0200
Message-ID: 
 <CANNYZj-f_T_7aJGLvgLYW+4+7-UHC6=K8g_GRfXJOgW6S+oBqQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/7] scripts/oe-setup-builddir: add a check that
 TEMPLATECONF is valid
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: ChenQi <Qi.Chen@windriver.com>,
	OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Sep 2022 08:17:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170826

On Sat, 17 Sept 2022 at 02:06, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
> Sorry, my fault. I forgot that while the build directory is created
> in oe-setup-builddir, the path that is used is actually determined in
> oe-buildenv-internal, line 42-81. And this is the part that I would
> have to duplicate. Now, I do not need all of it (it can be reduced to
> 19 lines), but it still means I am duplicating the logic from OE-Core
> and if that changes, we may or may not notice...

Then you can do it in the opposite order through the official tooling:

. oe-init-build-env (against a template with a lowest common
denominator set of layers, perhaps even one from poky)
bitbake-layers add-layer /path/to/meta-b
bitbake-layers add-layer /path/to/meta-c
...

This is better, as it avoids having to write bblayers.conf[.template]
directly. You say you don't want to duplicate the script logic; you
should try to avoid duplicating the content of config files too then.

Alex

