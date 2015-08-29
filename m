Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 45A72766DF
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Aug 2015 11:18:09 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 29 Aug 2015 04:18:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,429,1437462000"; d="scan'208";a="634497279"
Received: from fjclune-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.18.75])
	by orsmga003.jf.intel.com with ESMTP; 29 Aug 2015 04:18:08 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Alex Franco <alejandro.franco@linux.intel.com>
Date: Sat, 29 Aug 2015 12:18:07 +0100
Message-ID: <1443154.Z0jeO7rfN8@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.5-100.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <1440626255-29614-2-git-send-email-alejandro.franco@linux.intel.com>
References: <1440626255-29614-1-git-send-email-alejandro.franco@linux.intel.com>
	<1440626255-29614-2-git-send-email-alejandro.franco@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] Empty image: core-image-empty recipe, Rootfs fix
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
X-List-Received-Date: Sat, 29 Aug 2015 11:18:13 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Alex,

On Wednesday 26 August 2015 16:57:33 Alex Franco wrote:
> Added a core-image-empty recipe, as well as a DpkgOpkgRootfs test
> which skips the package post installs step, if PACKAGE_INSTALL is
> empty.
> 
> [YOCTO #7664]
> 
> Signed-off-by: Alex Franco <alejandro.franco@linux.intel.com>
> ---
>  meta/lib/oe/rootfs.py                        | 6 +++++-
>  meta/recipes-core/images/core-image-empty.bb | 7 +++++++
>  2 files changed, 12 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-core/images/core-image-empty.bb
> 
> diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
> index 8c8244c..f8cc6eb 100644
> --- a/meta/lib/oe/rootfs.py
> +++ b/meta/lib/oe/rootfs.py
> @@ -585,7 +585,11 @@ class DpkgOpkgRootfs(Rootfs):
> 
>          pkg_list = []
> 
> -        pkgs = self._get_pkgs_postinsts(status_file)
> +        pkgs = None
> +        if not self.d.getVar('PACKAGE_INSTALL', True).strip():
> +            bb.note("Building empty image")
> +        else:
> +            pkgs = self._get_pkgs_postinsts(status_file)
>          if pkgs:
>              root = "__packagegroup_postinst__"
>              pkgs[root] = pkgs.keys()
> diff --git a/meta/recipes-core/images/core-image-empty.bb
> b/meta/recipes-core/images/core-image-empty.bb new file mode 100644
> index 0000000..550567c
> --- /dev/null
> +++ b/meta/recipes-core/images/core-image-empty.bb
> @@ -0,0 +1,7 @@
> +SUMMARY = "An empty image."
> +IMAGE_INSTALL = ""
> +IMAGE_LINGUAS = ""
> +PACKAGE_INSTALL = ""
> +LICENSE = "MIT"
> +
> +inherit image

Could you please put this image recipe into meta-selftest instead (call it oe-
selftest-empty-image.bb) and add an oe-selftest test to ensure it builds and 
is empty?

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

