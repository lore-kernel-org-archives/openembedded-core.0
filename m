Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id EBE997E4A5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2019 17:29:31 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id w13so2431054wru.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2019 10:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=2lBA0ghJLG9p80VeNqLAkyWuXrnNqn4T8qlyOkYKE90=;
	b=cj23Bau7xxfgigraEIyPSwtbbeMt6T/fSQd6MxCLYb0/tCwZ40olbq+jxGDRbBFYou
	AdXZFVw/mYqGSAv7vHVo/oBU/q3Q5OEfW46+Yv8HDTp9JcXkhZDB+bWI+mRd/hCcYVdz
	KD7RmlnQXor8lBFSrjPdVl1VJioLlqd5Sy+CI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=2lBA0ghJLG9p80VeNqLAkyWuXrnNqn4T8qlyOkYKE90=;
	b=iVJivmtL8pK2t5XBxLZMe4oCV0SCB8Ftq5BFCcwGVeIZ3MwRSD656Rn05f/JyAv6W2
	m+YStV/sXnYkVry/CP5XfPqt8r0IQG+7Jog4tTJ4U+E+4rW1hrDUkI8CEX20yXmS1Y19
	kt27sEK/Qy16dKSxxfA33Nn3t8LCabCslo7MOOzKdeDItwWo8XxJE7eU6cFzVWy/l90A
	7pdas6cdGzF4WKtbZU3+frtHHX+hX/H1JMsj7SbDGW2NyvDg/iNm/RmQb8Fy+Vj9J/OM
	X3tVpr9kOfyfYhTWfi1SwDllFqwXs08Rrcbl3X+d6ySk82lFv5SKCGSm/CBI4yULfOpi
	oLFw==
X-Gm-Message-State: APjAAAVIazQfwWlWYFh7r/N5p4p66K/n9VVDnwKiG0ZWdvQg5PvOmkEB
	ScuZQJTBFZwNht6t7ssM/2JaVA==
X-Google-Smtp-Source: APXvYqwkpKbGgGlO4uo92CioalR4TISVa19aB3hA0AGGF/45bxPXwZKkP32Nh+G9R2wy1p8hT/ZGuw==
X-Received: by 2002:a5d:68d2:: with SMTP id p18mr59839877wrw.56.1558718972758; 
	Fri, 24 May 2019 10:29:32 -0700 (PDT)
Received: from hex ([85.255.233.241]) by smtp.gmail.com with ESMTPSA id
	b18sm2500011wrx.75.2019.05.24.10.29.31
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 24 May 2019 10:29:32 -0700 (PDT)
Message-ID: <c44ab1cfbbaa2cb3bbfd6227539a278e7d61b775.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Haiqing Bai <Haiqing.Bai@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 24 May 2019 18:29:30 +0100
In-Reply-To: <20190524054915.49751-1-Haiqing.Bai@windriver.com>
References: <20190524054915.49751-1-Haiqing.Bai@windriver.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH] make-mod-scripts: Add nostamp flag on configure task
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
X-List-Received-Date: Fri, 24 May 2019 17:29:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-05-24 at 13:49 +0800, Haiqing Bai wrote:
> Error appears while building out of tree kernel module
> after recompiling the kernel:
> bitbake -c cleanall/cleansstate virtual/kernel
> bitbake -c cleanall/cleansstate hello-mod
> bitbake virtual/kernel
> bitbake hello-mod
> 
> ERROR: Kernel configuration is invalid.
>        include/generated/autoconf.h or include/config/auto.conf are
> missing.
>        Run 'make oldconfig && make prepare' on kernel src to fix it.
> error: 'struct pt_regs' has no member named 'ds'; did you mean 'dx'?
> 
> make-mod-scripts must be forced to rebuild in this case to generate
> config data in 'kernel-build-artifacts/include/config'
> 
> Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
> ---
>  meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-
> scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-
> scripts_1.0.bb
> index 97c58c5233..f55104070d 100644
> --- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> +++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> @@ -12,6 +12,8 @@ S = "${WORKDIR}"
>  do_configure[depends] += "virtual/kernel:do_shared_workdir openssl-
> native:do_populate_sysroot"
>  do_compile[depends] += "virtual/kernel:do_compile_kernelmodules"
>  
> +do_configure[nostamp] = "1"
> +
>  DEPENDS += "bc-native"
>  
>  EXTRA_OEMAKE = " HOSTCC="${BUILD_CC} ${BUILD_CFLAGS}
> ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}""

This sounds like a really bad idea and will make anything depending on
it rebuild in every build.

We need to ensure that these clean commands are not cleaning things out
of the shared kernel directory that they don't own.

Cheers,

Richard


