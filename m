Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 51A6060809
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jun 2014 22:19:03 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 25 Jun 2014 15:13:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,548,1400050800"; d="scan'208";a="553333801"
Received: from unknown (HELO [10.255.12.166]) ([10.255.12.166])
	by fmsmga001.fm.intel.com with ESMTP; 25 Jun 2014 15:18:58 -0700
Message-ID: <53AB4ACF.40009@linux.intel.com>
Date: Wed, 25 Jun 2014 15:18:55 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Jate Sujjavanich <jatedev@gmail.com>, 
	openembedded-core@lists.openembedded.org
References: <1403732804-32097-1-git-send-email-jatedev@gmail.com>
In-Reply-To: <1403732804-32097-1-git-send-email-jatedev@gmail.com>
Subject: Re: [PATCH] Change resolv.conf generation for sysvinit
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
X-List-Received-Date: Wed, 25 Jun 2014 22:19:05 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/25/2014 02:46 PM, Jate Sujjavanich wrote:
> Move /etc/resolv.conf link generation a volatiles file. Then use
> update-alternatives to choose the correct one. This is for sysvinit
> and resolvconf.

Please review the commit guide lines on the Openembedded wiki

http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

Since this touches 2 recipes you can just say

resolvconf/initscripts: Change resolv.conf generation for sysvinit

as the summary

> ---
>   .../resolvconf/files/volatiles_resolv-conf         |    1 +
>   .../resolvconf/resolvconf_1.75.bb                  |   15 ++++++++++++++-
>   .../initscripts/initscripts-1.0/volatiles          |    1 -
>   .../initscripts-1.0/volatiles_resolv-conf          |    1 +
>   meta/recipes-core/initscripts/initscripts_1.0.bb   |    9 ++++++++-
>   5 files changed, 24 insertions(+), 3 deletions(-)
>   create mode 100644 meta/recipes-connectivity/resolvconf/files/volatiles_resolv-conf
>   create mode 100644 meta/recipes-core/initscripts/initscripts-1.0/volatiles_resolv-conf
>
> diff --git a/meta/recipes-connectivity/resolvconf/files/volatiles_resolv-conf b/meta/recipes-connectivity/resolvconf/files/volatiles_resolv-conf
> new file mode 100644
> index 0000000..e58993d
> --- /dev/null
> +++ b/meta/recipes-connectivity/resolvconf/files/volatiles_resolv-conf
> @@ -0,0 +1 @@
> +l root root 0644 /etc/resolv.conf /etc/resolvconf/run/resolv.conf
> diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.75.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.75.bb
> index 7310c83..e108516 100644
> --- a/meta/recipes-connectivity/resolvconf/resolvconf_1.75.bb
> +++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.75.bb
> @@ -11,12 +11,16 @@ AUTHOR = "Thomas Hood"
>   HOMEPAGE = "http://packages.debian.org/resolvconf"
>   RDEPENDS_${PN} = "bash"
>
> -SRC_URI = "${DEBIAN_MIRROR}/main/r/resolvconf/resolvconf_${PV}.tar.xz"
> +SRC_URI = "\
> +	${DEBIAN_MIRROR}/main/r/resolvconf/resolvconf_${PV}.tar.xz \
> +	file://volatiles_resolv-conf \
> +"
>
>   SRC_URI[md5sum] = "4b8bc86a3cf070e3fd0e9aff7eaaba56"
>   SRC_URI[sha256sum] = "16167f37a77ef4bc4596dcbefece269b6a10d10fa448594ec55ed3303193086e"
>
>   inherit allarch
> +inherit update-alternatives
>
>   do_compile () {
>   	:
> @@ -30,6 +34,10 @@ do_install () {
>   		install -d ${D}${sysconfdir}/tmpfiles.d
>   		echo "d /run/${BPN}/interface - - - -" \
>   		     > ${D}${sysconfdir}/tmpfiles.d/resolvconf.conf
> +	else
> +		# Use a volatiles script to install resolv.conf symlink
> +		install -d install -d ${D}${libdir}/${BPN}
> +		install -m 0755 ${WORKDIR}/volatiles_resolv-conf ${D}${libdir}/${BPN}/resolv-conf
>   	fi
>   	install -d ${D}${sysconfdir}/${BPN}
>   	ln -snf ${localstatedir}/run/${BPN} ${D}${sysconfdir}/${BPN}/run
> @@ -42,6 +50,11 @@ do_install () {
>   	install -m 0644 man/resolvconf.8 ${D}${mandir}/man8/
>   }
>
> +ALTERNATIVE_PRIORITY = "100"
> +ALTERNATIVE_${PN}_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', 'resolvconf', d)}"
> +ALTERNATIVE_LINK_NAME[resolv-conf] = "${sysconfdir}/default/volatiles/00_resolv-conf"
> +ALTERNATIVE_TARGET[resolv-conf] = "${libdir}/${BPN}/resolv-conf"
> +
>   pkg_postinst_${PN} () {
>   	if [ -z "$D" ]; then
>   		if command -v systemd-tmpfiles >/dev/null; then
> diff --git a/meta/recipes-core/initscripts/initscripts-1.0/volatiles b/meta/recipes-core/initscripts/initscripts-1.0/volatiles
> index 297245d..cd5f1f1 100644
> --- a/meta/recipes-core/initscripts/initscripts-1.0/volatiles
> +++ b/meta/recipes-core/initscripts/initscripts-1.0/volatiles
> @@ -32,5 +32,4 @@ l root root 1777 /tmp /var/tmp
>   d root root 0755 /var/lock/subsys none
>   f root root 0664 /var/log/wtmp none
>   f root root 0664 /var/run/utmp none
> -l root root 0644 /etc/resolv.conf /var/run/resolv.conf
>   f root root 0644 /var/run/resolv.conf none
> diff --git a/meta/recipes-core/initscripts/initscripts-1.0/volatiles_resolv-conf b/meta/recipes-core/initscripts/initscripts-1.0/volatiles_resolv-conf
> new file mode 100644
> index 0000000..ce7122d
> --- /dev/null
> +++ b/meta/recipes-core/initscripts/initscripts-1.0/volatiles_resolv-conf
> @@ -0,0 +1 @@
> +l root root 0644 /etc/resolv.conf /var/run/resolv.conf
> diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
> index 7273a82..721e258 100644
> --- a/meta/recipes-core/initscripts/initscripts_1.0.bb
> +++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
> @@ -3,7 +3,7 @@ DESCRIPTION = "Initscripts provide the basic system startup initialization scrip
>   SECTION = "base"
>   LICENSE = "GPLv2"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
> -PR = "r155"
> +PR = "r156"
>
Don't need to bump PR anymore

>   INHIBIT_DEFAULT_DEPS = "1"
>
> @@ -29,6 +29,7 @@ SRC_URI = "file://functions \
>              file://populate-volatile.sh \
>              file://read-only-rootfs-hook.sh \
>              file://volatiles \
> +           file://volatiles_resolv-conf \
>              file://save-rtc.sh \
>              file://GPLv2.patch \
>              file://dmesg.sh \
> @@ -45,8 +46,14 @@ DEPENDS_append = " ${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd-sys
>
>   PACKAGES =+ "${PN}-functions"
>   RDEPENDS_${PN} = "${PN}-functions"
> +FILES_${PN} += "${libdir}/${BPN}/"
>   FILES_${PN}-functions = "${sysconfdir}/init.d/functions*"
>
> +ALTERNATIVE_PRIORITY_${PN} = "90"
> +ALTERNATIVE_${PN} = "resolv-conf"
> +ALTERNATIVE_LINK_NAME[resolv-conf] = "${sysconfdir}/default/volatiles/00_resolv-conf"
> +ALTERNATIVE_TARGET[resolv-conf] = "${libdir}/${BPN}/resolv-conf"
> +
>   ALTERNATIVE_PRIORITY_${PN}-functions = "90"
>   ALTERNATIVE_${PN}-functions = "functions"
>   ALTERNATIVE_LINK_NAME[functions] = "${sysconfdir}/init.d/functions"
>

