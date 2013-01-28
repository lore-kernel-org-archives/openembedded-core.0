Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1Tztve-00069E-C2
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 19:59:57 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 28 Jan 2013 10:43:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,554,1355126400"; d="scan'208";a="253712968"
Received: from envy.jf.intel.com (HELO envy.home) ([10.7.199.77])
	by orsmga001.jf.intel.com with ESMTP; 28 Jan 2013 10:43:57 -0800
Message-ID: <5106C6ED.2090204@linux.intel.com>
Date: Mon, 28 Jan 2013 10:43:57 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <1359269665-1843-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1359269665-1843-1-git-send-email-raj.khem@gmail.com>
X-Enigmail-Version: 1.5
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] module-base.bbclass: Call make instead of oe_runmake in do_make_scripts
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Jan 2013 19:00:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 01/26/2013 10:54 PM, Khem Raj wrote:
> This makes the external module compilation a bit more robust for
> cases where external module recipes may be passing extra params
> to make via EXTRA_OEMAKE, and more that often one needs to pass

s/that/than/ (this honestly through me a bit :-)

> M=$(PWD) when building external modules and if we use EXTRA_OEMAKE
> that would mean that it would appear in do_make_scripts as well
> and since we are only changing the reference kernel src tree here
> it will not run the make scripts in desired directory.
> 
> It is also well explained in top makefile in kernel tree around
> line# 1335 in 3.4
> 
> |else # KBUILD_EXTMOD
> |
> |###
> |# External module support.
> |# When building external modules the kernel used as basis is considered
> |# read-only, and no consistency checks are made and the make
> |# system is not used on the basis kernel. If updates are required
> |# in the basis kernel ordinary make commands (without M=...) must
> |# be used.
> 
> Therefore passing  M=... will not do the updates in the basis
> kernel as expected with 'make scripts' so we have to bypass EXTRA_OEMAKE
> 
> [Yocto #3787]
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>


Acked-by: Darren Hart <dvhart@linux.intel.com>

Thanks Khem!

--
Darren

> ---
>  meta/classes/module-base.bbclass |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/module-base.bbclass b/meta/classes/module-base.bbclass
> index cfee50a..9dbb4b4 100644
> --- a/meta/classes/module-base.bbclass
> +++ b/meta/classes/module-base.bbclass
> @@ -18,6 +18,6 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>  #
>  do_make_scripts() {
>  	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS 
> -	oe_runmake CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
> +	make CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
>  	           -C ${STAGING_KERNEL_DIR} scripts
>  }
> 

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel


