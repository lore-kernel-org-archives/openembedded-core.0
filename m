Return-Path: <bogdan.purcareata@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bon0130.outbound.protection.outlook.com [157.56.111.130])
	by mail.openembedded.org (Postfix) with ESMTP id B505365D59
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Oct 2014 08:54:08 +0000 (UTC)
Received: from BY2PR03CA067.namprd03.prod.outlook.com (10.141.249.40) by
	BN1PR03MB187.namprd03.prod.outlook.com (10.255.200.149) with Microsoft
	SMTP Server (TLS) id 15.1.6.9; Mon, 27 Oct 2014 08:54:06 +0000
Received: from BN1AFFO11FD041.protection.gbl (2a01:111:f400:7c10::145) by
	BY2PR03CA067.outlook.office365.com (2a01:111:e400:2c5d::40) with
	Microsoft
	SMTP Server (TLS) id 15.1.6.9 via Frontend Transport; Mon, 27 Oct 2014
	08:54:05 +0000
Received: from az84smr01.freescale.net (192.88.158.2) by
	BN1AFFO11FD041.mail.protection.outlook.com (10.58.52.252) with
	Microsoft SMTP
	Server (TLS) id 15.0.1049.20 via Frontend Transport; Mon, 27 Oct 2014
	08:54:05 +0000
Received: from fsr-fed1764-008.ea.freescale.net
	(fsr-fed1764-008.ea.freescale.net [10.171.73.44])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id s9R8s2Q5026027;
	Mon, 27 Oct 2014 01:54:02 -0700
From: Bogdan Purcareata <bogdan.purcareata@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 27 Oct 2014 11:51:34 -0400
Message-ID: <1414425094-12256-1-git-send-email-bogdan.purcareata@freescale.com>
X-Mailer: git-send-email 1.9.rc1
In-Reply-To: <1414088763-15256-1-git-send-email-bogdan.purcareata@freescale.com>
References: <1414088763-15256-1-git-send-email-bogdan.purcareata@freescale.com>
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:CAL; IPV:NLI;
	EFV:NLI; SFV:NSPM;
	SFS:(10019020)(6009001)(54534003)(189002)(199003)(11905935001)(110136001)(33646002)(95666004)(575784001)(104016003)(105606002)(84676001)(69596002)(15975445006)(229853001)(2351001)(107046002)(19580405001)(19580395003)(21056001)(44976005)(6806004)(62966002)(97736003)(68736004)(86362001)(92566001)(92726001)(85852003)(89996001)(76482002)(85306004)(106466001)(26826002)(15395725005)(102836001)(87936001)(88136002)(104166001)(87286001)(50466002)(50986999)(76176999)(48376002)(46102003)(80022003)(120916001)(99396003)(36756003)(93916002)(81156004)(20776003)(77156001)(4396001)(47776003)(31966008)(15202345003)(64706001)(50226001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN1PR03MB187;
	H:az84smr01.freescale.net; FPR:; MLV:ovrnspm;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: UriScan:;
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:;SRVR:BN1PR03MB187;
X-Exchange-Antispam-Report-Test: UriScan:;
X-Forefront-PRVS: 0377802854
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=bogdan.purcareata@freescale.com; 
X-OriginatorOrg: freescale.com
Subject: [PATCH v2] shadow: enable support for subordinate IDs
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
X-List-Received-Date: Mon, 27 Oct 2014 08:54:13 -0000
Content-Type: text/plain

The subordinate IDs support in pkg-shadow allows unprivileged users to manage a
set of UIDs and GIDs. These subordinate IDs are specified by root, and can be
further used by the unprivileged user they have been assigned to. This user can
then create an e.g. user namespace, where he is allowed to manage his own set of
users and group from the pool of subordinate IDs. More details can be found at
http://lwn.net/Articles/533617/.

Pull a required change from upstream in order to make shadow cross-compile with
subordinate IDs support. Enable flag in recipe.

Changes since v1:
- update changelog

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


