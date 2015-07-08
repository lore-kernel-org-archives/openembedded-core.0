Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0F93A75D2C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jul 2015 16:35:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t68GZBRC002122; Wed, 8 Jul 2015 17:35:11 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 1OiEwdlt1zPq; Wed,  8 Jul 2015 17:35:11 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t68GYvXq002108
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 8 Jul 2015 17:35:08 +0100
Message-ID: <1436373297.9778.9.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: leonardo.sandoval.gonzalez@linux.intel.com
Date: Wed, 08 Jul 2015 17:34:57 +0100
In-Reply-To: <f81ba427469fb04550efe6431284a0c0b2c1a546.1436343270.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1436343270.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<f81ba427469fb04550efe6431284a0c0b2c1a546.1436343270.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: matt.fleming@intel.com, ricardo.neri@intel.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 1/2] ovmf: Recipe taken from luv-yocto repository
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
X-List-Received-Date: Wed, 08 Jul 2015 16:35:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-07-08 at 08:20 +0000,
leonardo.sandoval.gonzalez@linux.intel.com wrote:
> From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> 
> OVMF metadata taken from the luv-yocto[1] repository and copied into
> OE-Core meta/recipes-core folder.
> 
> [1] https://github.com/01org/luv-yocto/tree/master/meta-luv/recipes-core/ovmf
> 
> [YOCTO #5654]
> 
> Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> ---
>  ...s-Force-tools-variables-to-host-toolchain.patch | 50 ++++++++++++++++++
>  meta/recipes-core/ovmf/ovmf_git.bb                 | 61 ++++++++++++++++++++++
>  2 files changed, 111 insertions(+)
>  create mode 100644 meta/recipes-core/ovmf/ovmf/0001-BaseTools-Force-tools-variables-to-host-toolchain.patch
>  create mode 100644 meta/recipes-core/ovmf/ovmf_git.bb
> 
> diff --git a/meta/recipes-core/ovmf/ovmf/0001-BaseTools-Force-tools-variables-to-host-toolchain.patch b/meta/recipes-core/ovmf/ovmf/0001-BaseTools-Force-tools-variables-to-host-toolchain.patch
> new file mode 100644
> index 0000000..94c4d4c
> --- /dev/null
> +++ b/meta/recipes-core/ovmf/ovmf/0001-BaseTools-Force-tools-variables-to-host-toolchain.patch
> @@ -0,0 +1,50 @@
> +From 6e24bde1979c2d7149b37d142fb882dfde0e9770 Mon Sep 17 00:00:00 2001
> +From: Matt Fleming <matt.fleming@intel.com>
> +Date: Fri, 27 Jun 2014 11:12:18 +0100
> +Subject: [PATCH] BaseTools: Force tools variables to host toolchain
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Matt Fleming <matt.fleming@intel.com>
> +---
> + BaseTools/Source/C/Makefiles/app.makefile | 7 +++++++
> + BaseTools/Source/C/VfrCompile/GNUmakefile | 5 +++++
> + 2 files changed, 12 insertions(+)
> +
> +diff --git a/BaseTools/Source/C/Makefiles/app.makefile b/BaseTools/Source/C/Makefiles/app.makefile
> +index 19269a1..62aad0f 100644
> +--- a/BaseTools/Source/C/Makefiles/app.makefile
> ++++ b/BaseTools/Source/C/Makefiles/app.makefile
> +@@ -16,6 +16,13 @@ include $(MAKEROOT)/Makefiles/header.makefile
> + 
> + APPLICATION = $(MAKEROOT)/bin/$(APPNAME)
> + 
> ++CC = gcc
> ++CXX = g++
> ++AS = gcc
> ++AR = ar
> ++LD = ld
> ++LINKER = $(CC)
> ++
> + .PHONY:all
> + all: $(MAKEROOT)/bin $(APPLICATION) 
> + 
> +diff --git a/BaseTools/Source/C/VfrCompile/GNUmakefile b/BaseTools/Source/C/VfrCompile/GNUmakefile
> +index 82005e1..5ac5f7e 100644
> +--- a/BaseTools/Source/C/VfrCompile/GNUmakefile
> ++++ b/BaseTools/Source/C/VfrCompile/GNUmakefile
> +@@ -26,6 +26,11 @@ OBJECTS = AParser.o DLexerBase.o ATokenBuffer.o EfiVfrParser.o VfrLexer.o VfrSyn
> + 
> + VFR_CPPFLAGS = -DPCCTS_USE_NAMESPACE_STD $(CPPFLAGS)
> + 
> ++CC = gcc
> ++CXX = g++
> ++AS = gcc
> ++AR = ar
> ++LD = ld
> + LINKER = $(CXX)
> + 
> + EXTRA_CLEAN_OBJECTS = EfiVfrParser.cpp EfiVfrParser.h VfrParser.dlg VfrTokens.h VfrLexer.cpp VfrLexer.h VfrSyntax.cpp tokens.h
> +-- 
> +1.9.0
> +
> diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
> new file mode 100644
> index 0000000..ce7e4f8
> --- /dev/null
> +++ b/meta/recipes-core/ovmf/ovmf_git.bb
> @@ -0,0 +1,61 @@
> +DESCRIPTION = "OVMF - UEFI firmware for Qemu and KVM"
> +HOMEPAGE = "http://sourceforge.net/apps/mediawiki/tianocore/index.php?title=OVMF"
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://OvmfPkg/License.txt;md5=ffd52cf9a8e0e036b9a61a0de2dc87ed"
> +
> +SRC_URI = "git://github.com/tianocore/edk2.git;branch=master \
> +	file://0001-BaseTools-Force-tools-variables-to-host-toolchain.patch"
> +
> +SRCREV="dc4ad1532e59fd1a185d6b90d1c2a92cf8713f40"
> +
> +S = "${WORKDIR}/git"
> +
> +DEPENDS_class-native="util-linux-native iasl-native"

Sorry, I didn't spot this before.

Does OE-Core have iasl? 

Does this recipe not need iasl-native in the target case too?

Cheers,

Richard


