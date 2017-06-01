Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 6135660765
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jun 2017 15:00:52 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Jun 2017 08:00:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,280,1493708400"; d="scan'208";a="268999117"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.119])
	by fmsmga004.fm.intel.com with ESMTP; 01 Jun 2017 08:00:51 -0700
Message-ID: <1496329769.26945.72.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: "Gan, Yau Wai" <yau.wai.gan@intel.com>
Date: Thu, 01 Jun 2017 10:09:29 -0500
In-Reply-To: <1496276679-137217-1-git-send-email-yau.wai.gan@intel.com>
References: <1496276679-137217-1-git-send-email-yau.wai.gan@intel.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Gan@mail.openembedded.org, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] insane.bbclass: fix override handling in RDEPENDS QA
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
X-List-Received-Date: Thu, 01 Jun 2017 15:00:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-05-31 at 17:24 -0700, Gan, Yau Wai wrote:
> The package_qa_check_rdepends() in insane.bbclass has
> incorrectly replace its localdata OVERRIDES value with
> the package name. Fixing it by appending the package name
> to the existing OVERRIDES value. This resolves RDEPENDS QA
> error when setting PACKAGECONFIG using a pn- override at
> local.conf.
> 
> [YOCTO #11374]
> 
> Signed-off-by: Gan, Yau Wai <yau.wai.gan@intel.com>
> ---
>  meta/classes/insane.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index dc1c2f8..5a3d017 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -867,7 +867,7 @@ def package_qa_check_rdepends(pkg, pkgdest, skip, taskdeps, packages, d):
>  
>      if not "-dbg" in pkg and not "packagegroup-" in pkg and not "-image" in pkg:
>          localdata = bb.data.createCopy(d)
> -        localdata.setVar('OVERRIDES', pkg)
> +        localdata.setVar('OVERRIDES', localdata.getVar('OVERRIDES') + ':' + pkg)

you may use localdata.appendVar instead of setting the value again.

>  
>          # Now check the RDEPENDS
>          rdepends = bb.utils.explode_deps(localdata.getVar('RDEPENDS') or "")
> -- 
> 2.7.4
> 



