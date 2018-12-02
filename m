Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 46D086C2B3
	for <openembedded-core@lists.openembedded.org>;
	Sun,  2 Dec 2018 10:43:50 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	wB2AhnLh012341
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Sun, 2 Dec 2018 10:43:50 GMT
Message-ID: <6f1b3209e6b40f0b796f68dd8c638bb0f89a241c.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Joslyn <robert.joslyn@redrectangle.org>,
	openembedded-core@lists.openembedded.org
Date: Sun, 02 Dec 2018 10:43:49 +0000
In-Reply-To: <20181202031408.28161-1-robert.joslyn@redrectangle.org>
References: <20181202031408.28161-1-robert.joslyn@redrectangle.org>
User-Agent: Evolution 3.30.1-1build1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH v2] pciutils: Move headers from pciutils-dev to libpci-dev
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
X-List-Received-Date: Sun, 02 Dec 2018 10:43:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2018-12-01 at 19:14 -0800, Robert Joslyn wrote:
> The pciutils recipe places libpci in a separate package, but the
> default
> package split puts the headers for the library in pciutils-dev. When
> building an SDK for an image that uses libpci, but not pciutils, the
> headers for libpci are not included.
> 
> Move the headers, unversioned so symlink, and pkgconfig files from
> pciutils-dev to libpci-dev so the SDK gets those files for images
> using
> libpci.
> 
> Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
> ---
>  meta/recipes-bsp/pciutils/pciutils_3.6.2.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-bsp/pciutils/pciutils_3.6.2.bb
> b/meta/recipes-bsp/pciutils/pciutils_3.6.2.bb
> index 413421cd8a..de1e54e5a5 100644
> --- a/meta/recipes-bsp/pciutils/pciutils_3.6.2.bb
> +++ b/meta/recipes-bsp/pciutils/pciutils_3.6.2.bb
> @@ -52,9 +52,11 @@ do_install () {
>  	oe_multilib_header pci/config.h
>  }
>  
> -PACKAGES =+ "${PN}-ids libpci"
> +PACKAGES =+ "${PN}-ids libpci libpci-dev"
>  FILES_${PN}-ids = "${datadir}/pci.ids*"
>  FILES_libpci = "${libdir}/libpci.so.*"
> +FILES_libpci-dev = "${includedir} ${FILES_SOLIBSDEV}
> ${libdir}/pkgconfig"
>  SUMMARY_${PN}-ids = "PCI utilities - device ID database"
>  DESCRIPTION_${PN}-ids = "Package providing the PCI device ID
> database for pciutils."
>  RDEPENDS_${PN} += "${PN}-ids"
> +RDEPENDS_libpci-dev = "libpci (= ${EXTENDPKGV})"

"dev" packages per library don't really work unfortunately as most code
can't be split like that.

The general policy is one dev package per recipe. This patch doesn't
just move things but creates a new package.

The dev-pkgs code should be resolving "libpci" back to "pciutils" and
from there it can figure out it should be adding pciutils-dev, that is
the real bug we need to fix.

Cheers,

Richard




