Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id B7DD877AA9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 21:47:00 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga105.jf.intel.com with ESMTP; 30 Mar 2017 14:47:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,248,1486454400"; d="scan'208";a="840189962"
Received: from ablanken-mobl.amr.corp.intel.com ([10.255.87.95])
	by FMSMGA003.fm.intel.com with ESMTP; 30 Mar 2017 14:47:01 -0700
Date: Thu, 30 Mar 2017 14:47:00 -0700
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Message-ID: <20170330214700.GA42157@ablanken-mobl.amr.corp.intel.com>
References: <7e4d76293bf16287959f76b75aa4ed26c56ea170.1490886538.git-series.patrick.ohly@intel.com>
MIME-Version: 1.0
In-Reply-To: <7e4d76293bf16287959f76b75aa4ed26c56ea170.1490886538.git-series.patrick.ohly@intel.com>
User-Agent: Mutt/1.8.0 (2017-02-23)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] net-tools: enable native and nativesdk variant
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
X-List-Received-Date: Thu, 30 Mar 2017 21:47:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This won't work, and it is failing on the ab.

https://autobuilder.yoctoproject.org/main/builders/nightly-no-x11/builds/449/steps/BuildImages/logs/stdio

Just add a 'return' to your empty bash function and it'll work fine.

Cheers,
Stephano

On 03/30, Patrick Ohly wrote:
> net-tools-native is needed by swtpm-wrappers (in meta-security)
> because swtpm_setup.sh calls netstat, which cannot be assumed to be
> present in all Linux installations (for example, it is not in OpenSUSE
> minimal base).
> 
> Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
> ---
>  meta/recipes-extended/net-tools/net-tools_1.60-26.bb | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/meta/recipes-extended/net-tools/net-tools_1.60-26.bb b/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
> index be26735..4152a4f 100644
> --- a/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
> +++ b/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
> @@ -70,11 +70,20 @@ python do_patch() {
>      bb.build.exec_func('patch_do_patch', d)
>  }
>  
> +# i18n only enabled for the target, doesn't build for native
> +# and isn't needed there.
> +disable_i18n() {
> +	sed -i -e 's/^I18N=1/# I18N=1/' ${S}/config.make
> +}
> +disable_i18n_class-target () {
> +}
> +
>  do_configure() {
>  	# net-tools has its own config mechanism requiring "make config"
>  	# we pre-generate desired options and copy to source directory instead
>  	cp ${WORKDIR}/net-tools-config.h    ${S}/config.h
>  	cp ${WORKDIR}/net-tools-config.make ${S}/config.make
> +	disable_i18n
>  }
>  
>  do_compile() {
> @@ -125,3 +134,4 @@ python __anonymous() {
>  }
>  ALTERNATIVE_PRIORITY = "100"
>  
> +BBCLASSEXTEND = "native nativesdk"
> 
> base-commit: e4f5d88b8e69964c40e7011c1e7f33f6484b9090
> -- 
> git-series 0.9.1
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

