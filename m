Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E25DDC5475B
	for <webhook@archiver.kernel.org>; Mon, 11 Mar 2024 13:00:30 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.62037.1710162021053689020
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Mar 2024 06:00:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AI5TRdXt;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2d220e39907so70776911fa.1
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 06:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710162019; x=1710766819; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=O/IbpKUjgighW9l8ItTvNZEid6Ug/H2VtZr7iY1k9bc=;
        b=AI5TRdXtTwq0owYrYMJsug5Hfc0/hLqK3FqGRv3ytyAtMmfEMkl4GvLItKNvsWIFYL
         1wMFOqeU0OtmCs34tQKOj26ANVuGCOj3sGfXQXD56r/h1TWzFdKWg68vszr3GvJn7a3+
         J49hlRsUsSipNKevwP6iZyAg8R+jGg4fjb3Ezz0SH4MucJ74CV5KeKLA8kfq5dUMqcc3
         d24Sytp5irBK7N4zy08CYHTZf9i2mMMbyOjaq4ljBIq6KS7ORXEwpOCZCeMnSWq3QN3V
         iT0nGXKrCBToDPZz7gKhuaKCjQfaExzE0rcrGNiGEPAf9UYgjp55ZSqDLd9+a6SxQYco
         UrpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710162019; x=1710766819;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O/IbpKUjgighW9l8ItTvNZEid6Ug/H2VtZr7iY1k9bc=;
        b=Zz8ZDAI30QGl9N4uca8vNd61cHsM+2P4NBgEezUadtu5cmwkHyIGeOZdf+t/jKnJqy
         OadsZnzxeIeqBSc/BQFW3lvZuzPi1etMzO9p9Sf0x6CQRRWHKXqQYjZUwJiaKQdPrsUd
         tHcGGqyEhlYHIh3cp9t+aJtK76EU9ayLPGz/71lf8nsYL9NAllsNKY8ei8NkjBC+jcW0
         90Aw0ptfmOVBiFcPmOODwrWqgyZ5XjgoAG7TtJ3aXXUoSo2FM+Y3oRcc1jvT1zKTie3u
         EG9T1whqzkxH48NTEiIEbffb1kV+0+jzlp4n9q93DFTw/oPPRZElUby2xG96skTooJpp
         zuhg==
X-Gm-Message-State: AOJu0YypyFRM6EOPDA02MNSo4/Ns868jZ9Z54YlmW3fpR3hj/StIzPaO
	+vfJMgOGcsWsCzGaa1+GxlSXRqb4Xxs23zv5o3/WpHcBnwn1s7un1UEdOOiOGDGhjOKvuVolpuV
	4upZikbCIVLCVoQwKYrfz37y4HJk=
X-Google-Smtp-Source: AGHT+IGt47SxoB0Yb4VXgIhaBOKVLwYmigIzfFPXtLyDXu/Xfo0eid9tePD2WtWTednwTUp0HSkiqBNXFQYbc/QhiT8=
X-Received: by 2002:a2e:b618:0:b0:2d2:9b43:8d48 with SMTP id
 r24-20020a2eb618000000b002d29b438d48mr290346ljn.39.1710162018885; Mon, 11 Mar
 2024 06:00:18 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj9v5FE6z552opyk_LsZpUx0nGpvGBiJ-wfUfA_YYGRhhQ@mail.gmail.com>
 <27822.1710159302267588894@lists.openembedded.org>
In-Reply-To: <27822.1710159302267588894@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 11 Mar 2024 14:00:07 +0100
Message-ID: <CANNYZj84=NT6kWqtkGspt+oZJ28Au-rtLWxCYjSWFEe0UvFWSg@mail.gmail.com>
Subject: Re: [OE-core] [master][PATCH v2] librsvg: Fix do_package_qa error for librsvg
To: Nisha.M.Parrakat@bmw.de
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 13:00:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196936

On Mon, 11 Mar 2024 at 13:15, <Nisha.M.Parrakat@bmw.de> wrote:
> 1. Can we say, that oe-core will support Rust in future after Kirkstone  as a standalone (without any external dependency )?

Yes. Rust is now part of the core, and will stay there.

> 2. We assume that kirkstone will stay with 1.59 and those who want later versions (1.68+)can use meta-lts-mixins

That's right.

> 3. We have the following assumptions for meta-lts-mixins
>
>      a) We see kirkstone/rust-1.68, kirkstone/rust-1.70 branches.
>      A new branch will be created for a newer and stable rust version for example kirkstone/rust-1.75 .

There's also kirkstone/rust which is not tied to a specific rust
version and aims to provide the 'latest'.

>      b)  If 1 is not correct then we assume meta-lts-mixins will cater to all the LTS layers in future. That means we may see branches like scarthgap/rust-***

That will not necessarily happen. It depends on somebody willing to do
the work. But this also means that you can make that contribution.
There are typically two steps:

1. Update master to the needed upstream rust release.
2. Backport those recipes into a branch in meta-lts-mixins.

Keep in mind that this is a community project, and no one owes you
these things. The good news is that you are welcome to handle them and
share with the community.

Alex

