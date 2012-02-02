Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rt0vf-0000L5-Op
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Feb 2012 18:58:41 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 02 Feb 2012 09:50:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="113364303"
Received: from unknown (HELO [10.255.14.238]) ([10.255.14.238])
	by fmsmga001.fm.intel.com with ESMTP; 02 Feb 2012 09:50:41 -0800
Message-ID: <4F2ACCF1.70704@linux.intel.com>
Date: Thu, 02 Feb 2012 09:50:41 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1327478715-11214-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1327478715-11214-1-git-send-email-Martin.Jansa@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH] rootfs_ipk: remove runtime_script_required usage
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
X-List-Received-Date: Thu, 02 Feb 2012 17:58:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/25/2012 12:05 AM, Martin Jansa wrote:
> * it was introduced in 87780fc09b066525e47d0f50ee5497db54d304cd
> * then partially removed in 2feba313c991170747381c7cf821a45c2cd04632
> * so remove this use too as runtime_script_required is not initialized anymore and results in
>    run.do_rootfs.6328: line 235: [: -eq: unary operator expected
>
> Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
> ---
>   meta/classes/rootfs_ipk.bbclass |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
> index 48fb2fb..5342035 100644
> --- a/meta/classes/rootfs_ipk.bbclass
> +++ b/meta/classes/rootfs_ipk.bbclass
> @@ -90,7 +90,7 @@ fakeroot rootfs_ipk_do_rootfs () {
>   	rm -f ${IMAGE_ROOTFS}${opkglibdir}/lists/*
>
>   	if ${@base_contains("IMAGE_FEATURES", "package-management", "false", "true", d)}; then
> -		if [ $runtime_script_required -eq 0 ]; then
> +		if ! grep Status:.install.ok.unpacked ${IMAGE_ROOTFS}${opkglibdir}status; then
>   			# All packages were successfully configured.
>   			# update-rc.d, base-passwd are no further use, remove them now
>   			opkg-cl ${IPKG_ARGS} --force-depends remove update-rc.d base-passwd || true
Merged into OE-core

Thanks
	Sau!


