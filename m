Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 8801A606A8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Aug 2017 14:14:12 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Aug 2017 07:14:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,377,1498546800"; d="scan'208";a="139824089"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.134])
	by fmsmga005.fm.intel.com with ESMTP; 15 Aug 2017 07:14:13 -0700
Message-ID: <1502806980.28941.38.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
Date: Tue, 15 Aug 2017 09:23:00 -0500
In-Reply-To: <1502763838-84450-1-git-send-email-ee.peng.yeoh@intel.com>
References: <1502763838-84450-1-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] insane: add qa check for lowercase recipe name
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
X-List-Received-Date: Tue, 15 Aug 2017 14:14:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2017-08-14 at 19:23 -0700, Yeoh Ee Peng wrote:
> Since we disabled uppercase characters in overrides a few releases ago,
> uppercase characters in recipe names (and for that matter, distro and
> machine names) cannot be supported due to their reliance upon overrides
> including the name.
> 
> QA check will produce an warning message when it verify that recipe
> name is not lowercase.
> 
> [YOCTO# 11592]
> 
> Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
> ---
>  meta/classes/insane.bbclass | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index b7177c9..8e062d1 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -27,7 +27,7 @@ WARN_QA ?= "ldflags useless-rpaths rpaths staticdev libdir xorg-driver-abi \
>              installed-vs-shipped compile-host-path install-host-path \
>              pn-overrides infodir build-deps \
>              unknown-configure-option symlink-to-sysroot multilib \
> -            invalid-packageconfig host-user-contaminated \
> +            invalid-packageconfig host-user-contaminated pn_lowercase \
>              "

IMO, what you warn is that variable has uppercase letters, so the test
should be named 'pn_uppercase'


>  ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
>              perms dep-cmp pkgvarcheck perm-config perm-line perm-link \
> @@ -1274,7 +1274,9 @@ python () {
>      if pn in overrides:
>          msg = 'Recipe %s has PN of "%s" which is in OVERRIDES, this can result in unexpected behaviour.' % (d.getVar("FILE"), pn)
>          package_qa_handle_error("pn-overrides", msg, d)
> -
> +    if pn != pn.lower():
> +        package_qa_handle_error("pn_lowercase", 'PN: %s is not lower case, this can result in unexpected behavior.' % pn, d)
> +    

for performance reasons, perhaps it would be better to create a regex
matching uppercases and if match succeeded, the raise the error/warning

One more thing. At the beginning of the insane class, on the comments
area you can include this one on the 'Checks we do' section.

>      issues = []
>      if (d.getVar('PACKAGES') or "").split():
>          for dep in (d.getVar('QADEPENDS') or "").split():
> -- 
> 2.7.4
> 



