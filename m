Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web10.8988.1589883577436167189
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2020 03:19:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Da2KDXtT;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id h17so15217168wrc.8
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2020 03:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=YkJgldSJTgga9/EhQhDcO+lnLCQ6SmRFNDmfoDYrThk=;
        b=Da2KDXtTWYhuBzmG+Hy8pkuaIifL4iZazblBVHWitAqNeOr5qs7QAVSBlI6frhmOif
         BKNWGBK6BF8WPwjGfVwUGPuocrMNQKgreglmaZkaRhossZVQZ3+Rig//pq9Ay0/kWM4k
         faTHvBjLgEZ99gcENrUxWRl9q11OGnkdzDx6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=YkJgldSJTgga9/EhQhDcO+lnLCQ6SmRFNDmfoDYrThk=;
        b=X1Rtkz4z5cV/dZy+EeE2lJx7yXiFILEWDGSsmD0th7Do7U/cypujPODoX4mHyP66mP
         zZu0Uo/VyqKl8anJY6rjOQ7ydArBxGh97/sjsqDcBgIta13YUBbGlavkeAOGba9+6E+Z
         hPS4sDms/2Z4kqIiZcvZAOIGTw19jYkI4/3gX+uApy7pN65HyP2G7P1EPbuIryU3vov5
         gWjcZj3sPqsYaV4uoXwmPG8TBbaAVdGLtinNM8VrbekDpinjYmMnV3+3NU3oRcvKYPgD
         SBX9V467ZF1ggygvLCEngARg9b9USIcaHm7JxQjyMF293VL6CduTIqRNyS2QKDMM2C3l
         Mv0w==
X-Gm-Message-State: AOAM530WQXu6spNL5jOZ9Qa5vvixSL0mrbMkjJ3LEOO3atf4LeCsph2W
	9i7zBAFH+fsMa4xwvjK4qUirhw==
X-Google-Smtp-Source: ABdhPJxGBzbNaXPDKrj0d29esL8jhhsPoIlFhB6W8P76m3/e0z9A5+d6OUQF6IqTlU4UGu5hEhHqAg==
X-Received: by 2002:a5d:4747:: with SMTP id o7mr24468841wrs.11.1589883575915;
        Tue, 19 May 2020 03:19:35 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id j2sm20065294wrp.47.2020.05.19.03.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 03:19:35 -0700 (PDT)
Message-ID: <6c522a2f25257552f6970fd6d722f9e5db90dc17.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] classes/image_types_wic.bbclass: fix racing risk on rootfs
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: hongxu <hongxu.jia@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 19 May 2020 11:19:34 +0100
In-Reply-To: <20200518160003.7429-1-hongxu.jia@windriver.com>
References: <20200518160003.7429-1-hongxu.jia@windriver.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-05-19 at 00:00 +0800, hongxu wrote:
> Since wic image creation will temporarily update rootfs/etc/fstab
> to add UUID (*temporarily* means rootfs/etc/fstab will be recovered
> after wic image creation), there is a potential racing risk with other
> image creation (such as tar, ext)
> 
> Such as UUID was unexpected in tar.bz2's fstab:
> $ cat unpack_tar_bz2_dir/etc/fstab
> ...
> UUID=219B-2933 /boot vfat defaults 0 0
> ...
> 
> Explicitly make do_image_wic depend on other do_image_XXX (listed in
> IMAGE_FSTYPES except do_image_wicXXX) to avoid potential racing
> 
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/classes/image_types_wic.bbclass | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_types_wic.bbclass
> index 96ed0473ee..79bafeb818 100644
> --- a/meta/classes/image_types_wic.bbclass
> +++ b/meta/classes/image_types_wic.bbclass
> @@ -25,6 +25,7 @@ def wks_search(files, search_path):
>  
>  WIC_CREATE_EXTRA_ARGS ?= ""
>  
> +IMAGE_TYPEDEP_wic += "${@' '.join('%s' % r for r in d.getVar('IMAGE_FSTYPES').split() if not r.startswith('wic'))}"
>  IMAGE_CMD_wic () {
>  	out="${IMGDEPLOYDIR}/${IMAGE_NAME}"
>  	build_wic="${WORKDIR}/build-wic"

I thought wic took a copy of the rootfs which it could them modify for
this reason but I can't find the code which would do that.

I think we should teach wic to take a copy (using hardlinks) as editing
files in the rootfs in do_image_* is not allowed. By using hardlinks
and putting it on the same filesystem as the original (rootfsdir +
".wic" maybe?) then it should be fast.

Cheers,

Richard

