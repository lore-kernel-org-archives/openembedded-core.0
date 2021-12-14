Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA801C433F5
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 19:39:51 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web12.30905.1639510789822242025
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Dec 2021 11:39:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=CpOYZ6TA;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.47,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f47.google.com with SMTP id r25so66197178edq.7
        for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Dec 2021 11:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1qm0at2JLj7+Oq5vESe0mwcQ+7XsCclT/CDRJD+pZqg=;
        b=CpOYZ6TADe3jr0K27ag2+OSfdslTp7CutzJeeNH5BZIzo5ukXGcAxoSVFjI46ip1eP
         5BC8NGzW+AQAR48uSoD0hWnBG0bPMnYZRTvXkIH6V82qGXvhbiud24fTL4w5agNfmJwq
         eOgTvhJu7Uw6Bi3KX20UlUzQFiyxXqgsTMdrfQSz+7X6nT2DiE5PJdX1vXL/C/vhvZAx
         8LAzezLPPFIGGTpByhVY3EFAcPn42Lq202hQW5Io/MiAztnZMhLDsW+scg8pmzTgIidy
         FFTpltwON1dFnFEowRN/VqSualmqs7dsb1+siZkzMmpEtmLLJWbtm336OKDOMgETeIhp
         m3xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1qm0at2JLj7+Oq5vESe0mwcQ+7XsCclT/CDRJD+pZqg=;
        b=NwUL+/gqZc3FuOVAjW2qZ6tZkEd8o9kyJJaaHaNozxswQHXRRbUG1SuIzTxK2zVX8y
         hAbhcwm5HtyuiofFNaJgPiAJnY4mvuAKfRmt6f4i4RJzI2Hi8UF7Fu5R8B1sY/nni2z3
         uRs7ratzOE3xrvI/TybbpjJEp2p9gpxdUiCRSNKZ3inl0LThraMEMye6Ak2JF3NFyWf2
         9NeA/ul87yQIubaAKWc9BxXz3qXLUUDvdeNGvNXSwQuPOl4gPTkJ/rnNg7Ot7Q0sEpsq
         UU52dvLZbJCjVT0m/M97Zji8kIswUFpy62Acpc3mvW9jjUcHkD8dHE2vtawDNFaKseAy
         SZ2A==
X-Gm-Message-State: AOAM530TGKSlMdBCrOqtISteipXDU6WaZmYJtNCZ8Nz1XMAW6zp0xC/Q
	z7Yv4Rx8+CyHdy+TVL/RbKmt6JEllcN6q/H00jBxIA==
X-Google-Smtp-Source: 
 ABdhPJycHVdgcmuPxA/fc0/wxdbu3dcHgZFcQABT9SJKnTwaKLlTpX8WHRf6EnLW3v/yEglI1AQ6EMdfjui1b2FGjsE=
X-Received: by 2002:aa7:cada:: with SMTP id
 l26mr10913992edt.376.1639510788029;
 Tue, 14 Dec 2021 11:39:48 -0800 (PST)
MIME-Version: 1.0
References: <16BEE129ECE910F8.14236@lists.openembedded.org>
 <CA+_AqisJEDx-EE6+4fuMQ62y+Fzc7sGA3EcHGRHQqis4Ro8wwA@mail.gmail.com>
In-Reply-To: 
 <CA+_AqisJEDx-EE6+4fuMQ62y+Fzc7sGA3EcHGRHQqis4Ro8wwA@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 14 Dec 2021 09:39:36 -1000
Message-ID: 
 <CAOSpxdY5mfDc5ORJ_U364M8zNgTpqkcGJxq7hzpbuhhPAUmEUA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH][dunfell] lttng-modules: do not search in
 non-existing folder during install
To: Anibal Limon <anibal.limon@linaro.org>
Cc: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org, Andrey Zhizhikin <andrey.z@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Dec 2021 19:39:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159707

On Tue, Dec 14, 2021 at 9:36 AM Anibal Limon <anibal.limon@linaro.org> wrote:
>
> Hi,
>
> Any update on push this to dunfell?

It is in this morning's pull request:

https://lists.openembedded.org/g/openembedded-core/message/159699

Steve

