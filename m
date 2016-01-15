Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7BB17731A0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jan 2016 09:23:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0F9Njia005812
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Fri, 15 Jan 2016 01:23:45 -0800
Received: from [128.224.162.155] (128.224.162.155) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 15 Jan 2016 01:23:45 -0800
To: Christopher Larson <kergoth@gmail.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1447371049.git.chris_larson@mentor.com>
	<1cb0662447098b5f24ec3e02e471a3e288a69a04.1447371049.git.chris_larson@mentor.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <5698BA9F.4020809@windriver.com>
Date: Fri, 15 Jan 2016 17:23:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <1cb0662447098b5f24ec3e02e471a3e288a69a04.1447371049.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCH 2/4] opkg-utils: add update-alternatives PACKAGECONFIG
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
X-List-Received-Date: Fri, 15 Jan 2016 09:23:47 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


Hi Chris,

I've afraid this patch can't work well, when opkg-utils doesn't provide
virtual/update-alternatives, then chkconfig would be built and there would
be dependency loops for example,

PACKAGECONFIG = "python"
$ bitbake core-image-minimal

[snip]
ERROR:
Dependency loop #1 found:
   Task 747 
(/buildarea/lyang1/poky/meta/recipes-support/libpcre/libpcre_8.38.bb, 
do_packagedata) (dependent Tasks ['libpcre, do_package'])
   Task 2067 (/buildarea/lyang1/poky/meta/recipes-extended/slang/slang_2.2.4.bb, 
do_package) (dependent Tasks ['gcc-runtime, do_packagedata', 'pseudo, 
do_populate_sysroot', 'slang, do_install', 'libpcre, do_packagedata', 
'libtool-cross, do_packagedata', 'glibc, do_packagedata', 'rpm, 
do_populate_sysroot'])
   Task 2064 (/buildarea/lyang1/poky/meta/recipes-extended/slang/slang_2.2.4.bb, 
do_packagedata) (dependent Tasks ['slang, do_package'])
   Task 1876 
(/buildarea/lyang1/poky/meta/recipes-extended/newt/libnewt_0.52.18.bb, 
do_package) (dependent Tasks ['slang, do_packagedata', 'gcc-runtime, 
do_packagedata', 'pseudo, do_populate_sysroot', 'libnewt, do_install', 
'libtool-cross, do_packagedata', 'glibc, do_packagedata', 'popt, 
do_packagedata', 'rpm, do_populate_sysroot'])
   Task 1873 
(/buildarea/lyang1/poky/meta/recipes-extended/newt/libnewt_0.52.18.bb, 
do_packagedata) (dependent Tasks ['libnewt, do_package'])
   Task 1405 
(/buildarea/lyang1/poky/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb, 
do_package) (dependent Tasks ['gcc-runtime, do_packagedata', 'pseudo, 
do_populate_sysroot', 'glibc, do_packagedata', 'libnewt, do_packagedata', 
'chkconfig, do_install', 'popt, do_packagedata', 'gettext, do_packagedata', 
'rpm, do_populate_sysroot'])
   Task 1402 
(/buildarea/lyang1/poky/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb, 
do_packagedata) (dependent Tasks ['chkconfig, do_package'])
   Task 853 (/buildarea/lyang1/poky/meta/recipes-extended/bzip2/bzip2_1.0.6.bb, 
do_package) (dependent Tasks ['gcc-runtime, do_packagedata', 'bzip2, 
do_install_ptest_base', 'bzip2, do_install', 'libtool-cross, do_packagedata', 
'glibc, do_packagedata', 'pseudo, do_populate_sysroot', 'chkconfig, 
do_packagedata', 'rpm, do_populate_sysroot'])
   Task 850 (/buildarea/lyang1/poky/meta/recipes-extended/bzip2/bzip2_1.0.6.bb, 
do_packagedata) (dependent Tasks ['bzip2, do_package'])
   Task 750 
(/buildarea/lyang1/poky/meta/recipes-support/libpcre/libpcre_8.38.bb, 
do_package) (dependent Tasks ['libpcre, do_install_ptest_base', 'libpcre, 
do_install', 'gcc-runtime, do_packagedata', 'pseudo, do_populate_sysroot', 
'libtool-cross, do_packagedata', 'glibc, do_packagedata', 'bzip2, 
do_packagedata', 'zlib, do_packagedata', 'rpm, do_populate_sysroot'])

[snip]

// Robert


On 11/13/2015 07:41 AM, Christopher Larson wrote:
> From: Christopher Larson <chris_larson@mentor.com>
>
> This lets someone use a different update-alternatives-native provider. Without
> this available, they'll step on one another in the sysroot unconditionally,
> since we need to build opkg-utils-native for ipk based builds regardless.
>
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> ---
>   meta/recipes-devtools/opkg-utils/opkg-utils_git.bb | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
> index 5f518d2..b242d1f 100644
> --- a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
> +++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
> @@ -5,7 +5,7 @@ HOMEPAGE = "http://code.google.com/p/opkg/"
>   LICENSE = "GPLv2+"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
>                       file://opkg.py;beginline=1;endline=18;md5=15917491ad6bf7acc666ca5f7cc1e083"
> -PROVIDES += "virtual/update-alternatives"
> +PROVIDES += "${@bb.utils.contains('PACKAGECONFIG', 'update-alternatives', 'virtual/update-alternatives', '', d)}"
>
>   SRCREV = "53274f087565fd45d8452c5367997ba6a682a37a"
>   PV = "0.1.8+git${SRCPV}"
> @@ -21,15 +21,21 @@ TARGET_CC_ARCH += "${LDFLAGS}"
>   PYTHONRDEPS = "python python-shell python-io python-math python-crypt python-logging python-fcntl python-subprocess python-pickle python-compression python-textutils python-stringold"
>   PYTHONRDEPS_class-native = ""
>
> -PACKAGECONFIG = "python"
> +PACKAGECONFIG = "python update-alternatives"
>   PACKAGECONFIG[python] = ",,,${PYTHONRDEPS}"
> +PACKAGECONFIG[update-alternatives] = ",,,"
>
>   do_install() {
>   	oe_runmake PREFIX=${prefix} DESTDIR=${D} install
> +	if ! ${@bb.utils.contains('PACKAGECONFIG', 'update-alternatives', 'true', 'false', d)}; then
> +		rm -f "${D}${bindir}/update-alternatives"
> +	fi
>   }
>
>   do_install_append_class-target() {
> -	sed -i ${D}${bindir}/update-alternatives -e 's,/usr/bin,${bindir},g; s,/usr/lib,${libdir},g'
> +	if [ -e "${D}${bindir}/update-alternatives" ]; then
> +		sed -i ${D}${bindir}/update-alternatives -e 's,/usr/bin,${bindir},g; s,/usr/lib,${libdir},g'
> +	fi
>   }
>
>   PACKAGES =+ "update-alternatives-opkg"
>

