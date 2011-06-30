Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qc8jb-0007zL-TM
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Jun 2011 06:20:12 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 29 Jun 2011 21:16:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,447,1304319600"; d="scan'208";a="19958830"
Received: from unknown (HELO [10.255.14.13]) ([10.255.14.13])
	by orsmga002.jf.intel.com with ESMTP; 29 Jun 2011 21:16:27 -0700
Message-ID: <4E0BF89B.7000706@linux.intel.com>
Date: Wed, 29 Jun 2011 21:16:27 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1308868787-814-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1308868787-814-1-git-send-email-raj.khem@gmail.com>
Subject: Re: [PATCH] libtirpc: Upgrade 0.2.1 -> 0.2.2
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
X-List-Received-Date: Thu, 30 Jun 2011 04:20:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/23/2011 03:39 PM, Khem Raj wrote:
> Additionally bring in the nis headers which will be
> required when using eglibc 2.14 where rpc support
> is removed.
>
> Make it provide virtual/librpc
>
> Signed-off-by: Khem Raj<raj.khem@gmail.com>
> ---
>   .../libtirpc-0.2.2/libtirpc-0.2.1-fortify.patch    |   26 +++++++++++++
>   .../libtirpc-0.2.2-rpc-des-prot.patch              |   39 ++++++++++++++++++++
>   .../libtirpc/libtirpc-0.2.2/remove-des-crypt.patch |   17 +++++++++
>   meta/recipes-extended/libtirpc/libtirpc_0.2.1.bb   |   21 -----------
>   meta/recipes-extended/libtirpc/libtirpc_0.2.2.bb   |   33 +++++++++++++++++
>   5 files changed, 115 insertions(+), 21 deletions(-)
>   create mode 100644 meta/recipes-extended/libtirpc/libtirpc-0.2.2/libtirpc-0.2.1-fortify.patch
>   create mode 100644 meta/recipes-extended/libtirpc/libtirpc-0.2.2/libtirpc-0.2.2-rpc-des-prot.patch
>   create mode 100644 meta/recipes-extended/libtirpc/libtirpc-0.2.2/remove-des-crypt.patch
>   delete mode 100644 meta/recipes-extended/libtirpc/libtirpc_0.2.1.bb
>   create mode 100644 meta/recipes-extended/libtirpc/libtirpc_0.2.2.bb
>
> diff --git a/meta/recipes-extended/libtirpc/libtirpc-0.2.2/libtirpc-0.2.1-fortify.patch b/meta/recipes-extended/libtirpc/libtirpc-0.2.2/libtirpc-0.2.1-fortify.patch
> new file mode 100644
> index 0000000..32644b5
> --- /dev/null
> +++ b/meta/recipes-extended/libtirpc/libtirpc-0.2.2/libtirpc-0.2.1-fortify.patch
> @@ -0,0 +1,26 @@
> +Fix a possible overflow (reported by _FORTIFY_SOURCE=2)
> +
> +Ported from Gentoo
> +
> +Upstream-Status: Unknown
> +
> +Signed-off-by: Khem Raj<raj.khem@gmail.com>
> +
> +Index: libtirpc-0.2.1/src/getrpcport.c
> +===================================================================
> +--- libtirpc-0.2.1.orig/src/getrpcport.c
> ++++ libtirpc-0.2.1/src/getrpcport.c
> +@@ -54,11 +54,11 @@ getrpcport(host, prognum, versnum, proto
> +
> + 	if ((hp = gethostbyname(host)) == NULL)
> + 		return (0);
> ++	if (hp->h_length != sizeof(addr.sin_addr.s_addr))
> ++		return (0);
> + 	memset(&addr, 0, sizeof(addr));
> + 	addr.sin_family = AF_INET;
> + 	addr.sin_port =  0;
> +-	if (hp->h_length>  sizeof(addr))
> +-	  hp->h_length = sizeof(addr);
> + 	memcpy(&addr.sin_addr.s_addr, hp->h_addr, (size_t)hp->h_length);
> + 	/* Inconsistent interfaces need casts! :-( */
> + 	return (pmap_getport(&addr, (u_long)prognum, (u_long)versnum,
> diff --git a/meta/recipes-extended/libtirpc/libtirpc-0.2.2/libtirpc-0.2.2-rpc-des-prot.patch b/meta/recipes-extended/libtirpc/libtirpc-0.2.2/libtirpc-0.2.2-rpc-des-prot.patch
> new file mode 100644
> index 0000000..c38a55b
> --- /dev/null
> +++ b/meta/recipes-extended/libtirpc/libtirpc-0.2.2/libtirpc-0.2.2-rpc-des-prot.patch
> @@ -0,0 +1,39 @@
> +From f2f43212b33dea42635061c82645287454a70107 Mon Sep 17 00:00:00 2001
> +From: Mike Frysinger<vapier@gentoo.org>
> +Date: Sat, 11 Jun 2011 15:21:55 -0400
> +Subject: [PATCH] add multiple inclusion protection to rpc/des.h
> +
> +If you try to include this file multiple times, you get a build failure
> +due to redefinitions of enums and such.
> +
> +Signed-off-by: Mike Frysinger<vapier@gentoo.org>
> +---
> + tirpc/rpc/des.h |    5 +++++
> + 1 files changed, 5 insertions(+), 0 deletions(-)
> +
> +
> +Upstream-Status: Backport
> +
> +diff --git a/tirpc/rpc/des.h b/tirpc/rpc/des.h
> +index e3d6897..d2881ad 100644
> +--- a/tirpc/rpc/des.h
> ++++ b/tirpc/rpc/des.h
> +@@ -33,6 +33,9 @@
> +  * Copyright (c) 1986 by Sun Microsystems, Inc.
> +  */
> +
> ++#ifndef _RPC_DES_H_
> ++#define _RPC_DES_H_
> ++
> + #define DES_MAXLEN 	65536	/* maximum # of bytes to encrypt  */
> + #define DES_QUICKLEN	16	/* maximum # of bytes to encrypt quickly */
> +
> +@@ -80,3 +83,5 @@ struct desparams {
> +  * Software DES.
> +  */
> + extern int _des_crypt( char *, int, struct desparams * );
> ++
> ++#endif
> +--
> +1.7.5.3
> +
> diff --git a/meta/recipes-extended/libtirpc/libtirpc-0.2.2/remove-des-crypt.patch b/meta/recipes-extended/libtirpc/libtirpc-0.2.2/remove-des-crypt.patch
> new file mode 100644
> index 0000000..d94a585
> --- /dev/null
> +++ b/meta/recipes-extended/libtirpc/libtirpc-0.2.2/remove-des-crypt.patch
> @@ -0,0 +1,17 @@
> +http://sourceforge.net/mailarchive/message.php?msg_id=27636466
> +
> +Upstream-Status: Backport
> +
> +Index: libtirpc-0.2.2/src/Makefile.am
> +===================================================================
> +--- libtirpc-0.2.2.orig/src/Makefile.am
> ++++ libtirpc-0.2.2/src/Makefile.am
> +@@ -50,7 +50,7 @@ libtirpc_la_SOURCES = auth_none.c auth_u
> +         rpc_callmsg.c rpc_generic.c rpc_soc.c rpcb_clnt.c rpcb_prot.c \
> +         rpcb_st_xdr.c svc.c svc_auth.c svc_dg.c svc_auth_unix.c svc_generic.c \
> +         svc_raw.c svc_run.c svc_simple.c svc_vc.c getpeereid.c \
> +-        auth_time.c auth_des.c authdes_prot.c des_crypt.c
> ++        auth_time.c auth_des.c authdes_prot.c
> +
> + ## XDR
> + libtirpc_la_SOURCES += xdr.c xdr_rec.c xdr_array.c xdr_float.c xdr_mem.c xdr_reference.c xdr_stdio.c
> diff --git a/meta/recipes-extended/libtirpc/libtirpc_0.2.1.bb b/meta/recipes-extended/libtirpc/libtirpc_0.2.1.bb
> deleted file mode 100644
> index 6170e65..0000000
> --- a/meta/recipes-extended/libtirpc/libtirpc_0.2.1.bb
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -SUMMARY = "Transport-Independent RPC library"
> -DESCRIPTION = "Libtirpc is a port of Suns Transport-Independent RPC library to Linux"
> -SECTION = "libs/network"
> -PRIORITY = "optional"
> -HOMEPAGE = "http://sourceforge.net/projects/libtirpc/"
> -BUGTRACKER = "http://sourceforge.net/tracker/?group_id=183075&atid=903784"
> -LICENSE = "BSD"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=1c32c8e351f97e43e1ad6cf7f62de3bf \
> -                    file://src/netname.c;beginline=1;endline=27;md5=f8a8cd2cb25ac5aa16767364fb0e3c24"
> -PR = "r1"
> -
> -SRC_URI = "${SOURCEFORGE_MIRROR}/libtirpc/libtirpc-${PV}.tar.bz2"
> -
> -SRC_URI[md5sum] = "d77eb15f464bf9d6e66259eaf78b2a4e"
> -SRC_URI[sha256sum] = "ea77cadd63941fc4edbee7863d2c7094e6a18263d2a2c8922319aee91352ff41"
> -
> -inherit autotools
> -
> -do_install_append() {
> -	chown root:root ${D}${sysconfdir}/netconfig
> -}
> diff --git a/meta/recipes-extended/libtirpc/libtirpc_0.2.2.bb b/meta/recipes-extended/libtirpc/libtirpc_0.2.2.bb
> new file mode 100644
> index 0000000..f1f66e3
> --- /dev/null
> +++ b/meta/recipes-extended/libtirpc/libtirpc_0.2.2.bb
> @@ -0,0 +1,33 @@
> +SUMMARY = "Transport-Independent RPC library"
> +DESCRIPTION = "Libtirpc is a port of Suns Transport-Independent RPC library to Linux"
> +SECTION = "libs/network"
> +PRIORITY = "optional"
> +HOMEPAGE = "http://sourceforge.net/projects/libtirpc/"
> +BUGTRACKER = "http://sourceforge.net/tracker/?group_id=183075&atid=903784"
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=f835cce8852481e4b2bbbdd23b5e47f3 \
> +                    file://src/netname.c;beginline=1;endline=27;md5=f8a8cd2cb25ac5aa16767364fb0e3c24"
> +PR = "r0"
> +
> +DEPENDS += "xz-native"
> +PROVIDES = "virtual/librpc"
> +
> +SRC_URI = "${SOURCEFORGE_MIRROR}/${PN}/${P}.tar.bz2;name=libtirpc \
> +           ${GENTOO_MIRROR}/${PN}-glibc-nfs.tar.xz;name=glibc-nfs \
> +           file://libtirpc-0.2.1-fortify.patch \
> +           file://libtirpc-0.2.2-rpc-des-prot.patch \
> +           file://remove-des-crypt.patch \
> +          "
> +SRC_URI[libtirpc.md5sum] = "74c41c15c2909f7d11d9c7bfa7db6273"
> +SRC_URI[libtirpc.sha256sum] = "f05eb17c85d62423858b8f74512cfe66a9ae1cedf93f03c2a0a32e04f0a33705"
> +SRC_URI[glibc-nfs.md5sum] = "5ae500b9d0b6b72cb875bc04944b9445"
> +SRC_URI[glibc-nfs.sha256sum] = "2677cfedf626f3f5a8f6e507aed5bb8f79a7453b589d684dbbc086e755170d83"
> +inherit autotools pkgconfig
> +
> +do_configure_prepend () {
> +        cp -r ${S}/../tirpc ${S}
> +}
> +
> +do_install_append() {
> +        chown root:root ${D}${sysconfdir}/netconfig
> +}


Merged into OE-Core

Thanks
	Sau!


