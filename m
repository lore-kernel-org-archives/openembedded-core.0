Return-Path: <laurentiu.palcu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 77A026D159
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2013 12:43:05 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 14 Nov 2013 04:43:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,699,1378882800"; d="scan'208";a="427567727"
Received: from lpalcu-linux.rb.intel.com (HELO lpalcu-linux) ([10.237.105.41])
	by fmsmga001.fm.intel.com with ESMTP; 14 Nov 2013 04:43:04 -0800
Date: Thu, 14 Nov 2013 14:43:02 +0200
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20131114124302.GA7503@lpalcu-linux>
References: <cover.1383742507.git.laurentiu.palcu@intel.com>
	<0dcafa1bce7a6ae871ee0f6b20eab8834860b334.1383742507.git.laurentiu.palcu@intel.com>
MIME-Version: 1.0
In-Reply-To: <0dcafa1bce7a6ae871ee0f6b20eab8834860b334.1383742507.git.laurentiu.palcu@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH v2 1/1] flex: fix m4 issue on target
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
X-List-Received-Date: Thu, 14 Nov 2013 12:43:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Even though this was in the last C-pull, for some reason, it didn't end
up in master... Didn't see any comments on it either. Or maybe I missed
them...

Thanks,
Laurentiu

On Wed, Nov 06, 2013 at 03:07:58PM +0200, Laurentiu Palcu wrote:
> Flex needs m4 to run (see below) and, since the create_wrapper
> introduces a bash dependency on target, give the path to m4 binary in
> the configure command line.
> 
> Snippet from the flex documentation:
> "The macro processor m4 must be installed wherever flex is installed.
> <...>
> m4 is only required at the time you run flex."
> 
> [YOCTO #5329]
> 
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> ---
>  meta/recipes-devtools/flex/flex.inc |    5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/meta/recipes-devtools/flex/flex.inc b/meta/recipes-devtools/flex/flex.inc
> index 43f1dda..96d5de5 100644
> --- a/meta/recipes-devtools/flex/flex.inc
> +++ b/meta/recipes-devtools/flex/flex.inc
> @@ -13,6 +13,9 @@ inherit autotools gettext
>  M4 = "${bindir}/m4"
>  M4_class-native = "${STAGING_BINDIR_NATIVE}/m4"
>  
> +EXTRA_OECONF += "ac_cv_path_M4=${M4}"
> +EXTRA_OEMAKE += "m4=${STAGING_BINDIR_NATIVE}/m4"
> +
>  do_install_append_class-native() {
>  	create_wrapper ${D}/${bindir}/flex M4=${M4}
>  }
> @@ -20,3 +23,5 @@ do_install_append_class-native() {
>  do_install_append_class-nativesdk() {
>  	create_wrapper ${D}/${bindir}/flex M4=${M4}
>  }
> +
> +RDEPENDS_${PN} += "m4"
> -- 
> 1.7.9.5
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

