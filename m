Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TDzPq-0006Uv-3r
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Sep 2012 17:08:46 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 18 Sep 2012 07:56:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,442,1344236400"; d="scan'208";a="207036347"
Received: from unknown (HELO [10.255.13.193]) ([10.255.13.193])
	by orsmga002.jf.intel.com with ESMTP; 18 Sep 2012 07:55:38 -0700
Message-ID: <50588B69.90209@linux.intel.com>
Date: Tue, 18 Sep 2012 07:55:37 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Martin Ertsaas <mertsas@cisco.com>
References: <1347972747-7040-1-git-send-email-mertsas@cisco.com>
In-Reply-To: <1347972747-7040-1-git-send-email-mertsas@cisco.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bash: Make it possible to run bash 3.2.48 instead of 4.2.
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
X-List-Received-Date: Tue, 18 Sep 2012 15:08:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/18/2012 05:52 AM, Martin Ertsaas wrote:
> bash-3.2.48 did not provide the linking from sh to bash, making it unusable.
> This patch fixes this. The reason for using 3.2.48 is that it is GPLv2 licensed,
> which 4.2 is not.
> ---
>   meta/recipes-extended/bash/bash_3.2.48.bb |   20 +++++++++++++++-----
>   1 files changed, 15 insertions(+), 5 deletions(-)
>

Why can't this recipe use the base.inc file also?  This seems to be 
duplicating the code in the .inc file.

Sau!

> diff --git a/meta/recipes-extended/bash/bash_3.2.48.bb b/meta/recipes-extended/bash/bash_3.2.48.bb
> index 509d7a0..bab38a1 100644
> --- a/meta/recipes-extended/bash/bash_3.2.48.bb
> +++ b/meta/recipes-extended/bash/bash_3.2.48.bb
> @@ -6,7 +6,7 @@ LICENSE = "GPLv2+"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=fd5d9bcabd8ed5a54a01ce8d183d592a"
>   DEPENDS = "ncurses"
>
> -PR = "r10"
> +PR = "r11"
>
>   SRC_URI = "${GNU_MIRROR}/bash/bash-${PV}.tar.gz;name=tarball \
>              ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-049;apply=yes;striplevel=0;name=patch001 \
> @@ -25,16 +25,18 @@ SRC_URI[patch003.sha256sum] = "354886097cd95b4def77028f32ee01e2e088d58a98184fede
>   SRC_URI[md5sum] = "338dcf975a93640bb3eaa843ca42e3f8"
>   SRC_URI[sha256sum] = "128d281bd5682ba5f6953122915da71976357d7a76490d266c9173b1d0426348"
>
> -inherit autotools gettext
> +inherit autotools gettext update-alternatives
>
>   PARALLEL_MAKE = ""
>
> -bindir = "/bin"
> -sbindir = "/sbin"
> -
>   EXTRA_OECONF = "--with-ncurses"
>   export CC_FOR_BUILD = "${BUILD_CC}"
>
> +ALTERNATIVE_${PN} = "sh"
> +ALTERNATIVE_LINK_NAME[sh] = "${base_bindir}/sh"
> +ALTERNATIVE_TARGET[sh] = "${base_bindir}/bash"
> +ALTERNATIVE_PRIORITY = "100"
> +
>   export AUTOHEADER = "true"
>
>   do_configure_prepend () {
> @@ -43,6 +45,14 @@ do_configure_prepend () {
>   	fi
>   }
>
> +do_install_append () {
> +	# Move /usr/bin/bash to /bin/bash, if need
> +	if [ "${base_bindir}" != "${bindir}" ]; then
> +		mkdir -p ${D}${base_bindir}
> +		mv ${D}${bindir}/bash ${D}${base_bindir}
> +	fi
> +}
> +
>   pkg_postinst_${PN} () {
>   	touch $D${sysconfdir}/shells
>   	grep -q "bin/bash" $D${sysconfdir}/shells || echo /bin/bash >> $D${sysconfdir}/shells
>


