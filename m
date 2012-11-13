Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TYOtR-0007w8-0M
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Nov 2012 23:23:41 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 13 Nov 2012 14:09:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,768,1352102400"; d="scan'208";a="217325387"
Received: from unknown (HELO [10.255.12.71]) ([10.255.12.71])
	by azsmga001.ch.intel.com with ESMTP; 13 Nov 2012 14:09:37 -0800
Message-ID: <50A2C521.9010907@linux.intel.com>
Date: Tue, 13 Nov 2012 14:09:37 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Yashpal Dutta <yashpal.dutta@freescale.com>
References: <1351894551-15670-1-git-send-email-yashpal.dutta@freescale.com>
In-Reply-To: <1351894551-15670-1-git-send-email-yashpal.dutta@freescale.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2] cryptodev kernel module recipe
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
X-List-Received-Date: Tue, 13 Nov 2012 22:23:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/02/2012 03:15 PM, Yashpal Dutta wrote:
> This is a /dev/crypto device driver, equivalent to those in OpenBSD or FreeBSD.
> The main idea is to access of existing ciphers in kernel space from userspace,
> thus enabling re-use of a hardware implementation of a cipher.
>
> Signed-off-by: Yashpal Dutta <yashpal.dutta@freescale.com>
> ---
>   meta/recipes-kernel/cryptodev/cryptodev_1.5.bb     |   17 +++++++++++++
>   .../cryptodev/files/makefile_fixup.patch           |   26 ++++++++++++++++++++
>   2 files changed, 43 insertions(+), 0 deletions(-)
>   create mode 100644 meta/recipes-kernel/cryptodev/cryptodev_1.5.bb
>   create mode 100644 meta/recipes-kernel/cryptodev/files/makefile_fixup.patch
>
> diff --git a/meta/recipes-kernel/cryptodev/cryptodev_1.5.bb b/meta/recipes-kernel/cryptodev/cryptodev_1.5.bb
> new file mode 100644
> index 0000000..0696e2a
> --- /dev/null
> +++ b/meta/recipes-kernel/cryptodev/cryptodev_1.5.bb
> @@ -0,0 +1,17 @@
> +SECTION = "devel"
> +SUMMARY = "Linux Cryptodev KERNEL MODULE"
> +DESCRIPTION = "The Cryptodev package contains the kernel /dev/crypto module"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +RCONFLICTS_${PN} = "ocf-linux"
> +
> +inherit module
> +
> +SRCREV = "1c24a0aa996630518d47826a2e3fea129ea094c7"
> +
> +SRC_URI = "git://repo.or.cz/cryptodev-linux.git;protocol=git \
> +           file://makefile_fixup.patch"
> +
> +EXTRA_OEMAKE='KERNEL_DIR="${STAGING_KERNEL_DIR}" PREFIX="${D}"'
> +
> +S = "${WORKDIR}/git"
> diff --git a/meta/recipes-kernel/cryptodev/files/makefile_fixup.patch b/meta/recipes-kernel/cryptodev/files/makefile_fixup.patch
> new file mode 100644
> index 0000000..323aacd
> --- /dev/null
> +++ b/meta/recipes-kernel/cryptodev/files/makefile_fixup.patch

This file (patch) needs a patch header with Upstream-Status and 
Signed-off-by.

Thanks	
	Sau!

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
> +-	@echo "Installing cryptodev.h in /usr/include/crypto ..."
> +-	@install -D crypto/cryptodev.h /usr/include/crypto/cryptodev.h
> ++	@echo "Installing cryptodev.h in $(PREFIX)/usr/include/crypto ..."
> ++	@install -D crypto/cryptodev.h $(PREFIX)/usr/include/crypto/cryptodev.h
> +
> + clean:
> + 	make -C $(KERNEL_DIR) SUBDIRS=`pwd` clean
>


