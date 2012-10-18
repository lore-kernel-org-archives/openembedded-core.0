Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1TOwkH-0005ty-JC
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Oct 2012 22:31:09 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 18 Oct 2012 13:17:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,609,1344236400"; d="scan'208";a="207815311"
Received: from unknown (HELO envy.home) ([10.255.14.53])
	by orsmga001.jf.intel.com with ESMTP; 18 Oct 2012 13:17:47 -0700
Message-ID: <508063AF.9030400@linux.intel.com>
Date: Thu, 18 Oct 2012 16:16:47 -0400
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121009 Thunderbird/16.0
MIME-Version: 1.0
To: Yashpal Dutta <yashpal.dutta@freescale.com>
References: <1350554279-8975-1-git-send-email-yashpal.dutta@freescale.com>
In-Reply-To: <1350554279-8975-1-git-send-email-yashpal.dutta@freescale.com>
X-Enigmail-Version: 1.4.5
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] cryptodev kernel module recipe
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
X-List-Received-Date: Thu, 18 Oct 2012 20:31:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 10/18/2012 05:57 AM, Yashpal Dutta wrote:
> This is a /dev/crypto device driver, equivalent to those in OpenBSD or FreeBSD.
> The main idea is to access of existing ciphers in kernel space from userspace,
> thus enabling re-use of a hardware implementation of a cipher.
> 
> Signed-off-by: Yashpal Dutta <yashpal.dutta@freescale.com>
> ---
>  meta/recipes-kernel/cryptodev/cryptodev_1.5.bb     |   18 +++++++++++++
>  .../cryptodev/files/makefile_fixup.patch           |   26 ++++++++++++++++++++
>  2 files changed, 44 insertions(+), 0 deletions(-)
>  create mode 100644 meta/recipes-kernel/cryptodev/cryptodev_1.5.bb
>  create mode 100644 meta/recipes-kernel/cryptodev/files/makefile_fixup.patch
> 
> diff --git a/meta/recipes-kernel/cryptodev/cryptodev_1.5.bb b/meta/recipes-kernel/cryptodev/cryptodev_1.5.bb
> new file mode 100644
> index 0000000..5125710
> --- /dev/null
> +++ b/meta/recipes-kernel/cryptodev/cryptodev_1.5.bb
> @@ -0,0 +1,18 @@
> +SECTION = "devel"
> +SUMMARY = "Linux Cryptodev KERNEL MODULE"
> +DESCRIPTION = "The Cryptodev package contains the kernel /dev/crypto module"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +
> +DEPENDS = "virtual/kernel"

This DEPENDS in inherited from the module.bbclass, no need to duplicate

> +
> +inherit module
> +
> +SRCREV = "1c24a0aa996630518d47826a2e3fea129ea094c7"
> +
> +SRC_URI = "git://repo.or.cz/cryptodev-linux.git;protocol=git \
> +	  file://makefile_fixup.patch"

Tabs to indent, spaces to align. Spaces here please.

> +
> +EXTRA_OEMAKE='KERNEL_DIR="${STAGING_KERNEL_DIR}" PREFIX="${D}"'

modules.bbclass already sets KERNEL_PATH and KERNEL_SRC, perhaps you
could use one of those?

If you just use ${includedir} in your install I believe you can skip
PREFIX here and get the /usr part right there.

> +
> +S = "${WORKDIR}/git"
> diff --git a/meta/recipes-kernel/cryptodev/files/makefile_fixup.patch b/meta/recipes-kernel/cryptodev/files/makefile_fixup.patch
> new file mode 100644
> index 0000000..323aacd
> --- /dev/null
> +++ b/meta/recipes-kernel/cryptodev/files/makefile_fixup.patch
> @@ -0,0 +1,26 @@
> +diff --git a/Makefile b/Makefile
> +index 2be8825..b36d68c 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -1,6 +1,7 @@
> + KBUILD_CFLAGS += -I$(src)
> + KERNEL_DIR = /lib/modules/$(shell uname -r)/build
> + VERSION = 1.5
> ++PREFIX =
> + 
> + cryptodev-objs = ioctl.o main.o cryptlib.o authenc.o zc.o util.o
> + 
> +@@ -12,10 +13,10 @@ build: version.h
> + version.h: Makefile
> + 	@echo "#define VERSION \"$(VERSION)\"" > version.h
> + 
> +-install:
> ++modules_install:
> + 	make -C $(KERNEL_DIR) SUBDIRS=`pwd` modules_install

Current kernels recommend using M= instead of SUBDIRS=:

SRC := $(shell pwd)
make -C $(KERNEL_SRC) M=$(SRC) modules_install

See the hello-mod example in meta-skeleton/recipes-kernel/hello-mod for
a minimal example.

> +-	@echo "Installing cryptodev.h in /usr/include/crypto ..."
> +-	@install -D crypto/cryptodev.h /usr/include/crypto/cryptodev.h
> ++	@echo "Installing cryptodev.h in $(PREFIX)/usr/include/crypto ..."
> ++	@install -D crypto/cryptodev.h $(PREFIX)/usr/include/crypto/cryptodev.h

Use ${includedir} here

> + 
> + clean:
> + 	make -C $(KERNEL_DIR) SUBDIRS=`pwd` clean
> 

M=

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel


