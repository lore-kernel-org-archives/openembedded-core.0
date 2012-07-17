Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SrAKm-00015P-It
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 18:09:12 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 17 Jul 2012 08:57:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="178848268"
Received: from unknown (HELO [10.255.12.178]) ([10.255.12.178])
	by fmsmga001.fm.intel.com with ESMTP; 17 Jul 2012 08:57:52 -0700
Message-ID: <50058B80.4090608@linux.intel.com>
Date: Tue, 17 Jul 2012 08:57:52 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1341940460-5784-1-git-send-email-msm@freescale.com>
In-Reply-To: <1341940460-5784-1-git-send-email-msm@freescale.com>
Cc: Matthew McClintock <msm@freescale.com>
Subject: Re: [PATCH] rpm_5.4.9.bb: fix builds on systems with older libc
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
X-List-Received-Date: Tue, 17 Jul 2012 16:09:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/10/2012 10:14 AM, Matthew McClintock wrote:
> | dbconvert.o: In function `rpmdb_convert':
> | /local/jenkins/jobs/yocto-upstream/workspace/label/master/machine/p4080ds/poky/master/tmp/work/x86_64-linux/rpm-native-5.4.9-r45/rpm-5.4.9/tools/dbconvert.c:126: warning: the use of `tempnam' is dangerous, better use `mkstemp'
> | dbconvert.o: In function `main':
> | dbconvert.c:(.text+0x923): undefined reference to `htobe32'
> | dbconvert.c:(.text+0xaa4): undefined reference to `htole32'
> | dbconvert.c:(.text+0xac9): undefined reference to `htole32'
>
> Signed-off-by: Matthew McClintock <msm@freescale.com>
> ---
>   meta/recipes-devtools/rpm/rpm/dbconvert.patch |   27 +++++++++++++++++++++++++
>   meta/recipes-devtools/rpm/rpm_5.4.9.bb        |    3 ++-
>   2 files changed, 29 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-devtools/rpm/rpm/dbconvert.patch
>
Merged into OE-Core

Thanks
	Sau!

> diff --git a/meta/recipes-devtools/rpm/rpm/dbconvert.patch b/meta/recipes-devtools/rpm/rpm/dbconvert.patch
> new file mode 100644
> index 0000000..27dba8c
> --- /dev/null
> +++ b/meta/recipes-devtools/rpm/rpm/dbconvert.patch
> @@ -0,0 +1,27 @@
> +Upstream-Status: Not applicable
> +
> +Hack to prevent unneeded demo app from building on older libc
> +where it will break the build
> +
> +Index: rpm-5.4.9/tools/Makefile.am
> +===================================================================
> +--- rpm-5.4.9.orig/tools/Makefile.am
> ++++ rpm-5.4.9/tools/Makefile.am
> +@@ -24,7 +24,7 @@ AM_CFLAGS = $(OPENMP_CFLAGS)
> +
> + EXTRA_DIST =	hashtab.h bsdiff.1 bspatch.1 dotgraph.hh
> +
> +-EXTRA_PROGRAMS = augtool cudftool dbconvert debugedit \
> ++EXTRA_PROGRAMS = augtool cudftool debugedit \
> + 	nix-build nix-channel nix-collect-garbage nix-copy-closure \
> + 	nix-env nix-hash nix-install-package nix-instantiate \
> + 	nix-log2xml nix-prefetch-url nix-pull nix-push nix-store nix-worker \
> +@@ -60,7 +60,7 @@ pkgbin_PROGRAMS =	\
> + 	rpmcache rpmdigest rpmrepo rpmspecdump \
> + 	rpmcmp rpmdeps rpmdeps-oecore sqlite3 @WITH_KEYUTILS_RPMKEY@ @WITH_LIBELF_DEBUGEDIT@
> + if WITH_DB
> +-pkgbin_PROGRAMS +=	dbconvert
> ++pkgbin_PROGRAMS +=	
> + endif
> + dist_man_MANS =		rpmgrep.1
> +
> diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
> index 6ef1aae..e276cc3 100644
> --- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
> +++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
> @@ -43,7 +43,7 @@ LICENSE = "LGPLv2.1"
>   LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
>
>   DEPENDS = "libpcre attr acl popt ossp-uuid file"
> -PR = "r45"
> +PR = "r46"
>
>   # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It is needed
>   # in order to extract the distribution SRPM into a format we can extract...
> @@ -75,6 +75,7 @@ SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.9-0.20120508.src.rpm;ex
>   	   file://uclibc-support.patch \
>   	   file://rpmatch.patch \
>   	   file://fstack-protector-configure-check.patch \
> +	   file://dbconvert.patch \
>   	  "
>
>   SRC_URI[md5sum] = "60d56ace884340c1b3fcac6a1d58e768"
>



