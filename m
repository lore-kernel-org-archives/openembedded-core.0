Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 42F4C6010D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Nov 2015 02:32:42 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 19 Nov 2015 18:32:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,320,1444719600"; d="scan'208";a="603707606"
Received: from ywong15-mobl2.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.131.114])
	by FMSMGA003.fm.intel.com with ESMTP; 19 Nov 2015 18:32:41 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: mariano.lopez@linux.intel.com
Date: Fri, 20 Nov 2015 15:32:39 +1300
Message-ID: <1481526.SPystKB38S@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.12-101.fc21.x86_64; KDE/4.14.11; x86_64; ;
	)
In-Reply-To: <025384172ac445ea44ffcc9822fc19ef346e5f94.1447942163.git.mariano.lopez@linux.intel.com>
References: <cover.1447942163.git.mariano.lopez@linux.intel.com>
	<025384172ac445ea44ffcc9822fc19ef346e5f94.1447942163.git.mariano.lopez@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv3 1/6] license.bbclass: Write recipeinfo file in license folder
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
X-List-Received-Date: Fri, 20 Nov 2015 02:32:48 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Mariano,

On Thursday 19 November 2015 14:25:14 mariano.lopez@linux.intel.com wrote:
> From: Mariano Lopez <mariano.lopez@linux.intel.com>
> 
> Currently there is no way to get the recipe version when
> creating the rootfs. It is needed because the manifest
> file for the image has to contain this important piece
> of information.
> 
> This change writes a new file in the license folder for
> every recipe. This file is called "recipeinfo" and have
> the information used to write the manifest file for the
> recipes deployed next to the image.
> 
> [YOCTO #6772]
> 
> Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
> ---
>  meta/classes/license.bbclass | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
> index c616a20..7cf39e0 100644
> --- a/meta/classes/license.bbclass
> +++ b/meta/classes/license.bbclass
> @@ -142,6 +142,10 @@ python do_populate_lic() {
>      # The base directory we wrangle licenses to
>      destdir = os.path.join(d.getVar('LICSSTATEDIR', True), d.getVar('PN',
> True)) copy_license_files(lic_files_paths, destdir)
> +    info = get_recipe_info(d)
> +    with open(os.path.join(destdir, "recipeinfo"), "w") as f:
> +        for key in sorted(info.keys()):
> +            f.write("%s: %s\n" % (key, info[key]))
>  }
> 
>  # it would be better to copy them in do_install_append, but
> find_license_filesa is python @@ -156,6 +160,13 @@ python
> perform_packagecopy_prepend () {
>          add_package_and_files(d)
>  }
> 
> +def get_recipe_info(d):
> +    info = {}
> +    info["PV"] = d.getVar("PV", True)
> +    info["PR"] = d.getVar("PR", True)
> +    info["LICENSE"] = d.getVar("LICENSE")

This should be d.getVar("LICENSE", True) so that the value gets expanded 
(usually there aren't any variable references in LICENSE values but we can't 
discount it).

> +    return info
> +
>  def add_package_and_files(d):
>      packages = d.getVar('PACKAGES', True)
>      files = d.getVar('LICENSE_FILES_DIRECTORY', True)

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

