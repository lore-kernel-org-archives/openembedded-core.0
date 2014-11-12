Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5F9A665DA3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Nov 2014 19:16:38 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 12 Nov 2014 11:16:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,370,1413270000"; d="scan'208";a="621387821"
Received: from smoffitt-mobl.ger.corp.intel.com (HELO [10.255.13.72])
	([10.255.13.72])
	by fmsmga001.fm.intel.com with ESMTP; 12 Nov 2014 11:16:38 -0800
Message-ID: <5463B216.6090401@linux.intel.com>
Date: Wed, 12 Nov 2014 11:16:38 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.7.0
MIME-Version: 1.0
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>, 
	openembedded-core@lists.openembedded.org
References: <1415818205-9349-1-git-send-email-alejandro.hernandez@linux.intel.com>
In-Reply-To: <1415818205-9349-1-git-send-email-alejandro.hernandez@linux.intel.com>
Subject: Re: [PATCH] nfs-utils: Upgrade to 1.3.1
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
X-List-Received-Date: Wed, 12 Nov 2014 19:16:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/12/2014 10:50 AM, Alejandro Hernandez wrote:
> Removed: fix-a-Gcc-undefined-behavior.patch - Upstream
>
> Removed: 0001-statd-fixed-the-with-statdpath-flag.patch - Upstream
>
> Removed: fix-the-start-statd.patch - Different solution on upstream
>
> Removed: nfs-utils-1.0.6-uclibc.patch - Different solution on upstream
>
> Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
> ---
>   .../files/fix-a-Gcc-undefined-behavior.patch       |  38 -------
>   .../0001-statd-fixed-the-with-statdpath-flag.patch |  41 --------
>   .../nfs-utils/nfs-utils/fix-the-start-statd.patch  |  30 ------
>   .../nfs-utils/nfs-utils-1.0.6-uclibc.patch         |  27 -----
>   .../nfs-utils/nfs-utils_1.3.0.bb                   | 115 ---------------------
>   .../nfs-utils/nfs-utils_1.3.1.bb                   | 111 ++++++++++++++++++++

Did you use git mv?  or pass the -M to send-email since that correctly 
do renames.

>   6 files changed, 111 insertions(+), 251 deletions(-)
>   delete mode 100644 meta/recipes-connectivity/nfs-utils/files/fix-a-Gcc-undefined-behavior.patch
>   delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-statd-fixed-the-with-statdpath-flag.patch
>   delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/fix-the-start-statd.patch
>   delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.0.6-uclibc.patch
>   delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.0.bb
>   create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.1.bb
>
> diff --git a/meta/recipes-connectivity/nfs-utils/files/fix-a-Gcc-undefined-behavior.patch b/meta/recipes-connectivity/nfs-utils/files/fix-a-Gcc-undefined-behavior.patch
> deleted file mode 100644
> index 5843ba0..0000000
> --- a/meta/recipes-connectivity/nfs-utils/files/fix-a-Gcc-undefined-behavior.patch
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -[PATCH] fix a Gcc undefined behavior
> -
> -Upstream-Status: Pending
> -
> -Calling strncpy with NULL second argument, even when the size is 0,
> -is undefined behavior, which leads to GCC to drop the check old
> -variable with NULL in following code.
> -
> -https://bugzilla.yoctoproject.org/show_bug.cgi?id=6743
> -
> -Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ----
> - support/export/client.c |    9 +++++++--
> - 1 file changed, 7 insertions(+), 2 deletions(-)
> -
> -diff --git a/support/export/client.c b/support/export/client.c
> -index dbf47b9..a37ef69 100644
> ---- a/support/export/client.c
> -+++ b/support/export/client.c
> -@@ -482,8 +482,13 @@ add_name(char *old, const char *add)
> - 		else
> - 			cp = cp + strlen(cp);
> - 	}
> --	strncpy(new, old, cp-old);
> --	new[cp-old] = 0;
> -+
> -+	if (old) {
> -+		strncpy(new, old, cp-old);
> -+		new[cp-old] = 0;
> -+	} else
> -+		new[0] = 0;
> -+	
> - 	if (cp != old && !*cp)
> - 		strcat(new, ",");
> - 	strcat(new, add);
> ---
> -1.7.10.4
> -
> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-statd-fixed-the-with-statdpath-flag.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-statd-fixed-the-with-statdpath-flag.patch
> deleted file mode 100644
> index 2ce824c..0000000
> --- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-statd-fixed-the-with-statdpath-flag.patch
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -From 3b1457d219ceb1058d44bacc657581f13437ae40 Mon Sep 17 00:00:00 2001
> -From: Steve Dickson <steved@redhat.com>
> -Date: Tue, 17 Jun 2014 13:28:53 -0400
> -Subject: [PATCH] statd: fixed the --with-statdpath= flag
> -
> -Create the given path set with --with-statdpath
> -
> -Signed-off-by: chendt.fnst@cn.fujitsu.com
> -Reported-by: yaoxp@cn.fujitsu.com
> -Signed-off-by: Steve Dickson <steved@redhat.com>
> -Upstream-Status: Backport
> ----
> - Makefile.am | 10 +++++-----
> - 1 file changed, 5 insertions(+), 5 deletions(-)
> -
> -diff --git a/Makefile.am b/Makefile.am
> -index ae7cd16..5824adc 100644
> ---- a/Makefile.am
> -+++ b/Makefile.am
> -@@ -54,13 +54,13 @@ install-data-hook:
> - 	touch $(DESTDIR)$(statedir)/xtab; chmod 644 $(DESTDIR)$(statedir)/xtab
> - 	touch $(DESTDIR)$(statedir)/etab; chmod 644 $(DESTDIR)$(statedir)/etab
> - 	touch $(DESTDIR)$(statedir)/rmtab; chmod 644 $(DESTDIR)$(statedir)/rmtab
> --	mkdir -p $(DESTDIR)$(statedir)/sm $(DESTDIR)$(statedir)/sm.bak
> --	touch $(DESTDIR)$(statedir)/state
> --	chmod go-rwx $(DESTDIR)$(statedir)/sm $(DESTDIR)$(statedir)/sm.bak $(DESTDIR)$(statedir)/state
> --	-chown $(statduser) $(DESTDIR)$(statedir)/sm $(DESTDIR)$(statedir)/sm.bak $(DESTDIR)$(statedir)/state
> -+	mkdir -p $(DESTDIR)$(statdpath)/sm $(DESTDIR)$(statdpath)/sm.bak
> -+	touch $(DESTDIR)$(statdpath)/state
> -+	chmod go-rwx $(DESTDIR)$(statdpath)/sm $(DESTDIR)$(statdpath)/sm.bak $(DESTDIR)$(statdpath)/state
> -+	-chown $(statduser) $(DESTDIR)$(statdpath)/sm $(DESTDIR)$(statdpath)/sm.bak $(DESTDIR)$(statdpath)/state
> -
> - uninstall-hook:
> - 	rm $(DESTDIR)$(statedir)/xtab
> - 	rm $(DESTDIR)$(statedir)/etab
> - 	rm $(DESTDIR)$(statedir)/rmtab
> --	rm $(DESTDIR)$(statedir)/state
> -+	rm $(DESTDIR)$(statdpath)/state
> ---
> -1.8.4.2
> -
> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/fix-the-start-statd.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/fix-the-start-statd.patch
> deleted file mode 100644
> index b7e835e..0000000
> --- a/meta/recipes-connectivity/nfs-utils/nfs-utils/fix-the-start-statd.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -[PATCH] fix the start-statd
> -
> -Upstream-Status: Pending
> -
> -1. add /bin/ to PATH, since systemctl is installed under /bin/
> -2. redirect error to /dev/null
> -
> -Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ----
> - utils/statd/start-statd |    4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/utils/statd/start-statd b/utils/statd/start-statd
> -index cde3583..098ce70 100644
> ---- a/utils/statd/start-statd
> -+++ b/utils/statd/start-statd
> -@@ -4,8 +4,8 @@
> - # /var/run/rpc.statd.pid).
> - # It should run statd with whatever flags are apropriate for this
> - # site.
> --PATH=/sbin:/usr/sbin
> --if systemctl start statd.service
> -+PATH=/sbin:/usr/sbin:/bin
> -+if systemctl start statd.service 2>/dev/null
> - then :
> - else
> -     exec rpc.statd --no-notify
> ---
> -1.7.10.4
> -
> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.0.6-uclibc.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.0.6-uclibc.patch
> deleted file mode 100644
> index c344238..0000000
> --- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.0.6-uclibc.patch
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Upstream-Status: Inappropriate [embedded specific]
> -
> -Index: nfs-utils-1.2.6/support/nfs/svc_socket.c
> -===================================================================
> ---- nfs-utils-1.2.6.orig/support/nfs/svc_socket.c	2012-05-14 07:40:52.000000000 -0700
> -+++ nfs-utils-1.2.6/support/nfs/svc_socket.c	2012-10-28 02:42:50.179222457 -0700
> -@@ -40,8 +40,9 @@
> - 	char rpcdata[1024], servdata[1024];
> - 	struct rpcent rpcbuf, *rpcp;
> - 	struct servent servbuf, *servp = NULL;
> --	int ret;
> -+	int ret = 0;
> -
> -+#ifndef __UCLIBC__     /* neither getrpcbynumber() nor getrpcbynumber_r() is SuSv3 */
> - 	ret = getrpcbynumber_r(number, &rpcbuf, rpcdata, sizeof rpcdata,
> - 				&rpcp);
> - 	if (ret == 0 && rpcp != NULL) {
> -@@ -60,6 +61,7 @@
> - 			}
> - 		}
> - 	}
> -+#endif /* __UCLIBC__ */
> -
> - 	if (ret == 0 && servp != NULL)
> - 		return ntohs(servp->s_port);
> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.0.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.0.bb
> deleted file mode 100644
> index 4933e10..0000000
> --- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.0.bb
> +++ /dev/null
> @@ -1,115 +0,0 @@
> -SUMMARY = "userspace utilities for kernel nfs"
> -DESCRIPTION = "The nfs-utils package provides a daemon for the kernel \
> -NFS server and related tools."
> -HOMEPAGE = "http://nfs.sourceforge.net/"
> -SECTION = "console/network"
> -
> -LICENSE = "MIT & GPLv2+ & BSD"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=95f3a93a5c3c7888de623b46ea085a84"
> -
> -# util-linux for libblkid
> -DEPENDS = "libcap libnfsidmap libevent util-linux sqlite3"
> -RDEPENDS_${PN}-client = "rpcbind bash"
> -RDEPENDS_${PN} = "${PN}-client bash"
> -RRECOMMENDS_${PN} = "kernel-module-nfsd"
> -
> -inherit useradd
> -
> -USERADD_PACKAGES = "${PN}-client"
> -USERADD_PARAM_${PN}-client = "--system  --home-dir /var/lib/nfs \
> -			      --shell /bin/false --user-group rpcuser"
> -
> -SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.xz \
> -           file://0001-configure-Allow-to-explicitly-disable-nfsidmap.patch \
> -           file://nfs-utils-1.0.6-uclibc.patch \
> -           file://nfs-utils-1.2.3-sm-notify-res_init.patch \
> -           file://nfsserver \
> -           file://nfscommon \
> -           file://nfs-utils.conf \
> -           file://nfs-server.service \
> -           file://nfs-mountd.service \
> -           file://nfs-statd.service \
> -           file://nfs-utils-Do-not-pass-CFLAGS-to-gcc-while-building.patch \
> -           file://0001-statd-fixed-the-with-statdpath-flag.patch \
> -           file://fix-a-Gcc-undefined-behavior.patch \
> -           file://fix-the-start-statd.patch \
> -"
> -
> -SRC_URI[md5sum] = "6e93a7997ca3a1eac56bf219adab72a8"
> -SRC_URI[sha256sum] = "ab8384d0e487ed6a18c5380d5df28015f7dd98680bf08f3247c97d9f7d99e56f"
> -
> -PARALLEL_MAKE = ""
> -
> -# Only kernel-module-nfsd is required here (but can be built-in)  - the nfsd module will
> -# pull in the remainder of the dependencies.
> -
> -INITSCRIPT_PACKAGES = "${PN} ${PN}-client"
> -INITSCRIPT_NAME = "nfsserver"
> -INITSCRIPT_PARAMS = "defaults"
> -INITSCRIPT_NAME_${PN}-client = "nfscommon"
> -INITSCRIPT_PARAMS_${PN}-client = "defaults 19 21"
> -
> -inherit autotools-brokensep update-rc.d systemd pkgconfig
> -
> -SYSTEMD_SERVICE_${PN} = "nfs-server.service nfs-mountd.service"
> -SYSTEMD_SERVICE_${PN}-client = "nfs-statd.service"
> -SYSTEMD_AUTO_ENABLE = "disable"
> -
> -# --enable-uuid is need for cross-compiling
> -EXTRA_OECONF = "--with-statduser=nobody \
> -                --enable-mountconfig \
> -                --enable-libmount-mount \
> -                --disable-nfsv41 \
> -                --enable-uuid \
> -                --disable-gss \
> -                --disable-tirpc \
> -                --disable-nfsdcltrack \
> -                --with-statdpath=/var/lib/nfs/statd \
> -               "
> -
> -PACKAGECONFIG ??= "tcp-wrappers"
> -PACKAGECONFIG[tcp-wrappers] = "--with-tcp-wrappers,--without-tcp-wrappers,tcp-wrappers"
> -PACKAGECONFIG[nfsidmap] = "--enable-nfsidmap,--disable-nfsidmap,keyutils"
> -
> -INHIBIT_AUTO_STAGE = "1"
> -
> -PACKAGES =+ "${PN}-client ${PN}-stats"
> -FILES_${PN}-client = "${base_sbindir}/*mount.nfs* ${sbindir}/*statd \
> -		      ${sbindir}/rpc.idmapd ${sbindir}/sm-notify \
> -		      ${sbindir}/showmount ${sbindir}/nfsstat \
> -		      ${localstatedir}/lib/nfs \
> -		      ${sysconfdir}/nfs-utils.conf \
> -		      ${sysconfdir}/init.d/nfscommon \
> -		      ${systemd_unitdir}/system/nfs-statd.service"
> -FILES_${PN}-stats = "${sbindir}/mountstats ${sbindir}/nfsiostat"
> -RDEPENDS_${PN}-stats = "python"
> -
> -# Make clean needed because the package comes with
> -# precompiled 64-bit objects that break the build
> -do_compile_prepend() {
> -	make clean
> -}
> -
> -do_install_append () {
> -	install -d ${D}${sysconfdir}/init.d
> -	install -d ${D}${localstatedir}/lib/nfs/statd
> -	install -m 0755 ${WORKDIR}/nfsserver ${D}${sysconfdir}/init.d/nfsserver
> -	install -m 0755 ${WORKDIR}/nfscommon ${D}${sysconfdir}/init.d/nfscommon
> -
> -	install -m 0755 ${WORKDIR}/nfs-utils.conf ${D}${sysconfdir}
> -	install -d ${D}${systemd_unitdir}/system
> -	install -m 0644 ${WORKDIR}/nfs-server.service ${D}${systemd_unitdir}/system/
> -	install -m 0644 ${WORKDIR}/nfs-mountd.service ${D}${systemd_unitdir}/system/
> -	install -m 0644 ${WORKDIR}/nfs-statd.service ${D}${systemd_unitdir}/system/
> -	sed -i -e 's,@SBINDIR@,${sbindir},g' \
> -		-e 's,@SYSCONFDIR@,${sysconfdir},g' \
> -		${D}${systemd_unitdir}/system/*.service
> -
> -	# kernel code as of 3.8 hard-codes this path as a default
> -	install -d ${D}/var/lib/nfs/v4recovery
> -
> -	# the following are built by CC_FOR_BUILD
> -	rm -f ${D}${sbindir}/rpcdebug
> -	rm -f ${D}${sbindir}/rpcgen
> -	rm -f ${D}${sbindir}/locktest
> -}
> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.1.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.1.bb
> new file mode 100644
> index 0000000..5383c91
> --- /dev/null
> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.1.bb
> @@ -0,0 +1,111 @@
> +SUMMARY = "userspace utilities for kernel nfs"
> +DESCRIPTION = "The nfs-utils package provides a daemon for the kernel \
> +NFS server and related tools."
> +HOMEPAGE = "http://nfs.sourceforge.net/"
> +SECTION = "console/network"
> +
> +LICENSE = "MIT & GPLv2+ & BSD"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=95f3a93a5c3c7888de623b46ea085a84"
> +
> +# util-linux for libblkid
> +DEPENDS = "libcap libnfsidmap libevent util-linux sqlite3"
> +RDEPENDS_${PN}-client = "rpcbind bash"
> +RDEPENDS_${PN} = "${PN}-client bash"
> +RRECOMMENDS_${PN} = "kernel-module-nfsd"
> +
> +inherit useradd
> +
> +USERADD_PACKAGES = "${PN}-client"
> +USERADD_PARAM_${PN}-client = "--system  --home-dir /var/lib/nfs \
> +			      --shell /bin/false --user-group rpcuser"
> +
> +SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.xz \
> +           file://0001-configure-Allow-to-explicitly-disable-nfsidmap.patch \
> +           file://nfs-utils-1.2.3-sm-notify-res_init.patch \
> +           file://nfsserver \
> +           file://nfscommon \
> +           file://nfs-utils.conf \
> +           file://nfs-server.service \
> +           file://nfs-mountd.service \
> +           file://nfs-statd.service \
> +           file://nfs-utils-Do-not-pass-CFLAGS-to-gcc-while-building.patch \
> +"
> +
> +SRC_URI[md5sum] = "8de676b9ff34b8f9addc1d0800fabdf8"
> +SRC_URI[sha256sum] = "ff79d70b7b58b2c8f9b798c58721127e82bb96022adc04a5c4cb251630e696b8"
> +
> +PARALLEL_MAKE = ""
> +
> +# Only kernel-module-nfsd is required here (but can be built-in)  - the nfsd module will
> +# pull in the remainder of the dependencies.
> +
> +INITSCRIPT_PACKAGES = "${PN} ${PN}-client"
> +INITSCRIPT_NAME = "nfsserver"
> +INITSCRIPT_PARAMS = "defaults"
> +INITSCRIPT_NAME_${PN}-client = "nfscommon"
> +INITSCRIPT_PARAMS_${PN}-client = "defaults 19 21"
> +
> +inherit autotools-brokensep update-rc.d systemd pkgconfig
> +
> +SYSTEMD_SERVICE_${PN} = "nfs-server.service nfs-mountd.service"
> +SYSTEMD_SERVICE_${PN}-client = "nfs-statd.service"
> +SYSTEMD_AUTO_ENABLE = "disable"
> +
> +# --enable-uuid is need for cross-compiling
> +EXTRA_OECONF = "--with-statduser=nobody \
> +                --enable-mountconfig \
> +                --enable-libmount-mount \
> +                --disable-nfsv41 \
> +                --enable-uuid \
> +                --disable-gss \
> +                --disable-tirpc \
> +                --disable-nfsdcltrack \
> +                --with-statdpath=/var/lib/nfs/statd \
> +               "
> +
> +PACKAGECONFIG ??= "tcp-wrappers"
> +PACKAGECONFIG[tcp-wrappers] = "--with-tcp-wrappers,--without-tcp-wrappers,tcp-wrappers"
> +PACKAGECONFIG[nfsidmap] = "--enable-nfsidmap,--disable-nfsidmap,keyutils"
> +
> +INHIBIT_AUTO_STAGE = "1"
> +
> +PACKAGES =+ "${PN}-client ${PN}-stats"
> +FILES_${PN}-client = "${base_sbindir}/*mount.nfs* ${sbindir}/*statd \
> +		      ${sbindir}/rpc.idmapd ${sbindir}/sm-notify \
> +		      ${sbindir}/showmount ${sbindir}/nfsstat \
> +		      ${localstatedir}/lib/nfs \
> +		      ${sysconfdir}/nfs-utils.conf \
> +		      ${sysconfdir}/init.d/nfscommon \
> +		      ${systemd_unitdir}/system/nfs-statd.service"
> +FILES_${PN}-stats = "${sbindir}/mountstats ${sbindir}/nfsiostat"
> +RDEPENDS_${PN}-stats = "python"
> +
> +# Make clean needed because the package comes with
> +# precompiled 64-bit objects that break the build
> +do_compile_prepend() {
> +	make clean
> +}
> +
> +do_install_append () {
> +	install -d ${D}${sysconfdir}/init.d
> +	install -d ${D}${localstatedir}/lib/nfs/statd
> +	install -m 0755 ${WORKDIR}/nfsserver ${D}${sysconfdir}/init.d/nfsserver
> +	install -m 0755 ${WORKDIR}/nfscommon ${D}${sysconfdir}/init.d/nfscommon
> +
> +	install -m 0755 ${WORKDIR}/nfs-utils.conf ${D}${sysconfdir}
> +	install -d ${D}${systemd_unitdir}/system
> +	install -m 0644 ${WORKDIR}/nfs-server.service ${D}${systemd_unitdir}/system/
> +	install -m 0644 ${WORKDIR}/nfs-mountd.service ${D}${systemd_unitdir}/system/
> +	install -m 0644 ${WORKDIR}/nfs-statd.service ${D}${systemd_unitdir}/system/
> +	sed -i -e 's,@SBINDIR@,${sbindir},g' \
> +		-e 's,@SYSCONFDIR@,${sysconfdir},g' \
> +		${D}${systemd_unitdir}/system/*.service
> +
> +	# kernel code as of 3.8 hard-codes this path as a default
> +	install -d ${D}/var/lib/nfs/v4recovery
> +
> +	# the following are built by CC_FOR_BUILD
> +	rm -f ${D}${sbindir}/rpcdebug
> +	rm -f ${D}${sbindir}/rpcgen
> +	rm -f ${D}${sbindir}/locktest
> +}
>

