Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web10.8281.1631085314702526047
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Sep 2021 00:15:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay10.mail.gandi.net (Postfix) with ESMTPSA id 1E45D240004;
	Wed,  8 Sep 2021 07:15:10 +0000 (UTC)
Date: Wed, 8 Sep 2021 09:15:10 +0200
From: "Alexandre Belloni" <alexandre.belloni@bootlin.com>
To: oleh.matiusha@globallogic.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] findutils: add ptest
Message-ID: <YThi/ng0+Iy3SItA@piout.net>
References: <20210907103541.739344-1-oleh.matiusha@globallogic.com>
MIME-Version: 1.0
In-Reply-To: <20210907103541.739344-1-oleh.matiusha@globallogic.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

Thank you for the patch but it causes the following warning:

WARNING: findutils-4.8.0-r0 do_package_qa: QA Issue: supports ptests but is not included in oe-core's ptest-packagelists.inc [missing-ptest]

On 07/09/2021 13:35:41+0300, Oleh Matiusha via lists.openembedded.org wrote:
> Signed-off-by: Oleh Matiusha <oleh.matiusha@globallogic.com>
> ---
>  meta/recipes-extended/findutils/findutils.inc |  6 +-
>  .../findutils/findutils/run-ptest             | 57 +++++++++++++++++++
>  .../findutils/findutils_4.8.0.bb              | 11 ++++
>  3 files changed, 72 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-extended/findutils/findutils/run-ptest
> 
> diff --git a/meta/recipes-extended/findutils/findutils.inc b/meta/recipes-extended/findutils/findutils.inc
> index ea8a1b7afe..ddcc05750b 100644
> --- a/meta/recipes-extended/findutils/findutils.inc
> +++ b/meta/recipes-extended/findutils/findutils.inc
> @@ -6,9 +6,11 @@ HOMEPAGE = "http://www.gnu.org/software/findutils/"
>  BUGTRACKER = "http://savannah.gnu.org/bugs/?group=findutils"
>  SECTION = "console/utils"
>  
> -SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.xz"
> +SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.xz \
> +          file://run-ptest \
> +          "
>  
> -inherit autotools gettext texinfo update-alternatives
> +inherit autotools gettext texinfo update-alternatives ptest
>  
>  ALTERNATIVE:${PN} = "find xargs"
>  ALTERNATIVE_PRIORITY = "100"
> diff --git a/meta/recipes-extended/findutils/findutils/run-ptest b/meta/recipes-extended/findutils/findutils/run-ptest
> new file mode 100644
> index 0000000000..ec71583c51
> --- /dev/null
> +++ b/meta/recipes-extended/findutils/findutils/run-ptest
> @@ -0,0 +1,57 @@
> +#!/bin/bash
> +
> +# create temporary symlink to workaround missing oldfind
> +ln -s /usr/bin/find /tmp/oldfind
> +# make oldfind visible
> +export PATH="/tmp:${PATH}"
> +
> +export built_programs="find xargs locate updatedb"
> +
> +# this gets substituted by sed during build
> +export VERSION="__run_ptest_version__"
> +
> +# define missing functions for tests/init.sh
> +fu_path_prepend_ () {
> +	path_prepend_ $@
> +}
> +
> +print_ver_ () {
> +	:
> +}
> +
> +skip_if_root_ () {
> +	[ $(id -u) = 0 ] && exit 77;
> +}
> +
> +require_root_ () {
> +	[ $(id -u) = 0 ] || exit 77;
> +}
> +
> +expensive_ () {
> +	:
> +}
> +
> +export -f fu_path_prepend_
> +export -f print_ver_
> +export -f skip_if_root_
> +export -f require_root_
> +export -f expensive_
> +
> +
> +for f in tests/*/*.sh; do
> +	bash $f ;
> +	case $? in
> +		0 )
> +			echo -n "PASS";;
> +		77 )
> +			echo -n "SKIP";;
> +		* )
> +			echo -n "FAIL";;
> +	esac
> +	echo ": $f"
> +done
> +
> +#remove symlink
> +rm -f /tmp/oldfind
> +
> +echo
> diff --git a/meta/recipes-extended/findutils/findutils_4.8.0.bb b/meta/recipes-extended/findutils/findutils_4.8.0.bb
> index 675e53c0da..356fb05be6 100644
> --- a/meta/recipes-extended/findutils/findutils_4.8.0.bb
> +++ b/meta/recipes-extended/findutils/findutils_4.8.0.bb
> @@ -12,3 +12,14 @@ SRC_URI[sha256sum] = "57127b7e97d91282c6ace556378d5455a9509898297e46e10443016ea1
>  CACHED_CONFIGUREVARS += "gl_cv_func_wcwidth_works=yes"
>  
>  EXTRA_OECONF += "ac_cv_path_SORT=${bindir}/sort"
> +
> +RDEPENDS:${PN}-ptest += "bash sed grep"
> +
> +do_install_ptest:class-target() {
> +	mkdir -p ${D}${PTEST_PATH}/tests/
> +	cp -r ${S}/tests/* ${D}${PTEST_PATH}/tests/
> +
> +	# substitute value in run-ptest with actual version
> +	sed -i -e 's/__run_ptest_version__/${PV}/' ${D}${PTEST_PATH}/run-ptest
> +
> +}
> -- 
> 2.25.1
> 

> 
> 
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
