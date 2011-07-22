Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1QkPer-00069F-MT
	for openembedded-core@lists.openembedded.org;
	Sat, 23 Jul 2011 02:01:29 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 22 Jul 2011 16:57:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,250,1309762800"; d="scan'208";a="30977443"
Received: from unknown (HELO [10.255.14.51]) ([10.255.14.51])
	by orsmga001.jf.intel.com with ESMTP; 22 Jul 2011 16:57:16 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jul 2011 16:57:10 -0700
In-Reply-To: <5d2ad40722bd5bca32c9c1da396e5dfc252120c7.1311378711.git.sgw@linux.intel.com>
References: <cover.1311378711.git.sgw@linux.intel.com>
	<5d2ad40722bd5bca32c9c1da396e5dfc252120c7.1311378711.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.0.2 (3.0.2-3.fc15) 
Message-ID: <1311379036.8710.1.camel@scimitar>
Mime-Version: 1.0
Subject: Re: [PATCH 1/3] openjade-native: Add SYSROOT_PREPROCESS_FUNC
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
X-List-Received-Date: Sat, 23 Jul 2011 00:01:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-07-22 at 16:54 -0700, Saul Wold wrote:
> [YOCTO #1250]
> 
> This added function will install a private install-catalog binary so that shared state
> can find the binary as there is not a guarantee.
> 
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  .../openjade/openjade-native_1.3.2.bb              |   12 ++++++++++--
>  1 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb b/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
> index 1c672e1..3922968 100644
> --- a/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
> +++ b/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
> @@ -7,7 +7,7 @@ SECTION = "base"
>  LICENSE = "BSD"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=641ff1e4511f0a87044ad42f87cb1045"
>  
> -PR = "r2"
> +PR = "r3"
>  
>  DEPENDS = "opensp-native sgml-common-native"
>  RDEPENDS_${PN} = "sgml-common"
> @@ -31,6 +31,8 @@ CONFIGUREOPTS := "${@d.getVar('CONFIGUREOPTS', True).replace('--datadir=${datadi
>  CFLAGS =+ "-I${S}/include"
>  
>  SSTATEPOSTINSTFUNCS += "openjade_sstate_postinst"
> +SYSROOT_PREPROCESS_FUNCS += "openjade_sysroot_preprocess"
> +
>  
>  # We need to do this else the source interdependencies aren't generated and
>  # build failures can result (e.g. zero size style/Makefile.dep file)
> @@ -66,8 +68,14 @@ openjade_sstate_postinst() {
>  	then
>  		# Ensure that the catalog file sgml-docbook.cat is properly
>  		# updated when the package is installed from sstate cache.
> -		install-catalog \
> +		${SYSROOT_DESTDIR}${bindir_crossscripts}/install-catalog-openjade \
>  			--add ${sysconfdir}/sgml/sgml-docbook.cat \
>  			${sysconfdir}/sgml/openjade-${PV}.cat
>  	fi
>  }
> +
> +docbook_sgml_dtd_sysroot_preprocess () {

This is not the same function name as above...

> +    install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
> +    install -m 755 ${STAGING_BINDIR_NATIVE}/install-catalog ${SYSROOT_DESTDIR}${bindir_crossscripts}/install-catalog-openjade
> +}
> +

-- 
Joshua Lock
        Yocto Project "Johannes factotum"
        Intel Open Source Technology Centre



