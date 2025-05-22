Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86BFDC54E90
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 15:01:20 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.26064.1747926072665157855
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 08:01:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SqDHQD4r;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-440685d6afcso86417545e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 08:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747926071; x=1748530871; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LO79SqxbvbO6w/KgZWvyoryl2c+RxUhjXwpwG46yr1M=;
        b=SqDHQD4rUGa6WLxbn3EiUCidVgTZcnJAN94Aptnwox0UpSASe/mgsJzLmizr4Qz63Z
         6eiEWH5UaenrwjSVUBeAbWUjXxk2DPIthB3wExDVxd3sRJHzJXOQtBHUfwN6TBqqT/CF
         mUx4/lhDMJ5FVxNa0PyXdVQ8IQ7RlVlqoVeeFfvliaqMKGFrUfun8rWmey4G8yruXQgz
         akqn5WN33nwDPoN5loUrd4X2V8Wb9joyPp5OfVmscwZigQIFjQ4HUWAtFCgzQOjxDhGb
         PyRH0wGPXEvDizXkulmjgaG7HHQLj4DsIP8inr4OnGRk4onu4HpN+djxKI+E1ST2SXfp
         SEyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747926071; x=1748530871;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LO79SqxbvbO6w/KgZWvyoryl2c+RxUhjXwpwG46yr1M=;
        b=cqrW9zrjMsaEB9Lq5HrOZQCNTfjlpzRg/wP4nr8GYr9FLZ8jSXN/KSdRuUrs5pEz/v
         3/3tjpdf0IH1TPtROgOBN+q4SCQbV20ZmrFtM9bJ0rXGCPEOD4bBcLl2WgIqpN1Aksft
         q4RtQ4fnPkb1QbECiYj76oHNkYdG3uz1ObSDhggP8wGi2GgeoNUJt0nHaQtH0/dE8ev1
         5aR/9h7NJqd1+KvpuuvygHyGs0izKVYrSyK/Wsc5pcGsjgYeJyLx12ud+LM15xMfqpiq
         Xm+HSl4Nwns9A68tni5PzEcJj0jXGzf83ZrpXanaA/o5dPtF8VzpaAJG2a6WK0NwltHR
         j3Cw==
X-Forwarded-Encrypted: i=1; AJvYcCX7x60tR6cwKArEC7P0qntWpECXTW/VQ6CO4OvqPpb7l1pt+D2gyotVTwBIZ/dWNkp12VvW4mAPbXaNvGODvJn7/w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxQ3rL9dHqZl+1YyEVD7JOJtmTr4IPbK5/63wWtY62075wPtwvn
	BfS9uC8l/e2GLdapY3oENB3tgfEtIf6TsbNlUjzW4sUA2zTBC9pR/anS
X-Gm-Gg: ASbGncsB3FF5RNfhl1tQ+TBNcJ2Ln0V+H+dSl8fDW5pYzqNSJ393Fh0woXw/s08LrNE
	vIKBKRAG5rssIlCfqqBZkLvoUeZ4mcDg8KNgT8L9dSZl3Znpd79Ypw7jqiOYWDcMtisoM5wtMcb
	A30znJI8GsRNHmX/oPQ8E+RzOmuZggeO229jtzT9uu7v3odVesjj/88eWOEKw3e+qFmEg+PgPVC
	kLe3PgZBTWTQgaQj/Q1prUOMwFORC4hVaH0YuZZavPPIK2KJXg2iKmHMGPigTSgB1F2A9hVSnde
	+bm0PqgxdhDfasKiWXuTD4NcAzJ7hyCyZpjFBtqW+4MK9niVnkk3LcraLgE=
X-Google-Smtp-Source: AGHT+IGuu9Aol459qZuV9SPRsYdWfyP0djA1586vyHmqiAopHyjNFVUERRbqAu5cL3Hl0m3Bgrg9JQ==
X-Received: by 2002:a05:6000:1a86:b0:39d:8d54:5eac with SMTP id ffacd0b85a97d-3a35fe5bb4emr22469450f8f.11.1747926070467;
        Thu, 22 May 2025 08:01:10 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442eb85bb20sm206865045e9.0.2025.05.22.08.01.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 08:01:09 -0700 (PDT)
Message-ID: <566ce066-c7a7-48d6-97e1-592f06a82897@gmail.com>
Date: Thu, 22 May 2025 17:01:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 06/12] mesa: don't add extra tags to the
 libopencl-mesa package
To: dmitry.baryshkov@oss.qualcomm.com,
 openembedded-core@lists.openembedded.org
References: <20250522144605.2876771-1-dmitry.baryshkov@oss.qualcomm.com>
 <20250522144605.2876771-6-dmitry.baryshkov@oss.qualcomm.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250522144605.2876771-6-dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 15:01:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217124



On 5/22/25 16:45, Dmitry Baryshkov via lists.openembedded.org wrote:
> The libopencl-mesa package provides OpenCL ICDs (Installable Client
> Drivers). As such, there is no conflict between several packages
> providing ICDs for different vendors. Split the loop that modifies
> package metadata and stop adding extra RPROVIDES / RCONFLICTS /
> RREPLACES tags to the libopencl-mesa package.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  meta/recipes-graphics/mesa/mesa.inc | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> index a309c8023bd2..98860a0d7d15 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -264,28 +264,31 @@ do_install:append () {
>  # RPROVIDEs/RCONFLICTs on the generic libgl name.
>  python __anonymous() {
>      pkgconfig = (d.getVar('PACKAGECONFIG') or "").split()
> +    mlprefix = d.getVar("MLPREFIX")
>      suffix = ""
>      if "-native" in d.getVar("PN"):
>          suffix = "-native"
> +
> +    for p in ("libegl", "libgl", "libglx", "libgles1", "libgles2", "libgles3", "libopencl"):
> +        fullp = mlprefix + p[1] + "-mesa" + suffix
Is it supposed to be  "fullp = mlprefix + p...", instead of p[1]?
Otherwise it's the same letter "i" over and over again.
> +        d.appendVar("RRECOMMENDS:" + fullp, " ${MLPREFIX}mesa-megadriver" + suffix)
> +
> +    d.setVar("DEBIAN_NOAUTONAME:%slibopencl-mesa%s" % (mlprefix, suffix), "1")
> +
>      for p in (("egl", "libegl", "libegl1"),
>                ("opengl", "libgl", "libgl1"),
>                ("glvnd", "libglx",),
>                ("gles", "libgles1", "libglesv1-cm1"),
> -              ("gles", "libgles2", "libglesv2-2", "libgles3"),
> -              ("opencl", "libopencl",)):
> +              ("gles", "libgles2", "libglesv2-2", "libgles3")):
>          if not p[0] in pkgconfig:
>              continue
> -        mlprefix = d.getVar("MLPREFIX")
>          fullp = mlprefix + p[1] + "-mesa" + suffix
> -        mlprefix = d.getVar("MLPREFIX")
>          pkgs = " " + " ".join(mlprefix + x + suffix for x in p[1:])
>          d.setVar("DEBIAN_NOAUTONAME:" + fullp, "1")
>          d.appendVar("RREPLACES:" + fullp, pkgs)
>          d.appendVar("RPROVIDES:" + fullp, pkgs)
>          d.appendVar("RCONFLICTS:" + fullp, pkgs)
>  
> -        d.appendVar("RRECOMMENDS:" + fullp, " ${MLPREFIX}mesa-megadriver" + suffix)
> -
>          # For -dev, the first element is both the Debian and original name
>          fullp = mlprefix + p[1] + "-mesa-dev" + suffix
>          pkgs = " " + mlprefix + p[1] + "-dev" + suffix
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#217117): https://lists.openembedded.org/g/openembedded-core/message/217117
> Mute This Topic: https://lists.openembedded.org/mt/113248268/6084445
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


