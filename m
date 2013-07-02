Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A67816AEC3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2013 23:36:19 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 02 Jul 2013 16:36:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,983,1363158000"; d="scan'208";a="363843256"
Received: from unknown (HELO [10.255.13.91]) ([10.255.13.91])
	by orsmga002.jf.intel.com with ESMTP; 02 Jul 2013 16:36:20 -0700
Message-ID: <51D363F4.3020103@linux.intel.com>
Date: Tue, 02 Jul 2013 16:36:20 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Yevhen Kyriukha <kirgene@gmail.com>
References: <1372248906-2554-1-git-send-email-kirgene@gmail.com>
In-Reply-To: <1372248906-2554-1-git-send-email-kirgene@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v7] systemd: added python-systemd package generation.
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
X-List-Received-Date: Tue, 02 Jul 2013 23:36:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/26/2013 05:15 AM, Yevhen Kyriukha wrote:
> ---
>   meta/recipes-core/systemd/systemd_204.bb |   20 ++++++++++++++++----
>   1 file changed, 16 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-core/systemd/systemd_204.bb b/meta/recipes-core/systemd/systemd_204.bb
> index b8b1290..a12c6c9 100644
> --- a/meta/recipes-core/systemd/systemd_204.bb
> +++ b/meta/recipes-core/systemd/systemd_204.bb
> @@ -13,9 +13,15 @@ PE = "1"
>   DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup glib-2.0 qemu-native util-linux"
>   DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
>
> +# need to export these variables for python-config to work
> +export BUILD_SYS
> +export HOST_SYS
> +export STAGING_INCDIR
> +export STAGING_LIBDIR
> +
>   SECTION = "base/shell"
>
> -inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d update-alternatives qemu
> +inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d update-alternatives qemu pythonnative python-dir
>

There is still a problem with that, that systemd will no bring in python 
native unconditionally even if the PACKAGECONFIG is disabled, we will 
need a way to wrap the inherit some how using variables.

See image.bbclass usage of it around line 100.

Thanks
	Sau!

>   SRC_URI = "http://www.freedesktop.org/software/systemd/systemd-${PV}.tar.xz \
>              file://touchscreen.rules \
> @@ -51,6 +57,8 @@ DEPENDS += "libgcrypt"
>   # Compress the journal
>   PACKAGECONFIG[xz] = "--enable-xz,--disable-xz,xz"
>   PACKAGECONFIG[tcp-wrappers] = "--enable-tcpwrap,--disable-tcpwrap,tcp-wrappers"
> +# Use python-systemd
> +PACKAGECONFIG[python] = "--with-python,--without-python,python"
>
>   CACHED_CONFIGUREVARS = "ac_cv_path_KILL=${base_bindir}/kill"
>
> @@ -71,7 +79,6 @@ EXTRA_OECONF = " --with-rootprefix=${rootprefix} \
>                    --disable-tcpwrap \
>                    --enable-split-usr \
>                    --disable-microhttpd \
> -                 --without-python \
>                    --with-sysvrcnd-path=${sysconfdir} \
>                    --with-firmware-path=/lib/firmware \
>                    ac_cv_path_KILL=${base_bindir}/kill \
> @@ -93,6 +100,8 @@ do_install() {
>   	# Provided by a separate recipe
>   	rm ${D}${systemd_unitdir}/system/serial-getty* -f
>
> +	rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/systemd/*.la
> +
>   	# Provide support for initramfs
>   	ln -s ${rootlibexecdir}/systemd/systemd ${D}/init
>   	ln -s ${rootlibexecdir}/systemd/systemd-udevd ${D}/${base_sbindir}/udevd
> @@ -121,7 +130,7 @@ python populate_packages_prepend (){
>   }
>   PACKAGES_DYNAMIC += "^lib(udev|gudev|systemd).*"
>
> -PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-analyze ${PN}-kernel-install"
> +PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-analyze ${PN}-kernel-install python-${PN}"
>
>   USERADD_PACKAGES = "${PN}"
>   GROUPADD_PARAM_${PN} = "-r lock; -r systemd-journal"
> @@ -131,6 +140,9 @@ FILES_${PN}-analyze = "${bindir}/systemd-analyze"
>   FILES_${PN}-initramfs = "/init"
>   RDEPENDS_${PN}-initramfs = "${PN}"
>
> +FILES_python-${PN} = "${PYTHON_SITEPACKAGES_DIR}/systemd/*.py* ${PYTHON_SITEPACKAGES_DIR}/systemd/*.so"
> +RDEPENDS_python-${PN} = "python-core python-datetime python-logging python-syslog"
> +
>   FILES_${PN}-gui = "${bindir}/systemadm"
>
>   FILES_${PN}-vconsole-setup = "${rootlibexecdir}/systemd/systemd-vconsole-setup \
> @@ -187,7 +199,7 @@ FILES_${PN} = " ${base_bindir}/* \
>                   /lib/udev/rules.d/99-systemd.rules \
>                  "
>
> -FILES_${PN}-dbg += "${rootlibdir}/.debug ${systemd_unitdir}/.debug ${systemd_unitdir}/*/.debug ${base_libdir}/security/.debug/"
> +FILES_${PN}-dbg += "${rootlibdir}/.debug ${systemd_unitdir}/.debug ${systemd_unitdir}/*/.debug ${base_libdir}/security/.debug/ ${PYTHON_SITEPACKAGES_DIR}/systemd/.debug"
>   FILES_${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ ${sysconfdir}/rpm/macros.systemd"
>
>   RDEPENDS_${PN} += "dbus util-linux-mount"
>

