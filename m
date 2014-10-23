Return-Path: <bogdan.purcareata@freescale.com>
X-Greylist: delayed 3577 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 23 Oct 2014 14:01:49 UTC
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bon0147.outbound.protection.outlook.com [157.56.111.147])
	by mail.openembedded.org (Postfix) with ESMTP id EA67565D3F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Oct 2014 14:01:49 +0000 (UTC)
Received: from DM2PR03CA0029.namprd03.prod.outlook.com (10.141.96.28) by
	BL2PR03MB177.namprd03.prod.outlook.com (10.255.230.143) with Microsoft
	SMTP Server (TLS) id 15.1.6.9; Thu, 23 Oct 2014 11:28:10 +0000
Received: from BL2FFO11FD024.protection.gbl (2a01:111:f400:7c09::131) by
	DM2PR03CA0029.outlook.office365.com (2a01:111:e400:2428::28) with
	Microsoft
	SMTP Server (TLS) id 15.1.6.9 via Frontend Transport; Thu, 23 Oct 2014
	11:28:10 +0000
Received: from az84smr01.freescale.net (192.88.158.2) by
	BL2FFO11FD024.mail.protection.outlook.com (10.173.161.103) with
	Microsoft SMTP Server (TLS) id 15.0.1049.20 via Frontend Transport;
	Thu, 23 Oct 2014 11:28:10 +0000
Received: from fsr-fed1764-008.ea.freescale.net
	(fsr-fed1764-008.ea.freescale.net [10.171.73.44])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id s9NBS8sO016392;
	Thu, 23 Oct 2014 04:28:08 -0700
From: Bogdan Purcareata <bogdan.purcareata@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Oct 2014 14:26:03 -0400
Message-ID: <1414088763-15256-1-git-send-email-bogdan.purcareata@freescale.com>
X-Mailer: git-send-email 1.9.rc1
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:CAL; IPV:NLI;
	EFV:NLI; SFV:NSPM;
	SFS:(10019020)(6009001)(189002)(199003)(62966002)(575784001)(6806004)(93916002)(19580405001)(229853001)(2351001)(50466002)(86362001)(48376002)(64706001)(20776003)(81156004)(19580395003)(95666004)(104166001)(69596002)(46102003)(105606002)(92566001)(50226001)(44976005)(4396001)(107046002)(68736004)(102836001)(26826002)(84676001)(15975445006)(33646002)(85306004)(77156001)(106466001)(76482002)(31966008)(47776003)(15202345003)(36756003)(97736003)(21056001)(92726001)(80022003)(110136001)(87286001)(99396003)(85852003)(88136002)(89996001)(87936001)(50986999)(120916001)(104016003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BL2PR03MB177;
	H:az84smr01.freescale.net; FPR:; MLV:ovrnspm;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: UriScan:;
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:;SRVR:BL2PR03MB177;
X-Forefront-PRVS: 0373D94D15
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=bogdan.purcareata@freescale.com; 
X-OriginatorOrg: freescale.com
Subject: [PATCH] shadow: enable support for subordinate IDs
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
X-List-Received-Date: Thu, 23 Oct 2014 14:01:54 -0000
Content-Type: text/plain

Subordinate IDs support is required in order to enable creation of unprivileged
containers. Pull a required change from upstream in order to make shadow
cross-compile with subordinate IDs support. Enable flag in recipe.

Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
---
 ..._of_uid_t_and_gid_t_using_AC_CHECK_SIZEOF.patch |   41 ++++++++++++++++++++
 meta/recipes-extended/shadow/shadow.inc            |    3 +-
 2 files changed, 43 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/shadow/files/check_size_of_uid_t_and_gid_t_using_AC_CHECK_SIZEOF.patch

diff --git a/meta/recipes-extended/shadow/files/check_size_of_uid_t_and_gid_t_using_AC_CHECK_SIZEOF.patch b/meta/recipes-extended/shadow/files/check_size_of_uid_t_and_gid_t_using_AC_CHECK_SIZEOF.patch
new file mode 100644
index 0000000..185590c
--- /dev/null
+++ b/meta/recipes-extended/shadow/files/check_size_of_uid_t_and_gid_t_using_AC_CHECK_SIZEOF.patch
@@ -0,0 +1,41 @@
+From 2cb54158b80cdbd97ca3b36df83f9255e923ae3f Mon Sep 17 00:00:00 2001
+From: James Le Cuirot <chewi@aura-online.co.uk>
+Date: Sat, 23 Aug 2014 09:46:39 +0100
+Subject: [PATCH] Check size of uid_t and gid_t using AC_CHECK_SIZEOF
+
+This built-in check is simpler than the previous method and, most
+importantly, works when cross-compiling.
+
+Upstream-Status: Accepted
+[https://github.com/shadow-maint/shadow/commit/2cb54158b80cdbd97ca3b36df83f9255e923ae3f]
+
+Signed-off-by: Serge Hallyn <serge.hallyn@ubuntu.com>
+---
+ configure.in | 14 ++++----------
+ 1 file changed, 4 insertions(+), 10 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index 1a3f841..4a4d6d0 100644
+--- a/configure.in
++++ b/configure.in
+@@ -335,16 +335,10 @@ if test "$enable_subids" != "no"; then
+ 	dnl
+ 	dnl FIXME: check if 32 bit UIDs/GIDs are supported by libc
+ 	dnl
+-	AC_RUN_IFELSE([AC_LANG_SOURCE([
+-#include <sys/types.h>
+-int main(void) {
+-	uid_t u;
+-	gid_t g;
+-	return (sizeof u < 4) || (sizeof g < 4);
+-}
+-	])], [id32bit="yes"], [id32bit="no"])
+-
+-	if test "x$id32bit" = "xyes"; then
++	AC_CHECK_SIZEOF([uid_t],, [#include "sys/types.h"])
++	AC_CHECK_SIZEOF([gid_t],, [#include "sys/types.h"])
++
++	if test "$ac_cv_sizeof_uid_t" -ge 4 && test "$ac_cv_sizeof_gid_t" -ge 4; then
+ 		AC_DEFINE(ENABLE_SUBIDS, 1, [Define to support the subordinate IDs.])
+ 		enable_subids="yes"
+ 	else
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index b2a5f0e..9fada0d 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -16,6 +16,7 @@ SRC_URI = "http://pkg-shadow.alioth.debian.org/releases/${BPN}-${PV}.tar.xz \
            file://fix-installation-failure-with-subids-disabled.patch \
            file://0001-su.c-fix-to-exec-command-correctly.patch \
            file://0001-Do-not-read-login.defs-before-doing-chroot.patch \
+           file://check_size_of_uid_t_and_gid_t_using_AC_CHECK_SIZEOF.patch \
            ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${PAM_SRC_URI}', '', d)} \
            "
 
@@ -52,7 +53,7 @@ EXTRA_OECONF += "--without-audit \
                  --without-libcrack \
                  --without-selinux \
                  --with-group-name-max-length=24 \
-                 --enable-subordinate-ids=no \
+                 --enable-subordinate-ids=yes \
                  ${NSCDOPT}"
 
 NSCDOPT = ""
-- 
1.7.10.4


