Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F09DC433EF
	for <webhook@archiver.kernel.org>; Mon, 30 May 2022 16:16:41 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web09.38618.1653927399199527285
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 May 2022 09:16:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=RsodD+OF;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.46,
 mailfrom: steve@sakoman.com)
Received: by mail-ej1-f46.google.com with SMTP id f9so21842061ejc.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 30 May 2022 09:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jHowBbgv7KP/P1QgvZZUGp35zcjO1AamhwESWM+1W+0=;
        b=RsodD+OFFE40YkPKjzrnUPhAgxQUptc+Uz/gsafjNcuO53DdK83oUNbsT9H1CMSWgW
         Z3A7aSlZ4xBgJf9+C2g4Oh0eEvKzpvz3rwVv43B0bh/83qP9Yeu2Wo5NZM4NBWTD7SKR
         QKw1N2qEQCNc8sXkXW5qGVG+ROKmF8RGHTIlfAdrrFsYdctXFFOqE7kYU/qIHSm3P6CG
         ohwmQuKFxGgKKhmY6DFCmEhfz1EnaJOs+vkO2p6fuBxsE5RC2a7LLp7HLySfJ0VcpaIz
         MvlHwCclz3yTpVar1IJneH9B972VBxsHC69kbqviT/95c2eV7pBpCsOdu+WjLmqHkA29
         V0gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jHowBbgv7KP/P1QgvZZUGp35zcjO1AamhwESWM+1W+0=;
        b=oO0T51EbaH6K3/+Vtvn1qs44M55IYkJoeyp1sVUnmrKgf7QA51QUzST6VabwwzYcDp
         w0m4YMju7d0zP30PCfBLErvo20J7KDdPzl4URUttknMvId4MFmZv5qJxXck4ylcSZaIU
         +Qy1KgywPuInQAokwtSPCoBMCkjOmtOgJJwR51j6z0RRcEX6tLOCE5rk7TRu8N5oNCyT
         6ASr1ykiz8+i6CNqmb4PJiMx8SJgVbf7tkAsTzWe9RNHs7Qyyz7J9WVdk+P5iiqQFwVA
         k7kKWPT0EQKmlHob+XMgz2BMP7EqaLXU0cJ0Uz0GGBuERTxGEvrPbK06M1iSQOk4jaH3
         wWwQ==
X-Gm-Message-State: AOAM532K7883gzR8qdxElpDEZYAf2dovx/Oigz+b+SGa/5vo35NLN2xb
	blMwFrxYJ1s0VEaBCaby3hUHe05ga7ahhvjLxRyDPg==
X-Google-Smtp-Source: 
 ABdhPJxtdKW1NXqfQ/laJJkq4mGK3JS8fZFxueOsX2M1WsZluF0OM3urHTegyqplZOthMoOG+MkeS0cbGM1Q8faKfNc=
X-Received: by 2002:a17:907:1621:b0:6fe:fc8f:21f1 with SMTP id
 hb33-20020a170907162100b006fefc8f21f1mr30583963ejc.359.1653927397665; Mon, 30
 May 2022 09:16:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220523081041.5680-1-rak3033@gmail.com>
 <953.1653909572199421376@lists.openembedded.org>
In-Reply-To: <953.1653909572199421376@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 30 May 2022 06:16:26 -1000
Message-ID: 
 <CAOSpxdbRH0_9jmge91F7fSwJ1OE3G0D5BPUeneORVr5DekhRYg@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][dunfell][PATCH] curl: Add fix for
 CVE-2022-27781 CVE-2022-27782
To: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 May 2022 16:16:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166292

On Mon, May 30, 2022 at 1:19 AM Ranjitsinh Rathod
<ranjitsinhrathod1991@gmail.com> wrote:
>
> Hi Riyaz,
>
> You have used the wrong label meta-oe while sending this patch.

Indeed, I missed it due to the wrong tag!

> Steve, Can you please take this or do you want us to send it again?

I've got it now, no need to resend.

Thank you,

Steve

