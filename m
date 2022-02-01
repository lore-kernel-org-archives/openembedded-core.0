Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F163C433F5
	for <webhook@archiver.kernel.org>; Tue,  1 Feb 2022 08:13:39 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web12.45517.1643703217698932254
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Feb 2022 00:13:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XtZ3+3Yi;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id l25so30211972wrb.13
        for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Feb 2022 00:13:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=XSbgGWBAZ2VspXJmyotAGbZfR07cPHCrEDWypdLy2TQ=;
        b=XtZ3+3YiDw9r8XUoV+zOtH+R7qrs5Q+pcPp5fsdGsq1bxhikwPGTnu92+P71cmnRcy
         yo1uwNRkmMdyXw8FTatIy0vjQHwG7XFhJypEHN+sL/nv/eD7vUDfoVECsy6klKCEoe1B
         PvVmjbzRkpnuuwPakqJzwmnPW2WgjoX50NObw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=XSbgGWBAZ2VspXJmyotAGbZfR07cPHCrEDWypdLy2TQ=;
        b=e23mXBC0dAVr/7Q5xzf1dOYdTlQjx+beD/gaYRkIjqDhtagx+cG+oIN6sfvPYzj8bB
         sa6+HsJ2tL17i5OrICHXC8LFg9QqguBqzDjeq1yjMneNO5uatzlT2vxAxqEPifTGB5gV
         V1nA0W8k1jvZaoQ/5cIpMBKqcQRmk81EWa8zA3ol4B4TRpeXmDaeQXJeLu7PxDrMfe9k
         nXxCBr4H+nt54X5wXaO9/sNGO6bVadewMKHBHDL+74jVyKpzKoPyxr967n2lBpEFrE1p
         Es8eMWwF0d7fOR7PsC6wluingAmD9meDeSTzJlFryk7voN1FALfcPmoMXNRkq+MfwARD
         2F4Q==
X-Gm-Message-State: AOAM533o/pMF+5TaeSzPe+xu8WQiFy5ptsFTHfWat2lqYI9aUtX1UdZ1
	CGPNp+I3MG8RBUGD+SD4wRJ8Ag==
X-Google-Smtp-Source: 
 ABdhPJwpuZYuu8VztVlxEEhkxQS0M1nGSg/CtR8V0NjqQuG9BEeBFWKr8+Dww3HtIybFZCi6JVYMCg==
X-Received: by 2002:adf:f08b:: with SMTP id n11mr20639976wro.7.1643703215843;
        Tue, 01 Feb 2022 00:13:35 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:687d:5e4e:cf88:f9f9?
 ([2001:8b0:aba:5f3c:687d:5e4e:cf88:f9f9])
        by smtp.gmail.com with ESMTPSA id
 p2sm1326017wmc.33.2022.02.01.00.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Feb 2022 00:13:35 -0800 (PST)
Message-ID: 
 <e3f9fe7be1baadc146cab552f12f2e4add65698f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] packages.bbclass: Break out the debug
 info styles to bitbake variables
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 01 Feb 2022 08:13:34 +0000
In-Reply-To: <20220131213954.29887-2-pkj@axis.com>
References: <20220131213954.29887-1-pkj@axis.com>
	 <20220131213954.29887-2-pkj@axis.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Feb 2022 08:13:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161154

On Mon, 2022-01-31 at 22:39 +0100, Peter Kjellerstedt wrote:
> Break out the hardcoded values for the various debug info styles from
> split_and_strip_files() into bitbake variables. This allows the debug
> info styles to be adopted, and also allows new styles to be added
> (within the limits of the available variables).
> 
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  meta/classes/package.bbclass | 95 ++++++++++++++++++++++--------------
>  1 file changed, 58 insertions(+), 37 deletions(-)
> 
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index 4927fb99ff..a5358d5851 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -1065,6 +1065,51 @@ python fixup_perms () {
>                      fix_perms(each_file, fs_perms_table[dir].fmode, fs_perms_table[dir].fuid, fs_perms_table[dir].fgid, dir)
>  }
>  
> +# Debug info
> +PACKAGE_DEBUG_APPEND = "${@d.getVarFlag('PACKAGE_DEBUG_APPEND', d.getVar('PACKAGE_DEBUG_SPLIT_STYLE'))}"
> +PACKAGE_DEBUG_STATICAPPEND = "${@d.getVarFlag('PACKAGE_DEBUG_STATICAPPEND', d.getVar('PACKAGE_DEBUG_SPLIT_STYLE'))}"
> +PACKAGE_DEBUG_DIR = "${@d.getVarFlag('PACKAGE_DEBUG_DIR', d.getVar('PACKAGE_DEBUG_SPLIT_STYLE'))}"
> +PACKAGE_DEBUG_STATICDIR = "${@d.getVarFlag('PACKAGE_DEBUG_STATICDIR', d.getVar('PACKAGE_DEBUG_SPLIT_STYLE'))}"
> +PACKAGE_DEBUG_LIBDIR = "${@d.getVarFlag('PACKAGE_DEBUG_LIBDIR', d.getVar('PACKAGE_DEBUG_SPLIT_STYLE'))}"
> +PACKAGE_DEBUG_STATICLIBDIR = "${@d.getVarFlag('PACKAGE_DEBUG_STATICLIBDIR', d.getVar('PACKAGE_DEBUG_SPLIT_STYLE'))}"
> +PACKAGE_DEBUG_SRCDIR = "${@d.getVarFlag('PACKAGE_DEBUG_SRCDIR', d.getVar('PACKAGE_DEBUG_SPLIT_STYLE'))}"
> +
> +# Original OE-core, a.k.a. ".debug", style debug info
> +PACKAGE_DEBUG_APPEND[.debug] = ""
> +PACKAGE_DEBUG_STATICAPPEND[.debug] = ""
> +PACKAGE_DEBUG_DIR[.debug] = "/.debug"
> +PACKAGE_DEBUG_STATICDIR[.debug] = "/.debug-static"
> +PACKAGE_DEBUG_LIBDIR[.debug] = ""
> +PACKAGE_DEBUG_STATICLIBDIR[.debug] = ""
> +PACKAGE_DEBUG_SRCDIR[.debug] = "/usr/src/debug"
> +
> +# Single debug-file-directory style debug info
> +PACKAGE_DEBUG_APPEND[debug-file-directory] = ".debug"
> +PACKAGE_DEBUG_STATICAPPEND[debug-file-directory] = ""
> +PACKAGE_DEBUG_DIR[debug-file-directory] = ""
> +PACKAGE_DEBUG_STATICDIR[debug-file-directory] = ""
> +PACKAGE_DEBUG_LIBDIR[debug-file-directory] = "/usr/lib/debug"
> +PACKAGE_DEBUG_STATICLIBDIR[debug-file-directory] = "/usr/lib/debug-static"
> +PACKAGE_DEBUG_SRCDIR[debug-file-directory] = "/usr/src/debug"
> +
> +# Debug info without sources in /usr/src/debug
> +PACKAGE_DEBUG_APPEND[debug-without-src] = ""
> +PACKAGE_DEBUG_STATICAPPEND[debug-without-src] = ""
> +PACKAGE_DEBUG_DIR[debug-without-src] = "/.debug"
> +PACKAGE_DEBUG_STATICDIR[debug-without-src] = "/.debug-static"
> +PACKAGE_DEBUG_LIBDIR[debug-without-src] = ""
> +PACKAGE_DEBUG_STATICLIBDIR[debug-without-src] = ""
> +PACKAGE_DEBUG_SRCDIR[debug-without-src] = ""
> +
> +# Debug info with separate -src packages
> +PACKAGE_DEBUG_APPEND[debug-with-srcpkg] = ""
> +PACKAGE_DEBUG_STATICAPPEND[debug-with-srcpkg] = ""
> +PACKAGE_DEBUG_DIR[debug-with-srcpkg] = "/.debug"
> +PACKAGE_DEBUG_STATICDIR[debug-with-srcpkg] = "/.debug-static"
> +PACKAGE_DEBUG_LIBDIR[debug-with-srcpkg] = ""
> +PACKAGE_DEBUG_STATICLIBDIR[debug-with-srcpkg] = ""
> +PACKAGE_DEBUG_SRCDIR[debug-with-srcpkg] = "/usr/src/debug"
> +
>  python split_and_strip_files () {
>      import stat, errno
>      import subprocess


I can see what you've done and why but I'm not really sure this is an
improvement, it adds a ton of "global" variables which are only every used in a
very specific use case. I'm also particularly not keen on mapping the flags into
the real variables with online python. It isn't going to help our overall
parsing performance in the long run.

I'm torn on it but at least wanted to share my first thoughts looking at it...

Cheers,

Richard



