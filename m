Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SrAcV-0001ej-Hx
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 18:27:31 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 17 Jul 2012 09:15:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="193987177"
Received: from unknown (HELO [10.255.12.178]) ([10.255.12.178])
	by fmsmga002.fm.intel.com with ESMTP; 17 Jul 2012 09:15:39 -0700
Message-ID: <50058FAA.80201@linux.intel.com>
Date: Tue, 17 Jul 2012 09:15:38 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1342048527-20262-1-git-send-email-msm@freescale.com>
In-Reply-To: <1342048527-20262-1-git-send-email-msm@freescale.com>
Cc: Matthew McClintock <msm@freescale.com>
Subject: Re: [PATCH] sysvinit-inittab_2.88dsf.bb: Allow multiple serial port consoles to be defined
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
X-List-Received-Date: Tue, 17 Jul 2012 16:27:31 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/11/2012 04:15 PM, Matthew McClintock wrote:
> Set SERIAL_CONSOLES if you want to define multiple serial consoles, also if
> you need to check for the presence of the serial consoles you can also define
> SERIAL_CONSOLES_CHECK to determine if these are present when you boot. This
> will prevent error message that pop up when the serial port is not present.
>
> SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS1 115200;ttyEHV0"
> SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
>
> The above lines in machine.conf or elsewhere will have the effect of having
> two serial consoles and removing any that are not present at boot
> ---
>   .../sysvinit/sysvinit-inittab_2.88dsf.bb           |   22 ++++++++++++++++++--
>   1 file changed, 20 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
> index 9bd087c..1089edb 100644
> --- a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
> +++ b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
> @@ -2,7 +2,7 @@ DESCRIPTION = "Inittab for sysvinit"
>   LICENSE = "GPLv2"
>   LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
>
> -PR = "r6"
> +PR = "r7"
>
>   SRC_URI = "file://inittab"
>
> @@ -26,7 +26,8 @@ do_install() {
>       for i in $tmp
>       do
>   	j=`echo ${i} | sed s/\;/\ /g`
> -        echo "${idx}:2345:respawn:${base_sbindir}/getty ${j}" >> ${D}${sysconfdir}/inittab
> +	echo "${idx}:12345:respawn:${base_sbindir}/getty ${j}" >> ${D}${sysconfdir}/inittab
> +
>   	idx=`expr $idx + 1`
>       done
>
> @@ -51,6 +52,23 @@ EOF
>       fi
>   }
>
> +pkg_postinst_${PN} () {
> +# run this on the target
> +if [ "x$D" == "x" ]; then
> +	tmp="${SERIAL_CONSOLES_CHECK}"
> +	for i in $tmp
> +	do
> +		j=`echo ${i} | sed s/^.*\;//g`
> +		if [ -z "`cat /proc/consoles | grep ${j}`" ]; then
> +			sed -i /^.*${j}$/d /etc/inittab
> +		fi
> +	done
> +	kill -HUP 1
> +else
> +	exit 1
> +fi
> +}
> +
>   # USE_VT and SERIAL_CONSOLE are generally defined by the MACHINE .conf.
>   # Set PACKAGE_ARCH appropriately.
>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>

Merged into OE-Core

Thanks
	Sau!



