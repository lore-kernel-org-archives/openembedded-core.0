Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 249E66A5B4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 00:51:15 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 10 Jun 2013 17:51:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,841,1363158000"; d="scan'208";a="315054241"
Received: from unknown (HELO [10.255.12.247]) ([10.255.12.247])
	by azsmga001.ch.intel.com with ESMTP; 10 Jun 2013 17:51:13 -0700
Message-ID: <51B67480.5010400@linux.intel.com>
Date: Mon, 10 Jun 2013 17:51:12 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Christopher Larson <kergoth@gmail.com>
References: <cover.1370896990.git.chris_larson@mentor.com>
	<0face86bf815082f2080f84c0214a7835d0380dd.1370896990.git.chris_larson@mentor.com>
In-Reply-To: <0face86bf815082f2080f84c0214a7835d0380dd.1370896990.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/4] libnewt: split python module into libnewt-python
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
X-List-Received-Date: Tue, 11 Jun 2013 00:51:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/10/2013 01:47 PM, Christopher Larson wrote:
> From: Christopher Larson <chris_larson@mentor.com>
>
> This is useful as it avoids pulling python into a build just to build
> chkconfig. The python recipe uses the libnewt installed in the sysroot by the
> main package, so there's little loss of build time, other than the additional
> unpack/patch.
>
This one seems to introduce a new warning, this was from a populated 
build dir with sstate available

> WARNING: The recipe libnewt-python is trying to install files into a shared area when those files already exist.
Those files and their manifest location are:
 
/srv/ssd/sgw/builds/world/tmp/pkgdata/x86_64-poky-linux/runtime/whiptail 

     Matched in manifest-x86_64-libnewt.packagedata 

 
/srv/ssd/sgw/builds/world/tmp/pkgdata/x86_64-poky-linux/runtime-reverse/whiptail
     Matched in manifest-x86_64-libnewt.packagedata 

Please verify which package should provide the above files.



Sau!


> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> ---
>   .../newt/libnewt-python_0.52.14.bb                 | 26 ++++++++++++++++++++++
>   meta/recipes-extended/newt/libnewt_0.52.14.bb      | 15 +++++--------
>   2 files changed, 31 insertions(+), 10 deletions(-)
>   create mode 100644 meta/recipes-extended/newt/libnewt-python_0.52.14.bb
>
> diff --git a/meta/recipes-extended/newt/libnewt-python_0.52.14.bb b/meta/recipes-extended/newt/libnewt-python_0.52.14.bb
> new file mode 100644
> index 0000000..9af2d5d
> --- /dev/null
> +++ b/meta/recipes-extended/newt/libnewt-python_0.52.14.bb
> @@ -0,0 +1,26 @@
> +require recipes-extended/newt/libnewt_${PV}.bb
> +
> +SUMMARY .= " - python"
> +DEPENDS = "libnewt python"
> +RDEPENDS_${PN} += "python-core"
> +
> +inherit pythonnative python-dir
> +
> +EXTRA_OECONF += "--with-python"
> +EXTRA_OEMAKE += "PYTHONVERS=${PYTHON_DIR}"
> +
> +
> +do_compile () {
> +	VERSION="$(sed -n 's/^VERSION = //p' Makefile)"
> +	oe_runmake "LIBNEWTSH=${STAGING_LIBDIR}/libnewt.so.$VERSION" _snackmodule.so
> +}
> +
> +do_install () {
> +	install -d ${D}${PYTHON_SITEPACKAGES_DIR}
> +	install -m 0755 ${PYTHON_DIR}/_snackmodule.so ${D}${PYTHON_SITEPACKAGES_DIR}/
> +	install -m 0644 snack.py ${D}${PYTHON_SITEPACKAGES_DIR}/
> +}
> +
> +
> +FILES_${PN} = "${PYTHON_SITEPACKAGES_DIR}/*"
> +FILES_${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/.debug/"
> diff --git a/meta/recipes-extended/newt/libnewt_0.52.14.bb b/meta/recipes-extended/newt/libnewt_0.52.14.bb
> index 54da15d..ee8206e 100644
> --- a/meta/recipes-extended/newt/libnewt_0.52.14.bb
> +++ b/meta/recipes-extended/newt/libnewt_0.52.14.bb
> @@ -15,7 +15,7 @@ LICENSE = "LGPLv2"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
>
>   # slang needs to be >= 2.2
> -DEPENDS = "slang popt python"
> +DEPENDS = "slang popt"
>
>   PR = "r2"
>
> @@ -30,11 +30,9 @@ SRC_URI[sha256sum] = "f70f4f58baa60388ddf2e39249ffb00898fb40f2b2767e42e2ab51fe4b
>
>   S = "${WORKDIR}/newt-${PV}"
>
> -EXTRA_OECONF = "--without-tcl"
> +EXTRA_OECONF = "--without-tcl --without-python"
>
> -inherit autotools pythonnative python-dir
> -
> -EXTRA_OEMAKE = "PYTHONVERS=${PYTHON_DIR}"
> +inherit autotools
>
>   export STAGING_INCDIR
>   export STAGING_LIBDIR
> @@ -42,13 +40,10 @@ export STAGING_LIBDIR
>   export BUILD_SYS
>   export HOST_SYS
>
> -PACKAGES_prepend = "whiptail ${PN}-python "
> +PACKAGES_prepend = "whiptail "
>
>   do_configure_prepend() {
> -    ( cd ${S}; sh autogen.sh )
> +    sh autogen.sh
>   }
>
>   FILES_whiptail = "${bindir}/whiptail"
> -FILES_${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/.debug/"
> -FILES_${PN}-python = "${PYTHON_SITEPACKAGES_DIR}/*"
> -FILES_${PN}-staticdev = "${libdir}/*.a"
>

