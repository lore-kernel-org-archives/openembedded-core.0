Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RTNcn-0008W6-Vt
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Nov 2011 01:57:14 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 23 Nov 2011 16:50:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,562,1315206000"; d="scan'208";a="40701886"
Received: from unknown (HELO [10.255.12.93]) ([10.255.12.93])
	by AZSMGA002.ch.intel.com with ESMTP; 23 Nov 2011 16:50:39 -0800
Message-ID: <4ECD94DF.6010506@linux.intel.com>
Date: Wed, 23 Nov 2011 16:50:39 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1321569366-20167-1-git-send-email-msm@freescale.com>
In-Reply-To: <1321569366-20167-1-git-send-email-msm@freescale.com>
Cc: Matthew McClintock <msm@freescale.com>
Subject: Re: [PATCH] Nothing uses USERNAME, remove it - can cause sstate-cache conflicts
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
X-List-Received-Date: Thu, 24 Nov 2011 00:57:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/17/2011 02:36 PM, Matthew McClintock wrote:
> USER is the correct variable to use, also this can affect sstate
> cache as well.
>
> Signed-off-by: Matthew McClintock<msm@freescale.com>
> ---
> I'm not 100% sure about this one but it seems like nothing is using this
> variable?
>
> Also one of my build machines (Jenkins specifically) was exporting
> USERNAME=root for some reason to the build environment. This was preventing
> sstate-cache from being used on other machines where it was not even
> defined/used AFAICT
>
>   bitbake/lib/bb/utils.py |    1 -
>   meta/conf/bitbake.conf  |    2 +-
>   2 files changed, 1 insertions(+), 2 deletions(-)
>
> diff --git a/bitbake/lib/bb/utils.py b/bitbake/lib/bb/utils.py
> index 1f55407..bb3409d 100644
> --- a/bitbake/lib/bb/utils.py
> +++ b/bitbake/lib/bb/utils.py
> @@ -505,7 +505,6 @@ def preserved_envvars_exported():
>           'SHELL',
>           'TERM',
>           'USER',
> -        'USERNAME',
>       ]
>
>   def preserved_envvars_exported_interactive():
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index b7bcc23..b4335c9 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -751,7 +751,7 @@ TRANSLATED_TARGET_ARCH ??= "${@d.getVar('TARGET_ARCH', True).replace("_", "-")}"
>   # Setup our default hash policy
>   BB_SIGNATURE_HANDLER ?= "basic"
>   BB_HASHTASK_WHITELIST ?= "(.*-cross$|.*-native$|.*-cross-initial$|.*-cross-intermediate$|^virtual:native:.*|^virtual:nativesdk:.*)"
> -BB_HASHBASE_WHITELIST ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH DL_DIR SSTATE_DIR THISDIR FILESEXTRAPATHS FILE_DIRNAME HOME LOGNAME SHELL TERM USER FILESPATH USERNAME STAGING_DIR_HOST STAGING_DIR_TARGET COREBASE"
> +BB_HASHBASE_WHITELIST ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH DL_DIR SSTATE_DIR THISDIR FILESEXTRAPATHS FILE_DIRNAME HOME LOGNAME SHELL TERM USER FILESPATH STAGING_DIR_HOST STAGING_DIR_TARGET COREBASE"
>
>   MLPREFIX ??= ""
>   MULTILIB_VARIANTS ??= ""

This should really be 2 patches, I know they are small, but they should 
be broken down.

Thanks
	Sau!


