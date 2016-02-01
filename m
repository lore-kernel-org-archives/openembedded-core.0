Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 80E077666E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Feb 2016 18:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u11I27if019211; Mon, 1 Feb 2016 18:02:28 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id aR2n9rTuysEk; Mon,  1 Feb 2016 18:02:28 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u11I2Pew019220
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 1 Feb 2016 18:02:26 GMT
Message-ID: <1454349745.27087.51.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Mon, 01 Feb 2016 18:02:25 +0000
In-Reply-To: <17891198365760fe79cd82566cc34a66a2226d54.1454303080.git.raj.khem@gmail.com>
References: <79e1257a6eb8ed2fa57f92fb34adc8b14ed880fe.1454303080.git.raj.khem@gmail.com>
	<17891198365760fe79cd82566cc34a66a2226d54.1454303080.git.raj.khem@gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 3/8] distutils: Consider S != B case
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
X-List-Received-Date: Mon, 01 Feb 2016 18:02:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-02-01 at 05:08 +0000, Khem Raj wrote:
> out of tree builds can break the assumption about setup.py being in
> the
> current directory, seen especially with devtool when using
> externalsrc
> many python modules cant build since it cant find setup.py in devtool
> workspace

Why do we need to "cd" in all cases, and put full paths to setup.py?
Shouldn't one or the other suffice? The [dirs] option to the functions
should alleviate the need to cd in most cases?

Cheers,

Richard

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/classes/distutils.bbclass  | 27 +++++++++++++++++----------
>  meta/classes/distutils3.bbclass | 26 +++++++++++++++++++-------
>  2 files changed, 36 insertions(+), 17 deletions(-)
> 
> diff --git a/meta/classes/distutils.bbclass
> b/meta/classes/distutils.bbclass
> index cd06713..d9e0086 100644
> --- a/meta/classes/distutils.bbclass
> +++ b/meta/classes/distutils.bbclass
> @@ -8,44 +8,51 @@ DISTUTILS_INSTALL_ARGS ?= "--prefix=${D}/${prefix}
> \
>      --install-data=${D}/${datadir}"
>  
>  distutils_do_compile() {
> -         STAGING_INCDIR=${STAGING_INCDIR} \
> -         STAGING_LIBDIR=${STAGING_LIBDIR} \
> -         BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
> -         ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}
> setup.py build ${DISTUTILS_BUILD_ARGS} || \
> -         bbfatal "${PYTHON_PN} setup.py build execution failed."
> +        cwd=$PWD;cd ${S}
> +        STAGING_INCDIR=${STAGING_INCDIR} \
> +        STAGING_LIBDIR=${STAGING_LIBDIR} \
> +        BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
> +        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}
> ${S}/setup.py build --build-base=${B} ${DISTUTILS_BUILD_ARGS} || \
> +        bbfatal "${PYTHON_PN} setup.py build execution failed."
> +        cd $cwd
>  }
>  
>  distutils_stage_headers() {
> +        cwd=$PWD;cd ${S}
>          install -d ${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR}
>          BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
> -        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}
> setup.py install_headers ${DISTUTILS_STAGE_HEADERS_ARGS} || \
> +        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}
> ${S}/setup.py install_headers ${DISTUTILS_STAGE_HEADERS_ARGS} || \
>          bbfatal "${PYTHON_PN} setup.py install_headers execution
> failed."
> +        cd $cwd
>  }
>  
>  distutils_stage_all() {
> +        cwd=$PWD;cd ${S}
>          STAGING_INCDIR=${STAGING_INCDIR} \
>          STAGING_LIBDIR=${STAGING_LIBDIR} \
>          install -d ${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR}
>          PYTHONPATH=${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR} \
>          BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
> -        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}
> setup.py install ${DISTUTILS_STAGE_ALL_ARGS} || \
> +        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}
> ${S}/setup.py install ${DISTUTILS_STAGE_ALL_ARGS} || \
>          bbfatal "${PYTHON_PN} setup.py install (stage) execution
> failed."
> +        cd $cwd
>  }
>  
>  distutils_do_install() {
> +        cwd=$PWD;cd ${S}
>          install -d ${D}${PYTHON_SITEPACKAGES_DIR}
>          STAGING_INCDIR=${STAGING_INCDIR} \
>          STAGING_LIBDIR=${STAGING_LIBDIR} \
>          PYTHONPATH=${D}${PYTHON_SITEPACKAGES_DIR} \
>          BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
> -        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}
> setup.py install --install-lib=${D}/${PYTHON_SITEPACKAGES_DIR}
> ${DISTUTILS_INSTALL_ARGS} || \
> +        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}
> ${S}/setup.py install --install-lib=${D}/${PYTHON_SITEPACKAGES_DIR}
> ${DISTUTILS_INSTALL_ARGS} || \
>          bbfatal "${PYTHON_PN} setup.py install execution failed."
>  
>          # support filenames with *spaces*
>          # only modify file if it contains path  and recompile it
>          find ${D} -name "*.py" -exec grep -q ${D} {} \; -exec sed -i
> -e s:${D}::g {} \; -exec ${STAGING_BINDIR_NATIVE}/python
> -native/python -mcompileall {} \;
>  
> -        if test -e ${D}${bindir} ; then	
> +        if test -e ${D}${bindir} ; then
>              for i in ${D}${bindir}/* ; do \
>                  if [ ${PN} != "${BPN}-native" ]; then
>                  	sed -i -e s:${STAGING_BINDIR_NATIVE}/python
> -native/python:${bindir}/env\ python:g $i
> @@ -65,7 +72,6 @@ distutils_do_install() {
>  
>          rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/easy-install.pth
>          rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/site.py*
> -        
>          #
>          # FIXME: Bandaid against wrong datadir computation
>          #
> @@ -79,6 +85,7 @@ distutils_do_install() {
>  	   rm ${D}${PYTHON_SITEPACKAGES_DIR}/backports/__init__.py;
>  	   rm ${D}${PYTHON_SITEPACKAGES_DIR}/backports/__init__.pyc;
>  	fi
> +        cd $cwd
>  }
>  
>  EXPORT_FUNCTIONS do_compile do_install
> diff --git a/meta/classes/distutils3.bbclass
> b/meta/classes/distutils3.bbclass
> index 443bf3a..47cbf72 100644
> --- a/meta/classes/distutils3.bbclass
> +++ b/meta/classes/distutils3.bbclass
> @@ -9,6 +9,8 @@ DISTUTILS_INSTALL_ARGS ?= "--prefix=${D}/${prefix} \
>      --install-data=${D}/${datadir}"
>  
>  distutils3_do_compile() {
> +        cwd=$PWD
> +        cd ${S}
>          if [ ${BUILD_SYS} != ${HOST_SYS} ]; then
>                  SYS=${MACHINE}
>          else
> @@ -17,13 +19,16 @@ distutils3_do_compile() {
>          STAGING_INCDIR=${STAGING_INCDIR} \
>          STAGING_LIBDIR=${STAGING_LIBDIR} \
>          BUILD_SYS=${BUILD_SYS} HOST_SYS=${SYS} \
> -        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}
> setup.py \
> -        build ${DISTUTILS_BUILD_ARGS} || \
> +        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}
> ${S}/setup.py \
> +        build -build-base=${B} ${DISTUTILS_BUILD_ARGS} || \
>          bbfatal "${PYTHON_PN} setup.py build_ext execution failed."
> +        cd $cwd
>  }
>  distutils3_do_compile[vardepsexclude] = "MACHINE"
>  
>  distutils3_stage_headers() {
> +        cwd=$PWD
> +        cd ${S}
>          install -d ${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR}
>          if [ ${BUILD_SYS} != ${HOST_SYS} ]; then
>                  SYS=${MACHINE}
> @@ -31,12 +36,15 @@ distutils3_stage_headers() {
>                  SYS=${HOST_SYS}
>          fi
>          BUILD_SYS=${BUILD_SYS} HOST_SYS=${SYS} \
> -        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}
> setup.py install_headers ${DISTUTILS_STAGE_HEADERS_ARGS} || \
> +        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}
> ${S}/setup.py install_headers ${DISTUTILS_STAGE_HEADERS_ARGS} || \
>          bbfatal "${PYTHON_PN} setup.py install_headers execution
> failed."
> +        cd $cwd
>  }
>  distutils3_stage_headers[vardepsexclude] = "MACHINE"
>  
>  distutils3_stage_all() {
> +        cwd=$PWD
> +        cd ${S}
>          if [ ${BUILD_SYS} != ${HOST_SYS} ]; then
>                  SYS=${MACHINE}
>          else
> @@ -47,12 +55,15 @@ distutils3_stage_all() {
>          install -d ${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR}
>          PYTHONPATH=${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR} \
>          BUILD_SYS=${BUILD_SYS} HOST_SYS=${SYS} \
> -        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}
> setup.py install ${DISTUTILS_STAGE_ALL_ARGS} || \
> +        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}
> ${S}/setup.py install ${DISTUTILS_STAGE_ALL_ARGS} || \
>          bbfatal "${PYTHON_PN} setup.py install (stage) execution
> failed."
> +        cd $cwd
>  }
>  distutils3_stage_all[vardepsexclude] = "MACHINE"
>  
>  distutils3_do_install() {
> +        cwd=$PWD
> +        cd ${S}
>          install -d ${D}${PYTHON_SITEPACKAGES_DIR}
>          if [ ${BUILD_SYS} != ${HOST_SYS} ]; then
>                  SYS=${MACHINE}
> @@ -63,13 +74,13 @@ distutils3_do_install() {
>          STAGING_LIBDIR=${STAGING_LIBDIR} \
>          PYTHONPATH=${D}${PYTHON_SITEPACKAGES_DIR} \
>          BUILD_SYS=${BUILD_SYS} HOST_SYS=${SYS} \
> -        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}
> setup.py install --install-lib=${D}/${PYTHON_SITEPACKAGES_DIR}
> ${DISTUTILS_INSTALL_ARGS} || \
> +        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}
> ${S}/setup.py install --install-lib=${D}/${PYTHON_SITEPACKAGES_DIR}
> ${DISTUTILS_INSTALL_ARGS} || \
>          bbfatal "${PYTHON_PN} setup.py install execution failed."
>  
>          # support filenames with *spaces*
>          find ${D} -name "*.py" -exec grep -q ${D} {} \; -exec sed -i
> -e s:${D}::g {} \;
>  
> -        if test -e ${D}${bindir} ; then	
> +        if test -e ${D}${bindir} ; then
>              for i in ${D}${bindir}/* ; do \
>                  sed -i -e s:${STAGING_BINDIR_NATIVE}/${PYTHON_PN}
> -native/${PYTHON_PN}:${bindir}/env\ ${PYTHON_PN}:g $i
>                  sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $i
> @@ -84,7 +95,7 @@ distutils3_do_install() {
>          fi
>  
>          rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/easy-install.pth
> -        
> +
>          #
>          # FIXME: Bandaid against wrong datadir computation
>          #
> @@ -92,6 +103,7 @@ distutils3_do_install() {
>              mv -f ${D}${datadir}/share/* ${D}${datadir}/
>              rmdir ${D}${datadir}/share
>          fi
> +        cd $cwd
>  }
>  distutils3_do_install[vardepsexclude] = "MACHINE"
>  
> -- 
> 2.7.0
> 

