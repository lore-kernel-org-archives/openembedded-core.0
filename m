Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91B60C25B74
	for <webhook@archiver.kernel.org>; Mon, 27 May 2024 16:40:05 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web11.1774.1716827997976795019
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 May 2024 09:39:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZQOiZaZr;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2e6f51f9de4so139798761fa.3
        for <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 09:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716827996; x=1717432796; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eNt5fA82P32+ILvz8Ao25SsJai6CgOet6q3zgi5QPLo=;
        b=ZQOiZaZral/MBVEKY7uQFpbE/iT722M0MUd/sYOr5jus9WzLVyXjKiCAy9732nZfFu
         IwVcVlwdOwPq9HarEwLx4PzVCb99dB+w77hR//VmqTsTcUzB9qCAXRy/3pWzrA/qb6Xp
         PQnMdszHDM73szeRsqJZh66C6sImqvGnWkXDXbwV8seNHkrPb4Rteo+X4xtKmS+29ZZw
         zwFCFM2gUKsN2LGAaxqQKJ/d7l9W3LNdVfjkZ0GG/jTdGcoLpruBaY1QRGGVFXoJnCE6
         e1j5DkufWXWXjwe1h5Ty4dHIj+nSylSW+8imE0jXGoHhw8vtwTOFAY8zLvCe4CVdIccX
         GO6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716827996; x=1717432796;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eNt5fA82P32+ILvz8Ao25SsJai6CgOet6q3zgi5QPLo=;
        b=mbqFpvHgKJv+9KUynQKuZH07w/ZDsW1ovlE0Ht1L6PqrmZS3NgFQQRqnxuRIJG23zi
         oKJ3IorUuSOrj3Ft88Rpw4WCRtdGxCLY/imKEeg38jW9bRTpcZikHUsnpM2rB5EqEJ1M
         je53lq0s+PXilN+1WIPnXn1pV1XoV+HSdJLxIK/YkpjMGaPKpdcV9hZI4s7Wy6EnrMoz
         kDL/Q5e2CTv/a57zEDs1NC04sBLdaig+ghPbtsmib/gWYpevmFDDNU4YY8NmMdMBx5nr
         xv5R6O/suOrH5M8Y1VUBBAqOxuQwWvvKyo2hDYlr9kfEMq6gOfGB34fYNZoolPpFoLNL
         ZiDg==
X-Gm-Message-State: AOJu0YxvWBaPxPvJ9N6yOoCtik8Vu+YrCNhIgH5Q6ZtSKRxomQ7CHpPi
	FLu0kI9yWTxQUdaTzzo220WwQbxABjlaDt1QyiB1TEz6/pNBSUngFsk1Mn7WjB+2YLDzOvNIly/
	uDPo8oqNGDMH26xyIKkW2JB8Z4xA=
X-Google-Smtp-Source: AGHT+IGWMX1sDHzyn8twBqXgC2HqY07i+gEElQNO6HDyLOiHe9mxzsP2sE7qnFcCrEg+F4p4i4fx7+z0WtuykEibn9Q=
X-Received: by 2002:a2e:b005:0:b0:2e0:c363:f9dc with SMTP id
 38308e7fff4ca-2e95b256611mr83965841fa.40.1716827995870; Mon, 27 May 2024
 09:39:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240527161104.2954913-1-f_l_k@t-online.de> <17D364C190E1284E.7888@lists.openembedded.org>
 <CANNYZj8q1zqypRzFMdkt8hJ9bGGWjROW51EHO1P1fG-bFvCP2w@mail.gmail.com> <NNK5ES.VJH4NYNWIV9K2@t-online.de>
In-Reply-To: <NNK5ES.VJH4NYNWIV9K2@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 27 May 2024 18:39:44 +0200
Message-ID: <CANNYZj9iHD2sS7HNXrPLujxCVxe8JCygdtwpRTDUoLsWy73VmQ@mail.gmail.com>
Subject: Re: [oe-core][PATCH] ghostscript: update 10.03.0 -> 10.03.1
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 16:40:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199913

On Mon, 27 May 2024 at 18:32, Markus Volk <f_l_k@t-online.de> wrote:
>
> On Mon, May 27 2024 at 06:22:34 PM +02:00:00, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> With this error, forcing a cast may be masking the real issue? int should not be forced into a pointer to int, ever.
>
>
> Thanks. That was the information I was hoping for.
>
> Anyway, build for ghostscript currently fails and if the cast is causing the real issue, maybe it should be for now fixed like this?
>
> CFLAGS += "-Wno-int-conversion"

Someone sent the same version update but without the patch, so
presumably it works for them? Do you have something special in your
setup, can you try with plain poky master without the patch?

Alex

