Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73540CD1297
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 09:06:37 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.162346.1712739995528457049
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Apr 2024 02:06:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mzMxJ/tD;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2d8743ecebdso46031261fa.1
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Apr 2024 02:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712739994; x=1713344794; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EFs/Z+5of9uYv4GCE+TMmAO9AnfMiY4Em/9/IsVslQk=;
        b=mzMxJ/tD29N0DRXLc9sjTsKnRE77K15QT86w4GquWY/R84kGMDraLfv9hIuJtmLKJw
         hdxPzeg1dVTe2uLxbIyaBJY0muiCq8ZJdOqLnkAR561xzY0I1nZ2excA7nUasmv3RkrX
         qyi2VpTUpKM9EVP5svAox3dT/D2B2XNhrW64T2s0U4rgLnFBkzuj9AX6PmfPlMyltXBt
         8v2zNuX2tEj1Ak0mKWQxQ0CBqFyPJYx3b/IZ0XculT/MglGy2Edel64lL36go2Zl4jCW
         cA9L2ObgPxLZkZGp7bltsdJ+bJCi6eL1jmuOTIGcTKg0Ch7kdI6cZkm8G0bJJacIeeHw
         LTYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712739994; x=1713344794;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EFs/Z+5of9uYv4GCE+TMmAO9AnfMiY4Em/9/IsVslQk=;
        b=c/oRdPH1Z5QzM7iX5huVFLBLnqojL/mv1furTH+0dkw6pau4Uwuhtt6BnHMFFimT67
         hAWXM5I9c0ts0XaJNf0hycHuiNUAjzguYQodMAS53YE1DDS7LW4y0wDXZRdRhF0ZasXN
         2glj88K9rrcHqNp1JmH6Wj8tZgQTiKBdn1gOx019fM84Gc0nS3hKX9bCfJ0PZn/9TAJM
         9K1exdWSVj5LbG7l2RPxzMJCWvnNDJ7Rpt0XLEIjKyi83QY52KRdVeDp14ZnmwbY7Bc4
         N18O17Jp8SGPrIJmrWJVFycRN4l5lXefBL9R4oUNvE2ewihTF+YmfmyhSseYMmVy8Nnw
         fA3g==
X-Forwarded-Encrypted: i=1; AJvYcCX4VK1q/uxPUp41qIhFMGsC3xq4Qxj3jj+VJm8M7MRNyDrl4on4nen2x3Uxbe7h8zbjbnT1DroQ1yX0YYmuv/ndQts3YUJ0ETN0ge8u7GkMzf6QIxlkCSl3
X-Gm-Message-State: AOJu0YxjwyreydvFbjr+Zvz26O2r8z+v4vnuFVLRha34Q43NFFzwJsmg
	1eFDDBpC8dkklmBJgaMxP3uOzA+tvIY0ZZ/TUTw+/+JN52RVnT8nwKWvF569DThC7XZLuVUSzbM
	1qAzhMKVtRaAeg6a3EvC2h1sxkTw=
X-Google-Smtp-Source: AGHT+IHfKDmoXnvXzwrwod7rFl7K2WWsxgXWKZzo+y+jCKaV3pQdJ+XccFvXEmF9lOjdg4AbJqEZUTzTersll6Ycyfs=
X-Received: by 2002:a05:651c:21c:b0:2d8:9baa:50ae with SMTP id
 y28-20020a05651c021c00b002d89baa50aemr1645710ljn.31.1712739993454; Wed, 10
 Apr 2024 02:06:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAK5yBb8v4nejwGYPj3YYRQnz7xDeL_3v=dk3_RkrvJCaysPdqA@mail.gmail.com>
In-Reply-To: <CAK5yBb8v4nejwGYPj3YYRQnz7xDeL_3v=dk3_RkrvJCaysPdqA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 10 Apr 2024 11:06:22 +0200
Message-ID: <CANNYZj90YBS2YviX2CUwaJoEN_dwRK3MyGZ7LGmKmuTLuMf7Zg@mail.gmail.com>
Subject: Re: [OE-core] Yocto Project Status 9 April 2024 (WW15)
To: Stephen Jolley <sjolley.yp.pm@gmail.com>
Cc: Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	yocto-status@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Apr 2024 09:06:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198086

On Tue, 9 Apr 2024 at 16:55, Stephen Jolley <sjolley.yp.pm@gmail.com> wrote:
> We received some disappointing feedback from a key organization in the RISC-V ecosystem that the Yocto Project was not important and not worth funding. We will take this feedback into account.

Can anything else be disclosed about this?

Alex

