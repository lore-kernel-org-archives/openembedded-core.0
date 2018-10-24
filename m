Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id 544E67983F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Oct 2018 07:15:32 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id t22-v6so3744202lji.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Oct 2018 00:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=A2iCNSloSpY5sdfO2vHjV24oEm4O1sWJxG+SFnFJsLc=;
	b=GQfWLlQLDfv45G/YKB5yGnydZDT7XzWpMIthhxg6//0TRyDxUvzgTxTqa8/1DpGVNI
	2fZTlG+165CD6WKYvB8z6CJOm+vtGvivg3YyWne9NG/kTk46rwhT2vjEwSuNPftmi3po
	qd3bu95yT8GcyHIoget4xJguuGizk5QsQWU8WlnYGb3qgRE1dC/T5cUjbDTacqyuUlzR
	WaiX4KgMRJra1QQXHrxjbpEJ1MqUL7/r/C0lmNVghkUWioNRfwRBFYtNUS4d0B2TZcg0
	NEz+tu90ycMzOqX2ZHXE2XR3HsR1NG8RGdqMd6kLXFeJT84i5hpRS1oxsoNqBO0e8cEJ
	19vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=A2iCNSloSpY5sdfO2vHjV24oEm4O1sWJxG+SFnFJsLc=;
	b=lxb34fTM6bFxpLsdpVhbLVIwSw8nGs35jDXcsiCsWLayUQQsYvR9nm1ejWbrAJds9j
	/YeUq3pjIF6VWiJAyeSkvBaMDASiEmqxwPFl+ENb3vZ8NLSUYKgJEQ6TpLE/qLnmJNnz
	TUDzZqi7pLlwrFK5Ln1xjxXW2yWb1JbnU4tBjBziJsKtnsycs/z0uT+GpfgUOkX386iD
	6mhBGcmEnHKLKcp1Q5KD5UMDGJYNlO4Ksr5zskqa5h9/PK8MSCf4YPVhHv9NhJAWsSl4
	/nhIXDL2x200ysH2P9WtgJ/ZMXeO6wJ77IuOvA8WSe1Dbl3DfF0W9rQnDn5ESvT0DMAc
	NAAg==
X-Gm-Message-State: AGRZ1gKgrTURIFyDI8NLiy3Cwj/sKAjiiQWP5t8tZLoKQtkJm12LxMvA
	CVhmXpGZSycrYFIVz8Mfb38ZdfHZ7dir2+ctJAg=
X-Google-Smtp-Source: AJdET5eXBo7oDt33iIY7iLmSwsy3ZBlnzCgc6GO6lheOwVhIWJ4vwjLhT5vzzGf8J1I9gradVqSWJhT4WOHjZpA8QjU=
X-Received: by 2002:a2e:8587:: with SMTP id b7-v6mr914114lji.122.1540365332638;
	Wed, 24 Oct 2018 00:15:32 -0700 (PDT)
MIME-Version: 1.0
References: <20181024050426.15711-1-kamensky@cisco.com>
In-Reply-To: <20181024050426.15711-1-kamensky@cisco.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 24 Oct 2018 03:15:21 -0400
Message-ID: <CADkTA4MT=mw6r=BZdE64O6wECf0kW8T9v1eboAw5HODRLPY1Sg@mail.gmail.com>
To: Victor Kamensky <kamensky@cisco.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-devsrc: add selinux include files needed by scripts/selinux build
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Oct 2018 07:15:32 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 24, 2018 at 1:04 AM Victor Kamensky via Openembedded-core
<openembedded-core@lists.openembedded.org> wrote:
>
> If CONFIG_SECURITY_SELINUX=y is enabled in kernel configuration, then
> 'make scripts' command in /usr/src/kernel fails to build
> utilities under scripts/selinux that would be pulled in by this config:
>
>   HOSTCC  scripts/selinux/genheaders/genheaders
> scripts/selinux/genheaders/genheaders.c:19:10: fatal error: classmap.h: No such file or directory
>  #include "classmap.h"
>
> To address this issue add security/selinux/include files into
> kernel-devsrc.
>
> Signed-off-by: Victor Kamensky <kamensky@cisco.com>
> ---
> To reproduce this issue add to conf/local.conf selinux fragment:
> KERNEL_EXTRA_FEATURES_append = " cgl/features/selinux/selinux.scc"
> build core-image-lsb-sdk and run 'cd /usr/src/kernel; make scripts'

There will be a few of these that pop up over time.

No concerns from me, the header file count is small for that
directory, so we aren't adding much to the overall size.

Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>


>
>  meta/recipes-kernel/linux/kernel-devsrc.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
> index 5758572221..361ad21e1f 100644
> --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
> +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
> @@ -210,6 +210,9 @@ do_install() {
>             cp -a --parents kernel/bounds.c $kerneldir/build
>             cp -a --parents Kbuild $kerneldir/build
>         fi
> +
> +        # required to build scripts/selinux/genheaders/genheaders
> +        cp -a --parents security/selinux/include/* $kerneldir/build/
>      )
>
>      # Make sure the Makefile and version.h have a matching timestamp so that
> --
> 2.17.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

