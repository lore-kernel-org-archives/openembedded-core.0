Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8BBAC72120
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 May 2015 03:11:36 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t443BbBE027898
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 3 May 2015 20:11:37 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.224.2;
	Sun, 3 May 2015 20:11:36 -0700
Message-ID: <5546E367.60301@windriver.com>
Date: Mon, 4 May 2015 11:11:35 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1430292378.git.liezhi.yang@windriver.com>
	<7109a33ad37ba0f8193de18a2c7f113acc087990.1430292378.git.liezhi.yang@windriver.com>
	<CAJTo0LZcADEC1Y3rjcEs61+S8jSe9C+28sT0r2xvGpSO5vR3Xw@mail.gmail.com>
In-Reply-To: <CAJTo0LZcADEC1Y3rjcEs61+S8jSe9C+28sT0r2xvGpSO5vR3Xw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] libxml2: fix python path and add libxml2-python
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
X-List-Received-Date: Mon, 04 May 2015 03:11:39 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 05/01/2015 11:46 PM, Burton, Ross wrote:
> buildhistory says:
>
> packages/corei7-64-poky-linux/libxml2/libxml2: RDEPENDS: added "python-core"
>
> Why does the library package gain a dependency on python?

Sorry, I updated the patch a little, it was because of this line:

PACKAGECONFIG[python] = 
"--with-python=${PYTHON},--without-python,python,python-core"

The python-core should not be there, but should be:

RDEPENDS_${PN}-python += "python-core".

I updated it in the repo:

   git://git.openembedded.org/openembedded-core-contrib rbt/libxml2



diff --git a/meta/recipes-core/libxml/libxml2.inc 
b/meta/recipes-core/libxml/libxml2.inc
index 1314bbf..d337bec 100644
--- a/meta/recipes-core/libxml/libxml2.inc
+++ b/meta/recipes-core/libxml/libxml2.inc
@@ -9,8 +9,6 @@ LIC_FILES_CHKSUM = 
"file://Copyright;md5=2044417e2e5006b65a8b9067b683fcf1 \
 
file://list.c;beginline=4;endline=13;md5=cdbfa3dee51c099edb04e39f762ee907 \
 
file://trio.c;beginline=5;endline=14;md5=6c025753c86d958722ec76e94cae932e"

-DEPENDS_class-nativesdk = "nativesdk-python"
-DEPENDS_class-native = "python-native"
  DEPENDS =+ "zlib"

  SRC_URI = "ftp://xmlsoft.org/libxml2/libxml2-${PV}.tar.gz;name=libtar \
@@ -30,6 +28,8 @@ inherit autotools pkgconfig binconfig-disabled pythonnative ptest

  RDEPENDS_${PN}-ptest += "python-core"

+RDEPENDS_${PN}-python += "python-core"
+
  RDEPENDS_${PN}-ptest_append_libc-glibc += "glibc-gconv-ebcdic-us 
glibc-gconv-ibm1141"

  # We don't DEPEND on binutils for ansidecl.h so ensure we don't use the header
@@ -37,16 +37,16 @@ do_configure_prepend () {
         sed -i -e '/.*ansidecl.h.*/d' ${S}/configure.ac
  }
  -do_configure_prepend_class-nativesdk () {
-       # Ensure we get the correct site-packages path
-       export PYTHON_SITE_PACKAGES="${PYTHON_SITEPACKAGES_DIR}"
-}
+export PYTHON_SITE_PACKAGES="${PYTHON_SITEPACKAGES_DIR}"
+
+PACKAGECONFIG ??= "python"

+PACKAGECONFIG[python] = "--with-python=${PYTHON},--without-python,python"
  # WARNING: zlib is require for RPM use
-EXTRA_OECONF = "--without-python --without-debug --without-legacy 
--with-catalog --without-docbook --with-c14n --without-lzma --with-fexceptions"
-EXTRA_OECONF_class-native = "--with-python=${STAGING_BINDIR}/python 
--without-legacy --without-docbook --with-c14n --without-lzma --with-zlib"
-EXTRA_OECONF_class-nativesdk = "--with-python=${STAGING_BINDIR}/python 
--without-legacy --without-docbook --with-c14n --without-lzma --with-zlib"
-EXTRA_OECONF_linuxstdbase = "--without-python --with-debug --with-legacy 
--with-docbook --with-c14n --without-lzma --with-zlib"
+EXTRA_OECONF = "--without-debug --without-legacy --with-catalog 
--without-docbook --with-c14n --without-lzma --with-fexceptions"
+EXTRA_OECONF_class-native = "--without-legacy --without-docbook --with-c14n 
--without-lzma --with-zlib"
+EXTRA_OECONF_class-nativesdk = "--without-legacy --without-docbook --with-c14n 
--without-lzma --with-zlib"
+EXTRA_OECONF_linuxstdbase = "--with-debug --with-legacy --with-docbook 
--with-c14n --without-lzma --with-zlib"

  # required for pythong binding
  export HOST_SYS

// Robert

>
> Ross
>
> On 29 April 2015 at 08:26, Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
>
>     We have libxml2-python for native and nativesdk, but don't have it for
>     target, and can't find the reason from the git log, libxml2-python is
>     widely used, after looked into it's configure.in <http://configure.in>, we
>     can add it
>     by PACKAGECONFIG.
>
>     The previous --with-python=${STAGING_BINDIR}/python is incorrect, it
>     acted as work becase it's conigure can check automatically, python is in
>     ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}, as known as
>     ${PYTHON}.
>
>     Add python to PACKAGECONFIG, since createrepo rdepends on
>     libxml2-python, otherwise the target createrepo can't work.
>
>     Signed-off-by: Robert Yang <liezhi.yang@windriver.com
>     <mailto:liezhi.yang@windriver.com>>
>     ---
>       meta/recipes-core/libxml/libxml2.inc |   18 ++++++++----------
>       1 file changed, 8 insertions(+), 10 deletions(-)
>
>     diff --git a/meta/recipes-core/libxml/libxml2.inc
>     b/meta/recipes-core/libxml/libxml2.inc
>     index 1314bbf..4886705 100644
>     --- a/meta/recipes-core/libxml/libxml2.inc
>     +++ b/meta/recipes-core/libxml/libxml2.inc
>     @@ -9,8 +9,6 @@ LIC_FILES_CHKSUM =
>     "file://Copyright;md5=2044417e2e5006b65a8b9067b683fcf1 \
>
>       file://list.c;beginline=4;endline=13;md5=cdbfa3dee51c099edb04e39f762ee907 \
>
>       file://trio.c;beginline=5;endline=14;md5=6c025753c86d958722ec76e94cae932e"
>
>     -DEPENDS_class-nativesdk = "nativesdk-python"
>     -DEPENDS_class-native = "python-native"
>       DEPENDS =+ "zlib"
>
>       SRC_URI = "ftp://xmlsoft.org/libxml2/libxml2-${PV}.tar.gz;name=libtar \
>     @@ -37,16 +35,16 @@ do_configure_prepend () {
>              sed -i -e '/.*ansidecl.h.*/d' ${S}/configure.ac <http://configure.ac>
>       }
>
>     -do_configure_prepend_class-nativesdk () {
>     -       # Ensure we get the correct site-packages path
>     -       export PYTHON_SITE_PACKAGES="${PYTHON_SITEPACKAGES_DIR}"
>     -}
>     +export PYTHON_SITE_PACKAGES="${PYTHON_SITEPACKAGES_DIR}"
>     +
>     +PACKAGECONFIG ??= "python"
>
>     +PACKAGECONFIG[python] =
>     "--with-python=${PYTHON},--without-python,python,python-core"
>       # WARNING: zlib is require for RPM use
>     -EXTRA_OECONF = "--without-python --without-debug --without-legacy
>     --with-catalog --without-docbook --with-c14n --without-lzma --with-fexceptions"
>     -EXTRA_OECONF_class-native = "--with-python=${STAGING_BINDIR}/python
>     --without-legacy --without-docbook --with-c14n --without-lzma --with-zlib"
>     -EXTRA_OECONF_class-nativesdk = "--with-python=${STAGING_BINDIR}/python
>     --without-legacy --without-docbook --with-c14n --without-lzma --with-zlib"
>     -EXTRA_OECONF_linuxstdbase = "--without-python --with-debug --with-legacy
>     --with-docbook --with-c14n --without-lzma --with-zlib"
>     +EXTRA_OECONF = "--without-debug --without-legacy --with-catalog
>     --without-docbook --with-c14n --without-lzma --with-fexceptions"
>     +EXTRA_OECONF_class-native = "--without-legacy --without-docbook --with-c14n
>     --without-lzma --with-zlib"
>     +EXTRA_OECONF_class-nativesdk = "--without-legacy --without-docbook
>     --with-c14n --without-lzma --with-zlib"
>     +EXTRA_OECONF_linuxstdbase = "--with-debug --with-legacy --with-docbook
>     --with-c14n --without-lzma --with-zlib"
>
>       # required for pythong binding
>       export HOST_SYS
>     --
>     1.7.9.5
>
>     --
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

