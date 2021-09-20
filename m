Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web09.11132.1632142275647464909
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Sep 2021 05:51:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZBwunQW3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id t8so29359336wrq.4
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Sep 2021 05:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=POGNDUVR2PdcAUmLzVJdqqdzsuYfNKBAGv/q1Z6iBIY=;
        b=ZBwunQW3HyPXsUqc8jMVCD6aaXamWHYC9EW0HJipiOzxkWM6BzJLagzMlI86roANs2
         BdZM1jxmBuC8Pv7QsGFTSwkvJaeyVZgPvIVZPAnkaaVxn9n8cpUPeHDYHvmYX+UivTas
         4ihrmHSC5aBEjT3ttJdPtojKtPl6vMZ2+9/7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=POGNDUVR2PdcAUmLzVJdqqdzsuYfNKBAGv/q1Z6iBIY=;
        b=wogiVUFZKkCzxQmU/K/1awb5wWXnUGF0QixUNVIp5YX/wgHZm3SLUW4vUbPQtlx/TS
         yQQ6mUYVrlvtHRToe6Jdc6sr3Zk6JoEjiUaMkkw4vSC4sPTwuhM+d03lEDScO+wq4h2i
         yCGCwK72742+okUeayDMlQlrtA8NM4XjKBec1L3pzdIqwy2MPE4F807OT+y6GBv28x+a
         6D09nO4uA2uJ8qaW4w5tq72MNNnJeCoGtEdxVKMSwr8hfJguzw4oCAoynuh2/excfo9j
         3GDe2p++hfWbY49/9pNUD1/8o52aEKQKR/2w5lGc2OQNuBBp9G/BAAxUzBHM9EZeN5aN
         MbDw==
X-Gm-Message-State: AOAM530AC2rMeM2zC3EPPh9iTawHRN7reSbkJhC/MP1lac3+zLVySFdk
	BF3YSdq5O1g33FcKpKRa16cyoW0y59hUx7O8
X-Google-Smtp-Source: ABdhPJxir/HDTNRVh+eb3q8KUW/Ps4YO1I4NmEq7tD7DQqXNNZ0QTyJSRAvhPCoXDnq0i8rGFCLAFA==
X-Received: by 2002:a5d:4d91:: with SMTP id b17mr28004252wru.321.1632142274136;
        Mon, 20 Sep 2021 05:51:14 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:7173:466e:b128:3e8b? ([2001:8b0:aba:5f3c:7173:466e:b128:3e8b])
        by smtp.gmail.com with ESMTPSA id e5sm9710177wrd.1.2021.09.20.05.51.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 05:51:13 -0700 (PDT)
Message-ID: <3efdb496fefa59a9a7edec21f2ca751de5439bd5.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC PATCH 11/14] populate_sdk_base/images: Drop use of 'meta' class and hence do_build dependencies
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Sep 2021 13:51:12 +0100
In-Reply-To: <16A6887F33E2E04C.31899@lists.openembedded.org>
References: <20210920124621.1576702-1-richard.purdie@linuxfoundation.org>
	 <16A6887F33E2E04C.31899@lists.openembedded.org>
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2021-09-20 at 13:46 +0100, Richard Purdie via lists.openembedded.org
wrote:
> The 'meta' is old and not very useful. It empties PACKAGES and creates
> recursive do_build dependencies.
> 
> We shouldn't need such recursive build dependencies any more so simplify the code.
> 
> This does cause behaviour changes as some dependencies are no longer built.
> It did show up issues with qemu-helper-native handling for example but those
> issues look like real races and the underlying dependency chains were not correct.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/populate_sdk_base.bbclass | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
> index ccfe2232895..49e166e697d 100644
> --- a/meta/classes/populate_sdk_base.bbclass
> +++ b/meta/classes/populate_sdk_base.bbclass
> @@ -1,4 +1,6 @@
> -inherit meta image-postinst-intercepts image-artifact-names
> +PACKAGES = ""
> +
> +inherit image-postinst-intercepts image-artifact-names
>  
>  # Wildcards specifying complementary packages to install for every package that has been explicitly
>  # installed into the rootfs

This change is probably high impact in that it changes behaviour the most of any
of the changes. It does make image builds use a lot less sstate and in theory,
if there are issues with failures from this, there are probably existing races.

It does also have CI impact as it changes the things which are built as not all
build tasks now run. Open to opinions on whether we should do this now or not.

The meta class is pretty useless and should be removed regardless.

Cheers,

Richard

