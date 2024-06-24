Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDCCBC2BD09
	for <webhook@archiver.kernel.org>; Mon, 24 Jun 2024 12:36:51 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web11.139415.1719232603039738363
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jun 2024 05:36:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UknmlJJ0;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ec002caf3eso62530311fa.1
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 05:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719232601; x=1719837401; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oiPc4XQ3igXzSGa3AiSVOx+d265oK6ehP/WF6rQzWFc=;
        b=UknmlJJ04OVGtjHOo5UNS4EWwIrf5pOfRR12/k+i7EvY2+PJd25yJr7VI4ceqC5MLm
         yCQMhTmvNsyhR9kfwM4vnWPIjQpU4/v16mOXY2hruOc/gDE2kfbnNuG8yPcPIt4R6cIU
         kbMICmEhM9bZu30eRj/9EQ7ulNZTHCaXXNlO2u+9QY9ekUuvQvkmAMU1Qoukh1TfuE2n
         lF4M40sbYqSKn1o/fOpDckBrvCxwgEpfQWhXyB4wX/gdJKPQ5QK8FQKyEfXOQofbKOWt
         foFwbUTyYtsEA9fxqBOzLk42ho7M3/GW44pU+/N5SWKozyzH9/tL4g2yD+junS2y6oGY
         JU9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719232601; x=1719837401;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oiPc4XQ3igXzSGa3AiSVOx+d265oK6ehP/WF6rQzWFc=;
        b=Nj8ELvIRUIlo5i/ysUAoZL1xjcAHQQgdDnRxu2JhgFWjEA4ws4i6SfxUO2AwzK4dip
         BwFJacQ7V70nB/UGvysqzazeil5TfRxrr75DFCTJyeWvUnGUDUQCQi87UbrL+A0EEvlJ
         209PlNSYz9JaOBYdtYc+IKwk5P2T1lNDJx/hWIFHRI1qOKPRoVfmzZOjvpdpZ6pmj6cG
         gA/PMnXGYH8PrkOgqKy/j5+lf8SWTxIoIUqJKk7fMHzDPXFyu90giX2IQb2wK4uFJ5WE
         2rwmgmc6UxqGCAqqqRJbYiCqgn6bzPCP+b+XimIysdBtxzUQLiC6bx17Izn1+byOL+TA
         Cc7g==
X-Gm-Message-State: AOJu0YxMLF2yPrpi8wqn3RCQN04a/kXXSbyoDXJNsvlzsy2GO3g0/Ccx
	EwqqtDmnKI0t9rGZNC89F6Uflt7RZYAk66uownlB8aFpFFTUIbIXK8tLmxYHAqFTFpUW9q7+8LB
	Tpy7rax5rR+gTAf6ahRmVyZkPBdE=
X-Google-Smtp-Source: AGHT+IFqPlymy7GCj6QmdfOkF2kSJNmbx0zX5wQZt6CW1sG7mFtz8iaYT8ygr5kMKOU16b8654s2PH6HUf8ukvrBuOQ=
X-Received: by 2002:a2e:bc1a:0:b0:2ec:5f85:61c0 with SMTP id
 38308e7fff4ca-2ec5f856227mr30792201fa.48.1719232601079; Mon, 24 Jun 2024
 05:36:41 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj8eaSiyiAkCHgedu-+3T8ph3ETK_O4aq7T=y_kDCJ1JKA@mail.gmail.com>
 <2056.1719231783802644622@lists.openembedded.org>
In-Reply-To: <2056.1719231783802644622@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 24 Jun 2024 14:36:29 +0200
Message-ID: <CANNYZj-Osdn=hM8zjVbPhEQcU7ukR_zyY5xqZAWnp64FEa2SjA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] package.bbclass: Fix broken dev package dependency.
To: sreejith.ravi087@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 12:36:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201081

On Mon, 24 Jun 2024 at 14:23, Sreejith Ravi via lists.openembedded.org
<sreejith.ravi087=gmail.com@lists.openembedded.org> wrote:
>
> We are building the components through Yocto and using dev IPKs for the dependent packages (generated from Yocto) to resolve the build dependencies.
>
> Steps:
> 1) Generate the libical IPKs from Yocto.
> 2) Copy the IPKs to a folder and create the local opkg feed.
> 3) Remove libical from the BlueZ dependencies list.
> 4) Install the libical-dev IPK from the local feed to the BlueZ recipe sysroot.
> 4) Build the BlueZ package.

The supported way to do this is with 'devtool modify bluez'.

Another option is to use a Yocto SDK, if you only want to build
binaries with a cross-toolchain and not run any of the recipe tasks.

Installing things into sysroots with anything else except bitbake
isn't supported.

Alex

