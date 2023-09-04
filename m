Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86AA5C83F33
	for <webhook@archiver.kernel.org>; Mon,  4 Sep 2023 09:05:02 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.43999.1693818293439655425
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Sep 2023 02:04:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=onYUyrJr;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-500cd6261fdso2147965e87.3
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Sep 2023 02:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693818291; x=1694423091; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eP29V/0v9LgIA/O2x2XqTTBtaQc5mlXgOet9dHli0Ho=;
        b=onYUyrJr1LfoFvkp7ue/AkBfMyBkk2cZxug3J+EhKJVoPIZUeKXpBjVEwpVX4CmB16
         Ztn8nKJj2c8yuu5iuvSaJkMYk/MbSYjLFLxpeyaV+okR3Uyg5hVlFyprKmwAVvpBw6eO
         79H4QFT3iRXMPtnCcXh0js4TwyfA9NPkxj+1umFy2QAmO1nUgz4zmIfuGSZOfNNISat1
         x/MrGx1lgwirfDD6PucBEm0MVDus2WnsnD9q0T1tskH8KxKtMcSXqN5jznTte83PSCHk
         53z9ri2r0B3qQRTUVm8T+KaX57rfwbQSMntSad7GgufAVh3dCU70skRpQkP6mW4gGQmV
         Ucpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693818291; x=1694423091;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eP29V/0v9LgIA/O2x2XqTTBtaQc5mlXgOet9dHli0Ho=;
        b=jN2xQZhLm42XSalmTJTw2UVAeZlM9dCnDTeMqMxe5VTe2XJo6TQfNpSQwdBJbV6Xtl
         HnYVM2Z9ZsVYXX1pHD8ed/+bZkxN8TEeRZQNtH5f7mrhZUcLHvlY8WYLUsVw8w7bz46h
         g8n9/LIVJKQqWhgNx2lLRdkKOF72l433Ysf/VL2ES6yPzf5Z8PoGIyDC3eIYro9HH92u
         HJfxW9X4l+cPrYVFssOgwiZ5/n+VFnQCrXS69ImmtLWl1d8gTn+F3UL7cu8E/S+kmXTu
         IYyXgcKTVNcwq2mQChG2iujUCTGAmCpAYoCea1wmvfVcCM5atOaULDq1wP7R1TWUh6zj
         KW+w==
X-Gm-Message-State: AOJu0YyxgHg+C7SWcVjJmglWWP6RZtKHMqaqJEgEpf0HTL4TFBRfDcsJ
	dgvixejESNnW6MuHuYFFQ2K0dhnXiFr0Yg07zSc=
X-Google-Smtp-Source: AGHT+IF7m7LnbFqcQZQcgT5uY6o81QHfiN9Vbup1v9YoyHigkaTc0gZnWqfY3pfXwVAb/5apjIg0DA6To6a3Fr7W5YM=
X-Received: by 2002:a05:6512:3131:b0:4ff:9bd9:f69a with SMTP id
 p17-20020a056512313100b004ff9bd9f69amr5177771lfd.65.1693818291223; Mon, 04
 Sep 2023 02:04:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230904084937.4135164-1-bbara93@gmail.com>
In-Reply-To: <20230904084937.4135164-1-bbara93@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 4 Sep 2023 11:04:39 +0200
Message-ID: <CANNYZj8a-gncxWB4EtpHNc=E1f4=1M2+pr38=ige=X+BxYuVow@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ghostscript: avoid neon on unsupported machines
To: Benjamin Bara <bbara93@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Benjamin Bara <benjamin.bara@skidata.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Sep 2023 09:05:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187168

On Mon, 4 Sept 2023 at 10:49, Benjamin Bara <bbara93@gmail.com> wrote:
> +do_configure:prepend () {
> +    if ! [ "${@bb.utils.filter('TUNE_FEATURES', 'neon', d)}" ]; then
> +        # unset the neon-specific variables if no neon available
> +        sed -i 's/HAVE_NEON=".*"/HAVE_NEON=""/g' ${S}/configure.ac
> +        sed -i 's/TESS_NEON=".*"/TESS_NEON=""/g' ${S}/configure.ac

Ad hoc patching with sed should be avoided if possible because it's
difficult to understand and is prone to silent breakage (e.g. no
longer doing what it was meant to). Can you make a proper patch please
and submit upstream as well? Perhaps add an explicit option?

Alex

