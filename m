Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Svqju-0004gq-Pi
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jul 2012 16:14:31 +0200
Received: by yhjj56 with SMTP id j56so4328078yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2012 07:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=L4EL+Iazye+soi6OTH/Ocf1nMqHmXTijXhL8wYaFIXo=;
	b=pBtm7n5W+8s+tF/7zqz3Uo7e5WCfJksDz1z/dgbsJYp4zgmjrQY2MvXCbaaC2BSDbb
	MNGEKeqGM5U4jjc/U2Q5tXi13JkCer3fB3Q7aPKN2t3cMagrQeqA3ItZJ9NIMRsG1p62
	Ztd88Nu0Wi3qG8CshW3nJ/VzkOMKHt7h9H/WwrBpBDKVTgZornRpkyGBKsg+FnI3Yk1t
	4yEyrUDQnt0rQuWlSjHk3h+GJzkoDbhDcYYF8AK/n+AEdgRXX6H54XUDB0U1nQ7SYfZk
	Ot4BoPg+4e+wGEkscIv53/6aLyXU5L2fdg1kW/F2ZXR/1pN5AaV5Bo8uqQ9L3eKiQ8J5
	huWA==
MIME-Version: 1.0
Received: by 10.43.126.1 with SMTP id gu1mr6743246icc.6.1343656974148; Mon, 30
	Jul 2012 07:02:54 -0700 (PDT)
Received: by 10.64.142.201 with HTTP; Mon, 30 Jul 2012 07:02:54 -0700 (PDT)
In-Reply-To: <CALbNGRTJjTZZG=ysG3m+gnv0YqfaBhUEZkLF5WUJxg7-hSLGDg@mail.gmail.com>
References: <20120722104353.A204B1032B@opal>
	<CALbNGRTJjTZZG=ysG3m+gnv0YqfaBhUEZkLF5WUJxg7-hSLGDg@mail.gmail.com>
Date: Mon, 30 Jul 2012 16:02:54 +0200
Message-ID: <CALbNGRQdsaP8JOc91DJxD2wtvSV9KaL2LX4f-6ff2jubdGWgYQ@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Subject: [oe-commits] Morgan Little : python-native: Put binaries in seperate directory
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
X-List-Received-Date: Mon, 30 Jul 2012 14:14:31 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Jul 22, 2012 at 12:43 PM,  <git@git.openembedded.org> wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: a2e554f731437545e9483a7a73e6847c03f6f48a
> URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=a2e554f731437545e9483a7a73e6847c03f6f48a
>
> Author: Morgan Little <morgan.little@windriver.com>
> Date:   Thu Jul 19 13:46:06 2012 -0400
>
> python-native: Put binaries in seperate directory
>
> Update python-native to install the binaries in the python-native directory,
> add pythonnative.bbclass to let recipes that need python-native use the
> binaries and update disutils access the new binaries. Update distutils-base
> to inherit pythonnative.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> ---
>
>  meta/classes/distutils-base.bbclass                |    2 +-
>  meta/classes/distutils.bbclass                     |    8 ++++----
>  meta/classes/pythonnative.bbclass                  |    3 +++
>  .../recipes-devtools/python/python-native_2.7.3.bb |   10 ++++++----
>  4 files changed, 14 insertions(+), 9 deletions(-)
>
> diff --git a/meta/classes/distutils-base.bbclass b/meta/classes/distutils-base.bbclass
> index 6d18e08..c761b36 100644
> --- a/meta/classes/distutils-base.bbclass
> +++ b/meta/classes/distutils-base.bbclass
> @@ -1,5 +1,5 @@
>  DEPENDS  += "${@["python-native python", ""][(d.getVar('PACKAGES', True) == '')]}"
>  RDEPENDS_${PN} += "${@['', 'python-core']['${PN}' == '${BPN}']}"
>
> -inherit distutils-common-base
> +inherit distutils-common-base pythonnative
>
> diff --git a/meta/classes/distutils.bbclass b/meta/classes/distutils.bbclass
> index bcddf8d..690df73 100644
> --- a/meta/classes/distutils.bbclass
> +++ b/meta/classes/distutils.bbclass
> @@ -11,14 +11,14 @@ distutils_do_compile() {
>           STAGING_INCDIR=${STAGING_INCDIR} \
>           STAGING_LIBDIR=${STAGING_LIBDIR} \
>           BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
> -         ${STAGING_BINDIR_NATIVE}/python setup.py build ${DISTUTILS_BUILD_ARGS} || \
> +         ${STAGING_BINDIR_NATIVE}/python-native/python setup.py build ${DISTUTILS_BUILD_ARGS} || \
>           bbfatal "python setup.py build_ext execution failed."
>  }
>
>  distutils_stage_headers() {
>          install -d ${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR}
>          BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
> -        ${STAGING_BINDIR_NATIVE}/python setup.py install_headers ${DISTUTILS_STAGE_HEADERS_ARGS} || \
> +        ${STAGING_BINDIR_NATIVE}/python-native/python setup.py install_headers ${DISTUTILS_STAGE_HEADERS_ARGS} || \
>          bbfatal "python setup.py install_headers execution failed."
>  }
>
> @@ -28,7 +28,7 @@ distutils_stage_all() {
>          install -d ${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR}
>          PYTHONPATH=${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR} \
>          BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
> -        ${STAGING_BINDIR_NATIVE}/python setup.py install ${DISTUTILS_STAGE_ALL_ARGS} || \
> +        ${STAGING_BINDIR_NATIVE}/python-native/python setup.py install ${DISTUTILS_STAGE_ALL_ARGS} || \
>          bbfatal "python setup.py install (stage) execution failed."
>  }
>
> @@ -38,7 +38,7 @@ distutils_do_install() {
>          STAGING_LIBDIR=${STAGING_LIBDIR} \
>          PYTHONPATH=${D}/${PYTHON_SITEPACKAGES_DIR} \
>          BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
> -        ${STAGING_BINDIR_NATIVE}/python setup.py install ${DISTUTILS_INSTALL_ARGS} || \
> +        ${STAGING_BINDIR_NATIVE}/python-native/python setup.py install ${DISTUTILS_INSTALL_ARGS} || \
>          bbfatal "python setup.py install execution failed."
>
>          for i in `find ${D} -name "*.py"` ; do \
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
> index 50bf894..bfdcd12 100644
> --- a/meta/recipes-devtools/python/python-native_2.7.3.bb
> +++ b/meta/recipes-devtools/python/python-native_2.7.3.bb
> @@ -1,6 +1,6 @@
>  require python.inc
>  DEPENDS = "openssl-native bzip2-full-native zlib-native readline-native sqlite3-native"
> -PR = "${INC_PR}.0"
> +PR = "${INC_PR}.1"
>
>  SRC_URI += "file://04-default-is-optimized.patch \
>             file://05-enable-ctypes-cross-build.patch \
> @@ -20,6 +20,8 @@ inherit native
>
>  RPROVIDES += "python-distutils-native python-compression-native python-textutils-native python-core-native"
>
> +EXTRA_OECONF += " --bindir=${bindir}/${PN}"
> +
>  EXTRA_OEMAKE = '\
>    BUILD_SYS="" \
>    HOST_SYS="" \
> @@ -34,11 +36,11 @@ do_configure_prepend() {
>
>  do_install() {
>         oe_runmake 'DESTDIR=${D}' install
> -       install -d ${D}${bindir}/
> -       install -m 0755 Parser/pgen ${D}${bindir}/
> +       install -d ${D}${bindir}/${PN}
> +       install -m 0755 Parser/pgen ${D}${bindir}/${PN}
>
>         # Make sure we use /usr/bin/env python
> -       for PYTHSCRIPT in `grep -rIl ${bindir}/python ${D}${bindir}`; do
> +       for PYTHSCRIPT in `grep -rIl ${bindir}/${PN}/python ${D}${bindir}/${PN}`; do
>                 sed -i -e '1s|^#!.*|#!/usr/bin/env python|' $PYTHSCRIPT
>         done
>  }
>
>
Could somebody enlighten me please: What is the benefit in moving
python-native into a subdirectory and causing tons of recipe changes?
The commit message does not help me much.
To me it is just another build breaker after gobject-introspection &
gtk-doc. Please tell me how many further weeks we have to suffer for
innovations like this so I can come back then.

Andreas


