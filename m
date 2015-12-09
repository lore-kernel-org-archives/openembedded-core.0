Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 01DBE6FF76
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Dec 2015 22:04:30 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 09 Dec 2015 14:04:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,405,1444719600"; d="scan'208";a="857609641"
Received: from uungkuab-mobl2.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.142.29])
	by fmsmga001.fm.intel.com with ESMTP; 09 Dec 2015 14:04:28 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Alejandro del Castillo <alejandro.delcastillo@ni.com>
Date: Thu, 10 Dec 2015 11:04:26 +1300
Message-ID: <1750958.3rdPrcUnoM@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.2.6-301.fc23.x86_64; KDE/4.14.14; x86_64; ;
	)
In-Reply-To: <1449694203-15173-1-git-send-email-alejandro.delcastillo@ni.com>
References: <1449694203-15173-1-git-send-email-alejandro.delcastillo@ni.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libsolv: add new recipe
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
X-List-Received-Date: Wed, 09 Dec 2015 22:04:33 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Alejandro,

On Wed, 09 Dec 2015 14:50:03 Alejandro del Castillo wrote:
> Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>

So perhaps it was discussed elsewhere, but in any case if you want this to be 
added to OE-Core there needs to be something mentioned in the commit message 
about why - what needs this? If nothing, is OE-Core the best place for it?

> ---
>  meta/recipes-extended/libsolv/libsolv_0.6.14.bb | 26
> +++++++++++++++++++++++++ 1 file changed, 26 insertions(+)
>  create mode 100644 meta/recipes-extended/libsolv/libsolv_0.6.14.bb
> 
> diff --git a/meta/recipes-extended/libsolv/libsolv_0.6.14.bb
> b/meta/recipes-extended/libsolv/libsolv_0.6.14.bb new file mode 100644
> index 0000000..14955da
> --- /dev/null
> +++ b/meta/recipes-extended/libsolv/libsolv_0.6.14.bb
> @@ -0,0 +1,26 @@
> +SUMMARY = "Library for solving packages and reading repositories"
> +HOMEPAGE = "https://github.com/openSUSE/libsolv"
> +BUGTRACKER = "https://github.com/openSUSE/libsolv/issues"
> +SECTION = "devel"
> +LICENSE = "BSD"

LICENSE should be more specific - BSD-2-Clause, BSD-3-Clause, etc.

> +LIC_FILES_CHKSUM =
> "file://LICENSE.BSD;md5=62272bd11c97396d4aaf1c41bc11f7d8" +
>
> +SRC_URI = "https://github.com/openSUSE/libsolv/archive/0.6.14.zip"

Please use ${PV} instead of 0.6.14 here to make future upgrades easier.

> +SRC_URI[md5sum] = "171da68f08f672cacd1930643f8d1b4d"
> +SRC_URI[sha256sum] =
> "0263b11372012be9c83f1c01f7d55ea9464dde58c109f5ae4de1e52870034a45" 
> +
> +PACKAGES =+ "${PN}-tools ${PN}ext ${PN}ext-dbg"

The PACKAGES line should move down before the FILES lines since this has to do 
with packaging.

> +
> +S = "${WORKDIR}/libsolv-0.6.14"

As per SRC_URI, please use ${PV} instead of 0.6.14 here.

> +
> +inherit cmake
> +
> +EXTRA_OECMAKE = "-DLIB=${baselib}"
> +
> +DEPENDS = "expat zlib"
> +
> +FILES_${PN}-dev += "${datadir}/cmake/Modules/FindLibSolv.cmake"
> +FILES_${PN}-tools = "${bindir}/*"
> +FILES_${PN}ext = "${libdir}/${PN}ext.so.*"
> +FILES_${PN}ext-dbg = "${libdir}/.debug/${PN}ext.so.*"

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

