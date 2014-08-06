Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id EA7F465E2B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Aug 2014 12:38:45 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 06 Aug 2014 05:38:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,811,1400050800"; d="scan'208";a="465584562"
Received: from cgwithan-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.26])
	by azsmga001.ch.intel.com with ESMTP; 06 Aug 2014 05:38:45 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Sujith H <sujith.h@gmail.com>, Sujith H <Sujith_Haridasan@mentor.com>
Date: Wed, 06 Aug 2014 13:38:44 +0100
Message-ID: <11634411.QS1iMaReBX@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.13.3 (Linux/3.15.7-200.fc20.x86_64; KDE/4.13.3; x86_64; ; )
In-Reply-To: <1407326649-7117-1-git-send-email-sujith.h@gmail.com>
References: <1407326649-7117-1-git-send-email-sujith.h@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Wed, 06 Aug 2014 12:38:46 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 06 August 2014 17:34:09 Sujith H wrote:
> From: Sujith H <Sujith_Haridasan@mentor.com>
> 
> This is needed to deal with the situation where we're using ipk packaging,
> so opkg-utils must be built regardless of what update-alternatives provider
> we prefer. The downside to the current implementation is the need to adjust
> PACKAGECONFIG as well as PREFERRED_PROVIDER, but it is more explicit that
> way.
> 
> Signed-off-by: Christopher Larson <kergoth@gmail.com>
> Signed-off-by: Sujith H <Sujith_Haridasan@mentor.com>
> ---
>  meta/recipes-devtools/opkg-utils/opkg-utils_git.bb | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
> b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb index 693c216..952fce4
> 100644
> --- a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
> +++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
> @@ -19,11 +19,17 @@ TARGET_CC_ARCH += "${LDFLAGS}"
>  PYTHONRDEPS = "python python-shell python-io python-math python-crypt
> python-logging python-fcntl python-subprocess python-pickle
> python-compression python-textutils python-stringold"
> PYTHONRDEPS_class-native = ""
> 
> -PACKAGECONFIG = "python"
> +PACKAGECONFIG = "python update-alternatives"
>  PACKAGECONFIG[python] = ",,,${PYTHONRDEPS}"
> +PACKAGECONFIG[update-alternatives] = ",,,"
> +
> +PROVIDES_remove = "${@'virtual/update-alternatives' if
> 'update-alternatives' not in PACKAGECONFIG.split() else ''}"

If we have to do this, rather than using _remove here could we simply make 
adding it conditional?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

