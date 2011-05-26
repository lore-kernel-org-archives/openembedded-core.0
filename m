Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <darren.hart@intel.com>) id 1QPhz6-0008PY-AX
	for openembedded-core@lists.openembedded.org;
	Thu, 26 May 2011 23:20:49 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 26 May 2011 14:16:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,276,1304319600"; 
   d="scan'208";a="9584549"
Received: from doubt.jf.intel.com (HELO [10.24.80.114]) ([10.24.80.114])
	by fmsmga001.fm.intel.com with ESMTP; 26 May 2011 14:16:38 -0700
Message-ID: <4DDEC349.3000409@intel.com>
Date: Thu, 26 May 2011 14:16:57 -0700
From: Darren Hart <darren.hart@intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1306442263.git.nitin.a.kamble@intel.com>
	<03152273cac84eef23738c5f26c45b082194284f.1306442263.git.nitin.a.kamble@intel.com>
In-Reply-To: <03152273cac84eef23738c5f26c45b082194284f.1306442263.git.nitin.a.kamble@intel.com>
X-Mailman-Approved-At: Fri, 27 May 2011 08:04:01 +0200
Subject: Re: [bugfix 1/1] mesa-xlib: workaround gcc 4.6.0 ICE
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
X-List-Received-Date: Thu, 26 May 2011 21:20:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 05/26/2011 01:41 PM, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
> 
> Fixes this bug [YOCTO #1105]
> 
> Working around this issue withg gcc 4.6.0 for beagleboard machine (armv7)
> 
> ccache arm-poky-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon
> -mfloat-abi=softfp -fno-tree-vectorize
> --sysroot=/build_disk/poky_build/build0/tmp/sysroots/beagleboard -c -I.
> -I../../../../src/gallium/include -I../../../../src/gallium/auxiliary
> -I../../../../src/gallium/drivers
> -I../../../../src/gallium/drivers/svga/include -O2 -pipe -g
> -feliminate-unused-debug-types -Wall -Wmissing-prototypes -std=c99 -ffast-math
> -fvisibility=hidden -fno-strict-aliasing -fPIC -D_GNU_SOURCE -DPTHREADS
> -DHAVE_POSIX_MEMALIGN -DUSE_XSHM -std=gnu99 -fvisibility=hidden -DHAVE_STDINT_H
> -DHAVE_SYS_TYPES_H svga_tgsi_insn.c -o svga_tgsi_insn.o
> svga_tgsi_insn.c: In function 'svga_shader_emit_instructions':
> svga_tgsi_insn.c:2969:1: internal compiler error: in push_minipool_fix, at
> config/arm/arm.c:12084
> Please submit a full bug report,
> with preprocessed source if appropriate.
> See <http://gcc.gnu.org/bugs.html> for instructions.
> make[4]: *** [svga_tgsi_insn.o] Error 1
> 
> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> ---
>  meta/recipes-graphics/mesa/mesa-xlib_7.10.2.bb |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
> 
> diff --git a/meta/recipes-graphics/mesa/mesa-xlib_7.10.2.bb b/meta/recipes-graphics/mesa/mesa-xlib_7.10.2.bb
> index b77df2c..051bd72 100644
> --- a/meta/recipes-graphics/mesa/mesa-xlib_7.10.2.bb
> +++ b/meta/recipes-graphics/mesa/mesa-xlib_7.10.2.bb
> @@ -17,3 +17,6 @@ PE = "1"
>  PR = "r0"
>  
>  EXTRA_OECONF += "--with-driver=xlib"
> +
> +# nullify -O2

Can we specify why this is being done here in the recipe? We do this in
other areas, something like:

# GCC 4.6.0 hits an internal compiler error using -O2
# use -O to workaround.

This make it obvious when looking just at the source why this is an
issue, and will trigger a retest and removal when we move past 4.6.0.
Also, if there is a bug number, linking that here would make it easy to
determine if a fix is ready.

> +CFLAGS_append += " -O"

Thanks,

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


