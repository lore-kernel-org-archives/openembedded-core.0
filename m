Return-Path: <mike.looijmans@topic.nl>
X-Greylist: delayed 337 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 08 Jul 2015 08:18:19 UTC
Received: from atl4mhfb02.myregisteredsite.com
	(atl4mhfb02.myregisteredsite.com [209.17.115.56])
	by mail.openembedded.org (Postfix) with ESMTP id A998074248
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jul 2015 08:18:19 +0000 (UTC)
Received: from atl4mhob15.myregisteredsite.com
	(atl4mhob15.myregisteredsite.com [209.17.115.53])
	by atl4mhfb02.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	t688ChCC021441 for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Jul 2015 04:12:44 -0400
Received: from mailpod.hostingplatform.com ([10.30.71.204])
	by atl4mhob15.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	t688CewT019885 for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Jul 2015 04:12:40 -0400
Received: (qmail 5735 invoked by uid 0); 8 Jul 2015 08:12:40 -0000
X-TCPREMOTEIP: 88.159.208.100
X-Authenticated-UID: mike@milosoftware.com
Received: from unknown (HELO ?192.168.80.121?)
	(mike@milosoftware.com@88.159.208.100)
	by 0 with ESMTPA; 8 Jul 2015 08:12:40 -0000
Message-ID: <559CDB4A.4030805@topic.nl>
Date: Wed, 08 Jul 2015 10:11:54 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
References: <cover.1436342667.git.Qi.Chen@windriver.com>
	<d22002f92ef1c2c4031e92378de8434f0b3d2f5c.1436342667.git.Qi.Chen@windriver.com>
In-Reply-To: <d22002f92ef1c2c4031e92378de8434f0b3d2f5c.1436342667.git.Qi.Chen@windriver.com>
Subject: Re: [PATCH 1/1] nfs-utils: fix to start nfs-server correctly in systemd
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
X-List-Received-Date: Wed, 08 Jul 2015 08:18:20 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 08-07-15 10:07, Chen Qi wrote:
> 1. Change RRECOMMENDS to RDEPENDS for kernel-module-nfsd because this kernel
>     module is a necessity for nfs server.

No it is not! Like any kernel module, it can be built in, and then there will 
be no such package, and the package becomes uninstallable.

That is the reason that kernel-module-* dependencies are (almost) always 
RRECOMMENDS.

Moving this to RDEPENDS will break things on configurations where the module 
is built in.

(Maybe some day the kernel will RPROVIDE such packages, that would solve it)


> 2. Add proc-fs-nfsd.mount systemd unit file because it's needed for nfs server
>     to start correctly.
>
> After this change, in a systemd based image, we can use `systemctl start
> nfs-server' to start the nfs server and things would work correctly.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   .../nfs-utils/nfs-utils/proc-fs-nfsd.mount                   |  8 ++++++++
>   meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.1.bb       | 12 +++++++++++-
>   2 files changed, 19 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/proc-fs-nfsd.mount
>
> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/proc-fs-nfsd.mount b/meta/recipes-connectivity/nfs-utils/nfs-utils/proc-fs-nfsd.mount
> new file mode 100644
> index 0000000..630801b
> --- /dev/null
> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/proc-fs-nfsd.mount
> @@ -0,0 +1,8 @@
> +[Unit]
> +Description=NFSD configuration filesystem
> +After=systemd-modules-load.service
> +
> +[Mount]
> +What=nfsd
> +Where=/proc/fs/nfsd
> +Type=nfsd
> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.1.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.1.bb
> index 0bcd65e..fa56c1f 100644
> --- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.1.bb
> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.1.bb
> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=95f3a93a5c3c7888de623b46ea085a84"
>   DEPENDS = "libcap libnfsidmap libevent util-linux sqlite3"
>   RDEPENDS_${PN}-client = "rpcbind bash"
>   RDEPENDS_${PN} = "${PN}-client bash"
> -RRECOMMENDS_${PN} = "kernel-module-nfsd"
> +RDEPENDS_${PN} = "kernel-module-nfsd"
>
>   inherit useradd
>
> @@ -28,6 +28,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
>              file://nfs-server.service \
>              file://nfs-mountd.service \
>              file://nfs-statd.service \
> +           file://proc-fs-nfsd.mount \
>              file://nfs-utils-Do-not-pass-CFLAGS-to-gcc-while-building.patch \
>              file://nfs-utils-debianize-start-statd.patch \
>   "
> @@ -87,6 +88,8 @@ FILES_${PN}-client = "${base_sbindir}/*mount.nfs* ${sbindir}/*statd \
>   FILES_${PN}-stats = "${sbindir}/mountstats ${sbindir}/nfsiostat"
>   RDEPENDS_${PN}-stats = "python"
>
> +FILES_${PN} += "${systemd_unitdir}"
> +
>   # Make clean needed because the package comes with
>   # precompiled 64-bit objects that break the build
>   do_compile_prepend() {
> @@ -108,6 +111,13 @@ do_install_append () {
>   	sed -i -e 's,@SBINDIR@,${sbindir},g' \
>   		-e 's,@SYSCONFDIR@,${sysconfdir},g' \
>   		${D}${systemd_unitdir}/system/*.service
> +	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
> +	    install -d ${D}${sysconfdir}/modules-load.d
> +	    echo "nfsd" > ${D}${sysconfdir}/modules-load.d/nfsd.conf
> +	    install -m 0644 ${WORKDIR}/proc-fs-nfsd.mount ${D}${systemd_unitdir}/system/
> +	    install -d ${D}${systemd_unitdir}/system/sysinit.target.wants/
> +	    ln -sf ../proc-fs-nfsd.mount ${D}${systemd_unitdir}/system/sysinit.target.wants/proc-fs-nfsd.mount
> +	fi
>
>   	# kernel code as of 3.8 hard-codes this path as a default
>   	install -d ${D}/var/lib/nfs/v4recovery
>


