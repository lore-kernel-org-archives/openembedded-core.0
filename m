Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TBqG6-0001qz-Ar
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Sep 2012 18:57:50 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 12 Sep 2012 09:45:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,410,1344236400"; d="scan'208";a="221129018"
Received: from unknown (HELO [10.255.13.93]) ([10.255.13.93])
	by fmsmga002.fm.intel.com with ESMTP; 12 Sep 2012 09:45:16 -0700
Message-ID: <5050BC1C.8050204@linux.intel.com>
Date: Wed, 12 Sep 2012 09:45:16 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: "mark asselstine"@windriver.com
References: <1347111741-24828-1-git-send-email-mark.hatle@windriver.com>
In-Reply-To: <1347111741-24828-1-git-send-email-mark.hatle@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V4] base-files: provide a mechanism to skip creation of the hostname file
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
X-List-Received-Date: Wed, 12 Sep 2012 16:57:50 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/08/2012 06:42 AM, Mark Hatle wrote:
> From: Mark Asselstine <mark.asselstine@windriver.com>
>
> The existence of a /etc/hostname file causes any hostname provided on
> the kernel command line or via dhcp to be overwritten by the
> initscripts 'init.d/hostname.sh'. This change allows you to set a
> value of "" for 'hostname' which will skip the creation of the
> /etc/hostname file by the base-files package.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>   meta/recipes-core/base-files/base-files_3.0.14.bb |   14 ++++++++------
>   1 files changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
> index 6bab040..e80cff1 100644
> --- a/meta/recipes-core/base-files/base-files_3.0.14.bb
> +++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
> @@ -1,7 +1,7 @@
>   SUMMARY = "Miscellaneous files for the base system."
>   DESCRIPTION = "The base-files package creates the basic system directory structure and provides a small set of key configuration files for the system."
>   SECTION = "base"
> -PR = "r71"
> +PR = "r72"
>   LICENSE = "GPLv2"
>   LIC_FILES_CHKSUM = "file://licenses/GPL-2;md5=94d55d512a9ba36caa9b7df079bae19f"
>   # Removed all license related tasks in this recipe as license.bbclass
> @@ -107,10 +107,12 @@ do_install () {
>   }
>
>   do_install_basefilesissue () {
> -	if [ -n "${MACHINE}" -a "${hostname}" = "openembedded" ]; then
> -		echo ${MACHINE} > ${D}${sysconfdir}/hostname
> -	else
> -		echo ${hostname} > ${D}${sysconfdir}/hostname
> +	if [ "${hostname}" != "" ]; then
> +		if [ -n "${MACHINE}" -a "${hostname}" = "openembedded" ]; then
> +			echo ${MACHINE} > ${D}${sysconfdir}/hostname
> +		else
> +			echo ${hostname} > ${D}${sysconfdir}/hostname
> +		fi
>   	fi
>
>   	install -m 644 ${WORKDIR}/issue*  ${D}${sysconfdir}
> @@ -144,5 +146,5 @@ FILES_${PN}-doc = "${docdir} ${datadir}/common-licenses"
>
>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>
> -CONFFILES_${PN} = "${sysconfdir}/fstab ${sysconfdir}/hostname"
> +CONFFILES_${PN} = "${sysconfdir}/fstab ${@['', '${sysconfdir}/hostname'][(d.getVar('hostname', True) != '')]}"
>
>


