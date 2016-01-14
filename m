Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 72789607A5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 06:49:08 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u0E6n7LV007039
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 13 Jan 2016 22:49:07 -0800 (PST)
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 13 Jan 2016 22:49:06 -0800
Message-ID: <569744AF.5060009@windriver.com>
Date: Thu, 14 Jan 2016 14:48:15 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
References: <cover.1449743618.git.hongxu.jia@windriver.com>
In-Reply-To: <cover.1449743618.git.hongxu.jia@windriver.com>
Subject: Re: [PATCH 0/1] fix IMAGE_LINGUAS did not support multilib correctly
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
X-List-Received-Date: Thu, 14 Jan 2016 06:49:08 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ross,

I found you added this patch to 'Consolidated Pull', but not merged finally.

Did it cause build failure or introduce trouble?

//Hongxu


On 12/10/2015 06:41 PM, Hongxu Jia wrote:
> Test steps:
>
> 1. Make use of service in meta-skeleton to test the issue.
>     The app invoke setlocale(LC_CTYPE, "en_US.UTF-8") in C.
>
> --- a/meta-skeleton/recipes-skeleton/service/service/skeleton_test.c
> +++ b/meta-skeleton/recipes-skeleton/service/service/skeleton_test.c
> @@ -1,12 +1,13 @@
> -#include <unistd.h>
> -
> -/* This demo does nothing except for testing /etc/init.d/skeleton */
> +#include <locale.h>
> +#include <stdio.h>
> +#include <errno.h>
> +#include <string.h>
>   
>   int main(int argc, char *argv[])
>   {
> -       daemon(0, 0);
> -       while (1) {
> -               sleep(1);
> -       }
> -       return 0;
> +    char *p = setlocale (LC_CTYPE, "en_US.UTF-8");
> +    if (p == NULL)
> +        printf("setlocale failed: %s\n", strerror(errno));
> +    else
> +        printf("p %s\n", p);
>   }
>
> --- a/meta-skeleton/recipes-skeleton/service/service_0.1.bb
> +++ b/meta-skeleton/recipes-skeleton/service/service_0.1.bb
> @@ -1,4 +1,4 @@
> -SUMMARY = "The canonical example of init scripts"
> +SUMMARY = "The example to test multilib of setlocale"
>   SECTION = "base"
>   LICENSE = "GPLv2"
>   LIC_FILES_CHKSUM = "file://${WORKDIR}/COPYRIGHT;md5=349c872e0066155e1818b786938876a4"
> @@ -8,24 +8,14 @@ SRC_URI = "file://skeleton \
>             file://COPYRIGHT \
>             "
>   
> +FILES_${PN} += "${libdir}/setlocale"
> +
>   do_compile () {
> -       ${CC} ${WORKDIR}/skeleton_test.c -o ${WORKDIR}/skeleton-test
> +       ${CC} ${WORKDIR}/skeleton_test.c -o ${WORKDIR}/setlocale
>   }
>   
>   do_install () {
> -       install -d ${D}${sysconfdir}/init.d
> -       cat ${WORKDIR}/skeleton | \
> -         sed -e 's,/etc,${sysconfdir},g' \
> -             -e 's,/usr/sbin,${sbindir},g' \
> -             -e 's,/var,${localstatedir},g' \
> -             -e 's,/usr/bin,${bindir},g' \
> -             -e 's,/usr,${prefix},g' > ${D}${sysconfdir}/init.d/skeleton
> -       chmod a+x ${D}${sysconfdir}/init.d/skeleton
> -
> -       install -d ${D}${sbindir}
> -       install -m 0755 ${WORKDIR}/skeleton-test ${D}${sbindir}/
> +       install -d ${D}${libdir}
> +       install -m 0755 ${WORKDIR}/setlocale ${D}${libdir}/
>   }
>   
> -RDEPENDS_${PN} = "initscripts"
> -
> -CONFFILES_${PN} += "${sysconfdir}/init.d/skeleton"
>
>
> 2. On qemux86-64, enable multilib, add non-multilib and
>     multilib service to image, assign 'en-us' to IMAGE_LINGUAS
> vim local.conf
> ...
> MACHINE ?= "qemux86-64"
>
> require conf/multilib.conf
> MULTILIBS = "multilib:lib32"
> DEFAULTTUNE_virtclass-multilib-lib32 = "core2-32"
>
> IMAGE_INSTALL_append = " file service lib32-service"
> IMAGE_LINGUAS_append = " en-us"
> ...
>
> vim bblayers.conf
> ...
> BBLAYERS ?= " \
>    /buildarea/raid0/hjia/poky/meta \
>    /buildarea/raid0/hjia/poky/meta-yocto \
>    /buildarea/raid0/hjia/poky/meta-skeleton \
>    "
> ...
>
> 2. Build non-multilib image
> $ bitbake core-image-minimal
>
> 3. Run qemu
> $ runqemu qemux86-64 core-image-minimal slirp nographic
>
> 4. In qemu, invoke multilib /usr/lib/setlocale and non-multilib
>     /usr/lib64/setlocale success
>
> root@qemux86-64:~# file /usr/lib/setlocale
> /usr/lib/setlocale: ELF 32-bit LSB executable, Intel 80386, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux.so.2, for GNU/Linux 2.6.32, BuildID[sha1]=0caa404112fe8963dd1418757fc4bdee0cab272d, stripped
> root@qemux86-64:~# /usr/lib/setlocale
> p en_US.UTF-8
>
> root@qemux86-64:~# file /usr/lib64/setlocale
> /usr/lib64/setlocale: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 2.6.32, BuildID[sha1]=b8c88222213ffbd4603b34337b3db71aba43c968, stripped
> root@qemux86-64:~#
> root@qemux86-64:~# /usr/lib64/setlocale
> p en_US.UTF-8
>
> 5. Both locale-base-en-us and lib32-locale-base-en-us installed
> root@qemux86-64:~# ls /usr/lib64/locale/en_US/
> LC_ADDRESS         LC_CTYPE           LC_MEASUREMENT     LC_MONETARY        LC_NUMERIC         LC_TELEPHONE
> LC_COLLATE         LC_IDENTIFICATION  LC_MESSAGES
>
> root@qemux86-64:~# ls /usr/lib/locale/en_US/
> LC_ADDRESS         LC_CTYPE           LC_MEASUREMENT     LC_MONETARY        LC_NUMERIC         LC_TELEPHONE
> LC_COLLATE         LC_IDENTIFICATION  LC_MESSAGES
>
> 6. Build multilib image
> $ bitbake lib32-core-image-minimal
>
> 7. Run qemu
> $ runqemu qemux86-64 lib32-core-image-minimal slirp nographic
>
> 8. Both locale-base-en-us and lib32-locale-base-en-us installed
> root@qemux86-64:~# ls /usr/lib64/locale/en_US/
> LC_ADDRESS         LC_CTYPE           LC_MEASUREMENT     LC_MONETARY        LC_NUMERIC         LC_TELEPHONE
> LC_COLLATE         LC_IDENTIFICATION  LC_MESSAGES
>
> root@qemux86-64:~# ls /usr/lib/locale/en_US/
> LC_ADDRESS         LC_CTYPE           LC_MEASUREMENT     LC_MONETARY        LC_NUMERIC         LC_TELEPHONE
> LC_COLLATE         LC_IDENTIFICATION  LC_MESSAGES
>
> 9. Disable multilib and build core-image-minimal
>     only locale-base-en-us is installed
>
> root@qemux86-64:~# /usr/lib/setlocale
> p en_US.UTF-8
>
> root@qemux86-64:~# file /usr/lib/setlocale
> /usr/lib/setlocale: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-x86-64.so.2, for GNU/Linux 2.6.32, BuildID[sha1]=bc6d1a23619ad5629f8e064ce8e426d5d8b20434, stripped
>
> root@qemux86-64:~# ls /usr/lib/locale/en_US/
> LC_ADDRESS         LC_CTYPE           LC_MEASUREMENT     LC_MONETARY        LC_NUMERIC         LC_TELEPHONE
> LC_COLLATE         LC_IDENTIFICATION  LC_MESSAGES        LC_NAME            LC_PAPER           LC_TIME
>
> //Hongxu
>
> The following changes since commit 5e3e2e0cbb0a49986f4653e64c4c8d2b5461645e:
>
>    poky.conf: Bump for 2.1 development (2015-12-10 00:13:13 +0000)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib hongxu/fix-locale
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-locale
>
> Hongxu Jia (1):
>    image/multilib bbclass: install multilib and non-multilib language
>      pkgs for image recipes
>
>   meta/classes/image.bbclass    | 20 +++++++++++++++++++-
>   meta/classes/multilib.bbclass |  9 +++++++++
>   2 files changed, 28 insertions(+), 1 deletion(-)
>


