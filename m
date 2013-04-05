Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UOBfu-00015X-SU
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Apr 2013 20:47:52 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 05 Apr 2013 11:30:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,416,1363158000"; d="scan'208";a="290045593"
Received: from unknown (HELO helios.localnet) ([10.255.14.34])
	by orsmga001.jf.intel.com with ESMTP; 05 Apr 2013 11:30:26 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Date: Fri, 05 Apr 2013 19:30:24 +0100
Message-ID: <1772053.lXJvoCbPnm@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.1 (Linux/3.5.0-26-generic; KDE/4.10.1; i686; ; )
In-Reply-To: <1365178346-13759-1-git-send-email-laurentiu.palcu@intel.com>
References: <1365172122-20101-1-git-send-email-laurentiu.palcu@intel.com>
	<1365178346-13759-1-git-send-email-laurentiu.palcu@intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] postinst-intercepts, qemu.bbclass: fix issue on 32 bit hosts
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
X-List-Received-Date: Fri, 05 Apr 2013 18:48:08 -0000
X-List-Received-Date: Fri, 05 Apr 2013 18:48:08 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 05 April 2013 19:12:26 Laurentiu Palcu wrote:
> The intercept scripts fail to run on 32 bit hosts. Apparently, the
> current approach worked on 64 bit hosts due to the larger virtual address
> space (probably). On 32 bit hosts, however, calling the target binary like:
> 
> qemu-arm ld-linux.so --library-path /lib:/usr/lib arm_binary
> 
> fails with:
> 
> arm_binary: error while loading shared libraries: arm_binary: failed to
> map segment from shared object: Operation not permitted
> 
> When run like this, qemu-arm fails to map the arm_binary executable in
> memory because it's hitting the lower limit of
> /proc/sys/vm/mmap_min_addr. That's because it loads the
> ld-linux.so binary successfully, taking into account mmap_min_addr, runs
> it, and then ld-linux.so will map the arm_binary at a fixed address but this
> will fail because it is below mmap_min_addr. The qemu's guest base probing,
> apparently, doesn't work fine when a program runs inside other.
> 
> One way around this would be to set mmap_min_addr to 0 (on recent
> distributions is set to 65536 to avoid "kernel NULL pointer dereference"
> defects) but this approach is not safe.
> 
> The other way is to call the binary directly but providing qemu with a
> prefix (-L option) in order to find the elf interpreter correctly. This
> way, both the target binary and dynamic loader are mapped into memory
> under qemu's control and, only after, the dynamic loader is started.
> 
> [YOCTO #4179]
> 
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> ---
> Changes in v2:
>  * changed the qemu_run_binary() helper function too
> 
> Thanks,
> Laurentiu
> 
>  meta/classes/qemu.bbclass                       |    8 +-------
>  scripts/postinst-intercepts/update_font_cache   |    4 +---
>  scripts/postinst-intercepts/update_pixbuf_cache |    3 +--
>  3 files changed, 3 insertions(+), 12 deletions(-)
> 
> diff --git a/meta/classes/qemu.bbclass b/meta/classes/qemu.bbclass
> index 8b03926..0e71d6a 100644
> --- a/meta/classes/qemu.bbclass
> +++ b/meta/classes/qemu.bbclass
> @@ -29,10 +29,4 @@ def qemu_run_binary(data, rootfs_path, binary):
>      if qemu_binary == "qemu-allarch":
>          qemu_binary = "qemuwrapper"
> 
> -    dynamic_loader = rootfs_path + '$(readelf -l ' + rootfs_path + \
> -                     binary + '| grep "Requesting program interpreter"|sed
> -e \'s/^.*\[.*: \(.*\)\]/\\1/\')' -    library_path = rootfs_path +
> data.getVar("base_libdir", True) + ":" + \ -                   rootfs_path
> + data.getVar("libdir", True)
> -
> -    return "PSEUDO_UNLOAD=1 " + qemu_binary + " " + dynamic_loader + "
> --library-path " + library_path \ -           + " " + rootfs_path + binary
> +    return "PSEUDO_UNLOAD=1 " + qemu_binary + " -L " + rootfs_path + " " +
> rootfs_path + binary diff --git
> a/scripts/postinst-intercepts/update_font_cache
> b/scripts/postinst-intercepts/update_font_cache index 562b5b3..ad1bab3
> 100644
> --- a/scripts/postinst-intercepts/update_font_cache
> +++ b/scripts/postinst-intercepts/update_font_cache
> @@ -1,7 +1,5 @@
>  #!/bin/sh
> 
> -PSEUDO_UNLOAD=1 qemuwrapper $D$(readelf -l $D${bindir}/fc-cache| grep
> "Requesting program interpreter"|sed -e 's/^.*\[.*: \(.*\)\]/\1/') \ -     
>   --library-path $D/lib:$D/usr/lib $D${bindir}/fc-cache \
> -        --sysroot=$D >/dev/null 2>&1
> +PSEUDO_UNLOAD=1 qemuwrapper -L $D $D${bindir}/fc-cache --sysroot=$D
> >/dev/null 2>&1
> 
> 
> diff --git a/scripts/postinst-intercepts/update_pixbuf_cache
> b/scripts/postinst-intercepts/update_pixbuf_cache index 64033dc..9134529
> 100644
> --- a/scripts/postinst-intercepts/update_pixbuf_cache
> +++ b/scripts/postinst-intercepts/update_pixbuf_cache
> @@ -2,8 +2,7 @@
> 
>  export GDK_PIXBUF_MODULEDIR=$D${libdir}/gdk-pixbuf-2.0/2.10.0/loaders
> 
> -PSEUDO_UNLOAD=1 qemuwrapper $D$(readelf -l
> $D${bindir}/gdk-pixbuf-query-loaders|grep "Requesting program
> interpreter"|sed -e 's/^.*\[.*: \(.*\)\]/\1/') \ -    --library-path
> $D/lib:$D/usr/lib $D${bindir}/gdk-pixbuf-query-loaders \ +PSEUDO_UNLOAD=1
> qemuwrapper -L $D $D${bindir}/gdk-pixbuf-query-loaders \
>      >$GDK_PIXBUF_MODULEDIR/../loaders.cache 2>/dev/null && \
> 
>      sed -i -e "s:$D::g" $GDK_PIXBUF_MODULEDIR/../loaders.cache

This fixes the problem for me.

Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

-- 

Paul Eggleton
Intel Open Source Technology Centre


