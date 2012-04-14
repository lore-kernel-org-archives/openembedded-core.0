Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SIqfo-0001Yh-LJ
	for openembedded-core@lists.openembedded.org;
	Sat, 14 Apr 2012 02:17:04 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 13 Apr 2012 17:07:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="132288618"
Received: from unknown (HELO envy.home) ([10.255.12.99])
	by orsmga002.jf.intel.com with ESMTP; 13 Apr 2012 17:07:41 -0700
Message-ID: <4F88BFAA.4010106@linux.intel.com>
Date: Fri, 13 Apr 2012 17:07:06 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120209 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1334311268.git.dexuan.cui@intel.com>
	<01480f0f7418b8ceac72201e1b285495d2e23d58.1334311268.git.dexuan.cui@intel.com>
In-Reply-To: <01480f0f7418b8ceac72201e1b285495d2e23d58.1334311268.git.dexuan.cui@intel.com>
X-Enigmail-Version: 1.4
Subject: Re: [PATCH 1/1] nspr: fix package spliting
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 14 Apr 2012 00:17:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 04/13/2012 03:04 AM, Dexuan Cui wrote:
> Here /usr/lib/lib*.so files are binaries rather than symbol links.
> We should package them into ${PN} rather than ${PN}-dev, or else,
> when a package, that rdepends on nspr, is packaged, we get a
> "non-dev package rdepends on nspr-dev" ERROR.

Applied and built for qemux86. Had to bump PR to "r4" to increase past
another applied change.

> Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>

Tested-by: Darren Hart <dvhart@linux.intel.com>

> ---
>  meta/recipes-support/nspr/nspr_4.8.9.bb |    7 ++++---
>  1 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-support/nspr/nspr_4.8.9.bb b/meta/recipes-support/nspr/nspr_4.8.9.bb
> index 8b840d9..d3c683c 100644
> --- a/meta/recipes-support/nspr/nspr_4.8.9.bb
> +++ b/meta/recipes-support/nspr/nspr_4.8.9.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://configure.in;beginline=3;endline=40;md5=99d4d7d68bbc4
>                      file://Makefile.in;beginline=4;endline=38;md5=c2b512182a334e1bfa1edc4d1c84a298 "
>  SECTION = "libs/network"
>  
> -PR = "r2"
> +PR = "r3"
>  
>  SRC_URI = "ftp://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v${PV}/src/nspr-${PV}.tar.gz \
>             file://remove-rpath-from-tests.patch \
> @@ -160,6 +160,7 @@ do_install_append() {
>      install -m 0755 ${TESTS} ${D}${libdir}/nspr/tests
>  }
>  
> -FILES_${PN} = "${bindir}/*"
> -FILES_${PN}-dev += "${libdir}/nspr/tests/*"
> +FILES_${PN} = "${bindir}/* ${libdir}/lib*.so"
> +FILES_${PN}-dev = "${libdir}/nspr/tests/* ${libdir}/pkgconfig \
> +                ${includedir}/* ${datadir}/aclocal/* "
>  FILES_${PN}-dbg += "${libdir}/nspr/tests/.debug/*"

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


