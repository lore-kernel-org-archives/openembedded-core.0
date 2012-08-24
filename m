Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T4mAy-0002S4-J1
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Aug 2012 07:11:20 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by azsmga102.ch.intel.com with ESMTP; 23 Aug 2012 21:59:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,302,1344236400"; d="scan'208";a="184855303"
Received: from unknown (HELO [10.255.13.21]) ([10.255.13.21])
	by orsmga001.jf.intel.com with ESMTP; 23 Aug 2012 21:59:11 -0700
Message-ID: <50370A1F.40401@linux.intel.com>
Date: Thu, 23 Aug 2012 21:59:11 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <1345781608-2198-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1345781608-2198-1-git-send-email-raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2] iputils: Fix postinst to run on cross rootfs generation
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
X-List-Received-Date: Fri, 24 Aug 2012 05:11:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/23/2012 09:13 PM, Khem Raj wrote:
> rpm shows error messages like /bin/traceroute6 not found
> when building cross rootfs
>
Richard pointed out that with Pseudo the pkg_postinsts are un-needed, so 
I offered a different patch to that effect.

Sau!

> Yocto # 2892
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   meta/recipes-extended/iputils/iputils_s20101006.bb |    8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-extended/iputils/iputils_s20101006.bb b/meta/recipes-extended/iputils/iputils_s20101006.bb
> index 62e2b5e..bbaff5e 100644
> --- a/meta/recipes-extended/iputils/iputils_s20101006.bb
> +++ b/meta/recipes-extended/iputils/iputils_s20101006.bb
> @@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://ping.c;beginline=1;endline=35;md5=f9ceb201733e9a6cf8f
>
>   DEPENDS = "openssl docbook-utils-native sgmlspl-native"
>
> -PR = "r5"
> +PR = "r6"
>
>   SRC_URI = "http://www.skbuff.net/iputils/${BPN}-${PV}.tar.bz2 \
>              file://debian/fix-dead-host-ping-stats.diff \
> @@ -59,15 +59,15 @@ ALTERNATIVE_${PN}-ping6 = "ping6"
>   ALTERNATIVE_LINK_NAME[ping6] = "${base_bindir}/ping6"
>
>   pkg_postinst_${PN}-ping () {
> -       chmod 4555 ${base_bindir}/ping
> +       chmod 4555 $D${base_bindir}/ping
>   }
>
>   pkg_postinst_${PN}-ping6 () {
> -       chmod 4555 ${base_bindir}/ping6
> +       chmod 4555 $D${base_bindir}/ping6
>   }
>
>   pkg_postinst_${PN}-traceroute6 () {
> -	chmod 4555 ${base_bindir}/traceroute6
> +	chmod 4555 $D${base_bindir}/traceroute6
>   }
>
>   PACKAGES += "${PN}-ping ${PN}-ping6 ${PN}-arping ${PN}-tracepath ${PN}-tracepath6 ${PN}-traceroute6"
>


