Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0F2AC77D0E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Apr 2017 07:47:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTP id v377lrrA024807; 
	Fri, 7 Apr 2017 08:47:54 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 9qj5D82Q0jMy; Fri,  7 Apr 2017 08:47:54 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v377ahIB023873
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 7 Apr 2017 08:36:44 +0100
Message-ID: <1491550603.17200.83.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Dmitry Rozhkov <dmitry.rozhkov@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 07 Apr 2017 08:36:43 +0100
In-Reply-To: <20170405070120.11459-1-dmitry.rozhkov@linux.intel.com>
References: <20170405070120.11459-1-dmitry.rozhkov@linux.intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH] python-pycurl: create python3-pycurl recipe
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
X-List-Received-Date: Fri, 07 Apr 2017 07:47:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-04-05 at 10:01 +0300, Dmitry Rozhkov wrote:
> The python-pycurl recipe can be used with python2 only even
> though python3 is officially supported by upstream.
> 
> Create python3-pycurl recipe enabling the pycurl module for
> python3.

This failed autobuilder tests:

https://autobuilder.yocto.io/builders/nightly-world-lsb/builds/214/step
s/BuildImages/logs/stdio



> Signed-off-by: Dmitry Rozhkov <dmitry.rozhkov@linux.intel.com>
> ---
>  meta/recipes-devtools/python/python-pycurl.inc     | 31
> +++++++++++++++++++++
>  .../python/python-pycurl_7.21.5.bb                 | 32 +-----------
> ----------
>  .../python/python3-pycurl_7.21.5.bb                |  5 ++++
>  3 files changed, 37 insertions(+), 31 deletions(-)
>  create mode 100644 meta/recipes-devtools/python/python-pycurl.inc
>  create mode 100644 meta/recipes-devtools/python/python3-
> pycurl_7.21.5.bb
> 
> diff --git a/meta/recipes-devtools/python/python-pycurl.inc
> b/meta/recipes-devtools/python/python-pycurl.inc
> new file mode 100644
> index 0000000..d26318b
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python-pycurl.inc
> @@ -0,0 +1,31 @@
> +SUMMARY = "Python bindings for libcurl"
> +HOMEPAGE = "http://pycurl.sourceforge.net/"
> +SECTION = "devel/python"
> +LICENSE = "LGPLv2.1+ | MIT"
> +LIC_FILES_CHKSUM =
> "file://README.rst;beginline=166;endline=182;md5=a84a1caa65b89d4584b6
> 93d3680062fb \
> +                    file://COPYING-
> LGPL;md5=3579a9fd0221d49a237aaa33492f988c \
> +                    file://COPYING-
> MIT;md5=b7e434aeb228ed731c00bcf177e79b19"
> +
> +DEPENDS = "curl ${PYTHON_PN}"
> +RDEPENDS_${PN} = "${PYTHON_PN}-core curl"
> +SRCNAME = "pycurl"
> +
> +SRC_URI = "\
> +  http://${SRCNAME}.sourceforge.net/download/${SRCNAME}-
> ${PV}.tar.gz;name=archive \
> +  file://no-static-link.patch \
> +"
> +
> +SRC_URI[archive.md5sum] = "bca7bf47320082588db544ced2ba8717"
> +SRC_URI[archive.sha256sum] =
> "8a1e0eb55573388275a1d6c2534ca4cfca5d7fa772b99b505c08fa149b27aed0"
> +S = "${WORKDIR}/${SRCNAME}-${PV}"
> +
> +BBCLASSEXTEND = "native"
> +
> +# Ensure the docstrings are generated as make clean will remove them
> +do_compile_prepend() {
> +	${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}
> setup.py docstrings
> +}
> +
> +do_install_append() {
> +	rm -rf ${D}${datadir}/share
> +}
> diff --git a/meta/recipes-devtools/python/python-pycurl_7.21.5.bb
> b/meta/recipes-devtools/python/python-pycurl_7.21.5.bb
> index 7b41f6d..eb70cea 100644
> --- a/meta/recipes-devtools/python/python-pycurl_7.21.5.bb
> +++ b/meta/recipes-devtools/python/python-pycurl_7.21.5.bb
> @@ -1,33 +1,3 @@
> -SUMMARY = "Python bindings for libcurl"
> -HOMEPAGE = "http://pycurl.sourceforge.net/"
> -SECTION = "devel/python"
> -LICENSE = "LGPLv2.1+ | MIT"
> -LIC_FILES_CHKSUM =
> "file://README.rst;beginline=166;endline=182;md5=a84a1caa65b89d4584b6
> 93d3680062fb \
> -                    file://COPYING-
> LGPL;md5=3579a9fd0221d49a237aaa33492f988c \
> -                    file://COPYING-
> MIT;md5=b7e434aeb228ed731c00bcf177e79b19"
> -
> -DEPENDS = "curl python"
> -RDEPENDS_${PN} = "python-core curl"
> -SRCNAME = "pycurl"
> -
> -SRC_URI = "\
> -  http://${SRCNAME}.sourceforge.net/download/${SRCNAME}-
> ${PV}.tar.gz;name=archive \
> -  file://no-static-link.patch \
> -"
> -
> -SRC_URI[archive.md5sum] = "bca7bf47320082588db544ced2ba8717"
> -SRC_URI[archive.sha256sum] =
> "8a1e0eb55573388275a1d6c2534ca4cfca5d7fa772b99b505c08fa149b27aed0"
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> +require python-pycurl.inc
>  
>  inherit distutils
> -
> -BBCLASSEXTEND = "native"
> -
> -# Ensure the docstrings are generated as make clean will remove them
> -do_compile_prepend() {
> -	${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}
> setup.py docstrings
> -}
> -
> -do_install_append() {
> -	rm -rf ${D}${datadir}/share
> -}
> diff --git a/meta/recipes-devtools/python/python3-pycurl_7.21.5.bb
> b/meta/recipes-devtools/python/python3-pycurl_7.21.5.bb
> new file mode 100644
> index 0000000..5d11192
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-pycurl_7.21.5.bb
> @@ -0,0 +1,5 @@
> +FILESEXTRAPATHS_prepend := "${THISDIR}/python-pycurl:"
> +
> +require python-pycurl.inc
> +
> +inherit distutils3
> -- 
> 2.9.3
> 

