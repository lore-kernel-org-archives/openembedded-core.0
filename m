Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79244C678DA
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 15:05:17 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web11.89056.1749567907874665295
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 08:05:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Bn8MSuNc;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6fabb948e5aso58857556d6.1
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 08:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749567907; x=1750172707; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2eHxlv5YVnZw7NRBYQmrnbsmaeS/Mi0s5ZiX56O9UtM=;
        b=Bn8MSuNcaXEpzhQ7uQdH0QNAFgyNysx+oE57xdv3ph/tRdoZsg0sVuTqPULII/l0SR
         57hqhWzJqXmR6GQTHVYuMxHZHBo82ReSSEu0QR2vkuKVEnB2wjyyC7PlabxgWjIz1Xa3
         EIGIgZqCxznSEeh+ADKDd+pHS3IEcXB6fImX1FzLED87HYyvBvTrMXIpqtb1ZueOKSDU
         CCwMcwErpHRIiKScYDXJstCTyxpxlj24X518P/gjD835rK9sik7Yw2FvU9xIsC7pFsaW
         UjRd0hQUlbCag5vW8rqezeQqPDNnDJkCYHRh3bsR8S2CaXvuW+Im45N4cVHfeUrOvnUB
         pGKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749567907; x=1750172707;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2eHxlv5YVnZw7NRBYQmrnbsmaeS/Mi0s5ZiX56O9UtM=;
        b=jNzYsN2y/CkPDMUSAAwDeyEy1gQXt8eLk4V3gbuRyZgkHQTnMmG7h5D9c2EQ5+rUEf
         l06iO2yUJ1OvGjWZu91ThMQ0dEKT33y+QPj6s8B73v2qnl2svB7cEb6Yu1olEbrVwGPu
         HCFT7KfqQ+PsExZBb/LDbSeM5cFI/mf1x6h3Z1A0vq69M7gqgkwsy/1HFQLdRGFyCVX3
         XmPh02aMgDKgXvU/I06SSNpxREsxjOybsxNQHjq3EeIT5yEQi05tBHCsbTP1iCxLoIlq
         Dc010gqQ0ZfM5trJ55AjherkmlxF/y18M1chpyafw7PxCYBvV15LdUL14p9DRn+8Vxbb
         4/7w==
X-Forwarded-Encrypted: i=1; AJvYcCWMbQBi3ceMieNhYNELmyXPgNMlcqQaW2402uHciUZcCyzuw4Vg1Jxy++DWrdVA/UVe69l4/+1REXMZdyE4fKWdDQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx0C9M/IGPkoFUzDIS9mRUGL3Nqixu2kQzqjP/sZt4HkJKHFMS+
	q0Wo9BH5Iux3x3tsgo3q9hwU3C8d071rKJL90CJ68SEdgBvw6tCXjSvXNy26yCcvTWBgT+HU1Oq
	3sLSbMiX4mItmbpNFh2w4VqqcC9GtxRw=
X-Gm-Gg: ASbGncshHMRdWrsMvCnvt+P80kYsaY+rjHgkpCmGi7jOBlYA/aJRz0OmFgvONrtyNr6
	9uatWo8kAlJOdoV331xtFrF40RSTCQY+nLuNWAOpIcPUe07NjFykSb0WYKP8TnxIyhYGbfr+iDZ
	+3rggK2gLX+Nc7SpMfbqqcJZ22W7ZaXct7xlmoLEFUgrLyS73qSFsqiGipJP8rXWyY1RVRz9S0Y
	sSPyA==
X-Google-Smtp-Source: AGHT+IEikA1ErpM8mjus5eIxdjwYzYv9/BPy3vv2aGn+DqI4zAfYxJr81N211k4jgfIyC7mpDus2MFJRtL/1ntMpgdE=
X-Received: by 2002:ad4:5ce4:0:b0:6fa:fe02:8219 with SMTP id
 6a1803df08f44-6fb08fc6fa8mr305728256d6.7.1749567906743; Tue, 10 Jun 2025
 08:05:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAK5yBb-PRoA1biG6PA_hX_RndM9QqG7G_7ikYFUZE3goEaP-_Q@mail.gmail.com>
 <8ce48df3-b8a2-4b95-96df-bf0fc1ac1eaa@gmail.com>
In-Reply-To: <8ce48df3-b8a2-4b95-96df-bf0fc1ac1eaa@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 10 Jun 2025 17:04:55 +0200
X-Gm-Features: AX0GCFs_Z2EkCGKQdJLzCGpx17psYez5qJFVLAPGkuFp85p3tilqgwIynT_pIcY
Message-ID: <CANNYZj9EQ=xjSXRii-6RYk4uzV6kzztzWCDn1Mo5z8nNyvURhQ@mail.gmail.com>
Subject: Re: [OE-core] [yocto] Yocto Project Status 10 June. 2025 (WW23)
To: skandigraun@gmail.com
Cc: yocto@lists.yoctoproject.org, sjolley.yp.pm@gmail.com, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 15:05:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218357

On Tue, 10 Jun 2025 at 16:46, Gyorgy Sarvari via
lists.openembedded.org <skandigraun=gmail.com@lists.openembedded.org>
wrote:
> >     The clang build time and size increases continue to cause
> >     significant concern.
> >
>
> Is there more info available on this somewhere? I'd be interested if
> there are any concrete recipes/configurations where this is showing
> prominently and could be used as a benchmark. Or is it more like an
> overall "lot of small things add up to a big one" issue?

Please trim quotation lines when replying.

It's simply the build time of clang-native and clang target recipes. A
huge pile of c++ code, probably the heaviest recipe to build in
oe-core. At the same time clang is a critical path item for mesa (and
thus, anything graphical).

Alex

