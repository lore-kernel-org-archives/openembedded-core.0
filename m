Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QNBTf-0005Ka-UY for openembedded-core@lists.openembedded.org;
	Fri, 20 May 2011 00:13:56 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4JMB0rb014013
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2011 23:11:00 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13567-05 for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2011 23:10:56 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4JMAtau014007
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2011 23:10:55 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <0cd8cf133bc903e5706aa9c37fa6de7b1fadb5f3.1305839225.git.raj.khem@gmail.com>
References: <cover.1305839225.git.raj.khem@gmail.com>
	<0cd8cf133bc903e5706aa9c37fa6de7b1fadb5f3.1305839225.git.raj.khem@gmail.com>
Date: Thu, 19 May 2011 23:10:51 +0100
Message-ID: <1305843051.3424.560.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/2] opkg: Synchronise with OE
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
X-List-Received-Date: Thu, 19 May 2011 22:13:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-05-19 at 14:09 -0700, Khem Raj wrote:
> Remove use of IMAGE_ROOTFS which was making sstage to install
> ${IMAGE_ROOTFS}/${sysconfdir}/rcS.d into the dir where it was
> built first time. So if you moved the tmpdir it would still
> create this directory in old tmpdir and anyway its not needed
> 
> All the patches that it was applying are not needed anymore
> so we delete them

packagekit's opkg support required the add_vercmp patch?

Why not just s/${IMAGE_ROOTFS}/$D/ rather than remove a load of
functionality which people use?

This patch is at best very confusing and misleading as you do more than
you say in the above commit message...

Cheers,

Richard



> 
> Install opkg configure script
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/opkg/opkg.inc              |    7 ++--
>  meta/recipes-devtools/opkg/opkg/add_vercmp.patch |   36 ----------------------
>  meta/recipes-devtools/opkg/opkg/configure        |   25 +++++++++++++++
>  meta/recipes-devtools/opkg/opkg/headerfix.patch  |   19 -----------
>  meta/recipes-devtools/opkg/opkg_svn.bb           |   23 +++-----------
>  5 files changed, 34 insertions(+), 76 deletions(-)
>  delete mode 100644 meta/recipes-devtools/opkg/opkg/add_vercmp.patch
>  create mode 100644 meta/recipes-devtools/opkg/opkg/configure
>  delete mode 100644 meta/recipes-devtools/opkg/opkg/headerfix.patch
> 
> diff --git a/meta/recipes-devtools/opkg/opkg.inc b/meta/recipes-devtools/opkg/opkg.inc
> index a649213..49a083a 100644
> --- a/meta/recipes-devtools/opkg/opkg.inc
> +++ b/meta/recipes-devtools/opkg/opkg.inc
> @@ -39,6 +39,7 @@ BBCLASSEXTEND = "native nativesdk"
>  PKGSUFFIX = ""
>  PKGSUFFIX_virtclass-nativesdk = "-nativesdk"
>  
> -# Define a variable to allow distros to run configure earlier.
> -# (for example, to enable loading of ethernet kernel modules before networking starts)
> -POSTINSTALL_INITPOSITION ?= "98"
> +do_install_prepend() {
> +  install -d ${D}${sysconfdir}/rcS.d
> +  install -m 0755 ${WORKDIR}/configure ${D}${sysconfdir}/rcS.d/S40configure
> +}
> diff --git a/meta/recipes-devtools/opkg/opkg/add_vercmp.patch b/meta/recipes-devtools/opkg/opkg/add_vercmp.patch
> deleted file mode 100644
> index 1203c54..0000000
> --- a/meta/recipes-devtools/opkg/opkg/add_vercmp.patch
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -Upstream-Status: Inappropriate [function not used]
> -
> -Index: trunk/libopkg/opkg.c
> -===================================================================
> ---- trunk.orig/libopkg/opkg.c	2010-01-26 20:32:19.000000000 +0000
> -+++ trunk/libopkg/opkg.c	2010-01-26 20:40:34.000000000 +0000
> -@@ -876,3 +876,18 @@
> - 
> - 	return ret;
> - }
> -+
> -+int
> -+opkg_compare_versions (const char *ver1, const char *ver2)
> -+{
> -+  pkg_t *pkg1, *pkg2;
> -+
> -+  pkg1 = pkg_new();
> -+  pkg2 = pkg_new();
> -+
> -+  parse_version(pkg1, ver1);
> -+  parse_version(pkg2, ver2);
> -+
> -+  return pkg_compare_versions(pkg1, pkg2);
> -+}
> -+
> -Index: trunk/libopkg/opkg.h
> -===================================================================
> ---- trunk.orig/libopkg/opkg.h	2010-01-26 20:32:19.000000000 +0000
> -+++ trunk/libopkg/opkg.h	2010-01-26 20:35:19.000000000 +0000
> -@@ -58,4 +58,6 @@
> - 
> - int opkg_repository_accessibility_check(void);
> - 
> -+int opkg_compare_versions (const char *ver1, const char *ver2);
> -+
> - #endif /* OPKG_H */
> diff --git a/meta/recipes-devtools/opkg/opkg/configure b/meta/recipes-devtools/opkg/opkg/configure
> new file mode 100644
> index 0000000..633d8d3
> --- /dev/null
> +++ b/meta/recipes-devtools/opkg/opkg/configure
> @@ -0,0 +1,25 @@
> +#!/bin/sh
> +# get splash funcs
> +if [ -f /etc/default/splashfuncs ]; then
> +  . /etc/default/splashfuncs
> +## tell boot status to "pulsate" really long busy cycle here
> +status_pulse || true
> +fi
> +
> +# run configure in bg
> +if [  -f /etc/default/splashfuncs ]; then
> +  opkg-cl configure &
> +  PID=$!
> +  
> +  # while configure still running loop
> +  while test -d /proc/$PID; do
> +  # tick to splash so it doesn't time out
> +    status_tick || true
> +    sleep 1
> +  done
> +else
> +  opkg-cl configure
> +fi
> +
> +# delete myself
> +rm -f /etc/rcS.d/S40configure
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
> -+#include <stdio.h>
> -+
> - typedef struct pkg_dest pkg_dest_t;
> - struct pkg_dest
> - {
> diff --git a/meta/recipes-devtools/opkg/opkg_svn.bb b/meta/recipes-devtools/opkg/opkg_svn.bb
> index 5964a47..879af3b 100644
> --- a/meta/recipes-devtools/opkg/opkg_svn.bb
> +++ b/meta/recipes-devtools/opkg/opkg_svn.bb
> @@ -10,15 +10,14 @@ PACKAGE_ARCH_update-alternatives-cworth = "all"
>  RREPLACES_${PN} = "opkg-nogpg"
>  
>  SRC_URI = "svn://opkg.googlecode.com/svn;module=trunk;proto=http \
> -           file://add_vercmp.patch \
> -           file://headerfix.patch \
> -"
> +           file://configure \
> +          "
>  
>  S = "${WORKDIR}/trunk"
>  
>  SRCREV = "609"
>  PV = "0.1.8+svnr${SRCPV}"
> -PR = "r2"
> +PR = "r3"
>  
>  PACKAGES =+ "libopkg${PKGSUFFIX}-dev libopkg${PKGSUFFIX} update-alternatives-cworth${PKGSUFFIX}"
>  
> @@ -32,22 +31,10 @@ do_install_append() {
>  }
>  
>  pkg_postinst_${PN} () {
> -#!/bin/sh
> -if [ "x$D" != "x" ]; then
> -	install -d ${IMAGE_ROOTFS}/${sysconfdir}/rcS.d
> -	# this happens at S98 where our good 'ole packages script used to run
> -	echo "#!/bin/sh
> -opkg-cl configure
> -rm -f /${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}configure
> -" > $D${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}configure
> -	chmod 0755 $D${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}configure
> -fi
> -
> -update-alternatives --install ${bindir}/opkg opkg ${bindir}/opkg-cl 100
> +	update-alternatives --install ${bindir}/opkg opkg ${bindir}/opkg-cl 100
>  }
>  
>  pkg_postrm_${PN} () {
> -#!/bin/sh
> -update-alternatives --remove opkg ${bindir}/opkg-cl
> +	update-alternatives --remove opkg ${bindir}/opkg-cl
>  }
>  




