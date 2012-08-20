Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T3VPP-0000Zd-Cp
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Aug 2012 19:04:59 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 20 Aug 2012 09:52:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,797,1336374000"; d="scan'208";a="183213873"
Received: from unknown (HELO [10.255.13.49]) ([10.255.13.49])
	by azsmga001.ch.intel.com with ESMTP; 20 Aug 2012 09:52:53 -0700
Message-ID: <50326B65.4090600@linux.intel.com>
Date: Mon, 20 Aug 2012 09:52:53 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1345226047-25896-1-git-send-email-msm@freescale.com>
In-Reply-To: <1345226047-25896-1-git-send-email-msm@freescale.com>
Cc: Matthew McClintock <msm@freescale.com>
Subject: Re: [PATCH v2] cross-localedef-native_2.16.bb: fix for CentOS 5.X
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 20 Aug 2012 17:04:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/17/2012 10:54 AM, Matthew McClintock wrote:
> | gcc -isystem/home/mattsm/git/poky/build-master/tmp/sysroots/x86_64-linux/usr/include -isystem/home/mattsm/git/poky/build-master/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -DNOT_IN_libc=1 -DNO_SYSCONF -DNO_UNCOMPRESS -DLOCALE_PATH='"/usr/local/lib/locale:/usr/local/share/i18n"' -DLOCALEDIR='"/usr/local/lib/locale"' -DLOCALE_ALIAS_PATH='"/usr/local/share/locale"' -DCHARMAP_PATH='"/usr/local/share/i18n/charmaps"' -DREPERTOIREMAP_PATH='"/usr/local/share/i18n/repertoiremaps"' -DLOCSRCDIR='"/usr/local/share/i18n/locales"' -DNOT_IN_libc -DIN_GLIBC_LOCALEDEF -Iglibc/locale/programs -I./include -Iglibc/locale -I. -I. -include ./include/always.h -Wall -Wno-format -c -o ld-address.o glibc/locale/programs/ld-address.c
> | In file included from glibc/locale/programs/localedef.h:24,
> |                  from glibc/locale/programs/ld-address.c:30:
> | ./include/locale.h:6: error: conflicting types for 'locale_t'
> | glibc/locale/xlocale.h:42: error: previous declaration of 'locale_t' was here
> | make: *** [ld-address.o] Error 1
> | ERROR: oe_runmake failed
>
> Signed-off-by: Matthew McClintock <msm@freescale.com>
> ---
>   .../eglibc/cross-localedef-native_2.16.bb          |    9 +++++++--
>   .../eglibc/eglibc-2.16/fix_for_centos_5.8.patch    |   18 ++++++++++++++++++
>   2 files changed, 25 insertions(+), 2 deletions(-)
>   create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/fix_for_centos_5.8.patch
>
> diff --git a/meta/recipes-core/eglibc/cross-localedef-native_2.16.bb b/meta/recipes-core/eglibc/cross-localedef-native_2.16.bb
> index 47f0834..a79a276 100644
> --- a/meta/recipes-core/eglibc/cross-localedef-native_2.16.bb
> +++ b/meta/recipes-core/eglibc/cross-localedef-native_2.16.bb
> @@ -13,10 +13,15 @@ LIC_FILES_CHKSUM = "file://${LIC_DIR}/LICENSES;md5=98a1128c4b58120182cbea3b1752d
>   inherit native
>   inherit autotools
>
> -PR = "r0"
> +# pick up an eglibc-2.16 patch
> +FILESPATH = "${FILE_DIRNAME}/eglibc-${PV}"
> +
> +PR = "r1"
>   SRCREV="19383"
>   EGLIBC_BRANCH="eglibc-2_16"
> -SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};protocol=http "
> +SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};protocol=http \
> +	   file://fix_for_centos_5.8.patch;patchdir=.. \
> +	  "
>   S = "${WORKDIR}/${EGLIBC_BRANCH}/localedef"
>
>   do_unpack_append() {
> diff --git a/meta/recipes-core/eglibc/eglibc-2.16/fix_for_centos_5.8.patch b/meta/recipes-core/eglibc/eglibc-2.16/fix_for_centos_5.8.patch
> new file mode 100644
> index 0000000..7618c99
> --- /dev/null
> +++ b/meta/recipes-core/eglibc/eglibc-2.16/fix_for_centos_5.8.patch
> @@ -0,0 +1,18 @@
> +Upstream-Status: Inappropriate [other]
> +
> +This is a hack to fix building the locale bits on an older
> +CentOs 5.X machine
> +
> +Index: eglibc-2_16/libc/locale/programs/config.h
> +===================================================================
> +--- eglibc-2_16.orig/libc/locale/programs/config.h
> ++++ eglibc-2_16/libc/locale/programs/config.h
> +@@ -19,6 +19,8 @@
> + #ifndef _LD_CONFIG_H
> + #define _LD_CONFIG_H	1
> +
> ++#define DUMMY_LOCALE_T
> ++
> + /* Use the internal textdomain used for libc messages.  */
> + #define PACKAGE _libc_intl_domainname
> + #ifndef VERSION
>

Merged into OE-Core

Thanks
	Sau!



