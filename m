Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web12.3135.1585785257709854382
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2020 16:54:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HiiXtVHG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f66.google.com with SMTP id c81so1553005wmd.4
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2020 16:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=8YoqOpexV+8cflff4/860lWe6OEeKSVhAIrZzE3CYDg=;
        b=HiiXtVHGzj2SKZvK+rF5eRcA+NCU+1xSusZqIHYvMbeG3yYBN6Vl9y5mT1CPnABbg1
         OcULzTE2+g5BVi/b+Q3VMuRAoXeNAPqBli3N1HUtYP+zXk4f/Y7CGzIswbuYulCgZBWg
         tqOIgDjS72Z2kg9nKCvNiJ5kI1tntvoGeFUUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=8YoqOpexV+8cflff4/860lWe6OEeKSVhAIrZzE3CYDg=;
        b=RmJnqkXGCOsZjn/qfFVKqbICIx/SfYNAu3X1QCpfCXQIkMZjrUyVLNKc0vRBuLuLCW
         rGLWboJCAgBEkBTyH0B1sgcF9bj/OEF+fEjQQ9P1zEkfGMOWaXkQVpRd3VOi8rb/P/SF
         J7eZ+Mw5zi+2Pug9jUOdDpuH/3ikEehnbq44jwTNxLJttq+mkaMvGdEVujzppma6QzEw
         MJYBYNsAkTR9isgYtFOo/bzaSUvxL9hOravBAZumJnG+wb8e9qD48X21U9NzvlG6nftY
         njT0l6/qbKEhX8OR5VnngNvG/lJE7Z8GLwBSEvidHHyMvdk3tPgyycKNvlAjYVxQxUnX
         zY8g==
X-Gm-Message-State: AGi0PuaSr6BH9/XYjCqZCGLkz9FPw049ENLcJ6SBakbhx7YNLa79b8c9
	ceU9I8PyLYVnRYkn8kGB1LTlGw==
X-Google-Smtp-Source: APiQypI4jnfMdEuC/dbLl+qfAoPBJhFIw94RRY8EHWCVrXp7eISzF1AairRS53z5uAt7Rp65IKlCtw==
X-Received: by 2002:a1c:62c5:: with SMTP id w188mr509609wmb.112.1585785256047;
        Wed, 01 Apr 2020 16:54:16 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id v7sm4930221wrs.96.2020.04.01.16.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2020 16:54:15 -0700 (PDT)
Message-ID: <fcad93f710482b42d125e173a410c8396a518a71.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] kernel.bbclass: Stop creating empty .scmversion files
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: paulburton@google.com, openembedded-core@lists.openembedded.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, Martin Jansa
	 <martin.jansa@gmail.com>, Trevor Woerner <twoerner@gmail.com>
Date: Thu, 02 Apr 2020 00:54:14 +0100
In-Reply-To: <20200401194102.161130-1-paulburton@google.com>
References: <20200331235607.93023-1-paulburton@google.com>
	 <20200401194102.161130-1-paulburton@google.com>
User-Agent: Evolution 3.36.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-04-01 at 12:41 -0700, Paul Burton via lists.openembedded.org wrote:
> The kernel_do_configure() task creates empty .scmversion files within
> both the source & build directories. The presence of these files causes
> the scm_version function within the kernel's scripts/setlocalversion to
> always output the empty string, breaking the kernel's
> CONFIG_LOCALVERSION_AUTO=y functionality which appends that string to
> the kernel version. Rather than appending the git commit hash or another
> SCM revision to the kernel version, the empty string is appended causing
> CONFIG_LOCALVERSION_AUTO to do nothing.
> 
> Remove the creation of the empty .scmversion files in order to restore
> the kernel's CONFIG_LOCALVERSION_AUTO functionality. This allows users
> of kernels built from non-tagged source & configured with
> CONFIG_LOCALVERSION_AUTO=y to better determine what kernel they're
> actually running.
> 
> The .scmversion behavior was introduced for the build directory by
> commit 56fe5300ab5a ("kernel.bbclass: fix extra + in kernelrelease") and
> extended to the source directory by commit e3bf54731973
> ("kernel.bbclass: touch .scmversion also in ${S}"). The '+' character
> referenced would be appended if the kernel believed it were being built
> from a dirty working tree. If that is genuinely the case then this in
> itself is useful information; hiding that fact can only serve to muddy a
> user's understanding of what kernel they're actually running.
> 
> One case that Martin suggests may have been the original motivation for
> these commits is building a kernel whose source is not coming from git,
> but is a subdirectory of a larger git working tree. In that case git
> will ascend through the parent directories of the kernel source until it
> finds the .git directory of that larger repository & report version
> information that is nonsensical with regards to the kernel. As such,
> prevent this from happening by setting the GIT_CEILING_DIRECTORIES
> environment variable such that git will not ascend outside of the kernel
> source directory and therefore won't pick up on version information that
> doesn't relate to the kernel.
> 
> Signed-off-by: Paul Burton <paulburton@google.com>
> Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
> Cc: Martin Jansa <martin.jansa@gmail.com>
> Cc: Trevor Woerner <twoerner@gmail.com>
> ---
>  meta/classes/kernel.bbclass | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index a724645466..bf0b14285e 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -171,6 +171,17 @@ KERNEL_RELEASE ?= "${KERNEL_VERSION}"
>  KERNEL_OUTPUT_DIR ?= "arch/${ARCH}/boot"
>  KERNEL_IMAGEDEST ?= "boot"
>  
> +# The kernel's scripts/setlocalversion invokes git to determine whether we're
> +# building from source that isn't clean or isn't tagged, and append that
> +# information to the kernel version if CONFIG_LOCALVERSION_AUTO is enabled. If
> +# we're building kernel source that isn't directly from git, but is a
> +# subdirectory of a larger git repository, then we need to ensure the kernel's
> +# script doesn't pick up on the state of that larger git repository to prevent
> +# it reporting incorrect version information. We do that by ensuring git won't
> +# ascend above the kernel source directory whilst searching for a .git
> +# directory.
> +export GIT_CEILING_DIRECTORIES = "${@os.path.dirname('${S}')}"
> +
>  #
>  # configuration
>  #
> @@ -521,12 +532,6 @@ check_oldest_kernel[vardepsexclude] += "OLDEST_KERNEL KERNEL_VERSION"
>  do_configure[prefuncs] += "check_oldest_kernel"
>  
>  kernel_do_configure() {
> -	# fixes extra + in /lib/modules/2.6.37+
> -	# $ scripts/setlocalversion . => +
> -	# $ make kernelversion => 2.6.37
> -	# $ make kernelrelease => 2.6.37+
> -	touch ${B}/.scmversion ${S}/.scmversion
> -
>  	if [ "${S}" != "${B}" ] && [ -f "${S}/.config" ] && [ ! -f "${B}/.config" ]; then
>  		mv "${S}/.config" "${B}/.config"
>  	fi

I get very nervous about patches like this that come in a day before
the final release build. I'm not 100% certain its this patch but a
build with this patch in resulted in:

https://autobuilder.yoctoproject.org/typhoon/#/builders/50/builds/1747
https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/1749
https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/1753
https://autobuilder.yoctoproject.org/typhoon/#/builders/110/builds/649

and a ton of other similar failures.

I'm starting a retest without it.

Cheers,

Richard


