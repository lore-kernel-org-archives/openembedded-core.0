Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QF90d-0003iM-Ig
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Apr 2011 19:58:43 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 27 Apr 2011 10:56:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,275,1301900400"; d="scan'208";a="684851162"
Received: from unknown (HELO [10.255.13.11]) ([10.255.13.11])
	by fmsmga002.fm.intel.com with ESMTP; 27 Apr 2011 10:56:10 -0700
Message-ID: <4DB858B9.3030901@linux.intel.com>
Date: Wed, 27 Apr 2011 10:56:09 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1303922644.git.paul.eggleton@linux.intel.com>
	<318c3139745e74177a23f323881dbd76ddc42006.1303922644.git.paul.eggleton@linux.intel.com>
In-Reply-To: <318c3139745e74177a23f323881dbd76ddc42006.1303922644.git.paul.eggleton@linux.intel.com>
Cc: poky@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: Re: [poky] [PATCH 1/1] initscripts: remove -i from halt/reboot	arguments and allow override
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
X-List-Received-Date: Wed, 27 Apr 2011 17:58:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 04/27/2011 09:49 AM, Paul Eggleton wrote:
> From: Paul Eggleton <paul.eggleton@linux.intel.com>
> 
> Introduces a variable HALTARGS which specifies the arguments sent to
> halt and reboot, and sets the default value to "-d -f", dropping the
> previous -i (shut down all network interfaces before halt/reboot, which
> causes a freeze with NFS root.)
> 
> Fixes [YOCTO #997].

Is the SED_* tag a common search/replace mechanism in OE recipes? It's
fine, I'm just wondering if there is an accepted best practice for this
sort of thing. I know we do some sed replacements of /usr/bin and /etc.

> 
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Acked-by: Darren Hart <dvhart@linux.intel.com>

> ---
>  meta/recipes-core/initscripts/initscripts-1.0/halt |    2 +-
>  .../initscripts/initscripts-1.0/reboot             |    2 +-
>  meta/recipes-core/initscripts/initscripts_1.0.bb   |    9 ++++++++-
>  3 files changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-core/initscripts/initscripts-1.0/halt b/meta/recipes-core/initscripts/initscripts-1.0/halt
> index 609b793..021d9be 100755
> --- a/meta/recipes-core/initscripts/initscripts-1.0/halt
> +++ b/meta/recipes-core/initscripts/initscripts-1.0/halt
> @@ -24,6 +24,6 @@ then
>  	hddown=""
>  fi
>  
> -halt -d -f -i -p $hddown
> +halt SED_HALTARGS -p $hddown
>  
>  : exit 0
> diff --git a/meta/recipes-core/initscripts/initscripts-1.0/reboot b/meta/recipes-core/initscripts/initscripts-1.0/reboot
> index 4c55885..cf32e95 100755
> --- a/meta/recipes-core/initscripts/initscripts-1.0/reboot
> +++ b/meta/recipes-core/initscripts/initscripts-1.0/reboot
> @@ -12,4 +12,4 @@
>  PATH=/sbin:/bin:/usr/sbin:/usr/bin
>  
>  echo -n "Rebooting... "
> -reboot -d -f -i
> +reboot SED_HALTARGS
> diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
> index d990925..720c252 100644
> --- a/meta/recipes-core/initscripts/initscripts_1.0.bb
> +++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
> @@ -6,7 +6,7 @@ DEPENDS = "makedevs"
>  RDEPENDS_${PN} = "makedevs"
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
> -PR = "r124"
> +PR = "r125"
>  
>  SRC_URI = "file://functions \
>             file://halt \
> @@ -38,6 +38,13 @@ SRC_URI_append_arm = " file://alignment.sh"
>  
>  KERNEL_VERSION = ""
>  
> +HALTARGS ?= "-d -f"
> +
> +do_configure() {
> +	sed -i -e "s:SED_HALTARGS:${HALTARGS}:g" ${WORKDIR}/halt
> +	sed -i -e "s:SED_HALTARGS:${HALTARGS}:g" ${WORKDIR}/reboot
> +}
> +
>  do_install () {
>  #
>  # Create directories and install device independent scripts

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


