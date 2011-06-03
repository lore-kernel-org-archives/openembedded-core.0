Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QSI2q-0007oI-54
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Jun 2011 02:15:20 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 02 Jun 2011 17:12:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,312,1304319600"; 
   d="scan'208";a="6260825"
Received: from swold-mobl.jf.intel.com (HELO [10.24.4.14]) ([10.24.4.14])
	by azsmga001.ch.intel.com with ESMTP; 02 Jun 2011 17:12:02 -0700
Message-ID: <4DE826D3.8080108@linux.intel.com>
Date: Thu, 02 Jun 2011 17:12:03 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1306409375.2525.323.camel@phil-desktop>	<1306841498.2525.486.camel@phil-desktop>	<4DE52054.3070200@linux.intel.com>
	<1306924871.2529.33.camel@phil-desktop>
In-Reply-To: <1306924871.2529.33.camel@phil-desktop>
Subject: Re: [PATCH v3] rootfs_ipk: delete opkg metadata if package management not required and all packages are configured
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
X-List-Received-Date: Fri, 03 Jun 2011 00:15:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/01/2011 03:41 AM, Phil Blundell wrote:
> If all the postinsts were successfully run in offline mode, and
> package-management hasn't been requested as an IMAGE_FEATURE, the opkg
> metadata is now redundant and can safely be deleted.
>
> Also, the update-rc.d and base-passwd packages can be removed since
> they will serve no further purpose in this situation.
>
> If some packages are still unconfigured at this point then we need to
> keep their metadata around so that either opkg or the awk script can
> configure the packages at boot time.  In theory it would be possible to
> strip out the data for packages that have already been configured, but
> right now we just hold on to the whole status file in that situation.
>
> Signed-off-by: Phil Blundell<philb@gnu.org>
> ---
>   meta/classes/rootfs_ipk.bbclass |   11 +++++++++++
>   1 files changed, 11 insertions(+), 0 deletions(-)
>
> diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
> index edd84fb..3b4b4da 100644
> --- a/meta/classes/rootfs_ipk.bbclass
> +++ b/meta/classes/rootfs_ipk.bbclass
> @@ -82,6 +82,17 @@ fakeroot rootfs_ipk_do_rootfs () {
>   	
>   	rm -f ${IMAGE_ROOTFS}${opkglibdir}/lists/*
>
> +	if ${@base_contains("IMAGE_FEATURES", "package-management", "false", "true", d)}; then
> +		if [ $runtime_script_required -eq 0 ]; then
> +			# All packages were successfully configured.
> +			# update-rc.d, base-passwd are no further use, remove them now
> +			opkg-cl ${IPKG_ARGS} --force-depends remove update-rc.d base-passwd || true
> +
> +			# Also delete the status files
> +			rm -rf ${IMAGE_ROOTFS}${opkglibdir}
> +		fi
> +	fi
> +
>   	log_check rootfs 	
>   }
>
Merged into oe-core

Thanks
	Sau!


