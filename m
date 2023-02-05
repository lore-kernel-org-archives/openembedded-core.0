Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 577C8C61DA4
	for <webhook@archiver.kernel.org>; Sun,  5 Feb 2023 01:08:24 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web11.20755.1675559296793212253
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Feb 2023 17:08:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iC+E/78I;
 spf=pass (domain: gmail.com, ip: 209.85.167.176, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f176.google.com with SMTP id bj22so7176953oib.11
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Feb 2023 17:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=S18Z0hUOmzoIbwhYtmuO8fQX0Pz4PDVY2wq+vZV7eWI=;
        b=iC+E/78IdNr2vG4ggleFkzdgPox/+oJOX6kmp+i5G/USUzGWcFnaPMzwt5XU+etyCL
         t4kUqjywPW2ydO9a5ibsmaen5XSsXTel5wo2kC8xqCjHnjWrviuTpxIBFUY/ClTCDtSE
         TVFgK93ynRjRkFiX8FH2XLtxeWsMEj9RVu6RVdQVVYG2JuG1l1Le6KYUfw/4xZwH0KB1
         7upm1N90aMYSvFsIJZNHwIpiZyI61F4HGpdGTw1UvuwlPyjd5w48vv/Wuap+ORGVGSFk
         4oxiguHuSE+8jc7pN5/4pS591lvGs/1GYYYYMWeQs+TupeWWRkb9x2H05/iBk88RHElp
         1XFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S18Z0hUOmzoIbwhYtmuO8fQX0Pz4PDVY2wq+vZV7eWI=;
        b=wl7+smQYL8pjuz8o7mBxa57iny7CKV5I+Mlfpbvw0KJ2wNHkqLyzxSNeI3LG6AU6IW
         K0EO4fK3Dco/nRTxuyyuzwsktjoOUrhqOvqrK6SHI+ZQZM/ys03vV5Yv/03QALqbRoAS
         UqAOlwKdNRZc9bu0jDwvX9zMy0v86q7OWszRPtyqiwk0qUtlQn+Z9cztZJQjH7FaQUwe
         GqQwB6mrPDTkWJkJtyseUaEfDj2YNGopW/oRwpsJkLmJeYc64k9kp1MLNGG3TAcYtTs3
         cpi2iMC6jA00xaqDQ1og0FlyzVrhrC+uxEcLJcugbGdw4VDXXxMZqP0+pv/EKzVjZSZP
         bPpA==
X-Gm-Message-State: AO0yUKWdJkfOuH+nhW8H/6oxm3G2q3h23ypKJvIT2k+lEBCHtCR3PaeK
	iB6fWxvvNjmibzxxdHsb6W1CCaq4opbcp1rKsZM=
X-Google-Smtp-Source: AK7set+pIev7b5n10z2FbmjB+9FL0KeHeolssgCq96Lu0NNRNApN0YzoXx5yrmUvJoNcRN1iLQ3ND0rMZU+Suatg8nI=
X-Received: by 2002:aca:320a:0:b0:36e:f5f8:ccd9 with SMTP id
 y10-20020aca320a000000b0036ef5f8ccd9mr595209oiy.55.1675559295934; Sat, 04 Feb
 2023 17:08:15 -0800 (PST)
MIME-Version: 1.0
References: <20230204114133.1178502-1-richard.purdie@linuxfoundation.org> <20230204114133.1178502-2-richard.purdie@linuxfoundation.org>
In-Reply-To: <20230204114133.1178502-2-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 4 Feb 2023 17:07:49 -0800
Message-ID: <CAMKF1srgXYOdpErkN9Wjcma3CzbA+Nd6NykdEHCBG-pvS6YTyg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/3] libc-locale: Fix on target locale generation
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Feb 2023 01:08:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176781

On Sat, Feb 4, 2023 at 3:41 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> If on target locale generation is used, it fails at first boot showing
> errors about a missing directory. Ensure the directory exists.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes-recipe/libc-package.bbclass | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/classes-recipe/libc-package.bbclass b/meta/classes-recipe/libc-package.bbclass
> index de3d4223a8c..8a99f73ae72 100644
> --- a/meta/classes-recipe/libc-package.bbclass
> +++ b/meta/classes-recipe/libc-package.bbclass
> @@ -51,6 +51,7 @@ PACKAGE_NO_GCONV ?= "0"
>  OVERRIDES:append = ":${TARGET_ARCH}-${TARGET_OS}"
>
>  locale_base_postinst_ontarget() {
> +mkdir ${libdir}/locale

should it be mkdir -p for when it does exist beforehand ?

>  localedef --inputfile=${datadir}/i18n/locales/%s --charmap=%s %s
>  }
>
> --
> 2.37.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#176760): https://lists.openembedded.org/g/openembedded-core/message/176760
> Mute This Topic: https://lists.openembedded.org/mt/96742036/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

