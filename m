Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 55A1C7DF23
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 04:54:18 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id 145so7935948pgg.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 21:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=DCvgs/QtK02UFlhiTj3ZTRk6LBoDt1t3rvR2r+vF+qM=;
	b=nzVMDoyIAGrczb2X0JFJOBLD80OV9k7Scz5qckMs4eaev2ciMPFs2NCM/jG29s8Hpb
	7/u2RXxL6w1Hd00qnZ00nPNHnnf0ZYhQYVgb7yQeQlgugm0PvWws2I/q6rqGhrN9I7TS
	UphjX8+Xhw2DHw4iaNWFNVSGLdUkfaCDbTym2KSZoX1x05fUXM4ZLooqYeJHA8eqTgPB
	45a86ZKSOFagk1YVc0NQ5Gc7oe4jd62gvYKmZtIw+dFv2eVIoNudRCcA+Vz5ql1kPSth
	Os/073ln5qPsp32As7Ol68suKNiM+aDAubWntO9GDo/p/iyVJzXFIde03gE/0q2/XJpU
	ZQ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=DCvgs/QtK02UFlhiTj3ZTRk6LBoDt1t3rvR2r+vF+qM=;
	b=i5d91ebkx/kEt+217pie96kCbwbGqhTqo/XUSkTBELxH6O2RIjLeFoTiH9PSzHPFYN
	ysEoghqZYuWKG9ZPh3foO1lNW/88OSjFBWSgz/oF5XwtUy54Ajb9khXc4JcXKcWmhfxn
	96BHgYFZxyrJfzfQ4DreyVNRpizFRxXwCqx20GvMvG/XxeqP8Mb8IzhjyA2dJ3wjBcye
	rtcN5yXyBmFXFpzcgeDd1avOqOeivIjBgXLDCPVx7GQcaW1BHUpb2d7L2JetPdsN+p3Q
	cNwQ+Ejg75rQFyzT6+BQ1FtBPG9ilMblMbLK0k5VLXP/9c725arBK7T1VB7wGh+9Imbq
	QMMQ==
X-Gm-Message-State: APjAAAXeF27J2wfCxcAMddJRJvPCIljB3jLo2DgOpj8zlB2ByxQM/iod
	0I3Ybb4Uf0cG1S/qSXDu3W8zmyid
X-Google-Smtp-Source: APXvYqwqbHxbN1lE5FsTvKwJ7d8RK6joxbENg56B9AVNzsBB7H0QdoF5Y6Pvb/9/5IqwTAtfb8fIig==
X-Received: by 2002:a63:3d0b:: with SMTP id k11mr35379945pga.349.1557809659456;
	Mon, 13 May 2019 21:54:19 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:d909:eb3d:d2ab:fd1d])
	by smtp.gmail.com with ESMTPSA id
	q75sm5698451pfa.175.2019.05.13.21.54.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 May 2019 21:54:19 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 May 2019 21:53:54 -0700
Message-Id: <a0ecd3b56b86fa47ae0b051548bdf6cb08fc2d98.1557809500.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1557809500.git.akuster808@gmail.com>
References: <cover.1557809500.git.akuster808@gmail.com>
Subject: [PATCH 12/23] uboot-sign: Fix build when UBOOT_DTB_BINARY is empty
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
X-List-Received-Date: Tue, 14 May 2019 04:54:18 -0000

From: Alex Kiernan <alex.kiernan@gmail.com>

When UBOOT_DTB_BINARY is empty and because the code now changes
directory into ${B}, the test for the existence becomes `[ -f ]` which
succeeds and subsequently the install fails.

Reorder the code so it's clear that UBOOT_DTB_BINARY empty is an
expected configuration and then quote UBOOT_DTB_BINARY everywhere so
no one trips over this again.

Fixes: bacb59079eb6 ("uboot-sign: add support for different u-boot configurations")
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/uboot-sign.bbclass | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/classes/uboot-sign.bbclass b/meta/classes/uboot-sign.bbclass
index 2da4365..6385a06 100644
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


