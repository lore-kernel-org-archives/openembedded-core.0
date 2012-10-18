Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1TOqQs-0001eL-OP
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Oct 2012 15:46:42 +0200
Received: by mail-lb0-f175.google.com with SMTP id y2so5532476lbk.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Oct 2012 06:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=/i1m8o+j1vDm9lFTSPSCfyfBsofUzVe+7256D/cqTTs=;
	b=uD32Q1Cpg9Pz4xbiBzuy3rOKWiK0ZJhCe/kTcHPR6gnFYcaA+7yq3rmfsxLxVAQToy
	E4OxqYCfOLLYh9s/wYUm+Cb8YgOcYGcd+Y7nRzObS+HVdYldpploP9gSf2Xe9eRCNkxk
	lXpsYl12HOtq55p6QfMCWlBIduOBHKKdsp3zKa1vRGRz2fTD1j0lcZFdJxslxPq1qrU9
	TPDNwRAeezuLSgxiOO2TiX4ktzO1ZSpCIYfgtljs0Dual1gBpWp5lW0XqVqwjUpJMFbV
	rdlsb8BUH0f+En1WL43XMcklThnGIhBlfJd64kaksDmNTYiSY1frVa616aOuJWZ3ODDD
	PFTg==
MIME-Version: 1.0
Received: by 10.152.104.50 with SMTP id gb18mr18877630lab.9.1350567203192;
	Thu, 18 Oct 2012 06:33:23 -0700 (PDT)
Received: by 10.114.17.164 with HTTP; Thu, 18 Oct 2012 06:33:23 -0700 (PDT)
In-Reply-To: <1350554279-8975-1-git-send-email-yashpal.dutta@freescale.com>
References: <1350554279-8975-1-git-send-email-yashpal.dutta@freescale.com>
Date: Thu, 18 Oct 2012 09:33:23 -0400
Message-ID: <CADkTA4MzmofTtk7qvhU_2fsfKgmGRPmxf-zUzcj4FkzBDAP_rQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Yashpal Dutta <yashpal.dutta@freescale.com>
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
X-List-Received-Date: Thu, 18 Oct 2012 13:46:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Oct 18, 2012 at 5:57 AM, Yashpal Dutta
<yashpal.dutta@freescale.com> wrote:
> This is a /dev/crypto device driver, equivalent to those in OpenBSD or FreeBSD.
> The main idea is to access of existing ciphers in kernel space from userspace,
> thus enabling re-use of a hardware implementation of a cipher.

I always use OCF for an overlapping set of functionality. To make this external
module gracefully deal with a situation such as this, maybe a check for OCF
in the kernel config ?

The same thing could be said about having a kernel with this functionality
already integrated (I have several of those as well).

That's a more general question about what's the best way to gracefully deal
with out of tree modules detecting that they are being built against a kernel
that already has the functionality merged. The easy answer is that
it's something
the distro maintainer needs to know, and manage, and maybe that's the
final answer. But I'm more wondering about this with respect to
inter-operability
of layers, if something in a layer depends/rdepends on this module, it will be
pulled in, and won't that limit the mix/match/stacking of the various layers ?

I added Richard for comment on the above.

But that of course raises the question, why should this be in oe-core versus
something like OCF ? This is definitely simpler, but OCF has it's use cases and
advantages as well, that are an overlapping set of functionality.

I don't have all the answers, just plenty of questions :)

Cheers,

Bruce


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
> +
> +inherit module
> +
> +SRCREV = "1c24a0aa996630518d47826a2e3fea129ea094c7"
> +
> +SRC_URI = "git://repo.or.cz/cryptodev-linux.git;protocol=git \
> +         file://makefile_fixup.patch"
> +
> +EXTRA_OEMAKE='KERNEL_DIR="${STAGING_KERNEL_DIR}" PREFIX="${D}"'
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
> +       @echo "#define VERSION \"$(VERSION)\"" > version.h
> +
> +-install:
> ++modules_install:
> +       make -C $(KERNEL_DIR) SUBDIRS=`pwd` modules_install
> +-      @echo "Installing cryptodev.h in /usr/include/crypto ..."
> +-      @install -D crypto/cryptodev.h /usr/include/crypto/cryptodev.h
> ++      @echo "Installing cryptodev.h in $(PREFIX)/usr/include/crypto ..."
> ++      @install -D crypto/cryptodev.h $(PREFIX)/usr/include/crypto/cryptodev.h
> +
> + clean:
> +       make -C $(KERNEL_DIR) SUBDIRS=`pwd` clean
> --
> 1.7.0.4
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


