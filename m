Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T4OVL-0000zg-VE
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Aug 2012 05:54:48 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 22 Aug 2012 20:42:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,298,1344236400"; d="scan'208";a="212715900"
Received: from unknown (HELO [10.255.13.21]) ([10.255.13.21])
	by fmsmga002.fm.intel.com with ESMTP; 22 Aug 2012 20:42:40 -0700
Message-ID: <5035A6B0.3030007@linux.intel.com>
Date: Wed, 22 Aug 2012 20:42:40 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <1345685506-27178-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1345685506-27178-1-git-send-email-raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] iputils: Fix postinst to run on cross rootfs generation
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
X-List-Received-Date: Thu, 23 Aug 2012 03:54:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/22/2012 06:31 PM, Khem Raj wrote:
> rpm shows error messages like /bin/traceroute6 not found
> when building cross rootfs
>
> Yocto # 2894
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   meta/recipes-extended/iputils/iputils_s20101006.bb |    6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-extended/iputils/iputils_s20101006.bb b/meta/recipes-extended/iputils/iputils_s20101006.bb
> index 62e2b5e..856bde4 100644
> --- a/meta/recipes-extended/iputils/iputils_s20101006.bb
> +++ b/meta/recipes-extended/iputils/iputils_s20101006.bb
> @@ -59,15 +59,15 @@ ALTERNATIVE_${PN}-ping6 = "ping6"
>   ALTERNATIVE_LINK_NAME[ping6] = "${base_bindir}/ping6"
>
>   pkg_postinst_${PN}-ping () {
> -       chmod 4555 ${base_bindir}/ping
> +       chmod 4555 $D${base_bindir}/ping
So that's the magic!  I was trying to figure out what the right prefix 
was in there.  I think we need to do an audit of all pkg_postinst, 
because I saw other places where ${xxx} was used or even worse "/etc/..."

Sau!

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


