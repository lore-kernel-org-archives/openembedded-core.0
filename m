Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web09.1405.1611271710116221562
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jan 2021 15:28:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZyZzt8kL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id m4so3374712wrx.9
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Jan 2021 15:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=836jPq+/3ka1slVqC9jMqvkNiEi+1gbY3cY7CaELuTY=;
        b=ZyZzt8kLnLwzDC/7UbOQOwEfVLV1ipifJjK3xOBSuPKz9KAYo9EzMoB+xDMwAq+31Q
         szLDGw0jh8LiG1PVpriU/aT6CVhtyGdIpyGpALE56+o4VEtIY+QgtYLAH+cokMbmmlNI
         Lwg3zGiL+CnaXf8r3qMbJdPfTy5yj74VYE5qw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=836jPq+/3ka1slVqC9jMqvkNiEi+1gbY3cY7CaELuTY=;
        b=DqE8AX4IHQuqmJawPhow05omUap2vKY7bWO+JV46O4YusHc0n3YfOamXApd+KUVQOA
         lngA5d4fbiarCWVKVDerUIHo7atnH5hYX+K9Jb17uEJSrccFctYLW2XbVBDYf4z+Xe9E
         PFNB+obpfA+WCD6rPqP2JSgJC8OOZU8MVWrZvY1KvYVzb/UIyQZskPHyYxuwn43ICNeP
         k1AjCMFgtClWQXbxCHHXPk6RhvjelH6OXAYSoJeBn4eEfIK/PSIlfp+U3aVNZvb4CPHJ
         7JypikWy3VCR7t9EJn4e9en+YCmQXuhlnSRvN3DE+KmAS3hM9LZc/CKANSuRDGF9fcjz
         MLFQ==
X-Gm-Message-State: AOAM532P7NagpWoEUg0IdB0c6Q/TmIUauM7LUk2pRj17XyABDBY2c3sn
	+ulR+r38AygrkFwUAHOjLrMR0A==
X-Google-Smtp-Source: ABdhPJw/ohvkLph1WqkeIegub/Ne46094aab8hLZJ3xhXKKLLiawnWlydSdaFd7iAQXgq1BdULKAUg==
X-Received: by 2002:a5d:6289:: with SMTP id k9mr1756614wru.200.1611271708468;
        Thu, 21 Jan 2021 15:28:28 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:6d8b:661b:50ff:3a78? ([2001:8b0:aba:5f3c:6d8b:661b:50ff:3a78])
        by smtp.gmail.com with ESMTPSA id v6sm9071223wrx.32.2021.01.21.15.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 15:28:28 -0800 (PST)
Message-ID: <f07c4072dbb724260aa7196f94a513a78af5e3f4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH][V2] dtc: improve reproducibility
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: oobitots@cisco.com, openembedded-core@lists.openembedded.org
Date: Thu, 21 Jan 2021 23:28:27 +0000
In-Reply-To: <20210121122721.98421-1-oobitots@cisco.com>
References: <20210121122721.98421-1-oobitots@cisco.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-01-21 at 04:27 -0800, Oleksiy Obitotskyy via
lists.openembedded.org wrote:
> Makefile override CFLAGS, so -fmacro/debug-prefix-map
> optiions was omitted and binaries contains absolute
> patch to sources.
> 
> Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
> ---
>  V2 - apply patch unconditionally
>  V1 - apply patch only if reproducibility is turned on
> 
>  meta/recipes-kernel/dtc/dtc.inc               |  2 ++
>  ...-Makefile-to-add-CFLAGS-not-override.patch | 36 +++++++++++++++++++
>  2 files changed, 38 insertions(+)
>  create mode 100644 meta/recipes-kernel/dtc/dtc/0001-dtc-Fix-Makefile-to-add-CFLAGS-not-override.patch
> 
> diff --git a/meta/recipes-kernel/dtc/dtc.inc b/meta/recipes-kernel/dtc/dtc.inc
> index 0650e3c82e..5da6c24fbf 100644
> --- a/meta/recipes-kernel/dtc/dtc.inc
> +++ b/meta/recipes-kernel/dtc/dtc.inc
> @@ -7,7 +7,9 @@ DEPENDS = "flex-native bison-native"
>  
> 
> 
> 
>  SRC_URI = "git://git.kernel.org/pub/scm/utils/dtc/dtc.git \
>             file://make_install.patch \
> +           file://0001-dtc-Fix-Makefile-to-add-CFLAGS-not-override.patch \
>             "
> +
>  UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
>  
> 
> 
> 
>  EXTRA_OEMAKE='NO_PYTHON=1 PREFIX="${prefix}" LIBDIR="${libdir}" DESTDIR="${D}"'
> diff --git a/meta/recipes-kernel/dtc/dtc/0001-dtc-Fix-Makefile-to-add-CFLAGS-not-override.patch b/meta/recipes-kernel/dtc/dtc/0001-dtc-Fix-Makefile-to-add-CFLAGS-not-override.patch
> new file mode 100644
> index 0000000000..6ac83929b9
> --- /dev/null
> +++ b/meta/recipes-kernel/dtc/dtc/0001-dtc-Fix-Makefile-to-add-CFLAGS-not-override.patch
> @@ -0,0 +1,36 @@
> +From d684b031967ee7055d5719476ef578fe2c37401c Mon Sep 17 00:00:00 2001
> +From: Oleksiy Obitotskyy <oobitots@cisco.com>
> +Date: Thu, 24 Sep 2020 05:12:42 -0700
> +Subject: [PATCH] dtc: Fix Makefile to add CFLAGS not override
> +
> +Makefile override CFLAGS not extend them, so some of them
> +missing. Sources builds out of kernel tree and probably not all
> +options could be used (?). We need at least -fmacro-prefix-map/
> +debug-prefix-map to eliminate absolute path in binaries.
> +
> +Upstream-Status: Pending
> +Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
> +---
> + Makefile | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index f729bf6..bb51a92 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -16,10 +16,10 @@ EXTRAVERSION =
> + LOCAL_VERSION =
> + CONFIG_LOCALVERSION =
> + 
> +-CPPFLAGS = -I libfdt -I .
> ++CPPFLAGS += -I libfdt -I .
> + WARNINGS = -Wall -Wpointer-arith -Wcast-qual -Wnested-externs \
> + 	-Wstrict-prototypes -Wmissing-prototypes -Wredundant-decls -Wshadow
> +-CFLAGS = -g -Os $(SHAREDLIB_CFLAGS) -Werror $(WARNINGS) $(EXTRA_CFLAGS)
> ++CFLAGS += -g -Os $(SHAREDLIB_CFLAGS) -Werror $(WARNINGS) $(EXTRA_CFLAGS)
> + 
> + BISON = bison
> + LEX = flex
> +-- 
> +2.19.0.dirty
> +

I did try building this but it failed in testing with issues applying
the patch e.g.:

https://autobuilder.yoctoproject.org/typhoon/#/builders/15/builds/3235/steps/12/logs/stdio

Cheers,

Richard

