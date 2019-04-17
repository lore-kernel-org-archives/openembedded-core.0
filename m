Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id CC5316011C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2019 18:31:19 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id w16so3277082wrl.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2019 11:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=IUz6mGcard9lZLNirhSKiJNS3UAObEmOMD0WAU7V6PQ=;
	b=UhVCZly8abXlx5qyJvyr2QQ8IUbR7ldQ5A0WYiFZTjLWCmN3iMUCf3DCjsY8xsT/Mk
	E83YMEanW65Z+YTj8j9mGbYgtSoAAf4kZ0cII6Z3Bucy3l0E42lGmh210n7zDtczT+xg
	ZuXW8c3RSdkDEdTEF3LIyPpbgedzy3lwzsLPD978KXnLPLssPi4wnGS+6TF8EEDE2jUI
	WYhIR8LkfszVH5wcm4KlBZsXcpfv6VPJMXzGLzvXlnzAwYv6fIsrWG296U+RrSW4shsv
	T3M4zYIpaICxb4Hz/rY51Li1aRfJL/vLOMle17DB7Q8PSCVZarLWpk/jecLwVbybxASL
	IjgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=IUz6mGcard9lZLNirhSKiJNS3UAObEmOMD0WAU7V6PQ=;
	b=GP/0c8QVg9TvQFspZvqNtnBQbKwx3nUnYGdgqznSF6rKeEOK1Bt/UDgSYGszaZD4GA
	krPufjJE/X7L0JI27WNm8o2W531O9ghZD/Ge9dNdZ3Ku+Q53imw9SsF8+Y0eLQvL5ZQt
	wcc5tmvi7XLy06+81516eYJkgMMtjcSLfjIVvtnSzP5CDYLuuByqNgbjGNJ0RijwFB/w
	MMhU7sbdeNbTVuLE5MdDMuN+k0eCEsQWrtbaMuUZhscJEpijxMYZc5P2ZUGMffKx3ZIW
	h4esH2IrKoHnQPUNZEwh5QCL5Yon3qQ6psFLBIr7dEgKFG6Pqh/ZgmqYV3FVypPZXM3m
	Ob3Q==
X-Gm-Message-State: APjAAAU/mSYSAPrIByT3QFV4rjjznkHWxhWtXbiJCep/aox+Of5GV2K2
	QZwqyxLxN9Ez7v5kNNm1q2dnVYQG
X-Google-Smtp-Source: APXvYqx7JtpSPP8JDjn5gMTuNSwpk/AgFN54CyDqohY2EJg3bxqWKNaxgOOYytMy3G07iaHBcySfIg==
X-Received: by 2002:a5d:68cf:: with SMTP id p15mr37126196wrw.301.1555525880331;
	Wed, 17 Apr 2019 11:31:20 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246]) by smtp.gmail.com with ESMTPSA id
	s189sm6803514wmf.45.2019.04.17.11.31.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 17 Apr 2019 11:31:19 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Apr 2019 18:31:16 +0000
Message-Id: <1555525877-19944-1-git-send-email-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] uboot-sign: Fix build when UBOOT_DTB_BINARY is empty
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
X-List-Received-Date: Wed, 17 Apr 2019 18:31:20 -0000

When UBOOT_DTB_BINARY is empty and because the code now changes
directory into ${B}, the test for the existence becomes `[ -f ]` which
succeeds and subsequently the install fails.

Reorder the code so it's clear that UBOOT_DTB_BINARY empty is an
expected configuration and then quote UBOOT_DTB_BINARY everywhere so
no one trips over this again.

Fixes: bacb59079eb6 ("uboot-sign: add support for different u-boot configurations")
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/classes/uboot-sign.bbclass | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/classes/uboot-sign.bbclass b/meta/classes/uboot-sign.bbclass
index 2da43655aabb..6385a06c13ef 100644
--- a/meta/classes/uboot-sign.bbclass
+++ b/meta/classes/uboot-sign.bbclass
@@ -46,12 +46,12 @@ UBOOT_NODTB_SYMLINK ?= "u-boot-nodtb-${MACHINE}.${UBOOT_SUFFIX}"
 UBOOT_PN = "${@d.getVar('PREFERRED_PROVIDER_u-boot') or 'u-boot'}"
 
 concat_dtb_helper() {
-	if [ -e ${UBOOT_DTB_BINARY} ]; then
+	if [ -e "${UBOOT_DTB_BINARY}" ]; then
 		ln -sf ${UBOOT_DTB_IMAGE} ${DEPLOYDIR}/${UBOOT_DTB_BINARY}
 		ln -sf ${UBOOT_DTB_IMAGE} ${DEPLOYDIR}/${UBOOT_DTB_SYMLINK}
 	fi
 
-	if [ -f ${UBOOT_NODTB_BINARY} ]; then
+	if [ -f "${UBOOT_NODTB_BINARY}" ]; then
 		install ${UBOOT_NODTB_BINARY} ${DEPLOYDIR}/${UBOOT_NODTB_IMAGE}
 		ln -sf ${UBOOT_NODTB_IMAGE} ${UBOOT_NODTB_SYMLINK}
 		ln -sf ${UBOOT_NODTB_IMAGE} ${UBOOT_NODTB_BINARY}
@@ -67,13 +67,13 @@ concat_dtb_helper() {
 	elif [ -e "${DEPLOYDIR}/${UBOOT_NODTB_IMAGE}" -a -e "$deployed_uboot_dtb_binary" ]; then
 		cd ${DEPLOYDIR}
 		cat ${UBOOT_NODTB_IMAGE} $deployed_uboot_dtb_binary | tee ${UBOOT_BINARY} > ${UBOOT_IMAGE}
-	elif [ -n "${UBOOT_DTB_BINARY}" ]; then
+	else
 		bbwarn "Failure while adding public key to u-boot binary. Verified boot won't be available."
 	fi
 }
 
 concat_dtb() {
-	if [ "${UBOOT_SIGN_ENABLE}" = "1" -a "${PN}" = "${UBOOT_PN}" ]; then
+	if [ "${UBOOT_SIGN_ENABLE}" = "1" -a "${PN}" = "${UBOOT_PN}" -a -n "${UBOOT_DTB_BINARY}" ]; then
 		mkdir -p ${DEPLOYDIR}
 		if [ -n "${UBOOT_CONFIG}" ]; then
 			for config in ${UBOOT_MACHINE}; do
@@ -90,19 +90,19 @@ concat_dtb() {
 # Install UBOOT_DTB_BINARY to datadir, so that kernel can use it for
 # signing, and kernel will deploy UBOOT_DTB_BINARY after signs it.
 install_helper() {
-	if [ -f ${UBOOT_DTB_BINARY} ]; then
+	if [ -f "${UBOOT_DTB_BINARY}" ]; then
 		install -d ${D}${datadir}
 		# UBOOT_DTB_BINARY is a symlink to UBOOT_DTB_IMAGE, so we
 		# need both of them.
 		install ${UBOOT_DTB_BINARY} ${D}${datadir}/${UBOOT_DTB_IMAGE}
 		ln -sf ${UBOOT_DTB_IMAGE} ${D}${datadir}/${UBOOT_DTB_BINARY}
-	elif [ -n "${UBOOT_DTB_BINARY}" ]; then
+	else
 		bbwarn "${UBOOT_DTB_BINARY} not found"
 	fi
 }
 
 do_install_append() {
-	if [ "${UBOOT_SIGN_ENABLE}" = "1" -a "${PN}" = "${UBOOT_PN}" ]; then
+	if [ "${UBOOT_SIGN_ENABLE}" = "1" -a "${PN}" = "${UBOOT_PN}" -a -n "${UBOOT_DTB_BINARY}" ]; then
 		if [ -n "${UBOOT_CONFIG}" ]; then
 			for config in ${UBOOT_MACHINE}; do
 				cd ${B}/${config}
-- 
2.7.4


