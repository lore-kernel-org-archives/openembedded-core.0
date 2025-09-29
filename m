Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C987CAC5B5
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 09:41:04 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web10.49830.1759138862719080074
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Sep 2025 02:41:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VnXgaP5i;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-796fe71deecso31827126d6.1
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 02:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759138862; x=1759743662; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Jd0hVp8s+swXjppbO19QlCUo6a7JRARKYCKh89iKY0Q=;
        b=VnXgaP5i+tee5DCbkF7jBpLP59C7tHnTWiMpbQk4RtObzT/OrP8rNGMx6+6bLe4lJO
         pm/sAC97P868XXpsYo7gvFf6FI0zG03ecipYMVPH7DnRLTshcuvbhr6r3toRvC2Fyk6k
         2OIwiRH8q9HBCb9WwNcVRKHUjG94gza6CJ3yGQLrmaaRloByyBFwAuvTxUqYqJ6mNlwD
         xtBySiBb7JHRZd66S8nXwPLxbevj7ocVAhinZFYQDQSu0SjAGFPfEF/pJL9WQeMwdRd/
         yK6nYDCClNbKB2PU4nbufNJ3AYs5It5vxyLoSEI3PweSmrHpegK+xng8imT9TkKIwZ+I
         51Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759138862; x=1759743662;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jd0hVp8s+swXjppbO19QlCUo6a7JRARKYCKh89iKY0Q=;
        b=dUhqBhqlkmZ0VD3IRydLxOZ0L1OtehhHpfomgiORvD81IAggMkaZa0/6UyXh4KFOye
         xm/aucwtRofV9BkN94IJPVo2TiPUHMqnQ0lfp03z194keuGWCDAmCzQKyw7YGKZuq5fj
         ylKSm/wpX1SAD6pP0BR4hZ3V8par3S5jMbpvsWrnhKqX/8Mhd5bacyPGORORHw0UAHj/
         W6ZbB1NkPF5vzLB8HPW6KmLu4CmtRJjDDhyBEW0Sy2urpTD6At+B8rIx7SW/FUA+bfRg
         vhs70gNoDw/9FAiNCy7RF0ohv5SVgIVGTaXQB6E2CjC+Vngm9EIwiY+TJ8H01Srw1H7f
         1+hA==
X-Gm-Message-State: AOJu0YyUCY3wLJzU47R5s8xx/kCorCfC8XcYL7b2Y0e3NQbTB1fcIG3w
	cnY7kZRlaJ/JXRzamUCg0DdAjF2lUMnUBDmc/2/UNsP52g7Pt5JUg/LTgTQKP7VbuLJy6DFT+Dg
	6shPPlEN/4Yeb2z+6KwZhDvFbog0p/vI=
X-Gm-Gg: ASbGncvBxr2R6BwRwS9gB3kkylM8MI0amNfmsHwV77hRu1CGODyBBIYMkyb2KTZOr1X
	dfAQ4j/BBxUUYJEnuIx8U+6RlPacq6VTZMGp6qfKmf9rg/0UQYIP4dYp5TtA+xrDmC2l2IRxNAr
	1PYPBK81CA29qTBAuNjmvq9rqvbyn0avn9V2ekiCFnbcBUf25tZljTkHLyRz2uhFzKy8tmR2Kni
	Y3okfZoelCt8pxorF1NBXp3jq4mhbIEy7ZZy2jOPm0MAsVCMzZHQQk0ENd1LNLn+cja5PfCybeJ
	BNzU0pjNQcCbHNrzewbeo9cOie5MVMYLqpAEKGFx
X-Google-Smtp-Source: AGHT+IH9iq6mBbYdUmabHBsSaPmmaov5IPnqcr3ELQ8FB/pvfp33qpgWeIFiOmWV19bnMZTWU6PEC7PqXxttOD5DXr4=
X-Received: by 2002:a05:6214:d8c:b0:766:be67:3e63 with SMTP id
 6a1803df08f44-7fc2ea3d949mr270412586d6.18.1759138861672; Mon, 29 Sep 2025
 02:41:01 -0700 (PDT)
MIME-Version: 1.0
References: <a5b379d1-88b8-499c-bfe6-d741e508ca84@gmail.com>
In-Reply-To: <a5b379d1-88b8-499c-bfe6-d741e508ca84@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 29 Sep 2025 11:40:50 +0200
X-Gm-Features: AS18NWDGV4Zy3Zc-Pe40F-8Sup8nVr1Sti79J30zOQiguezE_jOQZazdax6Lcm8
Message-ID: <CANNYZj9PM=Sn5zy+6-N6ZFvzEt4eJpM5dGNAMong8WMtOHtNeA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rpm-sequoia-crypto-policy: add nativesdk to BBCLASSEXTEND
To: majortomtosourcecontrol@gmail.com
Cc: openembedded-core@lists.openembedded.org, zboszor@gmail.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 09:41:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224130

On Sun, 28 Sept 2025 at 22:32, Clayton Casciato via
lists.openembedded.org
<majortomtosourcecontrol=gmail.com@lists.openembedded.org> wrote:
>
> Prerequisite for nativesdk-rpm.
> Would be required by nativesdk-rpm-sequoia
>
> ERROR: Nothing RPROVIDES 'nativesdk-rpm-sequoia-crypto-policy'
> (but virtual:nativesdk:
> [...]/meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.9.0.bb
> RDEPENDS on or otherwise requires it)
>
> Reproduce:
> 1. Add "sequoia" to rpm's default PACKAGECONFIG [1]
> 2. Add "nativesdk" to rpm-sequoia's BBCLASSEXTEND
> 3. Configure local.conf [2]
> 4. Attempt to build "core-image-minimal"
>
> [1] This is seen when directly modifying the weak default.
> This does not occur with "PACKAGECONFIG:append:pn-rpm".

...

> -BBCLASSEXTEND = "native"
> +BBCLASSEXTEND = "native nativesdk"

There has to be an actual use case for doing this, and some standard
build path where nativesdk variant is tested. Otherwise, it's a
workaround, and you need to add sequoia option such that it's enabled
only for native and target.

Alex

