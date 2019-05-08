Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 8F6907DE5B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2019 13:02:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44zc8W6RX1z5w;
	Wed,  8 May 2019 15:02:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557320572;
	bh=GAXqAikAO7+ms/J8C45ExJSSUtU+rK/GY1pFSmY/6r8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kQrBHR+YtxhsNLAW068KZV4GATaxLUesxSDx4ScFYuBopahYajNLMt0S20PZguFIW
	lF/SjdrZI5+wtz+LUm7fdM4CAiyHh9/TMdo0X37C1iyapyZpuQ22E6qaxl1Ap53I61
	qFwKC8740MkSK8DmFrLjBarf2L8Z/VeB79M3lKxm3MqWE6H1NBF5Sk3wYLvc4R4C8A
	kKbmF6CETx3dMNYgdPBIj2TnPHiZJGyS61pLj1+DMwnaiGIKiplJv+6J1kN1IdzMHK
	Ei5HbFVUL7JD3hbfizpOpjhp252fVdrJBqwEAczv4GcZTpdD5s15grPvZL01p9yYPp
	0nzXjWRAQzN3tMbNy1mwe5EPBC4zst4RBBLpisqIRM7OVxt0zTcLdhx3QtseQCcy0t
	J8T3Q12yOeyV0yzVTs2tiIiTcir3uDqIqID7VCo34jAZorlIDrnMV3uHyzh8qihzLT
	BFJE0FK1IzCl6ixYFv7GMIn7Hkl/yB6chAc9DtwM6/cEh8Ldx7YQmeIwND75sGr23i
	Ce9gc7ZuLm3BIwjATMyIeFiJMdeU6DFEQxvK0X7bvEgcdgmwnQo6W/2rmAm5MmKOOg
	wD8iqi+UkFZ2myRB/cBE/07uZR4Edxjc1BrlaWrUf4xuhlajONbpjUt0MhtxP38fF0
	qJWgWjR4WEQxyGDCkeQrQHcQ=
Date: Wed, 8 May 2019 16:02:49 +0300
From: Adrian Bunk <bunk@stusta.de>
To: paul@betafive.co.uk
Message-ID: <20190508130249.GA25917@localhost>
References: <20190508115836.15758-1-paul@betafive.co.uk>
	<20190508115836.15758-3-paul@betafive.co.uk>
MIME-Version: 1.0
In-Reply-To: <20190508115836.15758-3-paul@betafive.co.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] strace: Fix aarch64 build with musl
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
X-List-Received-Date: Wed, 08 May 2019 13:02:53 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, May 08, 2019 at 11:58:36AM +0000, paul@betafive.co.uk wrote:
>...
> +--- strace-4.26.orig/strace.c
> ++++ strace-4.26/strace.c
> +@@ -26,7 +26,7 @@
> + #include <locale.h>
> + #include <sys/utsname.h>
> + #ifdef HAVE_PRCTL
> +-# include <sys/prctl.h>
> ++# include <linux/prctl.h>
> + #endif
> + #include <asm/unistd.h>
> diff --git a/meta/recipes-devtools/strace/strace_4.26.bb b/meta/recipes-devtools/strace/strace_4.26.bb
> index 24f92c99e5..b71122babf 100644
> --- a/meta/recipes-devtools/strace/strace_4.26.bb
> +++ b/meta/recipes-devtools/strace/strace_4.26.bb
> @@ -15,6 +15,7 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
>             file://0001-caps-abbrev.awk-fix-gawk-s-path.patch \
>             file://0001-tests-sigaction-Check-for-mips-and-alpha-before-usin.patch \
>             file://0001-mips-o32-fix-build.patch \
> +           file://musl-fixes-armv8.patch \
>             "
>...

#include <sys/prctl.h> is the documented way for getting the prototype 
of prctl(), which cannot be in linux/prctl.h for obvious reasons.

This patch creates the following problem:

../strace-4.26/strace.c: In function 'startup_child':
../strace-4.26/strace.c:1355:3: warning: implicit declaration of function 'prctl' [-Wimplicit-function-declaration]
   prctl(PR_SET_PTRACER, PR_SET_PTRACER_ANY);
   ^~~~~


cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


