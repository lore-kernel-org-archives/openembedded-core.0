Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6688C7115B
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 08:10:59 +0000 (UTC)
Received: from TWMBX01.aspeed.com (TWMBX01.aspeed.com [211.20.114.72])
 by mx.groups.io with SMTP id smtpd.web10.13301.1750147855276325504
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 01:10:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: aspeedtech.com, ip: 211.20.114.72, mailfrom: jamin_lin@aspeedtech.com)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 17 Jun
 2025 16:10:52 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 17 Jun 2025 16:10:52 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: <openembedded-core@lists.openembedded.org>
CC: <troy_lee@aspeedtech.com>, <jamin_lin@aspeedtech.com>
Subject: [PATCH v2 2/3] uboot-sign.bbclass: Refactor condition checks to use && and || instead of -a and -o
Date: Tue, 17 Jun 2025 16:10:51 +0800
Message-ID: <20250617081052.3087995-3-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617081052.3087995-1-jamin_lin@aspeedtech.com>
References: <20250617081052.3087995-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 08:10:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218860

This commit cleans up and modernizes the shell condition expressions in
`uboot-sign.bbclass` to follow best practices for portable and reliable she=
ll usage.

Key changes:
- Replace legacy `[ -a ]` and `[ -o ]` with explicit `[ ] && [ ]` and `[ ] =
|| [ ]`.
  Modern POSIX and busybox sh recommend using `&&` and `||` instead of `-a`=
 and `-o`
  because `-a` and `-o` are less robust and can cause parsing ambiguities i=
n some shells.
- Simplify `concat_dtb()` by moving the DTB existence check to the top and =
using
  early `return` to avoid deep nesting.
- Remove redundant fallback `else` blocks; use clearer control flow with di=
rect checks.

This improves maintainability, reduces shell syntax pitfalls, and aligns wi=
th
current shell scripting best practices.

References:
- POSIX recommends avoiding `-a` and `-o` in `[ ]` and using explicit `&&` =
and `||`:
  https://pubs.opengroup.org/onlinepubs/9699919799/utilities/test.html

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 meta/classes-recipe/uboot-sign.bbclass | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe/u=
boot-sign.bbclass
index 01c53c7448..0f387a3a3e 100644
--- a/meta/classes-recipe/uboot-sign.bbclass
+++ b/meta/classes-recipe/uboot-sign.bbclass
@@ -198,21 +198,23 @@ concat_dtb() {
 	# If we're not using a signed u-boot fit, concatenate SPL w/o DTB & U-Boo=
t DTB
 	# with public key (otherwise U-Boot will be packaged by uboot_fitimage_as=
semble)
 	if [ "${SPL_SIGN_ENABLE}" !=3D "1" ] ; then
-		if [ "x${UBOOT_SUFFIX}" =3D "ximg" -o "x${UBOOT_SUFFIX}" =3D "xrom" ] &&=
 \
-			[ -e "${UBOOT_DTB_BINARY}" ]; then
+		if [ ! -e "${UBOOT_DTB_BINARY}" ]; then
+			bbwarn "Failure while adding public key to u-boot binary. Verified boot=
 won't be available."
+			return
+		fi
+
+		if [ "x${UBOOT_SUFFIX}" =3D "ximg" ] || [ "x${UBOOT_SUFFIX}" =3D "xrom" =
]; then
 			oe_runmake EXT_DTB=3D"${UBOOT_DTB_SIGNED}" ${UBOOT_MAKE_TARGET}
 			if [ -n "${binary}" ]; then
 				cp ${binary} ${UBOOT_BINARYNAME}-${type}.${UBOOT_SUFFIX}
 			fi
-		elif [ -e "${UBOOT_NODTB_BINARY}" -a -e "${UBOOT_DTB_BINARY}" ]; then
+		elif [ -e "${UBOOT_NODTB_BINARY}" ]; then
 			if [ -n "${binary}" ]; then
 				cat ${UBOOT_NODTB_BINARY} ${UBOOT_DTB_SIGNED} | tee ${binary} > \
 					${UBOOT_BINARYNAME}-${type}.${UBOOT_SUFFIX}
 			else
 				cat ${UBOOT_NODTB_BINARY} ${UBOOT_DTB_SIGNED} > ${UBOOT_BINARY}
 			fi
-		else
-			bbwarn "Failure while adding public key to u-boot binary. Verified boot=
 won't be available."
 		fi
 	fi
 }
@@ -244,7 +246,7 @@ deploy_dtb() {
 }
=20
 concat_spl_dtb() {
-	if [ -e "${SPL_DIR}/${SPL_NODTB_BINARY}" -a -e "${SPL_DIR}/${SPL_DTB_BINA=
RY}" ] ; then
+	if [ -e "${SPL_DIR}/${SPL_NODTB_BINARY}" ] && [ -e "${SPL_DIR}/${SPL_DTB_=
BINARY}" ] ; then
 		cat ${SPL_DIR}/${SPL_NODTB_BINARY} ${SPL_DIR}/${SPL_DTB_SIGNED} > "${SPL=
_BINARY}"
 	else
 		bbwarn "Failure while adding public key to spl binary. Verified U-Boot b=
oot won't be available."
@@ -500,7 +502,7 @@ uboot_assemble_fitimage_helper() {
 	type=3D"$1"
 	binary=3D"$2"
=20
-	if [ "${UBOOT_SIGN_ENABLE}" =3D "1" -a -n "${UBOOT_DTB_BINARY}" ] ; then
+	if [ "${UBOOT_SIGN_ENABLE}" =3D "1" ] && [ -n "${UBOOT_DTB_BINARY}" ] ; t=
hen
 		concat_dtb "$type" "$binary"
 	fi
=20
@@ -508,7 +510,7 @@ uboot_assemble_fitimage_helper() {
 		uboot_fitimage_assemble
 	fi
=20
-	if [ "${SPL_SIGN_ENABLE}" =3D "1" -a -n "${SPL_DTB_BINARY}" ] ; then
+	if [ "${SPL_SIGN_ENABLE}" =3D "1" ] && [ -n "${SPL_DTB_BINARY}" ] ; then
 		concat_spl_dtb
 	fi
 }
@@ -547,7 +549,7 @@ addtask uboot_assemble_fitimage before do_install do_de=
ploy after do_compile
 deploy_helper() {
 	type=3D"$1"
=20
-	if [ "${UBOOT_SIGN_ENABLE}" =3D "1" -a -n "${UBOOT_DTB_SIGNED}" ] ; then
+	if [ "${UBOOT_SIGN_ENABLE}" =3D "1" ] && [ -n "${UBOOT_DTB_SIGNED}" ] ; t=
hen
 		deploy_dtb $type
 	fi
=20
@@ -569,7 +571,7 @@ deploy_helper() {
 		fi
 	fi
=20
-	if [ "${SPL_SIGN_ENABLE}" =3D "1" -a -n "${SPL_DTB_BINARY}" ] ; then
+	if [ "${SPL_SIGN_ENABLE}" =3D "1" ] && [ -n "${SPL_DTB_BINARY}" ] ; then
 		deploy_spl_dtb $type
 	fi
 }
@@ -594,7 +596,7 @@ do_deploy:prepend() {
 		deploy_helper ""
 	fi
=20
-	if [ "${UBOOT_SIGN_ENABLE}" =3D "1" -a -n "${UBOOT_DTB_BINARY}" ] ; then
+	if [ "${UBOOT_SIGN_ENABLE}" =3D "1" ] && [ -n "${UBOOT_DTB_BINARY}" ] ; t=
hen
 		ln -sf ${UBOOT_DTB_IMAGE} ${DEPLOYDIR}/${UBOOT_DTB_BINARY}
 		ln -sf ${UBOOT_DTB_IMAGE} ${DEPLOYDIR}/${UBOOT_DTB_SYMLINK}
 		ln -sf ${UBOOT_NODTB_IMAGE} ${DEPLOYDIR}/${UBOOT_NODTB_SYMLINK}
@@ -608,7 +610,7 @@ do_deploy:prepend() {
 		ln -sf ${UBOOT_FITIMAGE_IMAGE} ${DEPLOYDIR}/${UBOOT_FITIMAGE_SYMLINK}
 	fi
=20
-	if [ "${SPL_SIGN_ENABLE}" =3D "1" -a -n "${SPL_DTB_BINARY}" ] ; then
+	if [ "${SPL_SIGN_ENABLE}" =3D "1" ] && [ -n "${SPL_DTB_BINARY}" ] ; then
 		ln -sf ${SPL_DTB_IMAGE} ${DEPLOYDIR}/${SPL_DTB_SYMLINK}
 		ln -sf ${SPL_DTB_IMAGE} ${DEPLOYDIR}/${SPL_DTB_BINARY}
 		ln -sf ${SPL_NODTB_IMAGE} ${DEPLOYDIR}/${SPL_NODTB_SYMLINK}
--=20
2.43.0


