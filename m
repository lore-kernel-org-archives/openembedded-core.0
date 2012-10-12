Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TMjUu-0000Sh-EO
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Oct 2012 19:58:09 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 12 Oct 2012 10:44:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,577,1344236400"; d="scan'208";a="234183325"
Received: from unknown (HELO [10.255.14.5]) ([10.255.14.5])
	by fmsmga002.fm.intel.com with ESMTP; 12 Oct 2012 10:44:55 -0700
Message-ID: <50785717.8000606@linux.intel.com>
Date: Fri, 12 Oct 2012 10:44:55 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Phil Blundell <philb@gnu.org>
References: <1348577801.31293.71.camel@phil-desktop>
In-Reply-To: <1348577801.31293.71.camel@phil-desktop>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] eglibc: Move perl- and bash-using scripts to separate recipes
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
X-List-Received-Date: Fri, 12 Oct 2012 17:58:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/25/2012 05:56 AM, Phil Blundell wrote:
> This removes the dependency of eglibc.bb itself on perl and bash
> which, in turn, eliminates the need to build those two recipes if the
> scripts which need them are not going to be installed.
>

I think you missed dealing with an RPOVIDES someplace as I am getting 
the following error during build:

> ERROR: Nothing RPROVIDES 'libc-mtrace' (but /intel/poky/distro/meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb RDEPENDS on or otherwise requires it)
> NOTE: Runtime target 'libc-mtrace' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['libc-mtrace']
> ERROR: Required build target 'packagegroup-core-tools-debug' has no buildable providers.
> Missing or unbuildable dependency chain was: ['packagegroup-core-tools-debug', 'libc-mtrace']


Thanks
	Sau!


> Signed-off-by: Phil Blundell <pb@pbcl.net>
> ---
> v3: rebased on top of localedir changes
>
>   meta/recipes-core/eglibc/eglibc-collateral.inc  |   11 +++++++++
>   meta/recipes-core/eglibc/eglibc-locale.inc      |   11 +--------
>   meta/recipes-core/eglibc/eglibc-mtrace.inc      |   12 ++++++++++
>   meta/recipes-core/eglibc/eglibc-mtrace_2.16.bb  |    1 +
>   meta/recipes-core/eglibc/eglibc-package.inc     |   28 ++++++++++++++++++-----
>   meta/recipes-core/eglibc/eglibc-scripts.inc     |   17 ++++++++++++++
>   meta/recipes-core/eglibc/eglibc-scripts_2.16.bb |    1 +
>   meta/recipes-core/eglibc/eglibc_2.16.bb         |    2 +-
>   8 files changed, 66 insertions(+), 17 deletions(-)
>   create mode 100644 meta/recipes-core/eglibc/eglibc-collateral.inc
>   create mode 100644 meta/recipes-core/eglibc/eglibc-mtrace.inc
>   create mode 100644 meta/recipes-core/eglibc/eglibc-mtrace_2.16.bb
>   create mode 100644 meta/recipes-core/eglibc/eglibc-scripts.inc
>   create mode 100644 meta/recipes-core/eglibc/eglibc-scripts_2.16.bb
>
> diff --git a/meta/recipes-core/eglibc/eglibc-collateral.inc b/meta/recipes-core/eglibc/eglibc-collateral.inc
> new file mode 100644
> index 0000000..b770bb0
> --- /dev/null
> +++ b/meta/recipes-core/eglibc/eglibc-collateral.inc
> @@ -0,0 +1,11 @@
> +INHIBIT_DEFAULT_DEPS = "1"
> +LICENSE = "GPLv2 & LGPLv2.1"
> +
> +do_fetch[noexec] = "1"
> +do_unpack[noexec] = "1"
> +do_patch[noexec] = "1"
> +do_configure[noexec] = "1"
> +do_compile[noexec] = "1"
> +
> +do_install[depends] += "virtual/${MLPREFIX}libc:do_populate_sysroot"
> +
> diff --git a/meta/recipes-core/eglibc/eglibc-locale.inc b/meta/recipes-core/eglibc/eglibc-locale.inc
> index 105cf2e..16a357a 100644
> --- a/meta/recipes-core/eglibc/eglibc-locale.inc
> +++ b/meta/recipes-core/eglibc/eglibc-locale.inc
> @@ -1,15 +1,8 @@
> -INHIBIT_DEFAULT_DEPS = "1"
> -LICENSE = "GPLv2 & LGPLv2.1"
> +include eglibc-collateral.inc
>
>   BPN = "eglibc"
>   LOCALEBASEPN = "eglibc"
>
> -do_fetch[noexec] = "1"
> -do_unpack[noexec] = "1"
> -do_patch[noexec] = "1"
> -do_configure[noexec] = "1"
> -do_compile[noexec] = "1"
> -
>   # Binary locales are generated at build time if ENABLE_BINARY_LOCALE_GENERATION
>   # is set. The idea is to avoid running localedef on the target (at first boot)
>   # to decrease initial boot time and avoid localedef being killed by the OOM
> @@ -90,6 +83,4 @@ do_install () {
>
>   inherit libc-package
>
> -do_install[depends] += "virtual/${MLPREFIX}libc:do_populate_sysroot"
> -
>   BBCLASSEXTEND = "nativesdk"
> diff --git a/meta/recipes-core/eglibc/eglibc-mtrace.inc b/meta/recipes-core/eglibc/eglibc-mtrace.inc
> new file mode 100644
> index 0000000..321de7b
> --- /dev/null
> +++ b/meta/recipes-core/eglibc/eglibc-mtrace.inc
> @@ -0,0 +1,12 @@
> +include eglibc-collateral.inc
> +
> +SUMMARY = "mtrace utility provided by eglibc"
> +DESCRIPTION = "mtrace utility provided by eglibc"
> +RDEPENDS_${PN} = "perl"
> +
> +SRC = "${STAGING_INCDIR}/eglibc-scripts-internal-${MULTIMACH_TARGET_SYS}"
> +
> +do_install() {
> +	install -d -m 0755 ${D}${bindir}
> +	install -m 0755 ${SRC}/mtrace ${D}${bindir}/
> +}
> diff --git a/meta/recipes-core/eglibc/eglibc-mtrace_2.16.bb b/meta/recipes-core/eglibc/eglibc-mtrace_2.16.bb
> new file mode 100644
> index 0000000..6fa2be9
> --- /dev/null
> +++ b/meta/recipes-core/eglibc/eglibc-mtrace_2.16.bb
> @@ -0,0 +1 @@
> +require eglibc-mtrace.inc
> diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes-core/eglibc/eglibc-package.inc
> index 0059bcf..6da9615 100644
> --- a/meta/recipes-core/eglibc/eglibc-package.inc
> +++ b/meta/recipes-core/eglibc/eglibc-package.inc
> @@ -17,7 +17,7 @@ python __anonymous () {
>   # Set this to zero if you don't want ldconfig in the output package
>   USE_LDCONFIG ?= "1"
>
> -PACKAGES = "${PN}-dbg catchsegv sln nscd ldd ${PN}-mtrace ${PN}-utils eglibc-thread-db ${PN}-pic libcidn libmemusage libsegfault ${PN}-pcprofile libsotruss ${PN} eglibc-extra-nss ${PN}-dev ${PN}-staticdev ${PN}-doc"
> +PACKAGES = "${PN}-dbg catchsegv sln nscd ldd ${PN}-utils eglibc-thread-db ${PN}-pic libcidn libmemusage libsegfault ${PN}-pcprofile libsotruss ${PN} eglibc-extra-nss ${PN}-dev ${PN}-staticdev ${PN}-doc"
>
>   # The ld.so in this eglibc supports the GNU_HASH
>   RPROVIDES_${PN} = "glibc rtld(GNU_HASH)"
> @@ -51,8 +51,6 @@ FILES_${PN}-utils = "${bindir}/* ${sbindir}/*"
>   FILES_${PN}-dbg += "${libexecdir}/*/.debug ${libdir}/audit/.debug"
>   FILES_catchsegv = "${bindir}/catchsegv"
>   RDEPENDS_catchsegv = "libsegfault"
> -RDEPENDS_${PN}-utils += "bash"
> -RDEPENDS_${PN}-mtrace += "perl"
>   FILES_${PN}-pcprofile = "${base_libdir}/libpcprofile.so"
>   FILES_eglibc-thread-db = "${base_libdir}/libthread_db.so.* ${base_libdir}/libthread_db-*.so"
>   RPROVIDES_${PN}-dev += "libc-dev"
> @@ -65,11 +63,9 @@ DESCRIPTION_nscd = "nscd, name service cache daemon, caches name service lookups
>   SUMMARY_eglibc-extra-nss = "hesiod, NIS and NIS+ nss libraries"
>   DESCRIPTION_eglibc-extra-nss = "eglibc: nis, nisplus and hesiod search services."
>   SUMMARY_ldd = "print shared library dependencies"
> -DESCRIPTION_ldd = "/usr/bin/ldd prints shared library dependencies for each program or shared library specified on the command line."
> +DESCRIPTION_ldd = "${bindir}/ldd prints shared library dependencies for each program or shared library specified on the command line."
>   SUMMARY_${PN}-utils = "Miscellaneous utilities provided by eglibc"
>   DESCRIPTION_${PN}-utils = "Miscellaneous utilities including getconf, iconf, locale, gencat, tzselect, zic, rpcinfo, ..."
> -SUMMARY_${PN}-mtrace = "mtrace utility provided by eglibc"
> -DESCRIPTION_${PN}-mtrace = "mtrace utility provided by eglibc"
>   DESCRIPTION_libsotruss = "Library to support sotruss which traces calls through PLTs"
>
>   inherit libc-common multilib_header
> @@ -111,10 +107,30 @@ do_install_locale () {
>
>   addtask do_install_locale after do_install before do_populate_sysroot do_package
>
> +bashscripts = "mtrace sotruss xtrace"
> +
> +do_evacuate_scripts () {
> +	target=${D}${includedir}/eglibc-scripts-internal-${MULTIMACH_TARGET_SYS}
> +	mkdir -p $target
> +	for i in ${bashscripts}; do
> +		cp ${D}${bindir}/$i $target/
> +	done
> +}
> +
> +do_evacuate_scripts_pn-eglibc-initial () {
> +	:
> +}
> +
> +addtask evacuate_scripts after do_install before do_populate_sysroot do_package
> +
>   PACKAGE_PREPROCESS_FUNCS += "eglibc_package_preprocess"
>
>   eglibc_package_preprocess () {
>   	rm -rf ${PKGD}/${includedir}/eglibc-locale-internal-${MULTIMACH_TARGET_SYS}
> +	rm -rf ${PKGD}/${includedir}/eglibc-scripts-internal-${MULTIMACH_TARGET_SYS}
> +	for i in ${bashscripts}; do
> +	    rm -f ${PKGD}${bindir}/$i
> +	done
>   	rm -rf ${PKGD}/${localedir}
>   	if [ "${libdir}" != "${exec_prefix}/lib" ]; then
>   		# This dir only exists to hold locales
> diff --git a/meta/recipes-core/eglibc/eglibc-scripts.inc b/meta/recipes-core/eglibc/eglibc-scripts.inc
> new file mode 100644
> index 0000000..a020961
> --- /dev/null
> +++ b/meta/recipes-core/eglibc/eglibc-scripts.inc
> @@ -0,0 +1,17 @@
> +include eglibc-collateral.inc
> +
> +SUMMARY = "utility scripts provided by eglibc"
> +DESCRIPTION = "utility scripts provided by eglibc"
> +RDEPENDS_${PN} = "bash"
> +RDEPENDS_ldd = "bash"
> +
> +SRC = "${STAGING_INCDIR}/eglibc-scripts-internal-${MULTIMACH_TARGET_SYS}"
> +
> +bashscripts = "mtrace sotruss xtrace"
> +
> +do_install() {
> +	install -d -m 0755 ${D}${bindir}
> +	for i in ${bashscripts}; do
> +		install -m 0755 ${SRC}/$i ${D}${bindir}/
> +	done
> +}
> diff --git a/meta/recipes-core/eglibc/eglibc-scripts_2.16.bb b/meta/recipes-core/eglibc/eglibc-scripts_2.16.bb
> new file mode 100644
> index 0000000..3113362
> --- /dev/null
> +++ b/meta/recipes-core/eglibc/eglibc-scripts_2.16.bb
> @@ -0,0 +1 @@
> +require eglibc-scripts.inc
> diff --git a/meta/recipes-core/eglibc/eglibc_2.16.bb b/meta/recipes-core/eglibc/eglibc_2.16.bb
> index 72d134a..3a7ae50 100644
> --- a/meta/recipes-core/eglibc/eglibc_2.16.bb
> +++ b/meta/recipes-core/eglibc/eglibc_2.16.bb
> @@ -3,7 +3,7 @@ require eglibc.inc
>   SRCREV = "20393"
>
>   DEPENDS += "gperf-native kconfig-frontends-native"
> -PR = "r10"
> +PR = "r11"
>   PR_append = "+svnr${SRCPV}"
>
>   EGLIBC_BRANCH="eglibc-2_16"
>


