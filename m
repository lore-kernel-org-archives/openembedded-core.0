Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TBqlZ-0003CW-Pl
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Sep 2012 19:30:22 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 12 Sep 2012 10:17:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,410,1344236400"; d="scan'208";a="144296327"
Received: from unknown (HELO [10.255.13.93]) ([10.255.13.93])
	by AZSMGA002.ch.intel.com with ESMTP; 12 Sep 2012 10:17:47 -0700
Message-ID: <5050C3BB.5030300@linux.intel.com>
Date: Wed, 12 Sep 2012 10:17:47 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Matthew McClintock <msm@freescale.com>
References: <1347386213-6215-1-git-send-email-msm@freescale.com>
In-Reply-To: <1347386213-6215-1-git-send-email-msm@freescale.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] sysvinit-inittab_2.88dsf.bb: only run serial checks at boot if we have items to check
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
X-List-Received-Date: Wed, 12 Sep 2012 17:30:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/11/2012 10:56 AM, Matthew McClintock wrote:
> Right now, we delay running the serial console checks to we boot up. This causes
> issues for read only file systems. So, if have not configured any serial ports to
> check via SERIAL_CONSOLES_CHECK we can skip the check at boot. This fixes any
> issues with read only file systems and ipk packaging.
>
> Signed-off-by: Matthew McClintock <msm@freescale.com>
> ---
> v2: bump PR
> v3: change a == bashism to =
>
>   .../sysvinit/sysvinit-inittab_2.88dsf.bb           |   10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
> index 1089edb..5b79caf 100644
> --- a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
> +++ b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
> @@ -2,7 +2,7 @@ DESCRIPTION = "Inittab for sysvinit"
>   LICENSE = "GPLv2"
>   LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
>
> -PR = "r7"
> +PR = "r8"
>
>   SRC_URI = "file://inittab"
>
> @@ -54,7 +54,7 @@ EOF
>
>   pkg_postinst_${PN} () {
>   # run this on the target
> -if [ "x$D" == "x" ]; then
> +if [ "x$D" = "x" ]; then
>   	tmp="${SERIAL_CONSOLES_CHECK}"
>   	for i in $tmp
>   	do
> @@ -65,7 +65,11 @@ if [ "x$D" == "x" ]; then
>   	done
>   	kill -HUP 1
>   else
> -	exit 1
> +	if [ "${SERIAL_CONSOLES_CHECK}" = "" ]; then
> +		exit 0
> +	else
> +		exit 1
> +	fi
>   fi
>   }
>
>

Merged to OE-Core

Thanks
	Sau!



