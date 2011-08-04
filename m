Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Qp5z2-0006TD-Kb
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 00:01:40 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Qp5uo-0004tH-TJ
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 23:57:19 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <2c351319afd13acfca1283104172729925cfb696.1312469790.git.nitin.a.kamble@intel.com>
References: <e5fc6a2b0a315f9ade50a7f357b98068c38d49e3.1312469789.git.nitin.a.kamble@intel.com>
	<2c351319afd13acfca1283104172729925cfb696.1312469790.git.nitin.a.kamble@intel.com>
Date: Thu, 04 Aug 2011 22:57:12 +0100
Message-ID: <1312495032.3169.6.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH 09/10] x86 tune inc files: add x32 abi tune parameters
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
X-List-Received-Date: Thu, 04 Aug 2011 22:01:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-08-04 at 08:01 -0700, nitin.a.kamble@intel.com wrote:
>  # ELF32 ABI
>  TUNEVALID[m32] = "IA32 ELF32 standard ABI"
> -TUNECONFLICTS[m32] = "m64"
> +TUNECONFLICTS[m32] = "m64 mx32"
>  TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", "m32", "${X86ARCH32}", "" ,d)}"
> +ABIEXTENSION .= "${@bb.utils.contains("TUNE_FEATURES", "m32", "32", "" ,d)}"
>  TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "m32", "-m32", "", d)}"

This is going to cause TARGET_OS to change for everyone using the i586
ABI, right?  That doesn't seem like it is either necessary or desirable,
and it isn't mentioned in the checkin comment either.

>  # ELF64 ABI
>  TUNEVALID[m64] = "IA32e (x86_64) ELF64 standard ABI"
> -TUNECONFLICT[m64] = "m32"
> +TUNECONFLICT[m64] = "m32 mx32"
>  TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", "m64", "${X86ARCH64}", "" ,d)}"
> +ABIEXTENSION .= "${@bb.utils.contains("TUNE_FEATURES", "m64", "64", "" ,d)}"
>  TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "m64", "-m64", "", d)}"

... and likewise this for anybody using the x86-64 ABI.

> -PACKAGE_EXTRA_ARCHS_tune-x86-64 = "x86_64"
> +PACKAGE_EXTRA_ARCHS_tune-x86-64 = "x86-64"

That change might well be fine, but again it isn't mentioned in the
checkin message.

> diff --git a/meta/conf/machine/include/tune-x86_64.inc b/meta/conf/machine/include/tune-x86_64.inc
> index 04b0f96..50f20ba 100644
> --- a/meta/conf/machine/include/tune-x86_64.inc
> +++ b/meta/conf/machine/include/tune-x86_64.inc
> @@ -1,3 +1,3 @@
>  require conf/machine/include/ia32/arch-ia32.inc
>  
> -DEFAULTTUNE = "x86-64"
> +DEFAULTTUNE ?= "x86-64"

This one is also not mentioned in the checkin message and looks a bit
more dubious to me.  Why is this required?

p.




