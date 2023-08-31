Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A54F7C83F01
	for <webhook@archiver.kernel.org>; Thu, 31 Aug 2023 11:22:55 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.14409.1693480973928486804
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Aug 2023 04:22:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 80CA3FEC;
	Thu, 31 Aug 2023 04:23:32 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8CB3C3F85E;
	Thu, 31 Aug 2023 04:22:52 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH v2 2/3] inetutils: remove obsolete patches
Date: Thu, 31 Aug 2023 12:22:49 +0100
Message-Id: <20230831112250.124688-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230831112250.124688-1-ross.burton@arm.com>
References: <20230831112250.124688-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 11:22:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186971

From: Ross Burton <ross.burton@arm.com>

fix-disable-ipv6.patch: we don't support uclibc, and most libcs don't
have optional support for IPv6.

inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch an=
d
inetutils-1.8-0003-wchar.patch: these don't appear to be needed anymore.

inetutils-only-check-pam_appl.h-when-pam-enabled.patch: configure.ac
doesn't fail if PAM is disabled anymore.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../inetutils/fix-disable-ipv6.patch          | 85 -------------------
 ...rse-pull-in-features.h-for-__GLIBC__.patch | 27 ------
 .../inetutils/inetutils-1.8-0003-wchar.patch  | 25 ------
 ...ly-check-pam_appl.h-when-pam-enabled.patch | 49 -----------
 .../inetutils/inetutils_2.4.bb                |  4 -
 5 files changed, 190 deletions(-)
 delete mode 100644 meta/recipes-connectivity/inetutils/inetutils/fix-dis=
able-ipv6.patch
 delete mode 100644 meta/recipes-connectivity/inetutils/inetutils/inetuti=
ls-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch
 delete mode 100644 meta/recipes-connectivity/inetutils/inetutils/inetuti=
ls-1.8-0003-wchar.patch
 delete mode 100644 meta/recipes-connectivity/inetutils/inetutils/inetuti=
ls-only-check-pam_appl.h-when-pam-enabled.patch

diff --git a/meta/recipes-connectivity/inetutils/inetutils/fix-disable-ip=
v6.patch b/meta/recipes-connectivity/inetutils/inetutils/fix-disable-ipv6=
.patch
deleted file mode 100644
index 603d2baf9d2..00000000000
--- a/meta/recipes-connectivity/inetutils/inetutils/fix-disable-ipv6.patc=
h
+++ /dev/null
@@ -1,85 +0,0 @@
-From c7c27ba763c613f83c1561e56448b49315c271c5 Mon Sep 17 00:00:00 2001
-From: Jackie Huang <jackie.huang@windriver.com>
-Date: Wed, 6 Mar 2019 09:36:11 -0500
-Subject: [PATCH] Upstream:
- http://www.mail-archive.com/bug-inetutils@gnu.org/msg02103.html
-
-Upstream-Status: Pending
-
-Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
-
----
- ping/ping_common.h | 20 ++++++++++++++++++++
- 1 file changed, 20 insertions(+)
-
-diff --git a/ping/ping_common.h b/ping/ping_common.h
-index 65e3e60..3e84db0 100644
---- a/ping/ping_common.h
-+++ b/ping/ping_common.h
-@@ -18,10 +18,14 @@
-   You should have received a copy of the GNU General Public License
-   along with this program.  If not, see `http://www.gnu.org/licenses/'.=
 */
-=20
-+#include <config.h>
-+
- #include <netinet/in_systm.h>
- #include <netinet/in.h>
- #include <netinet/ip.h>
-+#ifdef HAVE_IPV6
- #include <netinet/icmp6.h>
-+#endif
- #include <icmp.h>
- #include <error.h>
- #include <progname.h>
-@@ -63,7 +67,12 @@ struct ping_stat
-    want to follow the traditional behaviour of ping.  */
- #define DEFAULT_PING_COUNT 0
-=20
-+#ifdef HAVE_IPV6
- #define PING_HEADER_LEN (USE_IPV6 ? sizeof (struct icmp6_hdr) : ICMP_MI=
NLEN)
-+#else
-+#define PING_HEADER_LEN (ICMP_MINLEN)
-+#endif
-+
- #define PING_TIMING(s)  ((s) >=3D sizeof (struct timeval))
- #define PING_DATALEN    (64 - PING_HEADER_LEN)  /* default data length =
*/
-=20
-@@ -78,13 +87,20 @@ struct ping_stat
-=20
- #define PING_MIN_USER_INTERVAL (200000/PING_PRECISION)
-=20
-+#ifdef HAVE_IPV6
- /* FIXME: Adjust IPv6 case for options and their consumption.  */
- #define _PING_BUFLEN(p, u) ((u)? ((p)->ping_datalen + sizeof (struct ic=
mp6_hdr)) : \
- 				   (MAXIPLEN + (p)->ping_datalen + ICMP_TSLEN))
-=20
-+#else
-+#define _PING_BUFLEN(p, u) (MAXIPLEN + (p)->ping_datalen + ICMP_TSLEN)
-+#endif
-+
-+#ifdef HAVE_IPV6
- typedef int (*ping_efp6) (int code, void *closure, struct sockaddr_in6 =
* dest,
- 			  struct sockaddr_in6 * from, struct icmp6_hdr * icmp,
- 			  int datalen);
-+#endif
-=20
- typedef int (*ping_efp) (int code,
- 			 void *closure,
-@@ -93,13 +109,17 @@ typedef int (*ping_efp) (int code,
- 			 struct ip * ip, icmphdr_t * icmp, int datalen);
-=20
- union event {
-+#ifdef HAVE_IPV6
-   ping_efp6 handler6;
-+#endif
-   ping_efp handler;
- };
-=20
- union ping_address {
-   struct sockaddr_in ping_sockaddr;
-+#ifdef HAVE_IPV6
-   struct sockaddr_in6 ping_sockaddr6;
-+#endif
- };
-=20
- typedef struct ping_data PING;
diff --git a/meta/recipes-connectivity/inetutils/inetutils/inetutils-1.8-=
0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch b/meta/recipes-c=
onnectivity/inetutils/inetutils/inetutils-1.8-0001-printf-parse-pull-in-f=
eatures.h-for-__GLIBC__.patch
deleted file mode 100644
index 2974bd4f94d..00000000000
--- a/meta/recipes-connectivity/inetutils/inetutils/inetutils-1.8-0001-pr=
intf-parse-pull-in-features.h-for-__GLIBC__.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From f7f785c21306010b2367572250b2822df5bc7728 Mon Sep 17 00:00:00 2001
-From: Mike Frysinger <vapier at gentoo.org>
-Date: Thu, 18 Nov 2010 16:59:14 -0500
-Subject: [PATCH] printf-parse: pull in features.h for __GLIBC__
-
-Upstream-Status: Pending
-
-Signed-off-by: Mike Frysinger <vapier at gentoo.org>
-
----
- lib/printf-parse.h | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/lib/printf-parse.h b/lib/printf-parse.h
-index e7d0f82..d7b4534 100644
---- a/lib/printf-parse.h
-+++ b/lib/printf-parse.h
-@@ -28,6 +28,9 @@
-=20
- #include "printf-args.h"
-=20
-+#ifdef HAVE_FEATURES_H
-+# include <features.h>	/* for __GLIBC__ */
-+#endif
-=20
- /* Flags */
- #define FLAG_GROUP       1      /* ' flag */
diff --git a/meta/recipes-connectivity/inetutils/inetutils/inetutils-1.8-=
0003-wchar.patch b/meta/recipes-connectivity/inetutils/inetutils/inetutil=
s-1.8-0003-wchar.patch
deleted file mode 100644
index 1ef7e210738..00000000000
--- a/meta/recipes-connectivity/inetutils/inetutils/inetutils-1.8-0003-wc=
har.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 9089c6eafbf5903174dce87b68476e35db80beb9 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <martin.jansa@gmail.com>
-Date: Wed, 6 Mar 2019 09:36:11 -0500
-Subject: [PATCH] inetutils: Import version 1.9.4
-
-Upstream-Status: Pending
-
----
- lib/wchar.in.h | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/lib/wchar.in.h b/lib/wchar.in.h
-index cdda680..043866a 100644
---- a/lib/wchar.in.h
-+++ b/lib/wchar.in.h
-@@ -77,6 +77,9 @@
- /* The include_next requires a split double-inclusion guard.  */
- #if @HAVE_WCHAR_H@
- # @INCLUDE_NEXT@ @NEXT_WCHAR_H@
-+#else
-+# include <stddef.h>
-+# define MB_CUR_MAX 1
- #endif
-=20
- #undef _GL_ALREADY_INCLUDING_WCHAR_H
diff --git a/meta/recipes-connectivity/inetutils/inetutils/inetutils-only=
-check-pam_appl.h-when-pam-enabled.patch b/meta/recipes-connectivity/inet=
utils/inetutils/inetutils-only-check-pam_appl.h-when-pam-enabled.patch
deleted file mode 100644
index 2343c03cb48..00000000000
--- a/meta/recipes-connectivity/inetutils/inetutils/inetutils-only-check-=
pam_appl.h-when-pam-enabled.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From cc66e842e037fba9f06761f942abe5c4856492b8 Mon Sep 17 00:00:00 2001
-From: Kai Kang <kai.kang@windriver.com>
-Date: Wed, 6 Mar 2019 09:36:11 -0500
-Subject: [PATCH] inetutils: Import version 1.9.4
-
-Only check security/pam_appl.h which is provided by package libpam when =
pam is
-enabled.
-
-Upstream-Status: Pending
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
----
- configure.ac | 15 ++++++++++++++-
- 1 file changed, 14 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 5e16c3a..18510a8 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -182,6 +182,19 @@ AC_SUBST(LIBUTIL)
-=20
- # See if we have libpam.a.  Investigate PAM versus Linux-PAM.
- if test "$with_pam" =3D yes ; then
-+  AC_CHECK_HEADERS([security/pam_appl.h], [], [], [
-+#include <sys/types.h>
-+#ifdef HAVE_NETINET_IN_SYSTM_H
-+# include <netinet/in_systm.h>
-+#endif
-+#include <netinet/in.h>
-+#ifdef HAVE_NETINET_IP_H
-+# include <netinet/ip.h>
-+#endif
-+#ifdef HAVE_SYS_PARAM_H
-+# include <sys/param.h>
-+#endif
-+])
-   AC_CHECK_LIB(dl, dlopen, LIBDL=3D-ldl)
-   AC_CHECK_LIB(pam, pam_authenticate, LIBPAM=3D-lpam)
-   if test "$ac_cv_lib_pam_pam_authenticate" =3D yes ; then
-@@ -617,7 +630,7 @@ AC_HEADER_DIRENT
- AC_CHECK_HEADERS([arpa/nameser.h arpa/tftp.h fcntl.h features.h \
- 		  glob.h memory.h netinet/ether.h netinet/in_systm.h \
- 		  netinet/ip.h netinet/ip_icmp.h netinet/ip_var.h \
--		  security/pam_appl.h shadow.h \
-+		  shadow.h \
- 		  stropts.h sys/tty.h \
- 		  sys/utsname.h sys/ptyvar.h sys/msgbuf.h sys/filio.h \
- 		  sys/ioctl_compat.h sys/cdefs.h sys/stream.h sys/mkdev.h \
diff --git a/meta/recipes-connectivity/inetutils/inetutils_2.4.bb b/meta/=
recipes-connectivity/inetutils/inetutils_2.4.bb
index d3f9e9e5fa4..a84fed1fbb8 100644
--- a/meta/recipes-connectivity/inetutils/inetutils_2.4.bb
+++ b/meta/recipes-connectivity/inetutils/inetutils_2.4.bb
@@ -13,17 +13,13 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0c7051aef9=
219dc7237f206c5c4179a7"
=20
 SRC_URI[sha256sum] =3D "1789d6b1b1a57dfe2a7ab7b533ee9f5dfd9cbf5b59bb1bb3=
c2612ed08d0f68b2"
 SRC_URI =3D "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.xz \
-           file://inetutils-1.8-0001-printf-parse-pull-in-features.h-for=
-__GLIBC__.patch \
-           file://inetutils-1.8-0003-wchar.patch \
            file://rexec.xinetd.inetutils \
            file://rlogin.xinetd.inetutils \
            file://rsh.xinetd.inetutils \
            file://telnet.xinetd.inetutils \
            file://tftpd.xinetd.inetutils \
-           file://inetutils-only-check-pam_appl.h-when-pam-enabled.patch=
 \
            file://0001-CVE-2023-40303-ftpd-rcp-rlogin-rsh-rshd-uucpd-fix=
-ch.patch \
            file://0002-CVE-2023-40303-Indent-changes-in-previous-commit.=
patch \
-           ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', '', 'file://f=
ix-disable-ipv6.patch', d)} \
            "
=20
 inherit autotools gettext update-alternatives texinfo
--=20
2.34.1


