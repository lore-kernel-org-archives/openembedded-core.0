Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Qlj98-0006kk-7Y
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 17:02:10 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p6QEvurd018971
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2011 07:57:56 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 26 Jul 2011 07:57:55 -0700
Message-ID: <4E2ED5F2.3090306@windriver.com>
Date: Tue, 26 Jul 2011 09:57:54 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1311683981.git.richard.purdie@linuxfoundation.org>
	<992efbf4ec3d7c55346953dbe82f9745590e64bf.1311683981.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <992efbf4ec3d7c55346953dbe82f9745590e64bf.1311683981.git.richard.purdie@linuxfoundation.org>
Subject: Re: [PATCH 3/3] Add basic PowerPC core tune config
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
X-List-Received-Date: Tue, 26 Jul 2011 15:02:10 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

Comments below...

On 7/26/11 7:44 AM, Richard Purdie wrote:
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/conf/machine/include/powerpc/arch-powerpc.inc |   45 +++++++++++++++++++-
>  meta/conf/machine/include/tune-ppc603e.inc         |   12 ++++-
>  meta/conf/machine/include/tune-ppce300c2.inc       |   12 ++++-
>  meta/conf/machine/include/tune-ppce500.inc         |   13 ++++--
>  meta/conf/machine/include/tune-ppce500mc.inc       |   12 ++++-
>  meta/conf/machine/include/tune-ppce500v2.inc       |   12 ++++-
>  6 files changed, 88 insertions(+), 18 deletions(-)
> 
> diff --git a/meta/conf/machine/include/powerpc/arch-powerpc.inc b/meta/conf/machine/include/powerpc/arch-powerpc.inc
> index 17ace32..3f7befb 100644
> --- a/meta/conf/machine/include/powerpc/arch-powerpc.inc
> +++ b/meta/conf/machine/include/powerpc/arch-powerpc.inc
> @@ -1,3 +1,44 @@
> -TUNE_ARCH = "powerpc"
> +# Power Architecture definition
> +# Four defined ABIs, all combinations of:
> +# *) Hard/Soft Floating Point
> +# *) 32-bit/64-bit
> +
> +DEFAULTTUNE ?= "powerpc"
> +
> +TUNEVALID[m32] = "Power ELF32 standard ABI"
> +TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "m32", "-m32", "", d)}"
> +
> +TUNEVALID[m32-arch] = "Enable powerpc package architecture"
> +TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", [ "m32-arch" ], "powerpc", "", d)}"
> +
> +TUNEVALID[m64] = "Power ELF64 standard ABI"
> +TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "n64", "-m64", "", d)}"
> +
> +TUNEVALID[m64-arch] = "Enable powerpc64 package architecture"
> +TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", [ "m64-arch" ], "powerpc64", "", d)}"

Why m32-arch and m64-arch?  If m32 or m64 is selected then it should mean
powerpc or powerpc64.

> +TUNEVALID[fpu-hard] = "Use hardware FPU."
> +TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "fpu-hard", "-mhard-float", "", d)}"
> +
> +TUNEVALID[fpu-soft] = "Use software FPU."
> +TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "fpu-soft", "-msoft-float", "", d)}"
> +TARGET_FPU .= "${@bb.utils.contains("TUNE_FEATURES", "fpu-soft", "soft", "", d)}"

Why specify both fpu-hard and fpu-soft?  The "unusual" ABI is fpu-soft.  It
would simplify it to only have to specify one, and you get the other automatically.

> +TUNEVALID[spe] = "Enable SPE ABI extensions"
> +TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "spe", "-mabi=spe -mspe", "", d)}"
> +
> +ABIEXTENSION = "${@['','spe'][d.getVar('TARGET_FPU', True) in ['ppc-efd', 'ppc-efs']]}"

SPE instructions are specific to certain processors and not generic across all
of PPC.  I would move this to each of the tunes where it may be used.

Also I see the ABIEXTENSION, but where is it being set?

In the core PowerPC specification there are two ABIs defined.  The standard
classic PPC FPU hard-float (this is the long-running default), and a no-float
version that avoids passing via FPU registers.

There is a variant of the soft-float specific to certain processors.. each
processor has it's own variant depending on what registers it has.  e500(v1 -
single precision) and e500v2 (double precision) each have their own variants.  I
believe there is also an e300 variant that has a completely different SPE as well.

I assume from the above ppc-efd is double and efs is single...  Perhaps an e500
tune file that specific the ABI extension and has knowledge of both e500(v1) and
e500v2?

> +# Basic tune definitions
> +AVAILTUNES += "powerpc powerpc-nf" 
> +TUNE_FEATURES_tune-powerpc ?= "m32 m32-arch fpu-hard"
> +BASE_LIB_tune-powerpc = "lib"
> +TUNE_FEATURES_tune-powerpc-nf ?= "m32 m32-arch fpu-soft"
> +BASE_LIB_tune-powerpc-nf = "lib"
> +
> +AVAILTUNES += "powerpc64 powerpc64-nf"
> +TUNE_FEATURES_tune-powerpc64 ?= "m64 m64-arch fpu-hard"
> +BASE_LIB_tune-powerpc64 = "lib64"
> +TUNE_FEATURES_tune-powerpc64-nf ?= "m64 m64-arch fpu-soft"
> +BASE_LIB_tune-powerpc64-nf = "lib64"
>  
> -ABIEXTENSION = "${@['','spe'][bb.data.getVar('TARGET_FPU',d,1) in ['ppc-efd', 'ppc-efs']]}"
> diff --git a/meta/conf/machine/include/tune-ppc603e.inc b/meta/conf/machine/include/tune-ppc603e.inc
> index 61c0669..6991ae0 100644
> --- a/meta/conf/machine/include/tune-ppc603e.inc
> +++ b/meta/conf/machine/include/tune-ppc603e.inc
> @@ -1,5 +1,11 @@
> +DEFAULTTUNE ?= "ppc603e"
> +
>  require conf/machine/include/powerpc/arch-powerpc.inc
>  
> -TUNE_CCARGS = "-mcpu=603e  -mhard-float"
> -TUNE_PKGARCH = "ppc603e"
> -PACKAGE_EXTRA_ARCHS = "powerpc ppc603e"
> +TUNEVALID[ppc603e] = "Enable ppc603e specific processor optimizations"
> +TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppc603e", "-mcpu=603e", "", d)}"
> +TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", "ppc603e", "ppc603e", "", d)}"
> +
> +AVAILTUNES += "ppc603e"
> +TUNE_FEATURES_tune-ppc603e = "m32 fpu-hard ppc603e"
> +PACKAGE_EXTRA_ARCHS_tune-ppc603e = "powerpc ppc603e"

Going back to my original comment, the m32-arch is missing... or m32 should mean
"powerpc" (my suggestion).

> diff --git a/meta/conf/machine/include/tune-ppce300c2.inc b/meta/conf/machine/include/tune-ppce300c2.inc
> index a38e97c..652422f 100644
> --- a/meta/conf/machine/include/tune-ppce300c2.inc
> +++ b/meta/conf/machine/include/tune-ppce300c2.inc
> @@ -1,5 +1,11 @@
> +DEFAULTTUNE ?= "ppce300"
> +
>  require conf/machine/include/powerpc/arch-powerpc.inc
>  
> -TUNE_CCARGS = "-mcpu=e300c2 -msoft-float"
> -TUNE_PKGARCH = "ppce300"
> -PACKAGE_EXTRA_ARCHS = "powerpc ppce300"
> +TUNEVALID[ppce300] = "Enable ppce300 specific processor optimizations"
> +TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppce300", "-mcpu=e300c2", "", d)}"
> +TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", "ppce300", "ppce300", "", d)}"
> +
> +AVAILTUNES += "ppce300"
> +TUNE_FEATURES_tune-ppce300 = "m32 fpu-soft ppce300"
> +PACKAGE_EXTRA_ARCHS_tune-ppce300 = "powerpc ppce300"

There is also a ppce300 as well as the e300c2, so I'd change the option to be
fully qualified.  (One has floating point one doesn't..)

> diff --git a/meta/conf/machine/include/tune-ppce500.inc b/meta/conf/machine/include/tune-ppce500.inc
> index 22208f0..fe62445 100644
> --- a/meta/conf/machine/include/tune-ppce500.inc
> +++ b/meta/conf/machine/include/tune-ppce500.inc
> @@ -1,6 +1,11 @@
> +DEFAULTTUNE ?= "ppce500"
> +
>  require conf/machine/include/powerpc/arch-powerpc.inc
>  
> -TUNE_CCARGS = "-mcpu=8540"
> -BASE_PACKAGE_ARCH = "ppce500"
> -TUNE_PKGARCH = "ppce500"
> -PACKAGE_EXTRA_ARCHS = "powerpc ppce500"
> +TUNEVALID[ppce500] = "Enable ppce500 specific processor optimizations"
> +TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppce500", "-mcpu=8540", "", d)}"
> +TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", "ppce500", "ppce500", "", d)}"
> +
> +AVAILTUNES += "ppce500"
> +TUNE_FEATURES_tune-ppce500 = "m32 ppce500"
> +PACKAGE_EXTRA_ARCHS_tune-ppce500 = "powerpc ppce500"

This is the single precision e500 -- it should be specifying it's floating point
type.

> diff --git a/meta/conf/machine/include/tune-ppce500mc.inc b/meta/conf/machine/include/tune-ppce500mc.inc
> index 182d019..0d3640f 100644
> --- a/meta/conf/machine/include/tune-ppce500mc.inc
> +++ b/meta/conf/machine/include/tune-ppce500mc.inc
> @@ -1,5 +1,11 @@
> +DEFAULTTUNE ?= "ppce500mc"
> +
>  require conf/machine/include/powerpc/arch-powerpc.inc
>  
> -TUNE_CCARGS = "-mcpu=e500mc"
> -TUNE_PKGARCH = "ppce500mc"
> -PACKAGE_EXTRA_ARCHS = "powerpc ppce500mc"
> +TUNEVALID[ppce500mc] = "Enable ppce500mc specific processor optimizations"
> +TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppce500mc", "-mcpu=e500mc", "", d)}"
> +TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", "ppce500mc", "ppce500mc", "", d)}"
> +
> +AVAILTUNES += "ppce500mc"
> +TUNE_FEATURES_tune-ppce500mc = "m32 ppce500mc"
> +PACKAGE_EXTRA_ARCHS_tune-ppce500mc = "powerpc ppce500mc"

e500mc using the classic "hard-float" floating point unit.

> diff --git a/meta/conf/machine/include/tune-ppce500v2.inc b/meta/conf/machine/include/tune-ppce500v2.inc
> index daf2d58..e6b48a2 100644
> --- a/meta/conf/machine/include/tune-ppce500v2.inc
> +++ b/meta/conf/machine/include/tune-ppce500v2.inc
> @@ -1,5 +1,11 @@
> +DEFAULTTUNE ?= "ppce500v2"
> +
>  require conf/machine/include/powerpc/arch-powerpc.inc
>  
> -TUNE_CCARGS = "-mcpu=8548 -mabi=spe -mspe"
> -TUNE_PKGARCH = "ppce500v2"
> -PACKAGE_EXTRA_ARCHS = "powerpc ppce500v2"
> +TUNEVALID[ppce500mc] = "Enable ppce500mc specific processor optimizations"
> +TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppce500v2", "-mcpu=8548", "", d)}"
> +TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", "ppce500v2", "ppce500v2", "", d)}"
> +
> +AVAILTUNES += "ppce500v2"
> +TUNE_FEATURES_tune-ppce500v2 = "m32 spe ppce500v2"
> +PACKAGE_EXTRA_ARCHS_tune-ppce500v2 = "powerpc ppce500v2"

This one is double precision.


