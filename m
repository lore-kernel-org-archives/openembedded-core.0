Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f171.google.com (mail-ie0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 8CA556084E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 18:04:46 +0000 (UTC)
Received: by mail-ie0-f171.google.com with SMTP id at1so1309789iec.30
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 11:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=kwS2EPa+o5OPSzpXImZsN8dz8HAe0HfQyw2ofPQ3DlU=;
	b=ztR00eT7yXDzu7GV1CW9O5nJLLjUHtz/XkVl4nDCao5awI9tQAUSfVULrOgu6hEN0O
	+2n2kHNGg3UjbgDBfpR0gRnYMhNriPnqwGEBZxRTp0+XykvkYi88+aDdwr1kBfZ9JxhP
	tsHXiirwMUzCedP9Lx0yRzpZsr4JKMpKsvhsCxV3dFTU7jy5r2iwMAiureohuCkGcmX8
	5Iw7KTK0f/O1z/5iI0gtwO3dHUNAC5JTGSyZUF9g3X9g+4lz/fSsARmbFmQrs4lqnyI9
	VpWSE5vFLCD53jO634Np012ckM5zCB0NbRh1aRotRg57+hzeVvO9x/5l2s+eFcSgXIaU
	NVfA==
X-Received: by 10.50.176.202 with SMTP id ck10mr30842364igc.2.1406138688128;
	Wed, 23 Jul 2014 11:04:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.78.105 with HTTP; Wed, 23 Jul 2014 11:04:18 -0700 (PDT)
In-Reply-To: <1403176695-18917-1-git-send-email-Martin.Jansa@gmail.com>
References: <1403176695-18917-1-git-send-email-Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 23 Jul 2014 11:04:18 -0700
Message-ID: <CAMKF1spKr_JzstojPa_ALCJKwBF=cDVh2bZmkucUO6hfB0ipsA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [DO-NOT-MERGE][RFC][PATCH] DO-NOT-MERGE: distutils3.bbclass: Don't use MACHINE variable
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
X-List-Received-Date: Wed, 23 Jul 2014 18:04:54 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jun 19, 2014 at 4:18 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> The original patch says this about MACHINE variables:
>
>     Use MACHINE for sysroot when not building for build host
>
>     Python's machinery replaces directories in sysroot path to match OE's
>     staging area sysroots. Earlier we use to have HOST_SYS represent sysroot
>     always but now we use MACHINE to represent target sysroots but HOST_SYS
>     to represent host sysroot. This patch caters to that difference
>
> But I think we need to find some different solution, because right now the only
> user of distutils3 bbclass python3-distribute becames effectivelly MACHINE_ARCH
> because of this. Detected with sstate-diff-machines.sh script:
>
>  == Comparing signatures for python3-distribute.do_populate_sysroot.sigdata between qemux86 and qemux86copy ==
>   Hash for dependent task python3-distribute_0.6.32.bb.do_install changed from ef2f64ea6aecf1f9c2c6a0f201c52f67 to 7afd17fd366b28cf4a0353c7dd5e1c5b
>
>   $ bitbake-diffsigs sstate-diff/1403174194/qemux86*/i586*/python3-distribute*/*do_install*
>     basehash changed from 5311d29c25ff324645de9c17cdefe083 to 2f079b81b13427faddeb040e7a115965
>     Variable MACHINE value changed from 'qemux86copy' to 'qemux86'
>     Hash for dependent task python3-distribute_0.6.32.bb.do_compile changed from 4fcb29eb2a0df7bef2f9806a0d9cdd92 to e7df3cdd7b82733d69c87f1822b7177b
>
>   $ bitbake-diffsigs sstate-diff/1403174194/qemux86*/i586*/python3-distribute*/*do_compile*
>     basehash changed from 870a9e01c2c4eb73dd57451eeb2a7f0c to c061ae11d7f16d74d49f667243a21be0
>     Variable MACHINE value changed from 'qemux86copy' to 'qemux86'
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>


BUILD_SYS is needed in python machinery to construct proper sys root
especially with python3 versions the cross build infra in python is
different. I think this patch would fail to build python3, either we
have to patch it in such a way that whatever sys root OE constructs is
passed directly and used and thereby remove depending on referring to
MACHINE but that would need a bigger patch for python which I was not
willing to carry. if there is another check that can deduce difference
of being compiled native or for target then we can use that check
instead of comparing BUILD_SYS to MACHINE

> ---
>  meta/classes/distutils3.bbclass | 28 ++++------------------------
>  1 file changed, 4 insertions(+), 24 deletions(-)
>
> diff --git a/meta/classes/distutils3.bbclass b/meta/classes/distutils3.bbclass
> index bbd645c..8cf29d5 100644
> --- a/meta/classes/distutils3.bbclass
> +++ b/meta/classes/distutils3.bbclass
> @@ -9,14 +9,9 @@ DISTUTILS_INSTALL_ARGS ?= "--prefix=${D}/${prefix} \
>      --install-data=${D}/${datadir}"
>
>  distutils3_do_compile() {
> -        if [ ${BUILD_SYS} != ${HOST_SYS} ]; then
> -                SYS=${MACHINE}
> -        else
> -                SYS=${HOST_SYS}
> -        fi
>          STAGING_INCDIR=${STAGING_INCDIR} \
>          STAGING_LIBDIR=${STAGING_LIBDIR} \
> -        BUILD_SYS=${BUILD_SYS} HOST_SYS=${SYS} \
> +        BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
>          ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py \
>          build ${DISTUTILS_BUILD_ARGS} || \
>          bbfatal "${PYTHON_PN} setup.py build_ext execution failed."
> @@ -24,42 +19,27 @@ distutils3_do_compile() {
>
>  distutils3_stage_headers() {
>          install -d ${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR}
> -        if [ ${BUILD_SYS} != ${HOST_SYS} ]; then
> -                SYS=${MACHINE}
> -        else
> -                SYS=${HOST_SYS}
> -        fi
> -        BUILD_SYS=${BUILD_SYS} HOST_SYS=${SYS} \
> +        BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
>          ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install_headers ${DISTUTILS_STAGE_HEADERS_ARGS} || \
>          bbfatal "${PYTHON_PN} setup.py install_headers execution failed."
>  }
>
>  distutils3_stage_all() {
> -        if [ ${BUILD_SYS} != ${HOST_SYS} ]; then
> -                SYS=${MACHINE}
> -        else
> -                SYS=${HOST_SYS}
> -        fi
>          STAGING_INCDIR=${STAGING_INCDIR} \
>          STAGING_LIBDIR=${STAGING_LIBDIR} \
>          install -d ${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR}
>          PYTHONPATH=${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR} \
> -        BUILD_SYS=${BUILD_SYS} HOST_SYS=${SYS} \
> +        BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
>          ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install ${DISTUTILS_STAGE_ALL_ARGS} || \
>          bbfatal "${PYTHON_PN} setup.py install (stage) execution failed."
>  }
>
>  distutils3_do_install() {
>          install -d ${D}${PYTHON_SITEPACKAGES_DIR}
> -        if [ ${BUILD_SYS} != ${HOST_SYS} ]; then
> -                SYS=${MACHINE}
> -        else
> -                SYS=${HOST_SYS}
> -        fi
>          STAGING_INCDIR=${STAGING_INCDIR} \
>          STAGING_LIBDIR=${STAGING_LIBDIR} \
>          PYTHONPATH=${D}${PYTHON_SITEPACKAGES_DIR} \
> -        BUILD_SYS=${BUILD_SYS} HOST_SYS=${SYS} \
> +        BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
>          ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install --install-lib=${D}/${PYTHON_SITEPACKAGES_DIR} ${DISTUTILS_INSTALL_ARGS} || \
>          bbfatal "${PYTHON_PN} setup.py install execution failed."
>
> --
> 2.0.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

