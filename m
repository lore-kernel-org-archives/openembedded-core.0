Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id AF496772BD
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 18:40:24 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 02 Feb 2016 10:40:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,385,1449561600"; d="scan'208";a="894909493"
Received: from sghosh7-mobl1.amr.corp.intel.com ([10.254.78.200])
	by fmsmga001.fm.intel.com with ESMTP; 02 Feb 2016 10:40:20 -0800
Message-ID: <1454438419.22468.178.camel@linux.intel.com>
From: Saul Wold <sgw@linux.intel.com>
To: Alexandru But <alexandru.but@ni.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 02 Feb 2016 10:40:19 -0800
In-Reply-To: <1454436308-29949-1-git-send-email-alexandru.but@ni.com>
References: <1454436308-29949-1-git-send-email-alexandru.but@ni.com>
X-Mailer: Evolution 3.18.1 (3.18.1-1.fc23) 
Mime-Version: 1.0
Subject: Re: [PATCH] linux-libc-headers: backport uapi header list
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
X-List-Received-Date: Tue, 02 Feb 2016 18:40:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2016-02-02 at 20:05 +0200, Alexandru But wrote:
> nvme uapi header was renamed from nvme.h to nvme_ioctl.h in linux
> 4.4, but the
> header list was not updated. This causes efivar (and maybe other)
> package build
> to fail. This should fix the build while the commit is backported in
> the
> kernel.
> 
Would it not make more sense to fix efivar (and maybe others) instead
of changing the kernel headers, which were clearly changed for a reason
to start with.

This patch seems to be pending: 
https://gitweb.gentoo.org/repo/gentoo.git/tree/sys-libs/efivar/files/0.
21-nvme_ioctl.h.patch

And a more appropriate patch to the kernel headers would be backporting
this already merged patch:

https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/
?id=a9cf8284b45110a4d98aea180a89c857e53bf850

You can request that Bruce (the linux-yocto maintainer) backport this
patch via the linux-yocto@yoctoproject.org list.


Sau!
 
> Signed-off-by: Alexandru But <alexandru.but@ni.com>
> ---
>  ...i-update-install-list-after-nvme.h-rename.patch | 34
> ++++++++++++++++++++++
>  .../linux-libc-headers/linux-libc-headers_4.4.bb   |  4 +++
>  2 files changed, 38 insertions(+)
>  create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-
> libc-headers/0001-uapi-update-install-list-after-nvme.h-rename.patch
> 
> diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-
> headers/0001-uapi-update-install-list-after-nvme.h-rename.patch
> b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-
> uapi-update-install-list-after-nvme.h-rename.patch
> new file mode 100644
> index 0000000..4d9f5a1
> --- /dev/null
> +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-
> uapi-update-install-list-after-nvme.h-rename.patch
> @@ -0,0 +1,34 @@
> +From a9cf8284b45110a4d98aea180a89c857e53bf850 Mon Sep 17 00:00:00
> 2001
> +From: Mike Frysinger <vapier@gentoo.org>
> +Date: Sun, 10 Jan 2016 20:14:11 -0500
> +Subject: [PATCH] uapi: update install list after nvme.h rename
> +
> +Commit 9d99a8dda154 ("nvme: move hardware structures out of the uapi
> +version of nvme.h") renamed nvme.h to nvme_ioctl.h, but the uapi
> list
> +still refers to nvme.h.  People trying to install the headers hit a
> +failure as the header no longer exists.
> +
> +Cc: stable@vger.kernel.org
> +Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> +Reviewed-by: Christoph Hellwig <hch@lst.de>
> +Signed-off-by: Jens Axboe <axboe@fb.com>
> +---
> + include/uapi/linux/Kbuild | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/include/uapi/linux/Kbuild b/include/uapi/linux/Kbuild
> +index 628e6e6..88e1292 100644
> +--- a/include/uapi/linux/Kbuild
> ++++ b/include/uapi/linux/Kbuild
> +@@ -306,7 +306,7 @@ header-y += nfs_mount.h
> + header-y += nl80211.h
> + header-y += n_r3964.h
> + header-y += nubus.h
> +-header-y += nvme.h
> ++header-y += nvme_ioctl.h
> + header-y += nvram.h
> + header-y += omap3isp.h
> + header-y += omapfb.h
> +-- 
> +2.6.1
> +
> diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-
> headers_4.4.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-
> headers_4.4.bb
> index 3763dc0..c8c7a10 100644
> --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-
> headers_4.4.bb
> +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-
> headers_4.4.bb
> @@ -5,5 +5,9 @@ SRC_URI_append_libc-musl = "\
>      file://0002-libc-compat.h-prevent-redefinition-of-struct-
> ethhdr.patch \
>      file://0003-remove-inclusion-of-sysinfo.h-in-kernel.h.patch \
>     "
> +SRC_URI_append ="\
> +    file://0001-uapi-update-install-list-after-nvme.h-rename.patch \
> +   "
> +
>  SRC_URI[md5sum] = "9a78fa2eb6c68ca5a40ed5af08142599"
>  SRC_URI[sha256sum] =
> "401d7c8fef594999a460d10c72c5a94e9c2e1022f16795ec51746b0d165418b2"
> -- 
> 2.6.1
> 

