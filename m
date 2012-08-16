Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1T22Gl-00047P-QM
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Aug 2012 17:46:00 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q7GFXxnE006552
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 16 Aug 2012 08:33:59 -0700 (PDT)
Received: from [128.224.146.67] (128.224.146.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Thu, 16 Aug 2012 08:33:58 -0700
Message-ID: <502D12E2.4000808@windriver.com>
Date: Thu, 16 Aug 2012 11:33:54 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Liang Li <liang.li@windriver.com>
References: <1344008589-3660-1-git-send-email-liang.li@windriver.com>
	<1344348160.9756.255.camel@ted> <20120808033742.GA19078@localhost>
	<20120814021712.GB25748@localhost>
In-Reply-To: <20120814021712.GB25748@localhost>
Cc: darren.hart@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [discussion] perf: specify SLANG_INC dir for perf
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Aug 2012 15:46:00 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12-08-13 10:17 PM, Liang Li wrote:
> Hi Richard,
>
> Ping ...
>
> Hopefully you could recall sufficient context from this thread about
> the 'include path for slang.h' cause compile error issue that we are
> trying to fix here.

Bump.

I'm holding off on merging a kernel patch for this while this is still
outstanding.

Can I distill this into the following (in the hope of resolving it).

   - do we want to fix this problem for all kernels, or just the linux-yocto
     ones ? And by 'fix', I mean without the requirement of porting
     a kernel patch to older recipes.

Cheers,

Bruce

>
> I saw your three commits in oecore like below:
>
> commit b033000
> Author: Richard Purdie<richard.purdie@linuxfoundation.org>
> Date:   Tue Aug 7 22:21:38 2012 +0000
>
>      linux-yocto-3.2: Apply slang workaround fixing perf builds to 3.2 kernels too
>
>      Signed-off-by: Richard Purdie<richard.purdie@linuxfoundation.org>
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto_3.2.bb b/meta/recipes-kernel/linux/linux-yocto_3.2.bb
> index de716da..b254251 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_3.2.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_3.2.bb
> @@ -24,6 +24,8 @@ KMETA = "meta"
>
>   SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.2;protocol=git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
>
> +SRC_URI += "file://noslang.patch"
> +
>   COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemuppc|qemumips|qemux86-64)"
>
>   # Functionality flags
>
> commit 6b4ed64
> Author: Richard Purdie<richard.purdie@linuxfoundation.org>
> Date:   Tue Aug 7 22:21:22 2012 +0000
>
>      linux-yocto-3.0: Apply slang workaround fixing perf builds to 3.0 kernels too
>
>      Signed-off-by: Richard Purdie<richard.purdie@linuxfoundation.org>
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto_3.0.bb b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
> index 2adbc46..3022f21 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_3.0.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
> @@ -24,6 +24,8 @@ PV = "${LINUX_VERSION}+git${SRCPV}"
>
>   SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.0;protocol=git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
>
> +SRC_URI += "file://noslang.patch"
> +
>   COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemuppc|qemumips|qemux86-64)"
>
>   # Functionality flags
>
> commit 4fd4b2e
> Author: Richard Purdie<richard.purdie@linuxfoundation.org>
> Date:   Tue Aug 7 12:17:16 2012 +0100
>
>      linux-yocto-3.4: Disable extra slang header search path
>
>      Add in a workaround to avoid host infection detection build failures
>      from the slang include directory in perf. I'll defer to Bruce to
>      fix this properly but we need a workaround now as this is breaking
>      builds.
>
>      Signed-off-by: Richard Purdie<richard.purdie@linuxfoundation.org>
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto/noslang.patch b/meta/recipes-kernel/linux/linux-yocto/noslang.patch
> new file mode 100644
> index 0000000..9cada34
> --- /dev/null
> +++ b/meta/recipes-kernel/linux/linux-yocto/noslang.patch
> @@ -0,0 +1,20 @@
> +We (OE) install slang into /usr/include so we never need to look into
> +/usr/include/slang/. We never want to look into a hardcoded path like this
> +since it triggers host infection issues. For now, simply remove this
> +since it causes us problems.
> +
> +Upstream-Status: Pending (would need rework)
> +
> +Index: tools/perf/Makefile
> +===================================================================
> +--- linux.orig/tools/perf/Makefile	2012-08-07 10:29:43.020149620 +0000
> ++++ linux/tools/perf/Makefile	2012-08-07 10:30:08.128148098 +0000
> +@@ -504,7 +504,7 @@
> + 		BASIC_CFLAGS += -DNO_NEWT_SUPPORT
> + 	else
> + 		# Fedora has /usr/include/slang/slang.h, but ubuntu /usr/include/slang.h
> +-		BASIC_CFLAGS += -I/usr/include/slang
> ++		# BASIC_CFLAGS += -I/usr/include/slang
> + 		EXTLIBS += -lnewt -lslang
> + 		LIB_OBJS += $(OUTPUT)util/ui/setup.o
> + 		LIB_OBJS += $(OUTPUT)util/ui/browser.o
> diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
> index 48333b3..5ab46b7 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
> @@ -20,6 +20,8 @@ SRCREV_meta ?= "7ff48aa47c50b6455d60ca93bc81260ce8fe1a1b"
>
>   SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
>
> +SRC_URI += "file://noslang.patch"
> +
>   LINUX_VERSION ?= "3.4.6"
>
>   PR = "${INC_PR}.0"
>
> ---
>
> Since you mentioned 'workaround' in commit log, I would like to submit
> another solution:
>
> #1. Merge below kernel patch to kernel tree:
>
>  From 7708f74d98e7233c7257b055eea0ffb914f4ce2c Mon Sep 17 00:00:00 2001
> From: Liang Li<liang.li@windriver.com>
> Date: Wed, 1 Aug 2012 14:31:24 +0800
> Subject: [PATCH] perf: add SLANG_INC for slang.h
>
> Previously we hard code '-I/usr/include/slang' to CFLAGS to works with
> some hosts that has /usr/include/slang/slang.h other than
> /usr/include/slang.h like Fedora. This will cause compiling warnings
> in some cases.
>
> We'd better to provide user a chance to specify correct location of
> slang.h then user could specify SLANG_INC to avoid compile warnings.
>
> Signed-off-by: Liang Li<liang.li@windriver.com>
> ---
>   tools/perf/Makefile | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/tools/perf/Makefile b/tools/perf/Makefile
> index b7a7a87..067f2df 100644
> --- a/tools/perf/Makefile
> +++ b/tools/perf/Makefile
> @@ -496,8 +496,10 @@ else
>   		msg := $(warning newt not found, disables TUI support. Please install newt-devel or libnewt-dev);
>   		BASIC_CFLAGS += -DNO_NEWT_SUPPORT
>   	else
> -		# Fedora has /usr/include/slang/slang.h, but ubuntu /usr/include/slang.h
> -		BASIC_CFLAGS += -I/usr/include/slang
> +		# Some releases like Fedora has /usr/include/slang/slang.h other than /usr/include/slang.h
> +		SLANG_INC ?= -I/usr/include/slang
> +		BASIC_CFLAGS += $(SLANG_INC)
> +
>   		EXTLIBS += -lnewt -lslang
>   		LIB_OBJS += $(OUTPUT)ui/setup.o
>   		LIB_OBJS += $(OUTPUT)ui/browser.o



