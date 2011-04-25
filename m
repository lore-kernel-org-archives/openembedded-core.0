Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QEPLY-0001V2-Qm
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Apr 2011 19:13:17 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 25 Apr 2011 10:10:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,265,1301900400"; d="scan'208";a="683686262"
Received: from doubt.jf.intel.com (HELO [10.24.5.31]) ([10.24.5.31])
	by fmsmga002.fm.intel.com with ESMTP; 25 Apr 2011 10:10:47 -0700
Message-ID: <4DB5AB17.2060806@linux.intel.com>
Date: Mon, 25 Apr 2011 10:10:47 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <73DFD7AC-9837-4C27-BB34-2B2AC7D1DD8B@dominion.thruhere.net>
In-Reply-To: <73DFD7AC-9837-4C27-BB34-2B2AC7D1DD8B@dominion.thruhere.net>
Cc: Bruce Ashfield <Bruce.Ashfield@windriver.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] don't run make clean on kernel_do_install
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
X-List-Received-Date: Mon, 25 Apr 2011 17:13:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi Koen,

On 04/23/2011 07:47 AM, Koen Kooi wrote:
> Hi,
> 
> Over the holidays I was trying to build some externel kernel modules
> and they failed to build because linux/bounds.h wasn't in sysroots.
> 


According the the linux Makefile:

###
# Cleaning is done on three levels.
# make clean     Delete most generated files
#                Leave enough to build external modules

The kernel Makefile should not be deleting it.

And indeed:
https://bugzilla.kernel.org/show_bug.cgi?id=11475

This was addressed by the following in 2.6.27:
7d3cc8b6d899e53222c22a78d98bb53a695f7962
Don't clean bounds.h and asm-offsets.h

Later, bounds.h moved as well in 2.6.33:
01fc0ac198eabcbf460e1ed058860a935b6c2c9a
kbuild: move bounds.h to include/generated


Which kernel version are you attempting to build?

We shouldn't add code to address a bug in a specific kernel version in a
kernel base class. That belongs in the specific recipe. I suggest trying
to add the 7d3cc8b6d899e53222c22a78d98bb53a695f7962 patch to your kernel
recipe and see if that resolves the issue for you without resorting to
recreating the clean process in the base class.

--
Darren

> I did this quick hack to work around it:
>
> --- a/meta-oe/classes/kernel.bbclass
> +++ b/meta-oe/classes/kernel.bbclass
> @@ -159,7 +159,8 @@ kernel_do_install() {
>         # we clean the scripts dir while leaving the generated config
>         # and include files.
>         #
> -       oe_runmake -C $kerneldir CC="${KERNEL_CC}" LD="${KERNEL_LD}" clean
> +       find $kerneldir -name "*.o" -delete
> +       #oe_runmake -C $kerneldir CC="${KERNEL_CC}" LD="${KERNEL_LD}"
clean
>         make -C $kerneldir _mrproper_scripts
>         find $kerneldir -path $kerneldir/scripts -prune -o -name
"*.[csS]" -exec rm '{}' \;
>         find $kerneldir/Documentation -name "*.txt" -exec rm '{}' \;
> 
> I'm not convinced that the above is the right way to solve it, but I
> lack the required kbuild knowledge to come up with a better one. Does
> anyone have a hint on how to approach this problem in a better way?
> 
> regards,
> 
> Koen

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


