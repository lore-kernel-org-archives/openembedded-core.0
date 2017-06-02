Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 69C8377D40
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Jun 2017 23:18:44 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id d127so21035712wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Jun 2017 16:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5rwGkMqCh0DsjTNacUQ/YEbOfIciIXpTv/TQ4NO5Dy8=;
	b=anhKN0Xiv6Plwuvll2NNZMQmoebUCRpl3IwEzOvwnkmRBGK/uV6ASZ7ZhRKUOISSR0
	uDOKGssprZpYX7E/ECDhh/IFXVdwDErfZetmfMa5H2/8tPUArN6YmYlnoRUmwHEPR5kj
	okvXLXYmJAV7+4MurjnO/Cn+ET0hLRCipuFLaEUgLHZbGigRdYj8Gy1f8a38gkyPyue1
	Tex0MOVjn04DHBuJAHgc9BraII9dWvRehIxeGklhjXqW5PblHvcwxieG5LF9eImj3dke
	51TcgZALREB2l2xTin9+bBlpOPZvcfFER/itPcOGJxWA3DWWdq1XUuRKQaIBBqQPeuMT
	zocw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5rwGkMqCh0DsjTNacUQ/YEbOfIciIXpTv/TQ4NO5Dy8=;
	b=lNQ6Iq+9/09VHHowmJGzuphEAujKNx6HVpRgEnwHDUxqD/dT1o8lcdSNa0Kabv293f
	XVJUIfTZwEpLd9624QhUIlz/7NV0rYPESgtlr55ovwJphmU5rOj5BvTXqb668L8No+k+
	Elkv7WZmfzBYy1lujtMEAlgWcsbcQ0ouBMqXzU6Mvsuqyh6HKebFUX2Uxw8gqm1xuZNM
	d2IK6bFmd4w+mGwT6gvwLXA0hE7dRPhTdm9TREUR1wHwu/tN32XeJx9kSOEJzZcMpWjT
	kGSyIDOPW6pul+BJ03DDGSHLtRRwY16cS+uExSRs3vjyJAm+PT7t02taS9epAMX2M/KL
	dlGA==
X-Gm-Message-State: AODbwcANGVNXr4E/iYWDjWBwvtquzb4r6VllOu1hHG9rxL5psjYsxgwe
	SNkOuvyQeL7vE5NAUWylhAxCvil6Bw==
X-Received: by 10.80.144.118 with SMTP id z51mr7486734edz.143.1496445525516;
	Fri, 02 Jun 2017 16:18:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.195.143 with HTTP; Fri, 2 Jun 2017 16:18:14 -0700 (PDT)
In-Reply-To: <1496444866-17811-1-git-send-email-jslater@windriver.com>
References: <1496444866-17811-1-git-send-email-jslater@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 2 Jun 2017 16:18:14 -0700
Message-ID: <CAMKF1sq3RWNEn=OPXrM=P-e0KWtD94fe1spaLzTH4gxvrbRaDw@mail.gmail.com>
To: Joe Slater <jslater@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] tcf-agent: correct CFLAGS
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
X-List-Received-Date: Fri, 02 Jun 2017 23:18:46 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 2, 2017 at 4:07 PM, Joe Slater <jslater@windriver.com> wrote:
> Modify CFLAGS for several cases which will not compile otherwise.
> Do not use the form CFLAGS_x_append because it will replace, not
> append to CFLAGS for override x.

actually the reason is that override and _append are exchanged. I see
the issue too here. I sent a patch just to fix the space issue but
this patch is better with one exception. please call the new variable
with call uppercase.

>
> Signed-off-by: Joe Slater <jslater@windriver.com>
> ---
>  meta/recipes-devtools/tcf-agent/tcf-agent_git.bb | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
>
> diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
> index 1dad825..5558a59 100644
> --- a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
> +++ b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
> @@ -35,17 +35,18 @@ MAKE_OS = "`echo ${TARGET_OS} | sed s,^linux.*,GNU/Linux,`"
>
>  EXTRA_OEMAKE = "MACHINE=${MAKE_ARCH} OPSYS=${MAKE_OS} 'CC=${CC}' 'AR=${AR}'"
>
> -# These features don't compile on mips and libc-musl
> -CFLAGS_mips_append = "-DSERVICE_RunControl=0 -DSERVICE_Breakpoints=0 \
> -    -DSERVICE_Memory=0 -DSERVICE_Registers=0 -DSERVICE_MemoryMap=0 \
> -    -DSERVICE_StackTrace=0 -DSERVICE_Expressions=0"
> -CFLAGS_mips64_append = "-DSERVICE_RunControl=0 -DSERVICE_Breakpoints=0 \
> -    -DSERVICE_Memory=0 -DSERVICE_Registers=0 -DSERVICE_MemoryMap=0 \
> -    -DSERVICE_StackTrace=0 -DSERVICE_Expressions=0"
> -CFLAGS_append_libc-musl = "-DSERVICE_RunControl=0 -DSERVICE_Breakpoints=0 \
> +lcl_stop_services = "-DSERVICE_RunControl=0 -DSERVICE_Breakpoints=0 \
>      -DSERVICE_Memory=0 -DSERVICE_Registers=0 -DSERVICE_MemoryMap=0 \
>      -DSERVICE_StackTrace=0 -DSERVICE_Expressions=0"
>
> +
> +# These features don't compile for several cases.
> +#
> +CFLAGS_append_mips = " ${lcl_stop_services}"
> +CFLAGS_append_mips64 = " ${lcl_stop_services}"
> +CFLAGS_append_libc-musl = " ${lcl_stop_services}"
> +CFLAGS_append_powerpc64 = " ${lcl_stop_services}"
> +
>  do_install() {
>         oe_runmake install INSTALLROOT=${D}
>         install -d ${D}${sysconfdir}/init.d/
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

