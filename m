Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1TsFWl-0006SA-BR
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 17:26:20 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 07 Jan 2013 08:10:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,424,1355126400"; d="scan'208";a="268716025"
Received: from envy.jf.intel.com (HELO envy.home) ([10.7.199.53])
	by orsmga002.jf.intel.com with ESMTP; 07 Jan 2013 08:11:08 -0800
Message-ID: <50EAF39C.20202@linux.intel.com>
Date: Mon, 07 Jan 2013 08:11:08 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Marco Cavallini <koansoftware@gmail.com>
References: <1357565963-21367-1-git-send-email-m.cavallini@koansoftware.com>
In-Reply-To: <1357565963-21367-1-git-send-email-m.cavallini@koansoftware.com>
X-Enigmail-Version: 1.4.6
Cc: Marco Cavallini <m.cavallini@koansoftware.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe][meta-oe][PATCH] kernel.bbclass: kernel_do_install fails with 2.6 kernel recipes
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
X-List-Received-Date: Mon, 07 Jan 2013 16:26:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi Marco,

On 01/07/2013 05:39 AM, Marco Cavallini wrote:
>  * old 2.6.x kernels don't have $kerneldir/tools directory
>  * so we got this error:
>  * sed: can't read ...SNIP...linux/2.6.30-r0/image/usr/src/kernel/tools/perf/Makefile: No such file or directory
>  * ERROR: Function failed: do_install
> 
> Signed-off-by: Marco Cavallini <m.cavallini@koansoftware.com>
> ---
>  meta/classes/kernel.bbclass | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index aee8a77..06b23e0 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -204,8 +204,10 @@ kernel_do_install() {
>  		rm -f $kerneldir/$entry
>  	done
>  
> -	# Fix SLANG_INC for slang.h
> -	sed -i 's#-I/usr/include/slang#-I=/usr/include/slang#g' $kerneldir/tools/perf/Makefile

Please include a comment here describing why this was needed. Something
like:

	# Linux 2.6.x kernels don't have a tools directory

(Replace .x with the appropriate version of course)

Otherwise, looks good to me. Thanks!

> +	if [ -f $kerneldir/tools/perf/Makefile ]; then
> +		# Fix SLANG_INC for slang.h
> +		sed -i 's#-I/usr/include/slang#-I=/usr/include/slang#g' $kerneldir/tools/perf/Makefile
> +	fi
>  }
>  
>  sysroot_stage_all_append() {
> 

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel


