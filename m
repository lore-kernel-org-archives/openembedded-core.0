Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UPgqE-0003Yv-NW for openembedded-core@lists.openembedded.org;
	Wed, 10 Apr 2013 00:16:39 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r39MAKbe028848; Tue, 9 Apr 2013 23:10:20 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id RnIpt-K046SE; Tue,  9 Apr 2013 23:10:20 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r39MADHA028840
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 9 Apr 2013 23:10:16 +0100
Message-ID: <1365544739.12407.115.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Date: Tue, 09 Apr 2013 22:58:59 +0100
In-Reply-To: <1365522831-17183-1-git-send-email-laurentiu.palcu@intel.com>
References: <1365522831-17183-1-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] postinst-intercepts, qemu.bbclass: fix segfaults in postinstalls
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
X-List-Received-Date: Tue, 09 Apr 2013 22:16:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-04-09 at 18:53 +0300, Laurentiu Palcu wrote:
> Postinstalls that use qemu are throwing a segmentation fault when
> building for qemux86-64 on a 64bit host (it might also happen for
> qemux86 if building on a 32bit host but I didn't test). It looks like
> qemu looks for ld.so.cache which is not found because it is generated
> after rootfs_(rpm|ipk|deb)_do_rootfs is called and then it tries to load
> libraries from the default paths (which are the host's). In order to
> avoid this, pass the LD_LIBRARY_PATH explicitly to the target's dynamic
> loader.
> 
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> ---
>  meta/classes/qemu.bbclass                       |    4 +++-
>  scripts/postinst-intercepts/update_font_cache   |    3 ++-
>  scripts/postinst-intercepts/update_pixbuf_cache |    3 ++-
>  3 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/classes/qemu.bbclass b/meta/classes/qemu.bbclass
> index 0e71d6a..6881826 100644
> --- a/meta/classes/qemu.bbclass
> +++ b/meta/classes/qemu.bbclass
> @@ -29,4 +29,6 @@ def qemu_run_binary(data, rootfs_path, binary):
>      if qemu_binary == "qemu-allarch":
>          qemu_binary = "qemuwrapper"
>  
> -    return "PSEUDO_UNLOAD=1 " + qemu_binary + " -L " + rootfs_path + " " + rootfs_path + binary
> +    return "PSEUDO_UNLOAD=1 " + qemu_binary + " -L " + rootfs_path\
> +            + " -E LD_LIBRARY_PATH=" + rootfs_path + "/lib:" + rootfs_path\
> +            + "/usr/lib " + rootfs_path + binary

This isn't going to work with multilibs. Can we reorder the rootfs code
so the ld.so.cache piece happens before the intercepts?

Cheers,

Richard

> diff --git a/scripts/postinst-intercepts/update_font_cache b/scripts/postinst-intercepts/update_font_cache
> index ad1bab3..fa2c0ef 100644
> --- a/scripts/postinst-intercepts/update_font_cache
> +++ b/scripts/postinst-intercepts/update_font_cache
> @@ -1,5 +1,6 @@
>  #!/bin/sh
>  
> -PSEUDO_UNLOAD=1 qemuwrapper -L $D $D${bindir}/fc-cache --sysroot=$D >/dev/null 2>&1
> +PSEUDO_UNLOAD=1 qemuwrapper -L $D -E LD_LIBRARY_PATH=$D/lib:$D/usr/lib\
> +					$D${bindir}/fc-cache --sysroot=$D >/dev/null 2>&1
>  
> 
> diff --git a/scripts/postinst-intercepts/update_pixbuf_cache b/scripts/postinst-intercepts/update_pixbuf_cache
> index 9134529..fbb6fd1 100644
> --- a/scripts/postinst-intercepts/update_pixbuf_cache
> +++ b/scripts/postinst-intercepts/update_pixbuf_cache
> @@ -2,7 +2,8 @@
>  
>  export GDK_PIXBUF_MODULEDIR=$D${libdir}/gdk-pixbuf-2.0/2.10.0/loaders
>  
> -PSEUDO_UNLOAD=1 qemuwrapper -L $D $D${bindir}/gdk-pixbuf-query-loaders \
> +PSEUDO_UNLOAD=1 qemuwrapper -L $D -E LD_LIBRARY_PATH=$D/lib:$D/usr/lib\
> +    $D${bindir}/gdk-pixbuf-query-loaders \
>      >$GDK_PIXBUF_MODULEDIR/../loaders.cache 2>/dev/null && \
>      sed -i -e "s:$D::g" $GDK_PIXBUF_MODULEDIR/../loaders.cache
>  




