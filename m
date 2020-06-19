Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web12.147.1592602062050140097
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2020 14:27:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IO8JzdIS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id d128so10328123wmc.1
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2020 14:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=xF4snhkUslo6Vm6dL7VCCjeA02NhKUJNoFJE2HwJkYA=;
        b=IO8JzdISJy17KeqW0XR7X9rR+dB1QX+qDRUSi7AoLgl9bVMmr+MS5x6bQ6o3fmam5L
         IrmNxVlUw+lL3elFcoXlGT5LU8jdp6XSLFlj9BgICfiYaue1/ozqLNl967DIlzim9nLd
         mYjsZrm0x3p8lelu9jFHv6ukP4looketX/J0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=xF4snhkUslo6Vm6dL7VCCjeA02NhKUJNoFJE2HwJkYA=;
        b=rkA19lI97T9tV8CrAmoXopbyZPoc0oMFX47mIYzPgTdP/dbpI9Mtc4Oudpvc/G1XJx
         w66wG9FfTw10cvi9OzWcpUyrZ6JWiYqgLC90muktTWPM9w26ZLV69XEP1FFL1QiaLOia
         SNPRr6Y7Rvd0C8kq5kd/wJoZ104mIv3Ahwe1tCR/TJhQLly8Y9PWFdkUbT4ZyJIsBwgl
         aiHDYHrSuNApeDGYpsi6lXyKOXlU/tfjIF/EfsFHYFCzjADcnMPXTRLyHfMpMM7WJBmQ
         jwnitQ9UJMI+E59Lxxm8s3qhBaLMGOe5FV+EHqLZCI0tioGonZ0Ut9jszgPltTXRooSL
         Y/6w==
X-Gm-Message-State: AOAM532SU4sQ+sAgL+N9Juo1npyTsFdJKwBjJti5zT+cPrUMy7kah00G
	wmzuBiVRX9NOq+1kpTg6H2W+Kw==
X-Google-Smtp-Source: ABdhPJzE6LWTqC5Ztvp+FtaohHg8rTNonXi4MRsThwj1dBQ5s9v0dnn9BA64Xs+ahXhCZ9LgvO7f/Q==
X-Received: by 2002:a7b:cb4c:: with SMTP id v12mr5527015wmj.43.1592602060530;
        Fri, 19 Jun 2020 14:27:40 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id i15sm8430451wre.93.2020.06.19.14.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2020 14:27:39 -0700 (PDT)
Message-ID: <f8cae5c1a6395d260bd8e5aaa29d5b49d8051d17.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/4] eudev: Extend for native/nativesdk
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Christian Eggers <ceggers@arri.de>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 19 Jun 2020 22:27:38 +0100
In-Reply-To: <20200619194351.30053-3-ceggers@arri.de>
References: <20200619194351.30053-1-ceggers@arri.de>
	 <20200619194351.30053-3-ceggers@arri.de>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-06-19 at 21:43 +0200, Christian Eggers wrote:
> eudev is required by networkmanager.
> 
> Signed-off-by: Christian Eggers <ceggers@arri.de>
> ---
>  meta/recipes-core/udev/eudev_3.2.9.bb | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta/recipes-core/udev/eudev_3.2.9.bb b/meta/recipes-
> core/udev/eudev_3.2.9.bb
> index f96f8cbe78..a4cec456d9 100644
> --- a/meta/recipes-core/udev/eudev_3.2.9.bb
> +++ b/meta/recipes-core/udev/eudev_3.2.9.bb
> @@ -94,3 +94,5 @@ pkg_postinst_eudev-hwdb () {
>  pkg_prerm_eudev-hwdb () {
>          rm -f $D${sysconfdir}/udev/hwdb.bin
>  }
> +
> +BBCLASSEXTEND = "native nativesdk"

A native eudev is a really bad idea, a nativesdk one isn't much better.
If there are libs we need from here, then the recipe should only be
generating those but a "native eudev" makes no sense to be needed by a
build system. In case I'm not being clear enough, is bitbake going to
replace the udev/systemd from your host system at run time?

Cheers,

Richard

