Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id F210365DA3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Aug 2014 19:36:45 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 07 Aug 2014 12:36:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,819,1400050800"; d="scan'208";a="466210705"
Received: from unknown (HELO [10.255.12.111]) ([10.255.12.111])
	by azsmga001.ch.intel.com with ESMTP; 07 Aug 2014 12:36:44 -0700
Message-ID: <53E3D545.5040406@linux.intel.com>
Date: Thu, 07 Aug 2014 12:36:37 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Sujith H <sujith.h@gmail.com>, 
 openembedded-core@lists.openembedded.org
References: <1407403457-25490-1-git-send-email-sujith.h@gmail.com>
In-Reply-To: <1407403457-25490-1-git-send-email-sujith.h@gmail.com>
Cc: Sujith H <Sujith_Haridasan@mentor.com>
Subject: Re: [PATCH] opkg-utils: allow disabling update-alternatives
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
X-List-Received-Date: Thu, 07 Aug 2014 19:36:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/07/2014 02:24 AM, Sujith H wrote:
> From: Sujith H <Sujith_Haridasan@mentor.com>
>
> This is needed to deal with the situation where we're using ipk packaging, so
> opkg-utils must be built regardless of what update-alternatives provider we
> prefer. The downside to the current implementation is the need to adjust
> PACKAGECONFIG as well as PREFERRED_PROVIDER, but it is more explicit that way.
>
> Signed-off-by: Christopher Larson <kergoth@gmail.com>
> Signed-off-by: Sujith H <Sujith_Haridasan@mentor.com>
> ---
>   meta/recipes-devtools/opkg-utils/opkg-utils_git.bb | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
> index 693c216..9364740 100644
> --- a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
> +++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
> @@ -19,11 +19,17 @@ TARGET_CC_ARCH += "${LDFLAGS}"
>   PYTHONRDEPS = "python python-shell python-io python-math python-crypt python-logging python-fcntl python-subprocess python-pickle python-compression python-textutils python-stringold"
>   PYTHONRDEPS_class-native = ""
>
> -PACKAGECONFIG = "python"
> +PACKAGECONFIG = "python update-alternatives"
>   PACKAGECONFIG[python] = ",,,${PYTHONRDEPS}"
> +PACKAGECONFIG[update-alternatives] = ",,,"
> +
> +PROVIDES += "${@'virtual/update-alternatives' if 'update-alternatives' in PACKAGECONFIG.split() else ''}"
>
Is there not still a PROVIDES line above that has the 
virtual/update-alternative that needs to be removed?

Sau!
>   do_install() {
>   	oe_runmake PREFIX=${prefix} DESTDIR=${D} install
> +        if ${@'true' if 'update-alternatives' not in PACKAGECONFIG.split() else 'false'}; then
> +            rm -f "${D}${bindir}/update-alternatives"
> +        fi
>   }
>
>   PACKAGES =+ "update-alternatives-opkg"
>

