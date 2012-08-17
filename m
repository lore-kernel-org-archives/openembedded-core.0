Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T2La0-0003uk-37 for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 14:23:08 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7HCB6Kl008538;
	Fri, 17 Aug 2012 13:11:06 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07451-09; Fri, 17 Aug 2012 13:11:01 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7HCAsF6008532
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Fri, 17 Aug 2012 13:10:55 +0100
Message-ID: <1345205454.27428.3.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 17 Aug 2012 13:10:54 +0100
In-Reply-To: <1345158769-15782-1-git-send-email-msm@freescale.com>
References: <1345158769-15782-1-git-send-email-msm@freescale.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Matthew McClintock <msm@freescale.com>, openembedded-core@openembedded.org
Subject: Re: [PATCH] cross-localedef-native_2.16.bb: fix for CentOS 5.X
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
X-List-Received-Date: Fri, 17 Aug 2012 12:23:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-08-16 at 18:12 -0500, Matthew McClintock wrote:
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
>  meta/recipes-core/eglibc/cross-localedef-native_2.16.bb     |  9 +++++++--
>  .../eglibc/eglibc-2.16/fix_for_centos_5.8.patch             | 13 +++++++++++++
>  2 files changed, 20 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/fix_for_centos_5.8.patch
> 
> diff --git a/meta/recipes-core/eglibc/cross-localedef-native_2.16.bb b/meta/recipes-core/eglibc/cross-localedef-native_2.16.bb
> index 47f0834..a79a276 100644
> --- a/meta/recipes-core/eglibc/cross-localedef-native_2.16.bb
> +++ b/meta/recipes-core/eglibc/cross-localedef-native_2.16.bb
> @@ -13,10 +13,15 @@ LIC_FILES_CHKSUM = "file://${LIC_DIR}/LICENSES;md5=98a1128c4b58120182cbea3b1752d
>  inherit native
>  inherit autotools
>  
> -PR = "r0"
> +# pick up an eglibc-2.16 patch
> +FILESPATH = "${FILE_DIRNAME}/eglibc-${PV}"
> +
> +PR = "r1"
>  SRCREV="19383"
>  EGLIBC_BRANCH="eglibc-2_16"
> -SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};protocol=http "
> +SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};protocol=http \
> +	   file://fix_for_centos_5.8.patch;patchdir=.. \
> +	  "
>  S = "${WORKDIR}/${EGLIBC_BRANCH}/localedef"
>  
>  do_unpack_append() {
> diff --git a/meta/recipes-core/eglibc/eglibc-2.16/fix_for_centos_5.8.patch b/meta/recipes-core/eglibc/eglibc-2.16/fix_for_centos_5.8.patch
> new file mode 100644
> index 0000000..32ee16d
> --- /dev/null
> +++ b/meta/recipes-core/eglibc/eglibc-2.16/fix_for_centos_5.8.patch
> @@ -0,0 +1,13 @@
> +Index: eglibc-2_16/libc/locale/programs/config.h

No patch header here...

Cheers,

Richard


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




