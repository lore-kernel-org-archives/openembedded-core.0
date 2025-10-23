Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08F3BCCD1BE
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 10:49:42 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web11.17314.1761216572949329670
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Oct 2025 03:49:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jG5XYk71;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-79a7d439efbso5432046d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 03:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761216572; x=1761821372; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EGX485ujgrozMm/BrmAqNGVMDDyPZ4dmz3d6roEbm+c=;
        b=jG5XYk71RfXGXiuLILu4m/PRQzeJpMpDOLOp5s/Mq0cPzkovR5pJ4HwBbw9q21bYon
         hmUtKjAoxGUFrQ0DGk2XxRzkTSVG8VYlaW00X/9ov/PxUOfyukwNbgBMAHFGVQQOVERm
         bbpVVq7IQNTBusarRkGUpb6MUaB2TFgyEI7SUr6JxnrUbXX3F+XoxQbC7PyDKpyrklMJ
         Iq2o5BTS+D/nhpJAZl72FJXoprubku6Adm6qFNMW7bUTEyGfAq7JzzGy+wfe0+TSmQnN
         ++IJ4Uzhi291HjoTLfZbQSWET4tw8TVo+3/E1czWxKROh04mlGZ7PR4bstrVO8JmMjTu
         KiDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761216572; x=1761821372;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EGX485ujgrozMm/BrmAqNGVMDDyPZ4dmz3d6roEbm+c=;
        b=uimgCipG/Hsqyqu+PpLsZ6ppJaMVWeBkDXekIX1RoCsn6jjAVh7VQHSBbaacqzXFBl
         W24j3roY8kRXpEUBgjvLGmjO7moMuq+no7OLxoHOTVljS/iGaepB+E2NeAk3u7JMf53R
         xK7Vf5IRxoc/k1jAM74Ou1mgkarUgMYDMz3J4ekIs363TAXUJjYpalgFWycx0d5XBd8R
         /dIQHXXk7pqFdzCiQpHQQAPZKCuUm48xSHVnboK579p1FxuRjz6rd8ZjHv9AOj3bj+h1
         gFhXHFL9XgoVDAU18nAo04uooXgVZSi5fniELbFuYN+zzIk7UjOjDVw2jAJvzQLQj7Y2
         YZTA==
X-Gm-Message-State: AOJu0YwzED5/O/x6vtj+eO20N+HjxVy6gmGeKkJIkKSqK2gongMcPtuX
	cogxrjQgoY8XjokVd+8eXJidcHLAAb0woJ3WAC/9ISbKo4nHFNjujJ0vWV5knCvbnoxvOHDxymK
	oczqA4CtGomfi0Bgc+1jWXfTBTInUHnk=
X-Gm-Gg: ASbGncuArFASkWKIdKrkyIaAuBXyNuYu4k7WwPl2o+0co4Ot/ci8W+me44VGJYwa/p0
	w2ZTTm7n1Dx2RHd37yGzIl6KA1qu+E9g6RRs3hNOwzlxiSu6plFZp32ZE9qyVnAAi1fRSxWxWH8
	vxqpRmDWYTPT+eVsqEZtwOm9hmJ8tCisJdawZ7YPppXlBHIz1qWp98JJeOV7eLogx8FqDOubN0O
	LOn0MtrdvZVe9+PWrn88b615g7uoyKM3KqkHSkSNvHwT5RXOrj9vYy7kPNfJzw1FoElNkdO9bzR
	7OnKLQx83U0xHeY2DCQZfuRPah4iFxqYr5vHI0SP+fpKRHv37VGJiSJ2cPO0rd3FH295
X-Google-Smtp-Source: AGHT+IHGRZcJcNvRQJ3tuSPq0GnqnHcfPc8PUB4IGoFag3TzSgIdCSVXabCTFtnVUpvDqqjlAmvgs0hRPclLqH8mi4I=
X-Received: by 2002:a05:6214:260b:b0:87b:f40c:4854 with SMTP id
 6a1803df08f44-87f9ee78b1bmr20165526d6.43.1761216571958; Thu, 23 Oct 2025
 03:49:31 -0700 (PDT)
MIME-Version: 1.0
References: <20251020171026.2965650-1-ecordonnier@snap.com> <20251020171026.2965650-2-ecordonnier@snap.com>
In-Reply-To: <20251020171026.2965650-2-ecordonnier@snap.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 23 Oct 2025 12:49:21 +0200
X-Gm-Features: AWmQ_bnqtYdSZnAUq4v4LNKwc9L1P2LkuAgCLt1KkqpT1-wZf2Mjz4gXCRl4BJY
Message-ID: <CANNYZj-Prjhs710rHr1S4L4682Ta_=ADVgaFOqPTpNnR9QwPtg@mail.gmail.com>
Subject: Re: [OE-core][PATCH v3 2/2] opkg: upgrade 0.8.0 -> 0.9.0
To: ecordonnier@snap.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 10:49:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225230

On Mon, 20 Oct 2025 at 19:10, Etienne Cordonnier via
lists.openembedded.org <ecordonnier=snap.com@lists.openembedded.org>
wrote:
> +From: Etienne Cordonnier <ecordonnier@snap.com>
> +Date: Mon, 20 Oct 2025 18:57:56 +0200
> +Subject: [PATCH] config.h.in: fix typo
> +
> +Upstream-Status: Pending

Pending without any reason == grumpy Alex.

This is actually a backport, please update the status:
https://git.yoctoproject.org/opkg/commit/?id=d723a90bfe6409c7ad983ed911225d4aefbfd09e

Alex

