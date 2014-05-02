Return-Path: <sgw@linux.intel.com>
X-Greylist: delayed 644 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 02 May 2014 19:52:59 UTC
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 7AAE860438
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 May 2014 19:52:59 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 02 May 2014 12:42:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,973,1389772800"; d="scan'208";a="532657661"
Received: from unknown (HELO [10.255.12.182]) ([10.255.12.182])
	by fmsmga002.fm.intel.com with ESMTP; 02 May 2014 12:42:15 -0700
Message-ID: <5363F517.3050806@linux.intel.com>
Date: Fri, 02 May 2014 12:42:15 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Changhyeok Bae <changhyeok.bae@lge.com>, 
	openembedded-core@lists.openembedded.org
References: <1398609887-20141-1-git-send-email-changhyeok.bae@lge.com>
In-Reply-To: <1398609887-20141-1-git-send-email-changhyeok.bae@lge.com>
Subject: Re: [PATCH v6] mirrors.bbclass: Add mirror site for savannah
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
X-List-Received-Date: Fri, 02 May 2014 19:53:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/27/2014 07:44 AM, Changhyeok Bae wrote:
> * The SRC_URI is not accessible.
>    So need to add mirror site referred by the original site.
> * The problem is that
>    http://download.savannah.gnu.org/releases redirects to closest mirror
>    and few mirrors (e.g. .jp) weren't working correctly while
>    http://download-mirror.savannah.gnu.org/releases/ seems to be reliable.
> * Add SAVANNAH_MIRROR variable in bitbake.conf.
> * Change the SRC_URI using the new variable.
>
> Signed-off-by: Changhyeok Bae <changhyeok.bae@lge.com>
> ---
>   meta/classes/mirrors.bbclass                      |    1 +
>   meta/conf/bitbake.conf                            |    1 +
>   meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb    |    2 +-
>   meta/recipes-devtools/dmidecode/dmidecode_2.12.bb |    2 +-
>   meta/recipes-devtools/quilt/quilt-0.61.inc        |    2 +-
>   meta/recipes-extended/ed/ed_0.5.bb                |    2 +-
>   meta/recipes-extended/texi2html/texi2html_5.0.bb  |    2 +-
>   meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb     |    2 +-
>   meta/recipes-support/attr/acl.inc                 |    2 +-
>   meta/recipes-support/attr/attr.inc                |    2 +-
>   10 files changed, 10 insertions(+), 8 deletions(-)
>
> diff --git a/meta/classes/mirrors.bbclass b/meta/classes/mirrors.bbclass
> index 1fd7cd8..4091a19 100644
> --- a/meta/classes/mirrors.bbclass
> +++ b/meta/classes/mirrors.bbclass
> @@ -45,6 +45,7 @@ ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp://sunsite.ualberta.ca/pub/M
>   ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp://the.wiretapped.net/pub/security/host-security/lsof/ \n \
>   http://www.apache.org/dist  http://archive.apache.org/dist \n \
>   http://downloads.sourceforge.net/watchdog/ http://fossies.org/linux/misc/ \n \
> +${SAVANNAH_MIRROR} http://download-mirror.savannah.gnu.org/releases \n \
>   cvs://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \n \
>   svn://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \n \
>   git://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \n \
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index b3786a7..fc3f988 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -568,6 +568,7 @@ KERNELORG_MIRROR = "http://kernel.org/pub"
>   SOURCEFORGE_MIRROR = "http://downloads.sourceforge.net"
>   XLIBS_MIRROR = "http://xlibs.freedesktop.org/release"
>   XORG_MIRROR = "http://xorg.freedesktop.org/releases"
> +SAVANNAH_MIRROR = "http://download.savannah.gnu.org/releases"
>
I may have been unclear in my request, we should have both a 
SAVANNAH_GNU_MIRROR and a SAVANNAH_NONGNU_MIRROR that point to their 
respective downloads area (gnu and nongnu) and then adjust the SRC_URI 
below appropriately.

Otherwise download areas change and can cause problems for caches and 
other tools.

Thanks
	Sau!

>   # You can use the mirror of your country to get faster downloads by putting
>   #  export DEBIAN_MIRROR = "ftp://ftp.de.debian.org/debian/pool"
> diff --git a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
> index 34e0a54..6841d6f 100644
> --- a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
> +++ b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
> @@ -9,7 +9,7 @@ PR = "r13"
>
>   RDEPENDS_${PN} = "${PN}-inittab"
>
> -SRC_URI = "http://download.savannah.gnu.org/releases-noredirect/sysvinit/sysvinit-${PV}.tar.bz2 \
> +SRC_URI = "${SAVANNAH_MIRROR}/sysvinit/sysvinit-${PV}.tar.bz2 \
>              file://install.patch \
>              file://crypt-lib.patch \
>              file://pidof-add-m-option.patch \
> diff --git a/meta/recipes-devtools/dmidecode/dmidecode_2.12.bb b/meta/recipes-devtools/dmidecode/dmidecode_2.12.bb
> index 61779fe..1a5c8e2 100644
> --- a/meta/recipes-devtools/dmidecode/dmidecode_2.12.bb
> +++ b/meta/recipes-devtools/dmidecode/dmidecode_2.12.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "http://www.nongnu.org/dmidecode/"
>   LICENSE = "GPLv2"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=393a5ca445f6965873eca0259a17f833"
>
> -SRC_URI = "http://savannah.nongnu.org/download/dmidecode/${BP}.tar.bz2"
> +SRC_URI = "${SAVANNAH_MIRROR}/dmidecode/${BP}.tar.bz2"
>
>   COMPATIBLE_HOST = "(i.86|x86_64|aarch64|arm|powerpc).*-linux"
>
> diff --git a/meta/recipes-devtools/quilt/quilt-0.61.inc b/meta/recipes-devtools/quilt/quilt-0.61.inc
> index 4d915bf..79285e0 100644
> --- a/meta/recipes-devtools/quilt/quilt-0.61.inc
> +++ b/meta/recipes-devtools/quilt/quilt-0.61.inc
> @@ -4,7 +4,7 @@ SECTION = "devel"
>   LICENSE = "GPLv2"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
>
> -SRC_URI = "http://download.savannah.gnu.org/releases/quilt/quilt-${PV}.tar.gz \
> +SRC_URI = "${SAVANNAH_MIRROR}/quilt/quilt-${PV}.tar.gz \
>           file://install.patch \
>           file://run-ptest \
>           file://Makefile \
> diff --git a/meta/recipes-extended/ed/ed_0.5.bb b/meta/recipes-extended/ed/ed_0.5.bb
> index a696c0c..12476de 100644
> --- a/meta/recipes-extended/ed/ed_0.5.bb
> +++ b/meta/recipes-extended/ed/ed_0.5.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6ddd5335ef96fb858a138230af773710 \
>                       file://main.c;beginline=1;endline=17;md5=36d4b85e5ae9028e918d1cc775c2475e"
>
>   PR = "r2"
> -SRC_URI = "http://download.savannah.gnu.org/releases-noredirect/ed/ed-${PV}.tar.bz2"
> +SRC_URI = "${SAVANNAH_MIRROR}/ed/ed-${PV}.tar.bz2"
>
>   SRC_URI[md5sum] = "4ee21e9dcc9b5b6012c23038734e1632"
>   SRC_URI[sha256sum] = "edef2bbde0fbf0d88232782a0eded323f483a0519d6fde9a3b1809056fd35f3e"
> diff --git a/meta/recipes-extended/texi2html/texi2html_5.0.bb b/meta/recipes-extended/texi2html/texi2html_5.0.bb
> index a22b981..b991fc6 100644
> --- a/meta/recipes-extended/texi2html/texi2html_5.0.bb
> +++ b/meta/recipes-extended/texi2html/texi2html_5.0.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
>
>   PR = "r2"
>
> -SRC_URI     = "http://download.savannah.gnu.org/releases/texi2html/${BPN}-${PV}.tar.bz2 \
> +SRC_URI     = "${SAVANNAH_MIRROR}/texi2html/${BPN}-${PV}.tar.bz2 \
>                  file://fix_gettext_version.patch"
>
>   SRC_URI[md5sum] = "f15ac876fcdc8be865b16535f480aa54"
> diff --git a/meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb b/meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb
> index f124be9..a4924e9 100644
> --- a/meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb
> +++ b/meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb
> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
>
>   DEPENDS = "gtk+ intltool-native"
>   DEPENDS_append_poky = " libowl"
> -SRC_URI = "http://savannah.nongnu.org/download/${BPN}/${BPN}-${PV}.tar.gz \
> +SRC_URI = "${SAVANNAH_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
>   	   file://leafpad.desktop"
>
>   SRC_URI[md5sum] = "254a72fc67505e3aa52884c729cd7b97"
> diff --git a/meta/recipes-support/attr/acl.inc b/meta/recipes-support/attr/acl.inc
> index 355dbdd..81a2f17 100644
> --- a/meta/recipes-support/attr/acl.inc
> +++ b/meta/recipes-support/attr/acl.inc
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://doc/COPYING;md5=c781d70ed2b4d48995b790403217a249 \
>                       file://doc/COPYING.LGPL;md5=9e9a206917f8af112da634ce3ab41764"
>
>   DEPENDS = "attr"
> -SRC_URI = "http://download.savannah.gnu.org/releases/acl/${BP}.src.tar.gz \
> +SRC_URI = "${SAVANNAH_MIRROR}/acl/${BP}.src.tar.gz \
>              file://run-ptest \
>              file://acl-fix-the-order-of-expected-output-of-getfacl.patch \
>   "
> diff --git a/meta/recipes-support/attr/attr.inc b/meta/recipes-support/attr/attr.inc
> index 873c1ff..266bf61 100644
> --- a/meta/recipes-support/attr/attr.inc
> +++ b/meta/recipes-support/attr/attr.inc
> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://doc/COPYING;md5=2d0aa14b3fce4694e4f615e30186335f \
>                       file://attr/attr.c;endline=17;md5=be0403261f0847e5f43ed5b08d19593c \
>                       file://libattr/libattr.c;endline=17;md5=7970f77049f8fa1199fff62a7ab724fb"
>
> -SRC_URI = "http://download.savannah.gnu.org/releases/attr/${BP}.src.tar.gz \
> +SRC_URI = "${SAVANNAH_MIRROR}/attr/${BP}.src.tar.gz \
>              file://run-ptest \
>   "
>
>

