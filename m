Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SwFMD-0005c3-BG
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jul 2012 18:31:41 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 31 Jul 2012 09:20:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="191242780"
Received: from unknown (HELO envy.home) ([10.255.13.49])
	by fmsmga001.fm.intel.com with ESMTP; 31 Jul 2012 09:20:03 -0700
Message-ID: <50180547.3010301@linux.intel.com>
Date: Tue, 31 Jul 2012 09:18:15 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1343747440-31885-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1343747440-31885-1-git-send-email-raj.khem@gmail.com>
X-Enigmail-Version: 1.4.3
Subject: Re: [PATCH] kernel.bbclass: Preserve generated headers
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
X-List-Received-Date: Tue, 31 Jul 2012 16:31:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 07/31/2012 08:10 AM, Khem Raj wrote:
> asm/unistd.h includes asm/unistd_64.h on x86_64
> and asm/unistd_32.h on i386 but these files are
> generated files in 3.4 and when we do 'make clean' they get
> deleted and it shows up as an error when building
> external modules. May be its a 3.4 kernel bug may be not
> but make clean should have left the tree in
> a shape to build modules but it does not.
> 
> Probably we should run make modules_prepare after having
> run make clean.

There just doesn't seem to be a good way to do what we need to do here.
modules_prepare will build scripts, which we don't want, but clean kills
all the generated files.

This sounds like a good Linux kernel bug for us to to take a look at
fixing upstream:

make modules_prepare_cross

or something simlar, so we can get what we need with proper make targets
and avoid this constant cherry picking of files.

> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/classes/kernel.bbclass |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index b19ed4c..4ac3d48 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -197,6 +197,8 @@ kernel_do_install() {
>  	if [ -f include/generated/bounds.h ]; then
>  		cp include/generated/bounds.h $kerneldir/include/generated/bounds.h
>  	fi
> +	mkdir -p $kerneldir/arch/${ARCH}/include/generated/
> +	cp -fR arch/${ARCH}/include/generated/* $kerneldir/arch/${ARCH}/include/generated/

Do you need all the generated files in arch/$ARCH/include/generated? Are
there any binaries in there?

>  
>  	# Remove the following binaries which cause strip or arch QA errors
>  	# during do_package for cross-compiled platforms
> 

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel


