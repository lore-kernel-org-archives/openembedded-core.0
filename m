Return-Path: <saul.wold@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1F43D731F7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Apr 2016 01:33:24 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 04 Apr 2016 18:33:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,442,1455004800"; d="scan'208";a="79073034"
Received: from anandsan-mobl.amr.corp.intel.com ([10.254.19.102])
	by fmsmga004.fm.intel.com with ESMTP; 04 Apr 2016 18:33:24 -0700
Message-ID: <1459820004.18406.230.camel@intel.com>
From: Saul Wold <saul.wold@intel.com>
To: Bill Randle <william.c.randle@intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 04 Apr 2016 18:33:24 -0700
In-Reply-To: <1459786689-13082-1-git-send-email-william.c.randle@intel.com>
References: <1459786689-13082-1-git-send-email-william.c.randle@intel.com>
X-Mailer: Evolution 3.18.5.1 (3.18.5.1-1.fc23) 
Mime-Version: 1.0
Subject: Re: [PATCH] bdwgc: use github repo for source location
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
X-List-Received-Date: Tue, 05 Apr 2016 01:33:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2016-04-04 at 09:18 -0700, Bill Randle wrote:
> The Yocto Autobuilder has been unable to fetch the release package
> from the developer's website at www.hboehm.info, so change recipe
> to fetch from the developer's github repo instead.
> 
> Signed-off-by: Bill Randle <william.c.randle@intel.com>
> ---
>  meta/recipes-support/bdwgc/bdwgc_7.4.2.bb | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/recipes-support/bdwgc/bdwgc_7.4.2.bb
> b/meta/recipes-support/bdwgc/bdwgc_7.4.2.bb
> index 95e358f..7a4110d 100644
> --- a/meta/recipes-support/bdwgc/bdwgc_7.4.2.bb
> +++ b/meta/recipes-support/bdwgc/bdwgc_7.4.2.bb
> @@ -21,12 +21,10 @@ SECTION = "devel"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM =
> "file://README.QUICK;md5=55f5088f90a982fed7af9a4897047ef7"
>  
> -SRC_URI = "http://www.hboehm.info/gc/gc_source/gc-${PV}.tar.gz \
> +SRCREV = "e31cdc288ffbee5bf25f948e19deb5a7ce846971"
> +SRC_URI = "git://github.com/ivmai/bdwgc.git;branch=release-7_4 \
>             file://0001-fix-build-with-musl.patch \
>            "

It appears that when you updated to the git location the source base
might have changed and the MUSL patch is no longer applyng correctly.

Please verify that the patch correctly applies.

See the failure in master-next with your patch:

https://autobuilder.yoctoproject.org/main/builders/nightly-no-x11/build
s/76/steps/BuildImages/logs/stdio

This might cause more failures in the Autobuilder, this is the first
that I saw.

Sau!


> -
> -SRC_URI[md5sum] = "12c05fd2811d989341d8c6d81f66af87"
> -SRC_URI[sha256sum] =
> "63320ad7c45460e4a40e03f5aa4c6893783f21a16416c3282b994f933312afa2"
>  FILES_${PN}-doc = "/usr/share"
>  
>  REAL_PV = "${@[d.getVar('PV',1)[:-1],
> d.getVar('PV',1)][(d.getVar('PV',1)[-1]).isdigit()]}"
> -- 
> 2.5.0
> 

