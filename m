Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SuTYe-0007xg-FV
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 21:17:12 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 26 Jul 2012 12:05:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="171874928"
Received: from unknown (HELO [10.255.12.157]) ([10.255.12.157])
	by orsmga001.jf.intel.com with ESMTP; 26 Jul 2012 12:05:27 -0700
Message-ID: <501194F7.7070003@linux.intel.com>
Date: Thu, 26 Jul 2012 12:05:27 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1342804329-5791-1-git-send-email-otavio@ossystems.com.br>
	<1342804329-5791-2-git-send-email-otavio@ossystems.com.br>
In-Reply-To: <1342804329-5791-2-git-send-email-otavio@ossystems.com.br>
Subject: Re: [PATCH 2/2] bash: fix warning about bashbug reference /usr/bin when installed in /bin
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
X-List-Received-Date: Thu, 26 Jul 2012 19:17:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/20/2012 10:12 AM, Otavio Salvador wrote:
> Change the installation process so we have bashbug in ${bindir} and
> bash at ${base_bindir}.
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>   meta/recipes-extended/bash/bash.inc    |   11 ++++++++---
>   meta/recipes-extended/bash/bash_4.2.bb |    2 +-
>   2 files changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/bash/bash.inc
> index 6d7e930..a7f5f8f 100644
> --- a/meta/recipes-extended/bash/bash.inc
> +++ b/meta/recipes-extended/bash/bash.inc
> @@ -9,9 +9,6 @@ DEPENDS = "ncurses bison-native"
>
>   inherit autotools gettext update-alternatives
>
> -bindir = "/bin"
> -sbindir = "/sbin"
> -
>   EXTRA_OECONF = "--enable-job-control"
>   export CC_FOR_BUILD = "${BUILD_CC}"
>
> @@ -28,6 +25,14 @@ do_configure_prepend () {
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
> diff --git a/meta/recipes-extended/bash/bash_4.2.bb b/meta/recipes-extended/bash/bash_4.2.bb
> index a28279e..50f2ff6 100644
> --- a/meta/recipes-extended/bash/bash_4.2.bb
> +++ b/meta/recipes-extended/bash/bash_4.2.bb
> @@ -1,6 +1,6 @@
>   require bash.inc
>
> -PR = "r3"
> +PR = "r4"
>
>   SRC_URI = "${GNU_MIRROR}/bash/${BPN}-${PV}.tar.gz;name=tarball \
>              ${GNU_MIRROR}/bash/bash-4.2-patches/bash42-001;apply=yes;striplevel=0;name=patch001 \
>

Took this patch into OE-Core, the parallel build is still failing.

Thanks
	Sau!


