Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC163C3ABB2
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 07:07:03 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.1293.1748588816008123627
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 May 2025 00:06:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=HvRxI3mX;
 spf=pass (domain: linaro.org, ip: 209.85.167.52, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54d6f933152so2610014e87.1
        for <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 00:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748588814; x=1749193614; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ia5nYFTC8vEniJ6Lpk2/scJ6c69Vuw+DD0ZuDb4RgGM=;
        b=HvRxI3mX047UoD8CmAh74ZxM3sfk+PhaRqaqz+25W0ktSVMoHDV2G5Ahlh29pRRSDC
         RRubYrZ0qqdo1jgzANccAFobyhX4fYBBN41n6LHcemKllRSJ+8CeatyW7x4Vfl+XRibQ
         vtYH8yarna54SS2RU7iF+frteiP8lothtLTo8Y+04irz5CpmFkkbpGy59WryKOZXiXqR
         eHtCksabnFv97LFxuBD8oC+RhTYaMu6+/OFYUWsOZQPJnvh8sMw8SAAoq5u5R3p2/a+S
         Ym5gPezjQshC8I/yV2L+YvSuijAZmfQ9KgagmRzo040DaGKjVi2ELiLBsQCipZ2BmM3M
         YmtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748588814; x=1749193614;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ia5nYFTC8vEniJ6Lpk2/scJ6c69Vuw+DD0ZuDb4RgGM=;
        b=XWaFGkL97wTNp1J2COt270w8Ux0EciGlj9FEvDEQt+O/+B9IUZsMBC4vd5jf4N9L6U
         WaZPmS/ltWx/GXVDvqfVjyoxYGG8uKmcWA9dtanQvSGMdg9tNN44GLAH4snFRecIdDGm
         OZ9+tirmyl7gcAYCvtEduSyixwQUFUVHqnAlEF0js41PUYTrVypSvmGbOYPA+dN37xUj
         jJsVlKzjMCJXTjhIBKiMVlAF0rlibSEdpB7NxVEBlC6oghnIrKQVtVoHa1SzV/F3+G0f
         pXaHC4LlQIdUuXSi2+ziOydQEu+Itnij2Jgl5X7Yz+M1rnyQCRL6Lh9wUyroY+zVvWvw
         7wmw==
X-Gm-Message-State: AOJu0YyxXgk2IDxG8opYd9XFZy5uWbGBhI8Lgrz7ni0eSpfUvrQy9VPv
	9tKDdGt8ktmM0fv+0S+Xhq32CEBVBn4KSo5KRtQ4QcRI5QXBMO0nXa8Q0tR+leXTowE=
X-Gm-Gg: ASbGncug168XqN7CLWwOELhNhcsN0uWN7hHmKuwR6UyM7TvPZ1J5o/iT5mq1hunrG4R
	xNZcifKRmCbI/Raj0W07YENSHiYWLxhr/hNGNN8dLOy9T2xsy9R1lUOYmAmD7KhmpiGRM1y0Z0o
	E8dyWS3s62nuqDsbZzdxmDrEoXLX/a6yZoSX90iIx/sr8tZNy93artPmXxn31SefVR1jMWsV5NC
	srliHBjn9GTKQMmpX5CdwvSyCKnr6gj3QmUi4UtlqyvMNvYwhv6H9G+A/lPIZn/aHYm36+Tvhht
	stW/CgZFGwCydpgppgji4wYkPfkeOJdtnN1qcg4IeNqrur2wqGhhDyObMChZIVgUlvkbCA8rx3K
	ct3e/DbIX
X-Google-Smtp-Source: AGHT+IEOSld2AFdeojkyYuJBZ2llr+k4887GLdrZj5Q3N+3lhF+0Jv+1sy22l9Taz4vj0rIW470PXg==
X-Received: by 2002:a05:6512:3b89:b0:553:2868:635e with SMTP id 2adb3069b0e04-5533d16bf33mr294593e87.23.1748588813954;
        Fri, 30 May 2025 00:06:53 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5533787d3desm606586e87.35.2025.05.30.00.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 00:06:53 -0700 (PDT)
Date: Fri, 30 May 2025 10:06:52 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: ross.burton@arm.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/2] linux/generate-cve-exclusions: show the
 name and version of the data source
Message-ID: <aDlZDCZusvsZft7_@nuoska>
References: <20250529105808.1943410-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250529105808.1943410-1-ross.burton@arm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 07:07:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217467

Hi,

On Thu, May 29, 2025 at 11:58:07AM +0100, Ross Burton via lists.openembedded.org wrote:
> Add another comment to state what the data source for the CVE data was,
> specifically the basename of the repository and the "git describe" output
> of HEAD.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-kernel/linux/generate-cve-exclusions.py | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-kernel/linux/generate-cve-exclusions.py b/meta/recipes-kernel/linux/generate-cve-exclusions.py
> index b45c2d5702a..dfc16663a58 100755
> --- a/meta/recipes-kernel/linux/generate-cve-exclusions.py
> +++ b/meta/recipes-kernel/linux/generate-cve-exclusions.py
> @@ -11,6 +11,7 @@ import json
>  import pathlib
>  import os
>  import glob
> +import subprocess
>  
>  from packaging.version import Version
>  
> @@ -92,13 +93,16 @@ def main(argp=None):
>      parser.add_argument("version", type=Version, help="Kernel version number to generate data for, such as 6.1.38")
>  
>      args = parser.parse_args(argp)
> -    datadir = args.datadir
> +    datadir = args.datadir.resolve()
>      version = args.version
>      base_version = Version(f"{version.major}.{version.minor}")
>  
> +    data_version = subprocess.check_output(("git", "describe", "--tags", "HEAD"), cwd=datadir, text=True)

It's good to add "--always" if the repo, or clone/cached one, does not include tags
for what ever reason.

Cheers,

-Mikko

