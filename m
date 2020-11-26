Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web12.5839.1606401466810907941
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Nov 2020 06:37:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=M/havpcZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id g25so703686wmh.1
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2020 06:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=OcqKuBpjfi3tPnxCLkV+yYouqURdU+I6GzZxz87uwMI=;
        b=M/havpcZBBzr1X2tV6vRlhv4Q1Gs/7E1dGBVOUNmcRDThu7IyQgyTf2GJOwRDhGoVV
         3C+L8/dj64IK0YKq5jvPINyvNtdVitd2ykH5MQxu9jWQOxHBPv5h9/LubVNrrC49uaST
         +xZFNc3/UEtc9zgSV9BeVow0qjlyLaM6VCj3w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=OcqKuBpjfi3tPnxCLkV+yYouqURdU+I6GzZxz87uwMI=;
        b=KifDENacRFOACHRWlJUPgdBfV99v2JlFS4sDKwTPUv/OIPfXPUU7b4wsNjpXsYpxxY
         ZOKdwucB00jCX/253DWtgPTeC/AT4lTUnbHrJi1sAnr3Ncu7NKVsskj8BVZfRlFKxg74
         GMuAs7qcLHhcaqSrMhp5fzYZdQAefT2mUlTXrakylUycd8fvSsjNkuXjAKQG7xLBshwi
         QDpcsTrgufKvSkjrXB/LlxzqtI1sVJDIcLa2lskk3+RqaFIhnY+S7bf3zoVjVqgXX3Mx
         5Pn+dj9jwsXgLHVWXmlbURohIvdlfDv8Q8XfOCPwRwgvgZecoqocXy2ElohdMFYFvjhf
         +MZw==
X-Gm-Message-State: AOAM5324ochdHZvSYylCKDBo5HTvrq6UZBdOEAh4qqVfNXaDD9db7YPi
	CPZ2ABSo83ZQRl+TK1E1nI87Rg==
X-Google-Smtp-Source: ABdhPJy1lgJ5nwoRR7kgS+a0D4wve9xM7OO8Kw+VDflQdeu5czlEwP655fGJtJoH56MR75DlP5oapw==
X-Received: by 2002:a1c:a5d4:: with SMTP id o203mr3756594wme.41.1606401465262;
        Thu, 26 Nov 2020 06:37:45 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 7.8.3.c.5.5.3.2.b.b.3.d.3.f.0.8.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (7.8.3.c.5.5.3.2.b.b.3.d.3.f.0.8.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:80f3:d3bb:2355:c387])
        by smtp.gmail.com with ESMTPSA id a131sm9297887wmh.30.2020.11.26.06.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2020 06:37:44 -0800 (PST)
Message-ID: <ef5e35d36905471304587803bd685ce2297ae889.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v2] kernel-dummy: fix executing unexpected tasks
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Andrej Valek <andrej.valek@siemens.com>, 
	openembedded-core@lists.openembedded.org, raj.khem@gmail.com
Cc: yocto@lists.yoctoproject.org
Date: Thu, 26 Nov 2020 14:37:41 +0000
In-Reply-To: <20201125172045.8697-1-andrej.valek@siemens.com>
References: <20201125165417.29781-1-andrej.valek@siemens.com>
	 <20201125172045.8697-1-andrej.valek@siemens.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-11-25 at 18:20 +0100, Andrej Valek wrote:
>  - correctly save files into sstate
>   - fix: ERROR: Task linux-dummy.do_fetch attempted to execute
> unexpectedly
> 
> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> ---
>  meta/recipes-kernel/linux/linux-dummy.bb | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-kernel/linux/linux-dummy.bb b/meta/recipes-
> kernel/linux/linux-dummy.bb
> index 62cf6f5ea6..1498da392c 100644
> --- a/meta/recipes-kernel/linux/linux-dummy.bb
> +++ b/meta/recipes-kernel/linux/linux-dummy.bb
> @@ -5,10 +5,12 @@ where you wish to build the kernel externally from
> the build system."
>  SECTION = "kernel"
>  
>  LICENSE = "GPLv2"
> -LIC_FILES_CHKSUM =
> "file://${WORKDIR}/COPYING.GPL;md5=751419260aa954499f7abaabaa882bbe"
> +LIC_FILES_CHKSUM =
> "file://COPYING.GPL;md5=751419260aa954499f7abaabaa882bbe"
>  
>  PROVIDES += "virtual/kernel"
>  
> +inherit deploy
> +
>  PACKAGES_DYNAMIC += "^kernel-module-.*"
>  PACKAGES_DYNAMIC += "^kernel-image-.*"
>  PACKAGES_DYNAMIC += "^kernel-firmware-.*"
> @@ -60,6 +62,6 @@ do_deploy() {
>  }
>  
>  addtask bundle_initramfs after do_install before do_deploy
> -addtask deploy after do_install
> +addtask deploy after do_populate_sysroot do_packagedata

Is this a leftover from the previous version of the patch? We don't
normally need those constraints?

Cheers,

Richard

