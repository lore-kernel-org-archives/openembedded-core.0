Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47F65C433F5
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 17:29:07 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web09.297.1634318945971338099
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Oct 2021 10:29:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AAWpf2aD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id
 g193-20020a1c20ca000000b0030d55f1d984so3606119wmg.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Oct 2021 10:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=sLgZlQWVJPAGQvrmwoBHF0//oue0UsQYIKQ4eZqk1VI=;
        b=AAWpf2aDmlLu1rXEegZ0a9cP5jELxRS7wG4qh+toDR2tiJLODOtq55UlUSr24b6WvT
         Zwq4YUpTFJGcvLYW35VdOqntTVEDBLJ1Lb+tRQuupXxpUo0DtP5dJqx/2RiqZSJBCcDP
         FajI8p7KjHRXKzkGnsTvisXETVkSdgrBXEzMI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=sLgZlQWVJPAGQvrmwoBHF0//oue0UsQYIKQ4eZqk1VI=;
        b=5Da6JS8Ko1jFuCjUcgoSdr76zinpTL04RrzfDg4M+2dPad81lIL22uW1e9X6CdA/sg
         u/who6ccN694pv2+tmgrz3lP7j98qTyqKaEHp+9y/eCaYg0juZ0/XQaxePTE4Ijj8dyS
         mMJt6USAwiAGAKXqH0PhL8CWAnqnY90+QI85bphyS+vzBXhKfuMFnKlrn5IDOtGO7Tem
         xG1CcGRvDqBgrW4R1cCHaLghp/6z7XbGYLP0hNWtop+UTJXNmf6cnePnZ0YD3jYfz5qd
         dlbeeNvPjnQyQbIzkNz0BlJalAr3uJBRcClhQIGvWH3fGGCgGMEg9DMzbkexy31EEsur
         Wl6Q==
X-Gm-Message-State: AOAM533IE4rmlw9V0FG3FdM2Qq1Swy7hcobbr1yijzRPzRB5nFA5N22x
	5F5auezKXNbEH3touELmov7xQA==
X-Google-Smtp-Source: 
 ABdhPJxqZF+gbjku4vJWkzYf9GM6m044mbl4uybSwD2D14Iv/hT1Sbm8zxX1V71n8syRgfmkR9NsKA==
X-Received: by 2002:a1c:3584:: with SMTP id c126mr14142734wma.0.1634318944203;
        Fri, 15 Oct 2021 10:29:04 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3c2a:82f4:3a7b:54b1?
 ([2001:8b0:aba:5f3c:3c2a:82f4:3a7b:54b1])
        by smtp.gmail.com with ESMTPSA id
 e1sm5711428wru.26.2021.10.15.10.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 10:29:03 -0700 (PDT)
Message-ID: 
 <5b92ee280a2f08291fa77a303d7b9edc98a61d30.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC PATCH] populate_sdk_base: add support for zstd
 compression (and default to it)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Date: Fri, 15 Oct 2021 18:29:02 +0100
In-Reply-To: <20211015170630.1069043-1-alex@linutronix.de>
References: <20211015170630.1069043-1-alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Oct 2021 17:29:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157005

On Fri, 2021-10-15 at 19:06 +0200, Alexander Kanavin wrote:
> This allows significantly faster do_populate_sdk() (5 min -> 3 min for
> the sato sdk on my machine) and decompression, at the cost of SDK file
> taking up more disk space.

Can you quantify "more"?

I'd be interested to know if a higher compression helps and what the time/cost
tradeoff is too. Not sure I'm keep to have it increase in size. This likely
increases the eSDK size a lot too?

> If that's a significant concern, it's possible to increase the zstd
> compression level or even go back to xz compression.
> 
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/classes/populate_sdk_base.bbclass | 10 ++++++++--
>  meta/files/toolchain-shar-extract.sh   |  9 ++++-----
>  2 files changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
> index 49e166e697..92a23e2325 100644
> --- a/meta/classes/populate_sdk_base.bbclass
> +++ b/meta/classes/populate_sdk_base.bbclass
> @@ -50,17 +50,23 @@ TOOLCHAIN_TARGET_TASK_ATTEMPTONLY ?= ""
>  TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-toolchain-${SDK_VERSION}"
>  
>  # Default archived SDK's suffix
> -SDK_ARCHIVE_TYPE ?= "tar.xz"
> +SDK_ARCHIVE_TYPE ?= "tar.zst"
>  SDK_XZ_COMPRESSION_LEVEL ?= "-9"
>  SDK_XZ_OPTIONS ?= "${XZ_DEFAULTS} ${SDK_XZ_COMPRESSION_LEVEL}"
>  
> -# To support different sdk type according to SDK_ARCHIVE_TYPE, now support zip and tar.xz
> +SDK_ZSTD_COMPRESSION_LEVEL ?= ""
> +SDK_ZSTD_OPTIONS ?= "-T${ZSTD_THREADS} ${SDK_ZSTD_COMPRESSION_LEVEL}"
> +
> +# To support different sdk type according to SDK_ARCHIVE_TYPE, now support zip, tar.zst and tar.xz
>  python () {
>      if d.getVar('SDK_ARCHIVE_TYPE') == 'zip':
>         d.setVar('SDK_ARCHIVE_DEPENDS', 'zip-native')
>         # SDK_ARCHIVE_CMD used to generate archived sdk ${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE} from input dir ${SDK_OUTPUT}/${SDKPATH} to output dir ${SDKDEPLOYDIR}
>         # recommand to cd into input dir first to avoid archive with buildpath
>         d.setVar('SDK_ARCHIVE_CMD', 'cd ${SDK_OUTPUT}/${SDKPATH}; zip -r -y ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE} .')
> +    elif d.getVar('SDK_ARCHIVE_TYPE') == 'tar.zst':
> +       d.setVar('SDK_ARCHIVE_DEPENDS', 'zstd-native')
> +       d.setVar('SDK_ARCHIVE_CMD', 'cd ${SDK_OUTPUT}/${SDKPATH}; tar ${SDKTAROPTS} -cf - . | zstd ${SDK_ZSTD_OPTIONS} > ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE}')
>      else:
>         d.setVar('SDK_ARCHIVE_DEPENDS', 'xz-native')
>         d.setVar('SDK_ARCHIVE_CMD', 'cd ${SDK_OUTPUT}/${SDKPATH}; tar ${SDKTAROPTS} -cf - . | xz ${SDK_XZ_OPTIONS} > ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE}')
> diff --git a/meta/files/toolchain-shar-extract.sh b/meta/files/toolchain-shar-extract.sh
> index 4386b985bb..4b8892af79 100644
> --- a/meta/files/toolchain-shar-extract.sh
> +++ b/meta/files/toolchain-shar-extract.sh
> @@ -51,11 +51,6 @@ if [ "$INST_ARCH" != "$SDK_ARCH" ]; then
>  	fi
>  fi
>  
> -if ! xz -V > /dev/null 2>&1; then
> -	echo "Error: xz is required for installation of this SDK, please install it first"
> -	exit 1
> -fi
> -
> 
> 

Deleting that is fine for testing but I think the final patch needs to do
better! ;-)

Cheers,

Richard


