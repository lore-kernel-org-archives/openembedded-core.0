Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QcQUU-0004R1-AW
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 01:17:46 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 30 Jun 2011 16:14:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,455,1304319600"; d="scan'208";a="20329722"
Received: from swold-mobl.jf.intel.com (HELO [10.24.82.35]) ([10.24.82.35])
	by orsmga002.jf.intel.com with ESMTP; 30 Jun 2011 16:14:01 -0700
Message-ID: <4E0D0333.8080706@linux.intel.com>
Date: Thu, 30 Jun 2011 16:13:55 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1309432228.7987.14.camel@desktop.home>
In-Reply-To: <1309432228.7987.14.camel@desktop.home>
Subject: Re: [PATCH] Add support for BAD_RECOMMENDATIONS to rootfs_ipk
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
X-List-Received-Date: Thu, 30 Jun 2011 23:17:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/30/2011 04:10 AM, Chris Elston wrote:
> As discussed on IRC on 30/06/11, this patch adds support for
> BAD_RECOMMENDATIONS to rootfs_ipk, which is a list of packages NOT to
> install if suggested or recommended by a recipe.  Taken from
> http://thread.gmane.org/gmane.comp.handhelds.openembedded/30417.
>
> Note that current support for this in oe.dev may also be broken,
> depending on the version of opkg in use.
>
This patch does not seem to apply cleanly, could you please rebase and 
resend.

Thanks

Sau!

> Signed-off-by: Chris Elston<celston@katalix.com>
>
> ---
>   meta/classes/rootfs_ipk.bbclass |   18 ++++++++++++++++++
>   1 files changed, 18 insertions(+), 0 deletions(-)
>
> diff --git a/meta/classes/rootfs_ipk.bbclass
> b/meta/classes/rootfs_ipk.bbclass
> index edd84fb..bf15f4c 100644
> --- a/meta/classes/rootfs_ipk.bbclass
> +++ b/meta/classes/rootfs_ipk.bbclass
> @@ -20,6 +20,9 @@ OPKG_POSTPROCESS_COMMANDS = "ipk_insert_feed_uris"
>
>   opkglibdir = "${localstatedir}/lib/opkg"
>
> +# Which packages to not install on the basis of a recommendation
> +BAD_RECOMMENDATIONS ?= ""
> +
>   fakeroot rootfs_ipk_do_rootfs () {
>   	set -x
>
> @@ -30,6 +33,21 @@ fakeroot rootfs_ipk_do_rootfs () {
>
>   	mkdir -p ${T}/
>
> +	STATUS=${IMAGE_ROOTFS}/var/lib/opkg/status
> +	mkdir -p `dirname ${STATUS}`
> +
> +	opkg-cl ${IPKG_ARGS} update
> +
> +	# prime the status file with bits that we don't want
> +	for i in ${BAD_RECOMMENDATIONS}; do
> +		infln="`opkg-cl ${IPKG_ARGS} info $i | grep -e '^Package:' -e
> '^Architecture:' -e '^Version:'`"
> +		if [ ! -z "$infln" ]; then
> +			echo "$infln">>  $STATUS
> +			echo "Status: deinstall ok not-installed">>  $STATUS
> +			echo>>  $STATUS
> +		fi
> + 	done
> +
>   	#install
>   	export
> INSTALL_PACKAGES_ATTEMPTONLY_IPK="${PACKAGE_INSTALL_ATTEMPTONLY}"
>   	export INSTALL_PACKAGES_LINGUAS_IPK="${LINGUAS_INSTALL}"


