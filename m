Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web09.23681.1605870481727793774
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2020 03:08:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ef7hu6wp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id p8so9624715wrx.5
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2020 03:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=qYTkSbPb1PQ4S0mACv+9PCJqv6dwsZ/DdRBeFG7MSQk=;
        b=ef7hu6wpMarxRODh8KhXoMJg3kIEGtpKEl/Sitv+ghh5rG00J4r+JkBe/nmS36tnqm
         L+5XfWJeQUc+wWd+ohc0T95TTCLJq5TcRXZotzoPYwkhrIs07yFMxY0Yk1ZHQV/4qN1b
         WdMJFlpPnPo2ZPrk713tOwDJZabgwrDlxehbc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=qYTkSbPb1PQ4S0mACv+9PCJqv6dwsZ/DdRBeFG7MSQk=;
        b=CP7kKKsGa0k4nZVfvrjgox6fgV5nvddkifI19LiqW9vn+1/DzDlopS+ljpLtR/JOCG
         4ZoPhLf5x59wpwIbdByKMmjdQtIOUoP+qPTFCeoMWeplw0LQ7MZ/VKlzaHCe7AHnOhcu
         bfL1vC8/O/8MhOCec/a6zBUMikPq6uje6UWX+JolqKFmtuLTSaMNDwyI7JgynAMNM02D
         Csba0b66FWHQObV8xbkYoKFXqZRaIAx87zlQUIQNXqd5qM8JneNPvQ8yxNq4XsNaivz5
         efNZmseaqFa1659KEsG+AaHim0Sc9E0vrgrw6B8+cqIc9Qfkca6c/vLQsEprc6HA6rGD
         WWLw==
X-Gm-Message-State: AOAM530nALgKUfUJr45xvozJIOme8408WSQ6iauDmw0ZQa+T6Y5OPGKX
	EiTNXm+7HZXqNdZepmaO2fXH3w==
X-Google-Smtp-Source: ABdhPJyzq1X/JdIyMNXpxfzB7FNoqyfUl1hrG86QxviHRhLdvepcB2CQWvX/v/RHrHYJi6BZ49bVkA==
X-Received: by 2002:adf:e541:: with SMTP id z1mr15213148wrm.389.1605870480164;
        Fri, 20 Nov 2020 03:08:00 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from c.8.b.3.0.6.d.4.9.0.2.b.0.0.0.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (c.8.b.3.0.6.d.4.9.0.2.b.0.0.0.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:6000:b209:4d60:3b8c])
        by smtp.gmail.com with ESMTPSA id w15sm4500414wrp.52.2020.11.20.03.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 03:07:59 -0800 (PST)
Message-ID: <fdd3fff795db407382604abaad4f6173d7028a9a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] buildtools-tarball: add wic dependency into buildtools
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Changqing Li <changqing.li@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 20 Nov 2020 11:07:58 +0000
In-Reply-To: <20201119004832.23088-1-changqing.li@windriver.com>
References: <20201119004832.23088-1-changqing.li@windriver.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-11-19 at 08:48 +0800, Changqing Li wrote:
> fix below error:
> wic ls ./core-image-minimal-intel-x86-64.wic
> 
> ERROR: Can't find executable parted
> 
> wic depend on some tools like parted/mtools/..., and we have those
> tools in native_sysroot. so above problem can be avoided by
> run command like wic ls imagename.wic --native-sysroot <path>
> 
> but this cannot cover condition that usr don't have build the
> image, the image just copy from somewhere.
> 
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta/recipes-core/meta/buildtools-tarball.bb | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/meta/recipes-core/meta/buildtools-tarball.bb
> b/meta/recipes-core/meta/buildtools-tarball.bb
> index 560b8d67b9..7783fabbf2 100644
> --- a/meta/recipes-core/meta/buildtools-tarball.bb
> +++ b/meta/recipes-core/meta/buildtools-tarball.bb
> @@ -29,6 +29,9 @@ TOOLCHAIN_HOST_TASK ?= "\
>      nativesdk-rpcsvc-proto \
>      nativesdk-patch \
>      nativesdk-mtools \
> +    nativesdk-parted \
> +    nativesdk-dosfstools \
> +    nativesdk-gptfdisk \
>      "

These sound more like something which would be in buildtools-extended-
tarball. Our rough metric for inclusion in this recipe is whether the
tools are needed by an OE build and these are not, they're only needed
for standalone wic usage. I'm therefore unsure whether we should be
adding them at all.

Any other opinions?

Cheers,
Richard

