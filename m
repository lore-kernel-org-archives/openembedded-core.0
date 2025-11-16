Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1363CD4F3E
	for <webhook@archiver.kernel.org>; Sun, 16 Nov 2025 09:09:03 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5555.1763284137119004845
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Nov 2025 01:08:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MTwcKH4s;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-3e8317b1262so2767006fac.3
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Nov 2025 01:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763284136; x=1763888936; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xa8v+XtTiKpdU6M/ARxtxp9/FGD4LPSiFDl7BZmOnbk=;
        b=MTwcKH4syVQ6e2GPegypnM89B0nMRwps5S5lw84wCTTORuhSf5I9BxuCBQJmyUyFQS
         ToKcGe4DIy2H5YdI8pVJa4M/ygwlc0JwPjaG6AlowpuS40lsxCYsS2hZk7HSjlEnUQ8W
         GQSSrEn57l/qZ2nu7bMEYaBfQZtrOfTmzphugdjol+vgNyPSNWJeGv1xZrBSj7my1EsX
         r0sgMAV93amIfTcqzMj9WN8MFGQBugbu1+EskJ0i+m0bKKSxPJO7nn2Zw7JOhEGtBK+I
         aX5BhO3ewqOLjGzGfuECQK+7Pwvcln1lf3bKgVl2f3UxhysgsFXQ4baAOUsVdcei0s1S
         QzNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763284136; x=1763888936;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xa8v+XtTiKpdU6M/ARxtxp9/FGD4LPSiFDl7BZmOnbk=;
        b=LAoUu8UWuafR5F8G69Q6/DzodqogCTklQvW/PrKqNn13SlBjlMTKl12kq3Cc3JNWhA
         xNngHQaoLOnD2ekepISIxFQ1WNnqc7N395MFEi5tEa934BR63QcGMKgVuzuRCiq0xiZg
         rQTEKiMHUWyAXdohVW6952vqPJhs/zKtGV8lXjxWjd2HrD+G2k7wDSBNoC+WDPF+em01
         IxN2WXN869RWqG9i/jyazxQJfE+syML3CjgK3oLVM2RWVxQmxJjLJMqvwOqDrSQH58ZD
         RHIOoCo9i+1SsVuAlOKpSgbFxsXSFKW4NIWKvSmievQlTYHlWlHFxMndxcCNUasVSibr
         THXw==
X-Gm-Message-State: AOJu0YwWcWREpJfBvF0Gwqp5zrx7nf2OtxmqA5oOLjPutMOId0D7Qn3+
	HxOGX/GjqPyUAjg3mum8q8ldBR8J5jl5D33iSd2i/x6JhIRHSEfzNDzddhfJpO4/Vp80Ie5yNLk
	hEDdiQ5iixicUp77aFEfBuWVSoPwIw5g=
X-Gm-Gg: ASbGncsHcKk8bCIzXcOCJlooZLrY6wJAJScB1jdQV9twG6eyQ21VCduSc9oL4+FCX/X
	qDFoN83QUj5ZWL42Vt6eQ32/S4sYGoEaOJAF6NDjIcpdZQEN+nv38Cbi4vYGGJHCR22MRKHhUxs
	u9dNj8ZsPo80kuOkZYD1qNAVoNB6hazRVhM1nDRzM1FPwnRz/w6ZENVI9hrVSnGthS3tvkB1rLS
	B9DIF8qMujMHQHfXA4hvu2hXV/Y0wCclRmUuJgfWhlOz8f+Szs2WgMy+YPuSA==
X-Google-Smtp-Source: AGHT+IEsoZVUc1q9ngp+ffLhkBFZqpfhumy/qh5RocU5xaLngpcK1d4/tPCdDhKvCVl0me9HR3WrHKNhZMqFKgVoqP4=
X-Received: by 2002:a05:6870:4008:b0:3ec:31a6:8b77 with SMTP id
 586e51a60fabf-3ec31a6db0bmr573321fac.9.1763284136119; Sun, 16 Nov 2025
 01:08:56 -0800 (PST)
MIME-Version: 1.0
References: <1876328ECE5FEE71.660630@lists.openembedded.org>
 <CADySD0FSgoO8RHnQHt3Eqv5b-SOdbQ3Y7edYPpGcSD79jgRMfQ@mail.gmail.com> <DE9YCAT3GO3Z.FI2X2QSNAHNU@bootlin.com>
In-Reply-To: <DE9YCAT3GO3Z.FI2X2QSNAHNU@bootlin.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Sun, 16 Nov 2025 22:08:45 +1300
X-Gm-Features: AWmQ_bk8LiISl0lHCVnK8nNpy8pJEccaUk0H2LuV-n7Gx8HdkIyFArxL86KRoj8
Message-ID: <CADySD0G6byC5TQaEWNafNPF_uczYytu5nvxG75KoJ69LBKkthA@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2] nghttp2: upgrade 1.66.0 -> 1.68.0
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Nov 2025 09:09:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226467

On Sun, Nov 16, 2025 at 8:48=E2=80=AFPM Mathieu Dubois-Briand
<mathieu.dubois-briand@bootlin.com> wrote:
>
> On Sat Nov 15, 2025 at 9:15 PM CET, Ankur Tyagi via lists.openembedded.or=
g wrote:
> > ping, please let me know if any other issue with this patch.
> >
>
> Hi Ankur,
>
> I confirm the patch is still in the queue. It will probably not be
> merged before whinlatter is released, but is likely to be merged in
> master after the release.
>

Thank you Mathieu, understood.

> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

