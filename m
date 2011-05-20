Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1QNZC2-0001Ey-TN
	for openembedded-core@lists.openembedded.org;
	Sat, 21 May 2011 01:33:19 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 20 May 2011 16:30:20 -0700
X-ExtLoop1: 1
Received: from unknown (HELO [10.255.12.39]) ([10.255.12.39])
	by orsmga002.jf.intel.com with ESMTP; 20 May 2011 16:30:20 -0700
Message-ID: <4DD6F98B.7090700@intel.com>
Date: Fri, 20 May 2011 16:30:19 -0700
From: Saul Wold <saul.wold@intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1305933509.git.raj.khem@gmail.com>
	<43cfb965113150ea56c55c3880b67ba272b3c719.1305933509.git.raj.khem@gmail.com>
In-Reply-To: <43cfb965113150ea56c55c3880b67ba272b3c719.1305933509.git.raj.khem@gmail.com>
Subject: Re: [PATCH 1/2] opkg_svn.bb: Install rcS.d into ${D} instead of ${IMAGE_ROOTFS}
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
X-List-Received-Date: Fri, 20 May 2011 23:33:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/20/2011 04:19 PM, Khem Raj wrote:
> Remove headerfix.patch, its already applied upstream
>
Minor nit, should be $D in the subject line also right?

Sau!

> Signed-off-by: Khem Raj<raj.khem@gmail.com>
> ---
>   meta/recipes-devtools/opkg/opkg/headerfix.patch |   19 -------------------
>   meta/recipes-devtools/opkg/opkg_svn.bb          |    3 +--
>   2 files changed, 1 insertions(+), 21 deletions(-)
>   delete mode 100644 meta/recipes-devtools/opkg/opkg/headerfix.patch
>
> diff --git a/meta/recipes-devtools/opkg/opkg/headerfix.patch b/meta/recipes-devtools/opkg/opkg/headerfix.patch
> deleted file mode 100644
> index b3515a0..0000000
> --- a/meta/recipes-devtools/opkg/opkg/headerfix.patch
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -Without this, the FILE reference in this header can cause compile issues.
> -
> -RP - 29/1/10
> -
> -Upstream-Status: Pending
> -
> -Index: trunk/libopkg/pkg_dest.h
> -===================================================================
> ---- trunk.orig/libopkg/pkg_dest.h	2010-01-29 09:37:22.000000000 +0000
> -+++ trunk/libopkg/pkg_dest.h	2010-01-29 09:37:33.000000000 +0000
> -@@ -18,6 +18,8 @@
> - #ifndef PKG_DEST_H
> - #define PKG_DEST_H
> -
> -+#include<stdio.h>
> -+
> - typedef struct pkg_dest pkg_dest_t;
> - struct pkg_dest
> - {
> diff --git a/meta/recipes-devtools/opkg/opkg_svn.bb b/meta/recipes-devtools/opkg/opkg_svn.bb
> index 5964a47..3f2c22b 100644
> --- a/meta/recipes-devtools/opkg/opkg_svn.bb
> +++ b/meta/recipes-devtools/opkg/opkg_svn.bb
> @@ -11,7 +11,6 @@ RREPLACES_${PN} = "opkg-nogpg"
>
>   SRC_URI = "svn://opkg.googlecode.com/svn;module=trunk;proto=http \
>              file://add_vercmp.patch \
> -           file://headerfix.patch \
>   "
>
>   S = "${WORKDIR}/trunk"
> @@ -34,7 +33,7 @@ do_install_append() {
>   pkg_postinst_${PN} () {
>   #!/bin/sh
>   if [ "x$D" != "x" ]; then
> -	install -d ${IMAGE_ROOTFS}/${sysconfdir}/rcS.d
> +	install -d $D/${sysconfdir}/rcS.d
>   	# this happens at S98 where our good 'ole packages script used to run
>   	echo "#!/bin/sh
>   opkg-cl configure



