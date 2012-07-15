Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Randy.MacLeod@windriver.com>) id 1SqFKj-00023P-Fl
	for openembedded-core@lists.openembedded.org;
	Sun, 15 Jul 2012 05:17:24 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q6F363gU009578
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Jul 2012 20:06:03 -0700 (PDT)
Received: from [128.224.22.51] (128.224.22.51) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Sat, 14 Jul 2012 20:06:02 -0700
Message-ID: <50023399.8030603@windriver.com>
Date: Sat, 14 Jul 2012 23:06:01 -0400
From: Randy MacLeod <randy.macleod@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>, Morgan Little
	<morgan.little@windriver.com>
References: <1342187709-19368-1-git-send-email-morgan.little@windriver.com>
	<1342187709-19368-2-git-send-email-morgan.little@windriver.com>
In-Reply-To: <1342187709-19368-2-git-send-email-morgan.little@windriver.com>
X-Originating-IP: [128.224.22.51]
Subject: Re: [PATCH 01/20] python-native: Put binaries in seperate directory
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
X-List-Received-Date: Sun, 15 Jul 2012 03:17:24 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12-07-13 09:54 AM, Morgan Little wrote:
> Update python-native to install the binaries in the python-native directory,
> add pythonnative.bbclass to let recipes that need python-native use the
> binaries and update disutils access the new binaries.
>
> Signed-off-by: Morgan Little <morgan.little@windriver.com>
> ---
>   meta/classes/distutils.bbclass                     |   14 +++++++++-----
>   meta/classes/pythonnative.bbclass                  |    3 +++
>   .../recipes-devtools/python/python-native_2.7.3.bb |    9 ++++++---
>   3 files changed, 18 insertions(+), 8 deletions(-)
>   create mode 100644 meta/classes/pythonnative.bbclass
>
> diff --git a/meta/classes/distutils.bbclass b/meta/classes/distutils.bbclass
> index bcddf8d..f731257 100644
> --- a/meta/classes/distutils.bbclass
> +++ b/meta/classes/distutils.bbclass
> @@ -1,4 +1,4 @@
> -inherit distutils-base
> +inherit distutils-base pythonnative
>
>   DISTUTILS_BUILD_ARGS ?= ""
>   DISTUTILS_STAGE_HEADERS_ARGS ?= "--install-dir=${STAGING_INCDIR}/${PYTHON_DIR}"
> @@ -11,14 +11,14 @@ distutils_do_compile() {
>            STAGING_INCDIR=${STAGING_INCDIR} \
>            STAGING_LIBDIR=${STAGING_LIBDIR} \
>            BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
> -         ${STAGING_BINDIR_NATIVE}/python setup.py build ${DISTUTILS_BUILD_ARGS} || \
> +         ${STAGING_BINDIR_NATIVE}/python-native/python setup.py build ${DISTUTILS_BUILD_ARGS} || \
>            bbfatal "python setup.py build_ext execution failed."
>   }
>
>   distutils_stage_headers() {
>           install -d ${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR}
>           BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
> -        ${STAGING_BINDIR_NATIVE}/python setup.py install_headers ${DISTUTILS_STAGE_HEADERS_ARGS} || \
> +        ${STAGING_BINDIR_NATIVE}/python-native/python setup.py install_headers ${DISTUTILS_STAGE_HEADERS_ARGS} || \
>           bbfatal "python setup.py install_headers execution failed."
>   }
>
> @@ -28,7 +28,7 @@ distutils_stage_all() {
>           install -d ${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR}
>           PYTHONPATH=${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR} \
>           BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
> -        ${STAGING_BINDIR_NATIVE}/python setup.py install ${DISTUTILS_STAGE_ALL_ARGS} || \
> +        ${STAGING_BINDIR_NATIVE}/python-native/python setup.py install ${DISTUTILS_STAGE_ALL_ARGS} || \
>           bbfatal "python setup.py install (stage) execution failed."
>   }
>
> @@ -38,7 +38,7 @@ distutils_do_install() {
>           STAGING_LIBDIR=${STAGING_LIBDIR} \
>           PYTHONPATH=${D}/${PYTHON_SITEPACKAGES_DIR} \
>           BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
> -        ${STAGING_BINDIR_NATIVE}/python setup.py install ${DISTUTILS_INSTALL_ARGS} || \
> +        ${STAGING_BINDIR_NATIVE}/python-native/python setup.py install ${DISTUTILS_INSTALL_ARGS} || \
>           bbfatal "python setup.py install execution failed."
>
>           for i in `find ${D} -name "*.py"` ; do \
> @@ -65,6 +65,10 @@ distutils_do_install() {
>           if test -e ${D}${datadir}/share; then
>               mv -f ${D}${datadir}/share/* ${D}${datadir}/
>           fi
> +
> +        # These are generated files, on really slow systems the storage/speed trade off
> +        # might be worth it, but in general it isn't
> +        find ${D}${libdir}/${PYTHON_DIR}/site-packages -iname '*.pyo' -exec rm {} \;

It may be true that in general it's not worth keeping .pyo files but
it's should be done as a separate commit. Also, if people agree that
we don't need those files, can we avoid generating them to begin with?

The rest of the commits look fine to me.

// Randy


>   }
>
>   EXPORT_FUNCTIONS do_compile do_install
> diff --git a/meta/classes/pythonnative.bbclass b/meta/classes/pythonnative.bbclass
> new file mode 100644
> index 0000000..bc346da
> --- /dev/null
> +++ b/meta/classes/pythonnative.bbclass
> @@ -0,0 +1,3 @@
> +PYTHON="${STAGING_BINDIR_NATIVE}/python-native/python"
> +PATH_prepend = "${STAGING_BINDIR_NATIVE}/python-native:"
> +DEPENDS += " python-native "
> diff --git a/meta/recipes-devtools/python/python-native_2.7.3.bb b/meta/recipes-devtools/python/python-native_2.7.3.bb
> index 50bf894..a4cbdcd 100644
> --- a/meta/recipes-devtools/python/python-native_2.7.3.bb
> +++ b/meta/recipes-devtools/python/python-native_2.7.3.bb
> @@ -1,6 +1,6 @@
>   require python.inc
>   DEPENDS = "openssl-native bzip2-full-native zlib-native readline-native sqlite3-native"
> -PR = "${INC_PR}.0"
> +PR = "${INC_PR}.1"
>
>   SRC_URI += "file://04-default-is-optimized.patch \
>              file://05-enable-ctypes-cross-build.patch \
> @@ -20,6 +20,8 @@ inherit native
>
>   RPROVIDES += "python-distutils-native python-compression-native python-textutils-native python-core-native"
>
> +EXTRA_OECONF += " --bindir=${bindir}/${PN}"
> +
>   EXTRA_OEMAKE = '\
>     BUILD_SYS="" \
>     HOST_SYS="" \
> @@ -35,10 +37,11 @@ do_configure_prepend() {
>   do_install() {
>   	oe_runmake 'DESTDIR=${D}' install
>   	install -d ${D}${bindir}/
> -	install -m 0755 Parser/pgen ${D}${bindir}/
> +	install -d ${D}${bindir}/${PN}
> +	install -m 0755 Parser/pgen ${D}${bindir}/${PN}
>
>   	# Make sure we use /usr/bin/env python
> -	for PYTHSCRIPT in `grep -rIl ${bindir}/python ${D}${bindir}`; do
> +	for PYTHSCRIPT in `grep -rIl ${bindir}/${PN}/python ${D}${bindir}/${PN}`; do
>   		sed -i -e '1s|^#!.*|#!/usr/bin/env python|' $PYTHSCRIPT
>   	done
>   }
>


-- 
# Randy MacLeod. MTS, Linux, Wind River
Direct: 613.963.1350




