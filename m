Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Srt19-00026B-4u
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 17:51:55 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Jul 2012 08:40:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="168530079"
Received: from unknown (HELO [10.255.12.214]) ([10.255.12.214])
	by orsmga001.jf.intel.com with ESMTP; 19 Jul 2012 08:40:30 -0700
Message-ID: <50082A6C.3020002@linux.intel.com>
Date: Thu, 19 Jul 2012 08:40:28 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Matthew McClintock <msm@freescale.com>
References: <1341940460-5784-1-git-send-email-msm@freescale.com>
In-Reply-To: <1341940460-5784-1-git-send-email-msm@freescale.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Thu, 19 Jul 2012 15:51:55 -0000
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

Matthew,

Some how this patch has introduced a problem with the package-index 
process, as can be seen by the recent autobuilder nightly failures. I 
know this patch seems to remove dbconvert, but that causes problems for 
the package-index task.

We have filed a bug #2753 
(https://bugzilla.yoctoproject.org/show_bug.cgi?id=2753), to track this. 
  Can you take a look into this?

Since it is causing the AB to fail, we would like to get this resolved, 
Robert Yang is also looking at the issue. We will likely revert this 
patch tomorrow if we don't get a resolution sooner.

Thanks
	Sau!

> Signed-off-by: Matthew McClintock <msm@freescale.com>
> ---
>   meta/recipes-devtools/rpm/rpm/dbconvert.patch |   27 +++++++++++++++++++++++++
>   meta/recipes-devtools/rpm/rpm_5.4.9.bb        |    3 ++-
>   2 files changed, 29 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-devtools/rpm/rpm/dbconvert.patch
>
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



