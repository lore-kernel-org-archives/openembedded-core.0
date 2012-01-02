Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RhlrJ-0001kU-Iq
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Jan 2012 18:39:48 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 02 Jan 2012 09:32:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="107983932"
Received: from unknown (HELO [10.255.13.112]) ([10.255.13.112])
	by fmsmga002.fm.intel.com with ESMTP; 02 Jan 2012 09:32:08 -0800
Message-ID: <4F01EA18.4050108@linux.intel.com>
Date: Mon, 02 Jan 2012 09:32:08 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <174bd926e4a4e00426eb92a2147cd0169e5cd515.1325252646.git.shane.wang@intel.com>
	<2216646a20081554bc1a4f8ab9e6bf7575b1b146.1325252646.git.shane.wang@intel.com>
In-Reply-To: <2216646a20081554bc1a4f8ab9e6bf7575b1b146.1325252646.git.shane.wang@intel.com>
Subject: Re: [PATCH 06/14] hdparm: upgrade to 9.37
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
X-List-Received-Date: Mon, 02 Jan 2012 17:39:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/30/2011 06:33 AM, Shane Wang wrote:
> Because hdparm depends on stat, stat is brought into Yocto.
>
Is this a new dependency witht he update version?


> Part of this patch comes from oe
> http://git.openembedded.org/openembedded/tree/recipes/hdparm, and
> http://git.openembedded.org/openembedded/tree/recipes/stat.
> But, changes include:
>   - upgrade to the latest version 9.37 from 9.35.
>   - added license checksum for both recipes.
>   - for hdparm, the license for wiper which is in hdparm is GPLv2. So, hdparm license in its bb file is changed accordingly.
>
> Signed-off-by: Shane Wang<shane.wang@intel.com>
> ---
>   .../recipes-extended/hdparm/hdparm-6.3/bswap.patch |   37 --------------------
>   .../hdparm/hdparm-6.3/uclibc.patch                 |   34 ------------------
>   meta/recipes-extended/hdparm/hdparm_6.3.bb         |   18 ---------
>   meta/recipes-extended/hdparm/hdparm_9.37.bb        |   35 ++++++++++++++++++
>   meta/recipes-extended/stat/stat_3.3.bb             |   27 ++++++++++++++
>   5 files changed, 62 insertions(+), 89 deletions(-)
>   delete mode 100644 meta/recipes-extended/hdparm/hdparm-6.3/bswap.patch
>   delete mode 100644 meta/recipes-extended/hdparm/hdparm-6.3/uclibc.patch
>   delete mode 100644 meta/recipes-extended/hdparm/hdparm_6.3.bb
>   create mode 100644 meta/recipes-extended/hdparm/hdparm_9.37.bb
>   create mode 100644 meta/recipes-extended/stat/stat_3.3.bb
>
> diff --git a/meta/recipes-extended/hdparm/hdparm-6.3/bswap.patch b/meta/recipes-extended/hdparm/hdparm-6.3/bswap.patch
> deleted file mode 100644
> index 715886a..0000000
> --- a/meta/recipes-extended/hdparm/hdparm-6.3/bswap.patch
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -Upstream-Status: Backport
> -
> -#
> -# Patch managed by http://www.holgerschurig.de/patcher.html
> -#
> -
> ---- hdparm-5.8/hdparm.c~bswap
> -+++ hdparm-5.8/hdparm.c
> -@@ -20,7 +20,9 @@
> - #include<linux/types.h>
> - #include<linux/hdreg.h>
> - #include<linux/major.h>
> --#include<asm/byteorder.h>
> -+#include<byteswap.h>
> -+
> -+#define le16_to_cpus(x) bswap_16(htons(x))
> -
> - #include "hdparm.h"
> -
> -@@ -1160,7 +1162,7 @@
> - 			}
> - 		} else {
> - 			for(i = 0; i<  0x100; ++i) {
> --				__le16_to_cpus(&id[i]);
> -+				le16_to_cpus(&id[i]);
> - 			}
> - 			identify((void *)id, NULL);
> - 		}
> -@@ -1380,7 +1382,7 @@
> - 	}
> - 	for (i = 0; count>= 4; ++i) {
> - 		sbuf[i] = (fromhex(b[0])<<  12) | (fromhex(b[1])<<  8) | (fromhex(b[2])<<  4) | fromhex(b[3]);
> --		__le16_to_cpus((__u16 *)(&sbuf[i]));
> -+		le16_to_cpus((__u16 *)(&sbuf[i]));
> - 		b += 5;
> - 		count -= 5;
> - 	}
> diff --git a/meta/recipes-extended/hdparm/hdparm-6.3/uclibc.patch b/meta/recipes-extended/hdparm/hdparm-6.3/uclibc.patch
> deleted file mode 100644
> index d5f9298..0000000
> --- a/meta/recipes-extended/hdparm/hdparm-6.3/uclibc.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -Upstream-Status: Inappropriate [embedded specific]
> -
> ---- hdparm-5.8/hdparm.c.ark	2005-05-22 19:48:34.000000000 +0000
> -+++ hdparm-5.8/hdparm.c	2005-05-22 19:52:18.000000000 +0000
> -@@ -17,7 +17,9 @@
> - #include<sys/times.h>
> - #include<sys/types.h>
> - #include<sys/mount.h>
> -+#ifndef __UCLIBC__
> - #include<linux/types.h>
> -+#endif
> - #include<linux/hdreg.h>
> - #include<linux/major.h>
> - #include<byteswap.h>
> ---- hdparm-5.8/hdparm.h.ark	2005-05-22 19:51:49.000000000 +0000
> -+++ hdparm-5.8/hdparm.h	2005-05-22 19:54:54.000000000 +0000
> -@@ -1,6 +1,6 @@
> - /* Some prototypes for extern functions. */
> -
> --#include<linux/types.h>	/* for __u16 */
> -+#include<stdint.h>
> -
> - #if !defined(__GNUC__)&&  !defined(__attribute__)
> - #define __attribute__(x)	/* if not using GCC, turn off the __attribute__
> -@@ -11,7 +11,7 @@
> -    others, though, were declared in hdparm.c with global scope; since other
> -    functions in that file have static (file) scope, I assume the difference is
> -    intentional. */
> --extern void identify (__u16 *id_supplied, const char *devname);
> -+extern void identify (uint16_t *id_supplied, const char *devname);
> -
> - extern void usage_error(int out)    __attribute__((noreturn));
> - extern int main(int argc, char **argv) __attribute__((noreturn));
> -
> diff --git a/meta/recipes-extended/hdparm/hdparm_6.3.bb b/meta/recipes-extended/hdparm/hdparm_6.3.bb
> deleted file mode 100644
> index 62ae4c0..0000000
> --- a/meta/recipes-extended/hdparm/hdparm_6.3.bb
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -SUMMARY = "Utility for displaying and setting hard disk parameters"
> -DESCRIPTION = "hdparm is a system utility for viewing \
> -and manipulating various IDE drive and driver parameters."
> -SECTION = "console/utils"
> -LICENSE = "BSD"
> -LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=910a8a42c962d238619c75fdb78bdb24"
> -
> -SRC_URI = "${SOURCEFORGE_MIRROR}/hdparm/hdparm-${PV}.tar.gz \
> -	   file://bswap.patch \
> -	   file://uclibc.patch"
> -
> -SRC_URI[md5sum] = "0c12672f3a09c14ad0b0882f15fc9389"
> -SRC_URI[sha256sum] = "08688a6a46ba495494bf838f8f26103e797584c1888eca94e43a171e1b37246d"
> -
> -do_install () {
> -	install -d ${D}/${sbindir} ${D}/${mandir}/man8
> -	oe_runmake 'DESTDIR=${D}' install
> -}
> diff --git a/meta/recipes-extended/hdparm/hdparm_9.37.bb b/meta/recipes-extended/hdparm/hdparm_9.37.bb
> new file mode 100644
> index 0000000..fdda67f
> --- /dev/null
> +++ b/meta/recipes-extended/hdparm/hdparm_9.37.bb
> @@ -0,0 +1,35 @@
> +DESCRIPTION = "hdparm is a Linux shell utility for viewing \
> +and manipulating various IDE drive and driver parameters."
> +SECTION = "console/utils"
> +PRIORITY = "optional"
> +LICENSE = "BSD&  GPLv2"

Spacing needs to be between the BSD and &

Since you are creating a wiper package below and it is licensed as
GPLv2, then you also need a LICENSE_wiper = "GPLv2"

> +LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=910a8a42c962d238619c75fdb78bdb24 \
> +                    file://debian/copyright;md5=a82d7ba3ade9e8ec902749db98c592f3 \
> +                    file://wiper/GPLv2.txt;md5=fcb02dc552a041dee27e4b85c7396067 \
> +                    file://wiper/wiper.sh;beginline=7;endline=31;md5=b7bc642addc152ea307505bf1a296f09"
> +
> +PACKAGES += "wiper"
> +
> +FILES_wiper = "${bindir}/wiper.sh"
> +FILES_${PN} = "${base_sbindir} ${mandir}"
> +
> +RDEPENDS_wiper = "bash gawk stat"
> +
> +SRC_URI = "${SOURCEFORGE_MIRROR}/hdparm/hdparm-${PV}.tar.gz "
> +SRC_URI[md5sum] = "0bb94ddd1bedd5c02b1ca62f1caaf6de"
> +SRC_URI[sha256sum] = "87ede0a7cb5b4de500748232e9d251b75acfccce078e1d42c8d125b9e5b4ccd3"
> +
> +do_install () {
> +	install -d ${D}/${base_sbindir} ${D}/${mandir}/man8 ${D}/${bindir}
> +	oe_runmake 'DESTDIR=${D}' 'sbindir=${base_sbindir}' install
> +	mv ${D}${base_sbindir}/hdparm ${D}${base_sbindir}/hdparm.${PN}
> +	cp ${S}/wiper/wiper.sh ${D}/${bindir}
> +}
> +
> +pkg_postinst_${PN} () {
> +	update-alternatives --install ${base_sbindir}/hdparm hdparm hdparm.${PN} 100
> +}
> +
> +pkg_prerm_${PN} () {
> +	update-alternatives --remove hdparm hdparm.${PN}
> +}
> diff --git a/meta/recipes-extended/stat/stat_3.3.bb b/meta/recipes-extended/stat/stat_3.3.bb
> new file mode 100644
> index 0000000..dc553ea
> --- /dev/null
> +++ b/meta/recipes-extended/stat/stat_3.3.bb
> @@ -0,0 +1,27 @@
> +SECTION = "console/utils"
> +DESCRIPTION = "Display all information about a file that the stat() call provides and all information a filesystem that statfs() provides."
> +LICENSE = "GPL"
Which GPL version?

> +LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=39886b077fd072e876e5c4c16310b631 \
> +                    file://GPL;md5=94d55d512a9ba36caa9b7df079bae19f"
> +
> +BBCLASSEXTEND = "native"
> +
> +PR = "r1"
> +
> +SRC_URI = "ftp://metalab.unc.edu/pub/Linux/utils/file/stat-3.3.tar.gz"
> +SRC_URI[md5sum] = "37e247e8e400ad9205f1b0500b728fd3"
> +SRC_URI[sha256sum] = "7071f0384a423a938dd542c1f08547a02824f6359acd3ef3f944b2c4c2d1ee09"
> +
> +do_install() {
> +	install -d ${D}${bindir} ${D}${mandir}/man1
> +	install -m 755 stat ${D}${bindir}
> +	install -m 644 stat.1 ${D}${mandir}/man1
> +}
> +
> +#do_install_virtclass-native() {
> +#	install -d ${D}${bindir}
> +#	install -m 755 stat ${D}${bindir}
> +#}
> +
> +NATIVE_INSTALL_WORKS = "1"
> +


