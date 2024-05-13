Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB8F9C25B75
	for <webhook@archiver.kernel.org>; Mon, 13 May 2024 20:35:29 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web10.4330.1715632528201504354
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 May 2024 13:35:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cNLVr+Gx;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2e4939c5323so61015201fa.2
        for <openembedded-core@lists.openembedded.org>; Mon, 13 May 2024 13:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715632526; x=1716237326; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jIRxdQtRihPPq5ZTQhjzhiRBOHGicyqKipEo7XVI1A4=;
        b=cNLVr+GxJJ3Vgy7PwtVQOnEg2EGZMUBtxMqxHil896DSSvsjaFWbrHNCFbiopJ2bfa
         WMJamAKOgb9PAehnbe7DPxm63RFd9dDsz4G/gs+XdwObs8hUjUvAj4/cwb1HsOyPbxBq
         +4iSGHKGHwK6Q+S/Z2hUpybptv8vXkKQ7NgDDxV8ZnSAi+0BvtQ6FScNxasaq+vYTmYo
         H+/dhmKZtGH1Xw4vIhU2I9nJ9qU4zd/5ou6kahuTurjAX5dPp8jvIhA8EIkh4HnC5ko2
         npQBmqVLyWvKEUJNAQlxjV/DaLj3xLWxqyAVENy6EDiarxeZJS8GLYOQgZSdAQpbaGUI
         UgxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715632526; x=1716237326;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jIRxdQtRihPPq5ZTQhjzhiRBOHGicyqKipEo7XVI1A4=;
        b=T4HaJhrS4GfhPspGvq3qKmLRYDXvFehedGXn5Mkw1XdP4oy8ntVuuyIZ6kUyf9taQM
         KiQxFgcI8I64t6x3E8J3K93EQ9I/VOAy01n3SYL9nLi/GPPJAcyvFQ6dIjno+rw9+kHF
         OX4ErisFrmYMtbIH11+syZz11Bd2+xkvBXw8L5RfoxOPXoGCNtfJeyB3VV4OQXLWgKAW
         3nd57u+PU7E9g+hUR/B/7jrgc07trzwrDF8uPNxY/6sNzmGJ+tMQuJSwPgyYu8r15PLe
         N5RHBRdA9HPSZmVuv+o50JIndfditPmIq08qiFRN3+XgBWg3kBTOF15Vrt5Ps6dTVmHk
         0uGw==
X-Forwarded-Encrypted: i=1; AJvYcCXWfsYs9R7cRrVrAZDoCxsd+DNiHP0B37+05kdNcidEG/WYuTqau5ydXxZTR1KfVYdjFbd1wHbsxB74HRoLXJ5dWChNHdfeutOntYwBKcUepwWx//tRtYP9
X-Gm-Message-State: AOJu0YzyY6RGj/Ep2Ugc1PD7PeI5OMNH9ZQ2ST3QmZEGscmnTKjWZYZU
	BH9Ta+W4peq1DRllbi9sjEU3oDAt3y6iXQ7cTDS32nNSZTq3bEHbAusAHnHpsWRMO6RVWoYdWoy
	MdeKoDn/JEZ9KDjQkjBJ+9ZmKDBjVhA==
X-Google-Smtp-Source: AGHT+IElrCJkQsM44EARiVJwZoNwVtfbzkMop0Ue9k5hRZ+6HxRtcHvzSUN+ZdpbhaWJ8wb8A6aNaR+qXpzj8P5V6p0=
X-Received: by 2002:a2e:86d0:0:b0:2da:7944:9547 with SMTP id
 38308e7fff4ca-2e51fd3feb4mr106810481fa.5.1715632526117; Mon, 13 May 2024
 13:35:26 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj-i90gLUfdk51Now0HY+=RCNkg8ugr2qcK65xXS+AypZg@mail.gmail.com>
 <a325fd9d7b923e76e0cba8786c9a4dcda81fd52f.camel@linuxfoundation.org>
 <a84b5ef9-2314-4ba7-99d0-b5292298f736@windriver.com> <835b59367fd827253789514b77e042fc99b55593.camel@linuxfoundation.org>
In-Reply-To: <835b59367fd827253789514b77e042fc99b55593.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 13 May 2024 22:35:14 +0200
Message-ID: <CANNYZj-_4j5XHXd8HzRPFneyonGhgmFpxE1sqvrepCf5UTZC2w@mail.gmail.com>
Subject: build host architecture leaking into target artefacts - new twist on reproducibility
To: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
Cc: Randy MacLeod <randy.macleod@windriver.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 May 2024 20:35:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199249

On Mon, 13 May 2024 at 17:35, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Run a build of "MACHINE=qemux86-64 bitbake rust" on both an x86_64
> build server and an aarch64 build server, then compare the output.
>
> It shouldn't matter which server architecture they're built on, the
> files should have the same name. Apparently they do not and this is the
> issue we're hitting.

The incomplete patch for this issue is here on top:
https://git.yoctoproject.org/poky-contrib/log/?h=akanavin/package-version-updates

Unfortunately, that is not all, as file names and file sizes are now
the same in libstd-rs, but content still isn't for some of them
(different hashes reported by sha256sum). And in target rust both
names and content differs.

I'm out of time today to look further into it, but you are welcome to
pick it up.

To catch such issues closer to where they first occur, we need to run
reproducible-armhost (that would compare sstate coming primarily from
x86 hosts against a pristine build on an arm host). I already found
out that plain llvm also leaks host architecture into its
installation.

Alex

