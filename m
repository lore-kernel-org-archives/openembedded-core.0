Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6ADAC3DA59
	for <webhook@archiver.kernel.org>; Tue, 16 Jul 2024 11:04:19 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.8103.1721127851213901951
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jul 2024 04:04:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h2k3QoOB;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52e96d4986bso5471563e87.3
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jul 2024 04:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721127849; x=1721732649; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5W1nDNj62KI85UOoictAkgQq+YZtCrawlcUuuYZZRvY=;
        b=h2k3QoOBnWXG0hPjfNjgjfhERQ5jf6M7pLRD12pyJPcAJ9r2SIDyKsPlkOn+ZlH3Zv
         AKBJcYdzO00GPTOdUZqFn3BQxy7qfG27Wxp1lOtXZPSqjXUdaYEp+PJI6ZbibLdTek0j
         aUjQPeJYqZ1u1L9THYTx1EFBXz+0dWf2a6S60w+TtUsepIVkfrlknvsh0SZCdlrhNVk4
         8VI2yk0nHo7Upe24BRKfkdKOm5OFmwaTyXuaNPu0NKYcnBB+gGincqAIUhO+CzLspywG
         TF/IjJkBepvm78nH9bzztSH/AWJbQcjONZ8osUpLdATVIuXlp+t7IpspuT2JssiqUPZD
         vaTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721127849; x=1721732649;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5W1nDNj62KI85UOoictAkgQq+YZtCrawlcUuuYZZRvY=;
        b=qEnNLR76vn2mtbCPHkXKyY54WzZep0BB71oT3Q2n641Y0OSg0OMxQ9shEPiXmKrAfJ
         npFC4bmsYLoKZkzwep20rhtmnxgaeIHWvT1G94BbpTtV0Hwn/DfEBpuG6sv0hyGVYEg9
         eKGi5cx18IrscJ5aTVRqYUvX33OaLzN1WU0W81jxPRG6yLPvVKaCmCTfwksXb4xsIibI
         1aTn/ErQRlWp0LtOWQ7wzEykTrfpxQS0QO/hXf/VE6XOkYFLHZiNs++G2IaugDqqy2aJ
         tt0cbqtRQUWrelZuMQPwStLlp1Qv4QIndmdkZSuuK3g0KH7el/zLayAJ+YWQonrZoAgq
         hLHA==
X-Gm-Message-State: AOJu0YwvTfbx9NBRxAQgv4J66OrrBbRaxwtKW5vkJdgaiilnvicBlEs4
	WvS3QqIrkF5WsSNbMKVB67Ilk1zjJUV72CG/gX9fqtr/KsHBKJLJDve8mF4KcwjuE+s7hrr6Dt6
	hDb5cnVwwq3I00WYIrJ8hDYoy2To=
X-Google-Smtp-Source: AGHT+IE+9cA7aww0hIPWE2qs3agZAK7Ckdwn/2t5M2mmN0rn/YmDdqccugiwUhjvkN++xY27Qm1RuBvVsFX55KxgMA8=
X-Received: by 2002:ac2:4c47:0:b0:52e:954d:3592 with SMTP id
 2adb3069b0e04-52edf02c1e7mr1191606e87.46.1721127848865; Tue, 16 Jul 2024
 04:04:08 -0700 (PDT)
MIME-Version: 1.0
References: <22262.1721064263985592663@lists.openembedded.org> <19409.1721127717782088316@lists.openembedded.org>
In-Reply-To: <19409.1721127717782088316@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 16 Jul 2024 13:03:57 +0200
Message-ID: <CANNYZj-oj9mjyX15aFXnzaLPHO8Sqj=4TmbmuFo==52s=ZA4dw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] bluez5: upgrade 5.72 -> 5.77
To: gudni.m.g@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jul 2024 11:04:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202107

On Tue, 16 Jul 2024 at 13:02, Gu=C3=B0ni M=C3=A1r Gilbert via
lists.openembedded.org <gudni.m.g=3Dgmail.com@lists.openembedded.org>
wrote:
> Am wondering about one section in the do_install:append . Not sure if we =
should remove it or not? It feels wrong to keep referencing Python 2 at lea=
st:
>
>     # Patch python tools to use Python 3; they should be source compatibl=
e, but
>     # still refer to Python 2 in the shebang
>     sed -i -e '1s,#!.*python.*,#!${bindir}/python3,' ${D}${libdir}/bluez/=
test/*
>
> Previously, the shebangs were very inconsistent and usually used /usr/bin=
/python
>
> But today, they are consistently set to usr/bin/env python3, I didn't see=
 this symlink in my testing so I'm not sure if removing this section from d=
o_install is OK.

It's fine to remove if after doing that you can conclusively verify
there's no 'python' anywhere.

Alex

