Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (unknown [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B0E5D6607F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 May 2014 16:59:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s4NGx6T1005755
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 23 May 2014 09:59:06 -0700 (PDT)
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Fri, 23 May 2014 09:59:06 -0700
Message-ID: <537F7E4F.3090908@windriver.com>
Date: Fri, 23 May 2014 12:58:55 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Darren Hart <dvhart@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>,
	Saul Wold <sgw@linux.intel.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
References: <b3bebaeb85b2dbd47744319dbd3bcf38f452537a.1400864279.git.dvhart@linux.intel.com>
In-Reply-To: <b3bebaeb85b2dbd47744319dbd3bcf38f452537a.1400864279.git.dvhart@linux.intel.com>
Subject: Re: [PATCH] linux-yocto-dev: Dynamic SRCREV update
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 May 2014 16:59:10 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 14-05-23 12:57 PM, Darren Hart wrote:
> The current implementation would result in the default SRCREVs being
> used by the fetcher, even though the anonymous python would update them
> to AUTOREV. This appears to be something to do with early parsing
> bitbake black magic.
>
> This patch ensures the default is never assigned if we are actually
> building the recipe by using a function to assign it in the first place.
>
> The USE_DEFAULT* variables are removed as they are not necessary to
> allow for overriding the SRCREVs.
>
> The anonymous python parse check is moved closer to the top of the
> recipe to be a bit more logically representative of its intended
> purpose.

Looks good to me.

Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>

>
> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> ---
>   meta/recipes-kernel/linux/linux-yocto-dev.bb |   29 ++++++++++----------------
>   1 file changed, 11 insertions(+), 18 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> index 5e09720..9b49eee 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> @@ -11,37 +11,30 @@
>   inherit kernel
>   require recipes-kernel/linux/linux-yocto.inc
>
> -USE_MACHINE_AUTOREV ?= "1"
> -USE_META_AUTOREV ?= "1"
> -
>   # provide this .inc to set specific revisions
>   include recipes-kernel/linux/linux-yocto-dev-revisions.inc
>
> +# Skip processing of this recipe if it is not explicitly specified as the
> +# PREFERRED_PROVIDER for virtual/kernel. This avoids network access required
> +# by the use of AUTOREV SRCREVs, which are the default for this recipe.
> +python () {
> +    if d.getVar("PREFERRED_PROVIDER_virtual/kernel", True) != "linux-yocto-dev":
> +        raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-dev to enable it")
> +}
> +
>   KBRANCH = "standard/base"
>   KBRANCH_DEFAULT = "${KBRANCH}"
>   KMETA = "meta"
>
> -SRC_URI = "git://git.pokylinux.org/linux-yocto-dev.git;nocheckout=1;branch=${KBRANCH},${KMETA};name=machine,meta"
> +SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
>
>   # Set default SRCREVs. Both the machine and meta SRCREVs are statically set
>   # to the korg v3.7 tag, and hence prevent network access during parsing. If
>   # linux-yocto-dev is the preferred provider, they will be overridden to
>   # AUTOREV in following anonymous python routine and resolved when the
>   # variables are finalized.
> -SRCREV_machine ?= "29594404d7fe73cd80eaa4ee8c43dcc53970c60e"
> -SRCREV_meta ?= "29594404d7fe73cd80eaa4ee8c43dcc53970c60e"
> -
> -python () {
> -    if d.getVar("PREFERRED_PROVIDER_virtual/kernel", True) != "linux-yocto-dev":
> -        raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-dev to enable it")
> -    else:
> -        # if the revisions have been changed from the defaults above we leave them
> -        # alone. But if the defaults are left, we change to AUTOREV.
> -        if d.getVar("USE_MACHINE_AUTOREV", True) == "1":
> -            d.setVar("SRCREV_machine", "${AUTOREV}")
> -        if d.getVar("USE_META_AUTOREV", True) == "1":
> -            d.setVar("SRCREV_meta", "${AUTOREV}")
> -}
> +SRCREV_machine ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
> +SRCREV_meta ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
>
>   LINUX_VERSION ?= "3.14+"
>   LINUX_VERSION_EXTENSION ?= "-yoctodev-${LINUX_KERNEL_TYPE}"
>


