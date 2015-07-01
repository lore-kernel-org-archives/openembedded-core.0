Return-Path: <dvhart@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 59A437561F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jul 2015 16:03:00 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 01 Jul 2015 09:03:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,386,1432623600"; d="scan'208";a="754125751"
Received: from npeddire-mobl.amr.corp.intel.com (HELO dvhart-mac02.local)
	([10.254.76.50])
	by fmsmga002.fm.intel.com with ESMTP; 01 Jul 2015 09:02:59 -0700
Message-ID: <55940F38.9060603@linux.intel.com>
Date: Wed, 01 Jul 2015 09:03:04 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>, 
	openembedded-core@lists.openembedded.org, 
	richard.purdie@linuxfoundation.org, pb@pbcl.net
References: <1435587050-18517-1-git-send-email-sgw@linux.intel.com>
In-Reply-To: <1435587050-18517-1-git-send-email-sgw@linux.intel.com>
Subject: Re: [PATCH] tune-i586-nlp: Add new tune file to support Quark/X1000 CPU
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
X-List-Received-Date: Wed, 01 Jul 2015 16:03:04 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 6/29/15 7:10 AM, Saul Wold wrote:
> This tune file is needed to enable a GAS option specific to this cpu family
> in order to disable the usage of lock prefix instructions.
> 
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/conf/machine/include/tune-i586-nlp.inc | 19 +++++++++++++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 meta/conf/machine/include/tune-i586-nlp.inc
> 
> diff --git a/meta/conf/machine/include/tune-i586-nlp.inc b/meta/conf/machine/include/tune-i586-nlp.inc
> new file mode 100644
> index 0000000..94e22c1
> --- /dev/null
> +++ b/meta/conf/machine/include/tune-i586-nlp.inc
> @@ -0,0 +1,19 @@
> +# Settings for the GCC(1) cpu-type "quark":
> +#
> +#
> +#
> +DEFAULTTUNE ?= "i586-nlp-32"
> +
> +# Include the previous tune to pull in PACKAGE_EXTRA_ARCHS
> +require conf/machine/include/x86/arch-x86.inc
> +
> +# x86 with no lock prefix
> +TUNEVALID[i586-nlp] = "IA32 with Lock Prefix omitted"
> +TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "i586-nlp", " -march=i586 -Wa,-momit-lock-prefix=yes", "", d)}"
> +
> +# Quark tune feature
> +AVAILTUNES = "i586-nlp-32"
> +TUNE_FEATURES_tune-i586-nlp-32 = "${TUNE_FEATURES_tune-x86} i586-nlp"
> +BASE_LIB_tune-i586-nlp-32 = "lib"
> +TUNE_PKGARCH_tune-i586-nlp-32 = "i586-nlp-32"
> +PACKAGE_EXTRA_ARCHS_tune-i586-nlp-32 = "i586-nlp-32"
> 

I believe this explicit assignment, instead of appending to tune-i586,
addresses the issue Phil raised?

Reviewed-by: Darren Hart <dvhart@linux.intel.com>

-- 
Darren Hart
Intel Open Source Technology Center

