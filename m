Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web12.22836.1593613769712341886
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2020 07:29:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KikoE02C;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f67.google.com with SMTP id z15so12845183wrl.8
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2020 07:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=GozOI4J3+vkfNDX2+vGi5ioP5xMuy0IV5iMaP7dpXYY=;
        b=KikoE02CZsWKhSUK+2YcZdcCItIseAGUlSv03GzJf+HYHi7oTJzdBkZV8/CoPACqpl
         07xRpDfypbR5eMqKNzASoJ9VAmJDAKRhgZ7N6OHRVJt13ERNwPzb50BsrFGP/zb+C6sw
         dII9plwLICd44rVRY9lwXChj34XlrOOnZOzPk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=GozOI4J3+vkfNDX2+vGi5ioP5xMuy0IV5iMaP7dpXYY=;
        b=JVnl2E6RIOriZ2dXaEv9l0jBBdjwGlcg9+/dLG5nXF0vj3dzpfIVLL5/1Bwen17IGm
         uNGqYfM5xIb7QX5fYAO1PKLbptG11hU3fe2aErAP4vRURPU19bSh4xBcT/eNZG+MI72s
         Srnq60Fn/CFdrBl0QLZ4F/gjXIIYKHp2gDGudAL7nzDi+cu0ZfT8Y/B/TcCVL4+F97Le
         OFzSw95m/9KD8DYT1zN0WQBBoJJr8gl6MbWybwEr3H73xANDhAXV3Kx+CrkBoYtQcNqD
         Bmj/6lTHtLat7NXGpHMGQksqHjWooqS66EMubBKINGO0kBOautfDTXhEM8ordvXVoWz+
         PF1A==
X-Gm-Message-State: AOAM530Yfn6DBgpRcQraHiKZi8LVDU2cW+ZcsTkXAi4H2K9bUvhndofe
	ZYcSs1FTfmqPon5aS9dLHbf1Qw==
X-Google-Smtp-Source: ABdhPJyM3D9florWaqhL62JCoI9/0VkjuVJmAM3JBHACiKPPfjNQB4pUwQwtqSnb7rdal63iCTBBXg==
X-Received: by 2002:adf:c185:: with SMTP id x5mr29508913wre.403.1593613767750;
        Wed, 01 Jul 2020 07:29:27 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id v3sm7438472wrq.57.2020.07.01.07.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2020 07:29:27 -0700 (PDT)
Message-ID: <e54cb280ad6ef4c7fca308919769da26f115017d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] cpio: add nativesdk support
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: hongxu <hongxu.jia@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 01 Jul 2020 15:29:26 +0100
In-Reply-To: <20200701134341.2894-1-hongxu.jia@windriver.com>
References: <20200701134341.2894-1-hongxu.jia@windriver.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-07-01 at 21:43 +0800, hongxu wrote:
> Since commit [24b80d211f nativesdk.bbclass: set sbindir to bindir]
> applied, sbindir = bindir in nativesdk, then routine `rmt' is
> installed to bindir which break `rmdir ${D}${bindir}/' failed with
> `Directory not empty'
> 
> Don't rmdir while nativesdk
> 
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/recipes-extended/cpio/cpio_2.13.bb | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-extended/cpio/cpio_2.13.bb b/meta/recipes-
> extended/cpio/cpio_2.13.bb
> index 9e35a80f8b..44036f07f9 100644
> --- a/meta/recipes-extended/cpio/cpio_2.13.bb
> +++ b/meta/recipes-extended/cpio/cpio_2.13.bb
> @@ -23,7 +23,9 @@ do_install () {
>      if [ "${base_bindir}" != "${bindir}" ]; then
>          install -d ${D}${base_bindir}/
>          mv "${D}${bindir}/cpio" "${D}${base_bindir}/cpio"
> -        rmdir ${D}${bindir}/
> +        if [ "${PN}" != "nativesdk-cpio" ]; then
> +            rmdir ${D}${bindir}/
> +        fi
>      fi

Please make the check "bindir != sbindir".

>  
>      # Avoid conflicts with the version from tar
> @@ -46,4 +48,4 @@ ALTERNATIVE_LINK_NAME[cpio] = "${base_bindir}/cpio"
>  ALTERNATIVE_PRIORITY[rmt] = "50"
>  ALTERNATIVE_LINK_NAME[rmt] = "${sbindir}/rmt"
>  
> -BBCLASSEXTEND = "native"
> +BBCLASSEXTEND = "native nativesdk"

So something which was never enabled broke? I guess this was hiding in
some other layer?

Cheers,

Richard

