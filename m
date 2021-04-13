Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web08.6706.1618307159786132936
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Apr 2021 02:46:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=d3tbKSlO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id p6so9049853wrn.9
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Apr 2021 02:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=adVgR0cSBM3a4w7ttUPA1DWtVzrTIWz8fuaLbqAmcTc=;
        b=d3tbKSlOC+UnZpIvVJir4IVxv5hNjO47F8QZw6j8GKm/7HAHFHBUzLUtwcP6THZsvp
         NqHtNAbow7rf/MQhyHEKg0b+lIzB1Xlb03xrRuhRi0hC/wgJeFAChhgrxZFyQ6941Ocd
         Y1tdRS2QQvNh+AuXLUor/EDdlmhA2bfx1WM/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=adVgR0cSBM3a4w7ttUPA1DWtVzrTIWz8fuaLbqAmcTc=;
        b=Qng44gspbtt5C/3WS5qwvTYFZqJcYmkV0Z+iB+bXqt3L07+vLcRwka7iVGq0S+l6wo
         dF4eNn2plaP+pnnvtqPas7LsBTmgkbVFOl2QLJlCSbWHnTxdZ/3ygjb8Ax6B88GBYB3j
         0rPFP8lrUBhXIsnr2M2J9kdaggqKrf/roYUSjCpazoucaBSfv6EbWyEqI3etYdr1W12a
         yafO/7bk+myLfLku1ti4mMKaemFx4D3l6LDvlM3DvGNIg9nYXlL++3FYTWIxeCoxXW5U
         n1x568ET1WggSwBjNpCaELqydx/0N5IGScIHuMBJutaJoFDr0WUiYyO3CjvjQcQW3R6r
         duww==
X-Gm-Message-State: AOAM530pyZOP0JZNVjVi5FRi0wTulKAXKqYTeQmUGH/xVfCt8elChPri
	eI8ZAGyMuRGAftr0Q86TPYKAOA==
X-Google-Smtp-Source: ABdhPJwTFxaBzhkwoRZiceCZpnhG6Qd9LbxaGQTMa1he7Pw08mvKUveYUl9TpTwTg8um1oAe5sV3Sw==
X-Received: by 2002:a5d:6684:: with SMTP id l4mr35710393wru.381.1618307158224;
        Tue, 13 Apr 2021 02:45:58 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:cfa:4562:e70e:c00b? ([2001:8b0:aba:5f3c:cfa:4562:e70e:c00b])
        by smtp.gmail.com with ESMTPSA id u3sm1868079wmp.42.2021.04.13.02.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 02:45:58 -0700 (PDT)
Message-ID: <a15e36dd1ef45bba25c2f7ca78ce17110d767723.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] libxcb: Add inherit python3native
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: krellan@google.com, openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross@burtonini.com>
Date: Tue, 13 Apr 2021 10:45:57 +0100
In-Reply-To: <20210413092432.3688149-1-krellan@google.com>
References: <20210413092432.3688149-1-krellan@google.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-04-13 at 02:24 -0700, Josh Lehan via lists.openembedded.org wrote:
> During compilation, the local Python environment leaks into
> the Bitbake build. Adding "inherit python3native" fixes this.
> 
> Signed-off-by: Josh Lehan <krellan@google.com>
> ---
>  meta/recipes-graphics/xorg-lib/libxcb_1.14.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb b/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb
> index f0a223a19c..40c7b1cc3c 100644
> --- a/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb
> +++ b/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb
> @@ -24,6 +24,7 @@ PACKAGES_DYNAMIC = "^${PN}-.*"
>  FILES_${PN} = "${libdir}/libxcb.so.*"
> 
>  inherit autotools pkgconfig features_check
> +inherit python3native
>  


Could you provide a little more information about how this is breaking things?

Whilst python is used by the libxcb build, I believe it shouldn't change the 
output, it doesn't in our reproducibity tests.

Adding a python-native dependency does slow the build down a bit so if we 
don't need it, it would be good to avoid it.

Cheers,

Richard





