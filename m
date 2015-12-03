Return-Path: <saul.wold@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id D1E3A6FF72
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Dec 2015 23:31:44 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 03 Dec 2015 15:31:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,378,1444719600"; d="scan'208";a="864267731"
Received: from unknown (HELO swold-mobl.jf.intel.com) ([10.254.112.33])
	by orsmga002.jf.intel.com with ESMTP; 03 Dec 2015 15:31:45 -0800
Message-ID: <1449185505.3199.49.camel@intel.com>
From: Saul Wold <saul.wold@intel.com>
To: Jianxun Zhang <jianxun.zhang@linux.intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 03 Dec 2015 15:31:45 -0800
In-Reply-To: <1449183819-236473-1-git-send-email-jianxun.zhang@linux.intel.com>
References: <1449183819-236473-1-git-send-email-jianxun.zhang@linux.intel.com>
X-Mailer: Evolution 3.18.1 (3.18.1-1.fc23) 
Mime-Version: 1.0
Subject: Re: [PATCH] Explicitly map ARCH to 32 or 64 bit for Intel machines
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
X-List-Received-Date: Thu, 03 Dec 2015 23:31:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2015-12-03 at 15:03 -0800, Jianxun Zhang wrote:
> For a bare-bone kernel recipe which specifies 32 bit x86 target,
> a 64 bit .config will be generated from do_configure task when
> building 32-bit qemux86, once all of these conditions are true:
> 
> () arch of host is x86_64
> () kernel source tree used in build has commit ffee0de41 which
> actually chooses i386 or x86_64 defconfig by asking host arch if
> ARCH is "x86" (arch/x86/Makefile)
> () bare-bone kernel recipe inherits directly from kernel without
> other special treatment
> 
> Build will fail in this case because of the mismatched architecture
> of kernel image after compiling.
> 
> The patch sets ARCH i386 or x86_64 explicitly to configure
> task to avoid this host contamination.
> 
Just to be clear about this, it does not change the TUNE_ARCH, the ARCH
that is set is local to the kernel-arch.bbclass.

This should also be a candidate for backport to Jethro

Sau!

> Signed-off-by: Jianxun Zhang <jianxun.zhang@linux.intel.com>
> ---
>  meta/classes/kernel-arch.bbclass | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/kernel-arch.bbclass b/meta/classes/kernel-
> arch.bbclass
> index 3ed5986..d8b180e 100644
> --- a/meta/classes/kernel-arch.bbclass
> +++ b/meta/classes/kernel-arch.bbclass
> @@ -21,7 +21,9 @@ def map_kernel_arch(a, d):
>  
>      valid_archs = d.getVar('valid_archs', True).split()
>  
> -    if   re.match('(i.86|athlon|x86.64)$', a):  return 'x86'
> +    if   re.match('i.86$', a):                  return 'i386'
> +    elif re.match('x86.64$', a):                return 'x86_64'
> +    elif re.match('athlon$', a):                return 'x86'
>      elif re.match('armeb$', a):                 return 'arm'
>      elif re.match('aarch64$', a):               return 'arm64'
>      elif re.match('aarch64_be$', a):            return 'arm64'
> -- 
> 1.9.1
> 

