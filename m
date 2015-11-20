Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 845F66072B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Nov 2015 02:33:57 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 19 Nov 2015 18:33:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,320,1444719600"; d="scan'208";a="603707993"
Received: from ywong15-mobl2.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.131.114])
	by FMSMGA003.fm.intel.com with ESMTP; 19 Nov 2015 18:33:55 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: mariano.lopez@linux.intel.com
Date: Fri, 20 Nov 2015 15:33:50 +1300
Message-ID: <1475508.sjhLkkp2DV@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.12-101.fc21.x86_64; KDE/4.14.11; x86_64; ;
	)
In-Reply-To: <bc8afc65a1ecd361a682a1e543731d107521c61e.1447942163.git.mariano.lopez@linux.intel.com>
References: <cover.1447942163.git.mariano.lopez@linux.intel.com>
	<bc8afc65a1ecd361a682a1e543731d107521c61e.1447942163.git.mariano.lopez@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv3 5/6] license.bbclass: Add function get_deployed_files
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
X-List-Received-Date: Fri, 20 Nov 2015 02:33:58 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 19 November 2015 14:25:18 mariano.lopez@linux.intel.com wrote:
> From: Mariano Lopez <mariano.lopez@linux.intel.com>
> 
> This function will get the files that were deployed using
> the sstate-control manifest file. This will give a better
> view of what was deployed next to the image.
> 
> [YOCTO #6772]
> 
> Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
> ---
>  meta/classes/license.bbclass | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
> index f012783..dbec4d7 100644
> --- a/meta/classes/license.bbclass
> +++ b/meta/classes/license.bbclass
> @@ -225,6 +225,21 @@ def get_boot_dependencies(d):
>                          break
>      return depends
> 
> +def get_deployed_files(man_file):
> +    """
> +    This will get the files deployed from the sstate manifest
> +    """
> +
> +    dep_files = ""
> +    excluded_files = ["README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt"]
> +    with open(man_file, "r") as manifest:
> +        all_files = manifest.read()
> +    for f in all_files.splitlines():
> +        if ((not (os.path.islink(f) or os.path.isdir(f))) and
> +                not os.path.basename(f) in excluded_files):
> +            dep_files = "%s %s" % (dep_files, os.path.basename(f))
> +    return dep_files

As per get_boot_dependencies(), best to return a proper list here.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

