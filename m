Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.9794.1616077864984984275
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Mar 2021 07:31:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=I+Gjhn6q;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id v11so5760821wro.7
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Mar 2021 07:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=2m6HeskzXZ3n2Ku0ULvEn8z/F2/tk6YxP5GkgPqUQFc=;
        b=I+Gjhn6qTer2AiqglvYDQzNd/YNHsOHL6tHKFGU7atfQ7Xmm7DkIDGqaBKgiPbT3d1
         y35GOhBp18gY/0Xv1hKE+FuuiB7SVWbEh04zBOVEDrT0H1oAte/RJznEyP5IeXkmlkPv
         yII8Ug3S+njOzvWhA7z2IpyN9wdELNz55+bhI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=2m6HeskzXZ3n2Ku0ULvEn8z/F2/tk6YxP5GkgPqUQFc=;
        b=DDyQDbC7JieycgUGPl0I+xg9RjomnbNQxQrKsoSqVhH4mTtEgHhYMuJW0dcN3hiB5H
         x1xvMbQRhH7M011Qf5YBanpNZixRtrX3kA5xGc/T1RYu9GjlSqnwIRj003Atng33gdWG
         L8k+T5ymRAy/g8c2fEO1k9rirDbbuAZ6QX4DHhQsIiYEvI1mxkMqQH2ECaUMhiS6fqYR
         c3h6ClFJbdeJjz1s+kS6C2HMgwkG0fZPn0ipCrBYAnGMcb/y0oH5Ndu68zn7bpEC33r7
         4t2WDD3O71i+qoU2WpvECJITMfXepqJNTBsspldNGotTohrSxqhC91zqBgOwzd7RjcMg
         6SVw==
X-Gm-Message-State: AOAM530xA5uf5e0cPtzDOFSidrjY0iGaWstlo7YUd9tTvzNQTdDU6/Es
	FmRLHNHN4yOFQ1B1dCaj6vX9qg==
X-Google-Smtp-Source: ABdhPJzIT2XJNKQW59VXWUfYQDwyRzrlcnEmswyes5auXRIBO2GgTwXNM/ZuwDGkGefc6vkJhk6IQQ==
X-Received: by 2002:adf:b30f:: with SMTP id j15mr10099900wrd.132.1616077863411;
        Thu, 18 Mar 2021 07:31:03 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:842d:8c78:da4:406b? ([2001:8b0:aba:5f3c:842d:8c78:da4:406b])
        by smtp.gmail.com with ESMTPSA id c131sm2540392wma.37.2021.03.18.07.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Mar 2021 07:31:03 -0700 (PDT)
Message-ID: <89c60143b0bc316c6eea953f9abef102c5b1f887.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] base.bbclass: Honor PATH when selecting hosttools
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Damian Wrobel <dwrobel@ertelnet.rybnik.pl>, openembedded-core
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 18 Mar 2021 14:31:02 +0000
In-Reply-To: <17845b8040c.d366bfc510803.2986508994038431829@ertelnet.rybnik.pl>
References: 
	<17845b8040c.d366bfc510803.2986508994038431829@ertelnet.rybnik.pl>
User-Agent: Evolution 3.39.2-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-03-18 at 15:23 +0100, Damian Wrobel wrote:
> Honors the PATH[1] and other user settings like
> system wide ccache when selecting hosttools.
> 
> Fixes the following compilation error when compiling clang-11:
> 
>  | CMake Error at cmake/modules/CheckCompilerVersion.cmake:38 (message):
>  |   Host GCC version must be at least 5.1, your version is 4.8.5.
>  | Call Stack (most recent call first):
>  |   cmake/modules/CheckCompilerVersion.cmake:48 (check_compiler_version)
> 
> on CentOS which by default has the gcc 4.8.5. However, this machine
> has configured the gcc-7 from Developer Toolset[2] as a default one:
> 
>  $ gcc --version | head -n1
>  gcc (GCC) 7.3.1 20180303 (Red Hat 7.3.1-5)
> 
>  $ which gcc
>  /opt/rh/devtoolset-7/root/usr/bin/gcc
> 
> So far, I did not find any other software which would not respect
> this setup.
> 
> This will also start honoring system-wide ccache configuration
> (e.g. widely used on Fedora Linux) where the gcc is used from
> the non-standard following location:
> 
>  $ which gcc
>  /usr/lib64/ccache/gcc
> 
> once the user decided to install ccache package:
> 
>  $ rpm -qf /usr/lib64/ccache/gcc
>  ccache-4.2-1.fc33.x86_64
> 
> [1] https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html#tag_18_09_01_01
> [2] https://www.softwarecollections.org/en/scls/rhscl/devtoolset-7/
> 
> Signed-off-by: Damian Wrobel <dwrobel@ertelnet.rybnik.pl>
> ---
>  meta/classes/base.bbclass | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index b4160402f0..67b0fa1497 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -131,12 +131,6 @@ def setup_hosttools_dir(dest, toolsvar, d, fatal=True):
>              if os.path.islink(desttool):
>                  os.unlink(desttool)
>              srctool = bb.utils.which(path, tool, executable=True)
> -            # gcc/g++ may link to ccache on some hosts, e.g.,
> -            # /usr/local/bin/ccache/gcc -> /usr/bin/ccache, then which(gcc)
> -            # would return /usr/local/bin/ccache/gcc, but what we need is
> -            # /usr/bin/gcc, this code can check and fix that.
> -            if "ccache" in srctool:
> -                srctool = bb.utils.which(path, tool, executable=True, direction=1)
>              if srctool:
>                  os.symlink(srctool, desttool)
>              else:

This change simply removes a different change added to work around a different 
problem. Do we know the original issue is fixed and this can be removed? My
worry is that we end up with a cycle of sets of patches adding and removing 
this :(.

Cheers,

Richard

