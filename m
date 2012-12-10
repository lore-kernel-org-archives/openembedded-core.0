Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TiDTU-0005ZR-3f
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Dec 2012 01:13:28 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 10 Dec 2012 15:58:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,254,1355126400"; d="scan'208";a="255472872"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.85])
	by orsmga002.jf.intel.com with ESMTP; 10 Dec 2012 15:58:55 -0800
Message-ID: <50C6773E.7000805@linux.intel.com>
Date: Mon, 10 Dec 2012 15:58:54 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Kang Kai <kai.kang@windriver.com>
References: <cover.1355131760.git.kai.kang@windriver.com>
	<82be931f7271af4863557f93daa29324fcbb439b.1355131760.git.kai.kang@windriver.com>
In-Reply-To: <82be931f7271af4863557f93daa29324fcbb439b.1355131760.git.kai.kang@windriver.com>
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] newt: enable python support
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
X-List-Received-Date: Tue, 11 Dec 2012 00:13:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/10/2012 01:37 AM, Kang Kai wrote:
> Compile newt with python support. There may be packages that need newt's
> python extension.
>
> Add python to DEPENDS. And add patch fix_python_fpic.patch to compile
> python .so module with flag -fPIC.
>
> Signed-off-by: Kang Kai <kai.kang@windriver.com>
> ---
>   .../newt/files/fix_python_fpic.patch               |   11 +++++++++
>   meta/recipes-extended/newt/libnewt_0.52.14.bb      |   24 +++++++++++++++-----
>   2 files changed, 29 insertions(+), 6 deletions(-)
>   create mode 100644 meta/recipes-extended/newt/files/fix_python_fpic.patch
>
> diff --git a/meta/recipes-extended/newt/files/fix_python_fpic.patch b/meta/recipes-extended/newt/files/fix_python_fpic.patch
> new file mode 100644
> index 0000000..d0dbe99
> --- /dev/null
> +++ b/meta/recipes-extended/newt/files/fix_python_fpic.patch

No Patch Header!

Please add Signed-off-by and Upstream-Status to your patches.

Sau!

> @@ -0,0 +1,11 @@
> +--- newt-0.52.14/Makefile.in	2012-12-04 17:27:27.578915801 +0800
> ++++ newt-0.52.14/Makefile.in.new	2012-12-04 17:28:43.274918472 +0800
> +@@ -84,7 +84,7 @@
> + 			PIFLAGS=`$$ver-config --includes`; \
> + 			PLDFLAGS=`$$ver-config --ldflags`; \
> + 			PLFLAGS=`$$ver-config --libs`; \
> +-	        $(CC) $(CPPFLAGS) $$PIFLAGS $$PCFLAGS -c -o $$ver/snackmodule.o snackmodule.c ;\
> ++	        $(CC) $(SHCFLAGS) $(CPPFLAGS) $$PIFLAGS $$PCFLAGS -c -o $$ver/snackmodule.o snackmodule.c ;\
> + 	        $(CC) --shared $$PLDFLAGS $$PLFLAGS $(LDFLAGS) -o $$ver/_snackmodule.so $$ver/snackmodule.o -L.  -lnewt $(LIBS);\
> + 	done || :
> + 	touch $@
> diff --git a/meta/recipes-extended/newt/libnewt_0.52.14.bb b/meta/recipes-extended/newt/libnewt_0.52.14.bb
> index 0208695..c1ec029 100644
> --- a/meta/recipes-extended/newt/libnewt_0.52.14.bb
> +++ b/meta/recipes-extended/newt/libnewt_0.52.14.bb
> @@ -15,28 +15,40 @@ LICENSE = "LGPLv2"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
>
>   # slang needs to be >= 2.2
> -DEPENDS = "slang popt"
> +DEPENDS = "slang popt python"
>
> -PR = "r1"
> +PR = "r2"
>
>   SRC_URI = "https://fedorahosted.org/releases/n/e/newt/newt-${PV}.tar.gz \
>              file://remove_slang_include.patch \
>              file://fix_SHAREDDIR.patch \
> -           file://cross_ar.patch"
> +           file://cross_ar.patch \
> +           file://fix_python_fpic.patch"
>
>   SRC_URI[md5sum] = "eb78c6bb658b92ec7198908b5b8d0e37"
>   SRC_URI[sha256sum] = "f70f4f58baa60388ddf2e39249ffb00898fb40f2b2767e42e2ab51fe4b40978e"
>
>   S = "${WORKDIR}/newt-${PV}"
>
> -EXTRA_OECONF = "--without-python --without-tcl"
> +EXTRA_OECONF = "--without-tcl"
>
> -inherit autotools
> +inherit autotools pythonnative python-dir
>
> -PACKAGES_prepend = "whiptail "
> +EXTRA_OEMAKE = "PYTHONVERS=${PYTHON_DIR}"
> +
> +export STAGING_INCDIR
> +export STAGING_LIBDIR
> +
> +export BUILD_SYS
> +export HOST_SYS
> +
> +PACKAGES_prepend = "whiptail ${PN}-python "
>
>   do_configure_prepend() {
>       sh autogen.sh
>   }
>
>   FILES_whiptail = "${bindir}/whiptail"
> +FILES_${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/.debug/"
> +FILES_${PN}-python = "${PYTHON_SITEPACKAGES_DIR}/*"
> +FILES_${PN}-staticdev = "${libdir}/*.a"
>


