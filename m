Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2620CC3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 13:50:11 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
 by mx.groups.io with SMTP id smtpd.web10.34633.1744293002515477125
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 06:50:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=SEFvI4Fv;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.175, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e6dee579f38so635715276.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 06:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1744293001; x=1744897801; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oW7q5UvTCphm7YSri1o1r5W75KUnuTuoLjRnPaRyeqo=;
        b=SEFvI4Fv33zvQaItaFKEHunwd7n79o7FBCjqI6j29A3bZKapFnUbzLM8xjnfqZjaLf
         r5HpEhQ7qf3Am+A5YlDldFxK4ONhuM5pLokeZjpJijO7qEECyo1JVwE6tzIil7MSbEHd
         j/BpKdAsb89JYo9h51u6v0pCThnVniSR/AmexhjTxYUcAvEiUgvwzoqBDBzlNrZSYQs+
         PYfRERi9KWhKoOyFJV9ic6BzWWhxvTUjwAJDFzCOKmSNObhQKMjlwBSjx5XkjE8l6VDF
         m6BHhj+JJyPUKm7wsGYgiSiI85RkxUxPnAjQEBCNZ25faMCnDvhOwpNKSB44uVymFnYh
         B7Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744293001; x=1744897801;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oW7q5UvTCphm7YSri1o1r5W75KUnuTuoLjRnPaRyeqo=;
        b=t66YOcgJu6AYOD5mZXl4GWJX0QtqU5TngjPZG4iCDGo5k05e6mE6eJ7fnrqpVwSQzt
         S7PdPczhrtPtk81qTESbHHaXWAAGPjRblcFnVpA/YfwjNxvHWiDtu3JXUt4B6bqETls5
         DgxKiiF6yJkSBTmq/g/l/29vUXIDxjp+oAJEPVTgcauAs7urYF8s2sUMh/lJiex0HKfQ
         NZNIRDFeZBiuTx5Yyo/GkTi943lKz7W+LCuX21aK81LWHkRgIxQQPlieABY9uBUJtmLA
         Si/zL5RajP1DfXgH/NZMxdheB7jMBjKpS/m6p9CRTmFsYYgDQ29rZmUsiF66UAV9wmpE
         mkhw==
X-Gm-Message-State: AOJu0Yxns7pS3BpzSprNPjcgV2HDcTLSiA4nfAbxL1V12Oq+txNcUvLC
	WvMzVCeKQEe0oK9VtJX1cL6HBIU5FCEV/zcqCjdFpenhN9BMHc03dtHyeXFsDB/fk5LBrIF8r6G
	zv5m31M9k3gnbTSJqJxGA1E88HW5ExIP6b0n2/A==
X-Gm-Gg: ASbGncttKStm8wo006Q6hwKsTw0YYOTDxjDS6C3XkkxHCbYMC/5BovjHfsjbM4+NTCy
	QpohqREExXBzQyv0ZnDtIGhTxdxkJMMl84lQm1+NGafCD/dGTnrKuYv21R4h2odZq81cfR5azoY
	DI8K/+gcAPzJHG5qcqa5ILxVK8deVtTKE0nbl0Eh4KPyTDGtiWvny1
X-Google-Smtp-Source: AGHT+IGTilsSSpMkpL4nI2MuMMG4U/ejUH884lXcQ1fI8En8SNzacnmZNZrHGWfknQooyMEpSTbX0OC7mqUEFImSBoA=
X-Received: by 2002:a05:6902:2e11:b0:e60:9dd3:38c9 with SMTP id
 3f1490d57ef6-e703e0df5ddmr4528142276.7.1744293001598; Thu, 10 Apr 2025
 06:50:01 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1744145328.git.steve@sakoman.com> <19fcc012160c6b8782be0e6fc54797c88bf084ba.1744145328.git.steve@sakoman.com>
 <3a3917e7e0b9c3f444ee895f24ca401b36e6c694.camel@linuxfoundation.org>
In-Reply-To: <3a3917e7e0b9c3f444ee895f24ca401b36e6c694.camel@linuxfoundation.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 10 Apr 2025 06:49:49 -0700
X-Gm-Features: ATxdqUHt55mgSIroSQB0_UpbjpDrxvWY3gEtJY2Nrzuybr_znZCQtjgMpYgiZF4
Message-ID: <CAOSpxdbDTvGJb3tVH323=+BEDEM6JwHRveMhaZ+oRFA0i5QrFQ@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 10/10] glibc: Add single-threaded fast path
 to rand()
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 13:50:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214675

On Thu, Apr 10, 2025 at 4:33=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2025-04-08 at 13:51 -0700, Steve Sakoman via
> lists.openembedded.org wrote:
> > From: Haixiao Yan <haixiao.yan.cn@windriver.com>
> >
> > Backport a patch [1] to improve performance of rand() and
> > __random()[2]
> > by adding a single-threaded fast path.
> >
> > [1]
> > https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3Dbe0cfd848d9ad7=
378800d6302bc11467cf2b514f
> > [2] https://sourceware.org/bugzilla/show_bug.cgi?id=3D32777
> > Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
> > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > ---
> >  ...dd-single-threaded-fast-path-to-rand.patch | 47
> > +++++++++++++++++++
> >  meta/recipes-core/glibc/glibc_2.35.bb         |  1 +
> >  2 files changed, 48 insertions(+)
> >  create mode 100644 meta/recipes-core/glibc/glibc/0001-stdlib-Add-
> > single-threaded-fast-path-to-rand.patch
>
> This isn't in walnascar yet.

I've got it and "qemu 8.2.7: ignore CVE-2023-1386" in my local
walnascar branch. I will hold off merging to all stable branches till
after walnascar release.

Thanks for catching this!

Steve

