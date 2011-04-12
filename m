Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Q9W2D-000302-Kk
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Apr 2011 07:21:06 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 11 Apr 2011 22:18:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,194,1301900400"; d="scan'208";a="677895593"
Received: from unknown (HELO [10.255.12.197]) ([10.255.12.197])
	by fmsmga002.fm.intel.com with ESMTP; 11 Apr 2011 22:18:49 -0700
Message-ID: <4DA3E0B9.2030505@linux.intel.com>
Date: Mon, 11 Apr 2011 22:18:49 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.10) Gecko/20100621 Fedora/3.0.5-1.fc13 Lightning/1.0b2pre
	Thunderbird/3.0.5
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1302572384.git.edwin.zhai@intel.com>
	<45df8d07a8e35223e8a53033b4e0d208d8829c04.1302572384.git.edwin.zhai@intel.com>
In-Reply-To: <45df8d07a8e35223e8a53033b4e0d208d8829c04.1302572384.git.edwin.zhai@intel.com>
Subject: Re: [PATCH 1/1] qemu: Fix the qemu GL application start failure.
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
X-List-Received-Date: Tue, 12 Apr 2011 05:21:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/11/2011 06:42 PM, Zhai Edwin wrote:
> From: Zhai Edwin<edwin.zhai@intel.com>
>
> Some turn-on macro/variable are re-arranged, buffer pointer is extended to
> support 32/64b combination of target/host.
>
> [YOCTO #688] fixed.
>
> Signed-off-by:  Zhai Edwin<edwin.zhai@intel.com>
> ---
>   .../qemu/qemu-0.14.0/qemugl-fix.patch              |   70 ++++++++++++++++++++
>   meta/recipes-devtools/qemu/qemu_0.14.0.bb          |    1 +
>   2 files changed, 71 insertions(+), 0 deletions(-)
>   create mode 100644 meta/recipes-devtools/qemu/qemu-0.14.0/qemugl-fix.patch
>
> diff --git a/meta/recipes-devtools/qemu/qemu-0.14.0/qemugl-fix.patch b/meta/recipes-devtools/qemu/qemu-0.14.0/qemugl-fix.patch
> new file mode 100644
> index 0000000..c395b60
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu-0.14.0/qemugl-fix.patch
> @@ -0,0 +1,70 @@
> +This patch fix GL application start failure on qemu 0.14.0.
> +
> +Some turn-on macro/variable are re-arranged, buffer pointer is extended to
> +support 32/64b combination of target/host.
> +
> +This is not perfect fix, and we need consider other GL alternatives in future.
> +
As this is a new patch, is this due to be sent upstream?  Please add an 
Upstream-Status: tag indicating what your intentions with this patch is.

Thanks
	Sau!

> +Signed-off-by: Zhai Edwin<edwin.zhai@intel.com>
> +Index: qemu-0.14.0/target-i386/opengl_func.h
> +===================================================================
> +--- qemu-0.14.0.orig/target-i386/opengl_func.h	2011-04-08 16:43:46.000000000 +0800
> ++++ qemu-0.14.0/target-i386/opengl_func.h	2011-04-08 16:45:55.000000000 +0800
> +@@ -26,8 +26,9 @@
> + #include "mesa_glext.h"
> +
> + /* Argument list are internally of a type that can hold a target pointer
> +- * or a host pointer.  */
> +-typedef target_phys_addr_t arg_t;
> ++ * or a host pointer. If 32b target runs on 64b host, it should be big enough
> ++ * to hold host pointer */
> ++typedef long unsigned int arg_t;
> +
> + enum {
> +     TYPE_NONE,
> +Index: qemu-0.14.0/target-i386/translate.c
> +===================================================================
> +--- qemu-0.14.0.orig/target-i386/translate.c	2011-04-08 16:19:15.000000000 +0800
> ++++ qemu-0.14.0/target-i386/translate.c	2011-04-08 16:22:03.000000000 +0800
> +@@ -2652,17 +2652,19 @@
> +     s->is_jmp = DISAS_TB_JUMP;
> + }
> +
> +-int enable_gl = 0;
> ++extern int enable_gl;
> +
> + /* an interrupt is different from an exception because of the
> +    privilege checks */
> + static void gen_interrupt(DisasContext *s, int intno,
> +                           target_ulong cur_eip, target_ulong next_eip)
> + {
> ++#if !defined(CONFIG_USER_ONLY)
> +     if (enable_gl&&  intno == 0x99) {
> +         gen_helper_opengl();
> +         return;
> +     }
> ++#endif
> +
> +     if (s->cc_op != CC_OP_DYNAMIC)
> +         gen_op_set_cc_op(s->cc_op);
> +Index: qemu-0.14.0/vl.c
> +===================================================================
> +--- qemu-0.14.0.orig/vl.c	2011-04-08 16:11:43.000000000 +0800
> ++++ qemu-0.14.0/vl.c	2011-04-08 16:20:05.000000000 +0800
> +@@ -229,7 +229,7 @@
> + unsigned int nb_prom_envs = 0;
> + const char *prom_envs[MAX_PROM_ENVS];
> + int boot_menu;
> +-extern int enable_gl;
> ++int enable_gl = 0;
> +
> + typedef struct FWBootEntry FWBootEntry;
> +
> +@@ -1909,6 +1909,7 @@
> +     return popt;
> + }
> +
> ++#define TARGET_OPENGL_OK
> + int main(int argc, char **argv, char **envp)
> + {
> +     const char *gdbstub_dev = NULL;
> diff --git a/meta/recipes-devtools/qemu/qemu_0.14.0.bb b/meta/recipes-devtools/qemu/qemu_0.14.0.bb
> index d8535b2..e440759 100644
> --- a/meta/recipes-devtools/qemu/qemu_0.14.0.bb
> +++ b/meta/recipes-devtools/qemu/qemu_0.14.0.bb
> @@ -24,6 +24,7 @@ SRC_URI = "\
>       file://spice-qxl-locking-fix-for-qemu-kvm.patch \
>       file://Detect-and-use-GCC-atomic-builtins-for-locking.patch \
>       file://larger_default_ram_size.patch \
> +    file://qemugl-fix.patch \
>       "
>   SRC_URI[md5sum] = "f9d145d5c09de9f0984ffe9bd1229970"
>   SRC_URI[sha256sum] = "ba21e84d7853217830e167dae9999cdbff481189c6a0bb600ac7fb7201453108"


