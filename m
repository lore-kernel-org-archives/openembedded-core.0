Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UIMi0-0000I4-2q
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Mar 2013 18:21:53 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 20 Mar 2013 10:03:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,880,1355126400"; d="scan'208";a="305196057"
Received: from unknown (HELO [10.255.13.175]) ([10.255.13.175])
	by orsmga002.jf.intel.com with ESMTP; 20 Mar 2013 10:04:49 -0700
Message-ID: <5149EC31.3080209@linux.intel.com>
Date: Wed, 20 Mar 2013 10:04:49 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: b28495@freescale.com
References: <1363085567-5474-1-git-send-email-b28495@freescale.com>
In-Reply-To: <1363085567-5474-1-git-send-email-b28495@freescale.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] busybox: detects customized configs when do_install
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
X-List-Received-Date: Wed, 20 Mar 2013 17:21:53 -0000
X-List-Received-Date: Wed, 20 Mar 2013 17:21:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/12/2013 03:52 AM, b28495@freescale.com wrote:
> From: Ting Liu <b28495@freescale.com>
>
> After using 'bitbake -c menuconfig busybox' to customize defconfig,
> do_install fail to detect the changes. Grep configs in ${S}/.config
> instead of defconfig.
>
With the recent changes from Richard to move towards using a separate 
${B} directory for build vs ${S} directory for source (marked read-only 
in the future), this change should be updated to use ${B} instead of 
${S} for checking the .config file.

The overall change is good, we just need to use the right directory for 
checking the build related changes to the .config file.


Thanks
     Sau!

> Change-Id: I958c232eb9f8096e4113a1c3a2748f5f2eccdeb5
> Signed-off-by: Ting Liu <b28495@freescale.com>
> ---
>   meta/recipes-core/busybox/busybox.inc       |   22 +++++++++++-----------
>   meta/recipes-core/busybox/busybox_1.20.2.bb |    3 ++-
>   2 files changed, 13 insertions(+), 12 deletions(-)
>
> diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
> index fc6ca91..093bf2e 100644
> --- a/meta/recipes-core/busybox/busybox.inc
> +++ b/meta/recipes-core/busybox/busybox.inc
> @@ -149,11 +149,11 @@ do_install () {
>
>   	install -d ${D}${sysconfdir}/init.d
>
> -	if ! grep -q "CONFIG_FEATURE_INDIVIDUAL=y" ${WORKDIR}/defconfig; then
> +	if ! grep -q "CONFIG_FEATURE_INDIVIDUAL=y" ${S}/.config; then
>   		# Install /bin/busybox, and the /bin/sh link so the postinst script
>   		# can run. Let update-alternatives handle the rest.
>   		install -d ${D}${base_bindir}
> -		if grep -q "CONFIG_FEATURE_SUID=y" ${WORKDIR}/defconfig; then
> +		if grep -q "CONFIG_FEATURE_SUID=y" ${S}/.config; then
>   			install -m 4755 ${S}/busybox ${D}${base_bindir}
>   		else
>   			install -m 0755 ${S}/busybox ${D}${base_bindir}
> @@ -179,36 +179,36 @@ do_install () {
>   		fi
>   	fi
>
> -	if grep -q "CONFIG_SYSLOGD=y" ${WORKDIR}/defconfig; then
> +	if grep -q "CONFIG_SYSLOGD=y" ${S}/.config; then
>   		install -m 0755 ${WORKDIR}/syslog ${D}${sysconfdir}/init.d/syslog.${BPN}
>   		install -m 644 ${WORKDIR}/syslog-startup.conf ${D}${sysconfdir}/syslog-startup.conf.${BPN}
>   	fi
> -	if grep "CONFIG_CROND=y" ${WORKDIR}/defconfig; then
> +	if grep "CONFIG_CROND=y" ${S}/.config; then
>   		install -m 0755 ${WORKDIR}/busybox-cron ${D}${sysconfdir}/init.d/
>   	fi
> -	if grep "CONFIG_HTTPD=y" ${WORKDIR}/defconfig; then
> +	if grep "CONFIG_HTTPD=y" ${S}/.config; then
>   		install -m 0755 ${WORKDIR}/busybox-httpd ${D}${sysconfdir}/init.d/
>   		install -d ${D}/srv/www
>   	fi
> -	if grep "CONFIG_UDHCPD=y" ${WORKDIR}/defconfig; then
> +	if grep "CONFIG_UDHCPD=y" ${S}/.config; then
>   		install -m 0755 ${WORKDIR}/busybox-udhcpd ${D}${sysconfdir}/init.d/
>   	fi
> -	if grep "CONFIG_HWCLOCK=y" ${WORKDIR}/defconfig; then
> +	if grep "CONFIG_HWCLOCK=y" ${S}/.config; then
>   		install -m 0755 ${WORKDIR}/hwclock.sh ${D}${sysconfdir}/init.d/
>   	fi
> -	if grep "CONFIG_UDHCPC=y" ${WORKDIR}/defconfig; then
> +	if grep "CONFIG_UDHCPC=y" ${S}/.config; then
>   		install -d ${D}${sysconfdir}/udhcpc.d
>   		install -d ${D}${datadir}/udhcpc
>                   install -m 0755 ${WORKDIR}/simple.script ${D}${sysconfdir}/udhcpc.d/50default
>   		install -m 0755 ${WORKDIR}/default.script ${D}${datadir}/udhcpc/default.script
>   	fi
> -	if grep "CONFIG_INETD=y" ${WORKDIR}/defconfig; then
> +	if grep "CONFIG_INETD=y" ${S}/.config; then
>   		install -m 0755 ${WORKDIR}/inetd ${D}${sysconfdir}/init.d/inetd.${BPN}
>   		install -m 0644 ${WORKDIR}/inetd.conf ${D}${sysconfdir}/
>   	fi
> -        if grep "CONFIG_MDEV=y" ${WORKDIR}/defconfig; then
> +        if grep "CONFIG_MDEV=y" ${S}/.config; then
>                  install -m 0755 ${WORKDIR}/mdev ${D}${sysconfdir}/init.d/mdev
> -               if grep "CONFIG_FEATURE_MDEV_CONF=y" ${WORKDIR}/defconfig; then
> +               if grep "CONFIG_FEATURE_MDEV_CONF=y" ${S}/.config; then
>                          install -m 644 ${WORKDIR}/mdev.conf ${D}${sysconfdir}/mdev.conf
>                  fi
>   	fi
> diff --git a/meta/recipes-core/busybox/busybox_1.20.2.bb b/meta/recipes-core/busybox/busybox_1.20.2.bb
> index 783261e..255d56c 100644
> --- a/meta/recipes-core/busybox/busybox_1.20.2.bb
> +++ b/meta/recipes-core/busybox/busybox_1.20.2.bb
> @@ -1,5 +1,5 @@
>   require busybox.inc
> -PR = "r5"
> +PR = "r6"
>
>   SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
>              file://B921600.patch \
> @@ -30,6 +30,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
>              file://stat-usr-bin.patch \
>              file://testsuite-du-du-k-works-fix-false-positive.patch"
>
> +
>   SRC_URI[tarball.md5sum] = "e025414bc6cd79579cc7a32a45d3ae1c"
>   SRC_URI[tarball.sha256sum] = "eb13ff01dae5618ead2ef6f92ba879e9e0390f9583bd545d8789d27cf39b6882"
>
>


