Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1ROYPj-0008Qx-RN
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Nov 2011 18:27:48 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 10 Nov 2011 09:21:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,489,1315206000"; d="scan'208";a="88630656"
Received: from unknown (HELO [10.255.15.157]) ([10.255.15.157])
	by fmsmga002.fm.intel.com with ESMTP; 10 Nov 2011 09:21:23 -0800
Message-ID: <4EBC0813.2090607@linux.intel.com>
Date: Thu, 10 Nov 2011 09:21:23 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1320441301.3137.1.camel@lenovo.internal.reciva.com>
	<1320441941-30850-1-git-send-email-msm@freescale.com>
In-Reply-To: <1320441941-30850-1-git-send-email-msm@freescale.com>
Cc: Matthew McClintock <msm@freescale.com>, philb@gnu.org
Subject: Re: [PATCH v2] Introduce new SERIAL_CONSOLES to add multiple consoles for your MACHINE
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
X-List-Received-Date: Thu, 10 Nov 2011 17:27:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/04/2011 02:25 PM, Matthew McClintock wrote:
> Just define additional serial consoles like so:
>
> SERIAL_CONSOLES="115200;ttyS0 115200;ttyS1 ... 115200;ttySN"
>
> Also be sure to remove SERIAL_CONSOLE (lacking the S) from your
> machine as they can conflict.
>
> Signed-off-by: Matthew McClintock<msm@freescale.com>
> ---
> v2: handle case where SERIAL_CONSOLES is not defined
>
>   .../sysvinit/sysvinit-inittab_2.88dsf.bb           |   12 ++++++++++++
>   1 files changed, 12 insertions(+), 0 deletions(-)
>
> diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
> index ba60c74..adab262 100644
> --- a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
> +++ b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
> @@ -25,6 +25,18 @@ do_install() {
>       if [ ! -z "${SERIAL_CONSOLE}" ]; then
>           echo "S:2345:respawn:${base_sbindir}/getty ${SERIAL_CONSOLE}">>  ${D}${sysconfdir}/inittab
>       fi
> +
> +    idx=0
> +    tmp="${SERIAL_CONSOLES}"
> +    if [ "x" != "x$tmp" ]; then
> +	for i in $tmp
> +	do
> +	    j=`echo ${i} | sed s/\;/\ /g`
> +	    echo "${idx}:2345:respawn:${base_sbindir}/getty ${j}">>  ${D}${sysconfdir}/inittab
> +	    idx=`expr $idx + 1`
> +	done
> +    fi
> +
>       if [ "${USE_VT}" = "1" ]; then
>           cat<<EOF>>${D}${sysconfdir}/inittab
>   # ${base_sbindir}/getty invocations for the runlevels.

Merged into OE-Core

Thanks
	Sau!


