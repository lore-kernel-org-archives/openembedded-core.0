Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1THGJQ-0000Xw-CM
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Sep 2012 17:47:40 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 27 Sep 2012 08:34:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,496,1344236400"; d="scan'208";a="149881981"
Received: from unknown (HELO [10.255.13.173]) ([10.255.13.173])
	by AZSMGA002.ch.intel.com with ESMTP; 27 Sep 2012 08:34:46 -0700
Message-ID: <50647215.4000906@linux.intel.com>
Date: Thu, 27 Sep 2012 08:34:45 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Phil Blundell <philb@gnu.org>
References: <1348746272.32611.15.camel@phil-desktop>
In-Reply-To: <1348746272.32611.15.camel@phil-desktop>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] eglibc: Remove bogus PACKAGES_DYNAMIC setting
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
X-List-Received-Date: Thu, 27 Sep 2012 15:47:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/27/2012 04:44 AM, Phil Blundell wrote:
> It transpires that eglibc has been setting PACKAGES_DYNAMIC = "libc6*" for
> some time.  However, this is bogus for at least two reasons:
>
> 1. Bitbake interprets PACKAGES_DYNAMIC as a regex, not a glob, so this will
> match against any package whose name starts "libc" plus zero or more sixes.
> This is particularly toxic because the nativesdk variant picks up the same
> value and will, consequently, start trying to build itself at the slightest
> excuse.
>
> 2. eglibc doesn't actually build any packages named "libc6<anything>", other
> than the ones that are named in PACKAGES anyway, so the dynamic provider
> declaration is in any case useless.
>
> Simply deleting the line is not sufficient since then we get the default
> value from bitbake.conf which causes eglibc.bb to fight with eglibc-locale.bb.
> So instead we must set it to the empty string for good results.
>
> Signed-off-by: Phil Blundell <pb@pbcl.net>
> ---
>   meta/recipes-core/eglibc/eglibc_2.16.bb |    3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/eglibc/eglibc_2.16.bb b/meta/recipes-core/eglibc/eglibc_2.16.bb
> index 3a7ae50..b37922d 100644
> --- a/meta/recipes-core/eglibc/eglibc_2.16.bb
> +++ b/meta/recipes-core/eglibc/eglibc_2.16.bb
> @@ -43,7 +43,8 @@ SRC_URI_append_virtclass-nativesdk = " file://ld-search-order.patch \
>   S = "${WORKDIR}/${EGLIBC_BRANCH}/libc"
>   B = "${WORKDIR}/build-${TARGET_SYS}"
>
> -PACKAGES_DYNAMIC = "libc6*"
> +PACKAGES_DYNAMIC = ""
> +
>   RPROVIDES_${PN}-dev = "libc6-dev virtual-libc-dev"
>   PROVIDES_${PN}-dbg = "glibc-dbg"
>
>
Merged into OE-Core

Thanks
	Sau!



