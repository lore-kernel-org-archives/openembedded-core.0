Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SGc9X-0001SG-H8
	for openembedded-core@lists.openembedded.org;
	Sat, 07 Apr 2012 22:22:31 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 07 Apr 2012 13:13:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="126435015"
Received: from unknown (HELO [10.255.12.159]) ([10.255.12.159])
	by orsmga001.jf.intel.com with ESMTP; 07 Apr 2012 13:13:15 -0700
Message-ID: <4F809FDB.6030303@linux.intel.com>
Date: Sat, 07 Apr 2012 13:13:15 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1333699326.git.edwin.zhai@intel.com>
	<0d5664e615f94682afe05c5889c53373ba837b36.1333699326.git.edwin.zhai@intel.com>
In-Reply-To: <0d5664e615f94682afe05c5889c53373ba837b36.1333699326.git.edwin.zhai@intel.com>
Subject: Re: [PATCH 1/1] qemu: Fix gl failure from 64b target on 32b host
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
X-List-Received-Date: Sat, 07 Apr 2012 20:22:31 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/06/2012 01:04 AM, edwin.zhai@intel.com wrote:
> From: Zhai Edwin<edwin.zhai@intel.com>
>
> Data from 64b target is truncated by 32b host. This patch makes type of data
> buf in host same as target.
>
> [YOCTO #2221] got fixed.
>
> Signed-off-by: Zhai Edwin<edwin.zhai@intel.com>
> ---
>   .../qemu/qemu-0.15.1/opengl-args-copy-fix.patch    |   66 ++++++++++++++++++++
>   meta/recipes-devtools/qemu/qemu_0.15.1.bb          |    1 +
>   2 files changed, 67 insertions(+), 0 deletions(-)
>   create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.1/opengl-args-copy-fix.patch
>
> diff --git a/meta/recipes-devtools/qemu/qemu-0.15.1/opengl-args-copy-fix.patch b/meta/recipes-devtools/qemu/qemu-0.15.1/opengl-args-copy-fix.patch
> new file mode 100644
> index 0000000..ddf4e4a
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu-0.15.1/opengl-args-copy-fix.patch
> @@ -0,0 +1,66 @@
> +This patch fix GL application failure from 64b target on 32b host
> +
> +64b target produce 64b args buffer, but qemu parse it as 32b and get wrong
> +data. To avoid this, the type of args buffer in qemu should be same as target,
> +that is, target_phys_addr_t. The only potential issue is that we need copy
> +the data in buffer one by one, or else data corruption when 32b/64b for
> +target/host combination.
> +
> +Upstream-Status: Inappropriate [other] - depends on qemu gl patch
> +
> +Signed-off-by: Zhai Edwin<edwin.zhai@intel.com>
> +
> +Index: qemu-0.15.1/target-i386/opengl_func.h
> +===================================================================
> +--- qemu-0.15.1.orig/target-i386/opengl_func.h	2012-04-06 10:00:08.000000000 +0800
> ++++ qemu-0.15.1/target-i386/opengl_func.h	2012-04-06 10:47:38.000000000 +0800
> +@@ -25,10 +25,10 @@
> + #include "mesa_gl.h"
> + #include "mesa_glext.h"
> +
> +-/* Argument list are internally of a type that can hold a target pointer
> +- * or a host pointer. If 32b target runs on 64b host, it should be big enough
> +- * to hold host pointer */
> +-typedef long unsigned int arg_t;
> ++/* Argument list are internally of a type that point to a buffer passed from
> ++ * target. It should have same type as target, so that we can support 32b
> ++ * target on 64b host, and vice versa */
> ++typedef target_phys_addr_t arg_t;
> +
> + enum {
> +     TYPE_NONE,
> +Index: qemu-0.15.1/Makefile.target
> +===================================================================
> +--- qemu-0.15.1.orig/Makefile.target	2012-04-06 10:00:08.000000000 +0800
> ++++ qemu-0.15.1/Makefile.target	2012-04-06 10:00:08.000000000 +0800
> +@@ -128,7 +128,7 @@
> + gl_beginend.h: ../target-i386/beginend_funcs.sh
> + 	$<  >  $@
> + opengl_exec.o : opengl_exec.c server_stub.c gl_func.h opengl_func.h gl_beginend.h
> +-	$(CC) $(GL_CFLAGS) $(DEFINES) -c -o $@ $<  -I. -I../target-i386
> ++	$(CC) $(GL_CFLAGS) $(DEFINES) -c -o $@ $<  -I.. -I. -I../fpu -I../target-i386 -DNEED_CPU_H
> +
> + #########################################################
> + # Linux user emulator target
> +Index: qemu-0.15.1/target-i386/opengl_exec.c
> +===================================================================
> +--- qemu-0.15.1.orig/target-i386/opengl_exec.c	2012-04-06 10:00:08.000000000 +0800
> ++++ qemu-0.15.1/target-i386/opengl_exec.c	2012-04-06 10:39:22.000000000 +0800
> +@@ -37,16 +37,12 @@
> + #include<mesa_gl.h>
> + #include<mesa_glx.h>
> +
> +-// TODO
> +-typedef long unsigned int target_phys_addr_t;
> +-
> ++#include "exec.h"
> + #include "opengl_func.h"
> +
> + #include "mesa_glu.h"
> + #include "mesa_mipmap.c"
> +
> +-#include "../qemu-common.h"
> +-
> + //#define SYSTEMATIC_ERROR_CHECK
> + #define BUFFER_BEGINEND
> + #define glGetError() 0
> diff --git a/meta/recipes-devtools/qemu/qemu_0.15.1.bb b/meta/recipes-devtools/qemu/qemu_0.15.1.bb
> index 3a4ef32..d01e79d 100644
> --- a/meta/recipes-devtools/qemu/qemu_0.15.1.bb
> +++ b/meta/recipes-devtools/qemu/qemu_0.15.1.bb
> @@ -29,6 +29,7 @@ QEMUGLPATCHES = "\
>       file://enable-i386-linux-user.patch \
>       file://qemugl-fix.patch \
>       file://opengl-sdl-fix.patch \
> +    file://opengl-args-copy-fix.patch \
>       "
>
>   SRC_URI_append_virtclass-native = "\

Needs a PR bump, which I added for testing.

Sau!


