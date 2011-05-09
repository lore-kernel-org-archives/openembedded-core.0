Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QJTDd-0002vv-Hz
	for openembedded-core@lists.openembedded.org;
	Mon, 09 May 2011 18:22:01 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 09 May 2011 09:19:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,341,1301900400"; d="scan'208";a="433044824"
Received: from unknown (HELO [10.255.12.75]) ([10.255.12.75])
	by azsmga001.ch.intel.com with ESMTP; 09 May 2011 09:19:16 -0700
Message-ID: <4DC81403.5050102@linux.intel.com>
Date: Mon, 09 May 2011 09:19:15 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.10) Gecko/20100621 Fedora/3.0.5-1.fc13 Lightning/1.0b2pre
	Thunderbird/3.0.5
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1304614676-7334-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1304614676-7334-1-git-send-email-raj.khem@gmail.com>
Subject: Re: [PATCH] gettext.bbclass, bitbake.conf: Append nls options to EXTRA_OECONF instead of +=
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
X-List-Received-Date: Mon, 09 May 2011 16:22:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/05/2011 09:57 AM, Khem Raj wrote:
> Some recipes do not defined EXTRA_OECONF in such cases += drops
> the --enable|--disable-nls options. In another case where recipe
> defines EXTRA_OECONF instead of adding/appending to it then
> --enable|--disable-nls options are lost from EXTRA_OECONF
>
> We define EXTRA_OECONF = "" in bitbake.conf so the variable exists
> always.
>
> We use _append instead of += so the option is added at very end
> and not lost.
>
> We only return empty gettext dependencies if its a target recipe
> in case when USE_NLS is not set because the native/cross/nativesdk recipes still
> need the gettext dependencies
>
> Signed-off-by: Khem Raj<raj.khem@gmail.com>
> ---
>   meta/classes/gettext.bbclass |    6 +++---
>   meta/conf/bitbake.conf       |    2 +-
>   2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta/classes/gettext.bbclass b/meta/classes/gettext.bbclass
> index 6f79e5e..86b505b 100644
> --- a/meta/classes/gettext.bbclass
> +++ b/meta/classes/gettext.bbclass
> @@ -1,7 +1,7 @@
>   def gettext_dependencies(d):
> -    if d.getVar('USE_NLS', True) == 'no':
> +    if d.getVar('USE_NLS', True) == 'no' and not oe.utils.inherits(d, 'native', 'nativesdk', 'cross'):
>           return ""
> -    if bb.data.getVar('INHIBIT_DEFAULT_DEPS', d, True) and not oe.utils.inherits(d, 'cross-canadian'):
> +    if d.getVar('INHIBIT_DEFAULT_DEPS', True) and not oe.utils.inherits(d, 'cross-canadian'):
>           return ""
>       return d.getVar('DEPENDS_GETTEXT', False)
>
> @@ -14,4 +14,4 @@ def gettext_oeconf(d):
>   DEPENDS_GETTEXT = "virtual/gettext gettext-native"
>
>   BASEDEPENDS =+ "${@gettext_dependencies(d)}"
> -EXTRA_OECONF += "${@gettext_oeconf(d)}"
> +EXTRA_OECONF_append = " ${@gettext_oeconf(d)}"
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index a2b36bd..4a1bfa1 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -395,7 +395,7 @@ export BUILD_NM = "${BUILD_PREFIX}nm"
>
>   export MAKE = "make"
>   EXTRA_OEMAKE = "-e MAKEFLAGS="
> -
> +EXTRA_OECONF = ""
>   export LC_ALL = "C"
>
>   ##################################################################

Pulled into oe-core

Thanks
	Sau!


