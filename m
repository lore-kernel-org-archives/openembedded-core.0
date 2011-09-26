Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R8J8V-0007ou-KS
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Sep 2011 23:54:51 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 26 Sep 2011 14:49:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,446,1312182000"; d="scan'208";a="67676410"
Received: from unknown (HELO [10.255.14.215]) ([10.255.14.215])
	by fmsmga001.fm.intel.com with ESMTP; 26 Sep 2011 14:49:24 -0700
Message-ID: <4E80F364.8020004@linux.intel.com>
Date: Mon, 26 Sep 2011 14:49:24 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); en-US;
	rv:1.9.2.22) Gecko/20110902 Thunderbird/3.1.14
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1316593182-3009-1-git-send-email-koen@dominion.thruhere.net>
In-Reply-To: <1316593182-3009-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] procps 3.2.8: remove initscript
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
X-List-Received-Date: Mon, 26 Sep 2011 21:54:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/21/2011 01:19 AM, Koen Kooi wrote:
> Sysctl is managed by other initscripts in the sysV world and by systemd itself in the systemd world, so drop it from the procps recipe.
>
> This also fixes some style issues and a global FILES assignenment.
>
> Signed-off-by: Koen Kooi<koen@dominion.thruhere.net>
> ---
>   .../procps/procps-3.2.8/procps.init                |    6 ----
>   meta/recipes-extended/procps/procps_3.2.8.bb       |   27 ++++++--------------
>   2 files changed, 8 insertions(+), 25 deletions(-)
>   delete mode 100644 meta/recipes-extended/procps/procps-3.2.8/procps.init
>
> diff --git a/meta/recipes-extended/procps/procps-3.2.8/procps.init b/meta/recipes-extended/procps/procps-3.2.8/procps.init
> deleted file mode 100644
> index 739dcf4..0000000
> --- a/meta/recipes-extended/procps/procps-3.2.8/procps.init
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -#!/bin/sh
> -
> -SYSCTL_CONF="/etc/sysctl.conf"
> -if [ -f "${SYSCTL_CONF}" ]; then
> -	/sbin/sysctl -q -p "${SYSCTL_CONF}"
> -fi
> diff --git a/meta/recipes-extended/procps/procps_3.2.8.bb b/meta/recipes-extended/procps/procps_3.2.8.bb
> index a38077e..d989955 100644
> --- a/meta/recipes-extended/procps/procps_3.2.8.bb
> +++ b/meta/recipes-extended/procps/procps_3.2.8.bb
> @@ -1,11 +1,8 @@
>   require procps.inc
>
> -PR = "r2"
> +PR = "r3"
>
> -inherit update-rc.d update-alternatives
> -
> -INITSCRIPT_NAME = "procps.sh"
> -INITSCRIPT_PARAMS = "start 30 S ."
> +inherit update-alternatives
>
>   ALTERNATIVE_LINKS = "${bindir}/top ${bindir}/uptime ${bindir}/free ${bindir}/pkill ${bindir}/pmap \
>                        ${base_bindir}/kill ${base_sbindir}/sysctl ${base_bindir}/ps"
> @@ -13,22 +10,14 @@ ALTERNATIVE_PRIORITY = "90"
>
>   SRC_URI += "file://procmodule.patch \
>               file://psmodule.patch \
> -	    file://linux-limits.patch \
> -	    file://sysctl.conf \
> -	    file://procps.init \
> -	    file://procps-3.2.8+gmake-3.82.patch \
> -	    "
> +            file://linux-limits.patch \
> +            file://sysctl.conf \
> +            file://procps-3.2.8+gmake-3.82.patch \
> +           "
>
>   SRC_URI[md5sum] = "9532714b6846013ca9898984ba4cd7e0"
>   SRC_URI[sha256sum] = "11ed68d8a4433b91cd833deb714a3aa849c02aea738c42e6b4557982419c1535"
>
> -FILES = "${bindir}/top.${BPN} ${base_bindir}/ps.${BPN} ${bindir}/uptime.${BPN} ${base_bindir}/kill.${BPN} \
> -	 ${bindir}/free.${BPN} ${bindir}/w ${bindir}/watch ${bindir}/pgrep ${bindir}/pmap ${bindir}/pwdx \
> -	 ${bindir}/snice ${bindir}/vmstat ${bindir}/slabtop ${bindir}/pkill ${bindir}/skill ${bindir}/tload \
> -	 ${base_sbindir}/sysctl.${BPN}"
> -
> -CONFFILES_${PN} = "${sysconfdir}/sysctl.conf"
> -
>   EXTRA_OEMAKE = "CFLAGS=-I${STAGING_INCDIR} \
>                   CPPFLAGS=-I${STAGING_INCDIR} \
>                   LDFLAGS="${LDFLAGS}" \
> @@ -39,6 +28,6 @@ EXTRA_OEMAKE = "CFLAGS=-I${STAGING_INCDIR} \
>   do_install_append () {
>   	install -d ${D}${sysconfdir}
>   	install -m 0644 ${WORKDIR}/sysctl.conf ${D}${sysconfdir}/sysctl.conf
> -	install -d ${D}${sysconfdir}/init.d
> -	install -m 0755 ${WORKDIR}/procps.init ${D}${sysconfdir}/init.d/procps.sh
>   }
> +
> +CONFFILES_${PN} = "${sysconfdir}/sysctl.conf"

Merged into OE-Core

Thank	
	Sau!


