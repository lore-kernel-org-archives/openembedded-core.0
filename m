Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web09.11921.1625242814841293130
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jul 2021 09:20:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10033"; a="196043430"
X-IronPort-AV: E=Sophos;i="5.83,317,1616482800"; 
   d="scan'208";a="196043430"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2021 09:20:17 -0700
X-IronPort-AV: E=Sophos;i="5.83,317,1616482800"; 
   d="scan'208";a="626776354"
Received: from ypoh4-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.151.64])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2021 09:20:16 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 04/22] uboot-sign.bbclass: fix some install commands
Date: Sat,  3 Jul 2021 00:19:46 +0800
Message-Id: <0fc4e10250e69a67c5250ce48bfc632d90a34097.1625242066.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1625242066.git.anuj.mittal@intel.com>
References: <cover.1625242066.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Liu <liu.ming50@gmail.com>

A "install -d" command is missing when dealing with
${UBOOT_NODTB_BINARY} in install_spl_helper function, this can lead
to invalid install error saying:

| install: cannot create .../usr/share/u-boot-nodtb-2021.04-r0.bin': No such file or directory

Let's drop all "install -d" and replace them with "install -Dm" in
install_helper/install_spl_helper functions.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit db2b1da511ea3d4daef136a8b1d85b7040a46632)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/uboot-sign.bbclass | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/classes/uboot-sign.bbclass b/meta/classes/uboot-sign.bbclass
index d11882f90f..ba48f24b10 100644
--- a/meta/classes/uboot-sign.bbclass
+++ b/meta/classes/uboot-sign.bbclass
@@ -196,10 +196,9 @@ concat_spl_dtb() {
 # signing, and kernel will deploy UBOOT_DTB_BINARY after signs it.
 install_helper() {
 	if [ -f "${UBOOT_DTB_BINARY}" ]; then
-		install -d ${D}${datadir}
 		# UBOOT_DTB_BINARY is a symlink to UBOOT_DTB_IMAGE, so we
 		# need both of them.
-		install ${UBOOT_DTB_BINARY} ${D}${datadir}/${UBOOT_DTB_IMAGE}
+		install -Dm 0644 ${UBOOT_DTB_BINARY} ${D}${datadir}/${UBOOT_DTB_IMAGE}
 		ln -sf ${UBOOT_DTB_IMAGE} ${D}${datadir}/${UBOOT_DTB_BINARY}
 	else
 		bbwarn "${UBOOT_DTB_BINARY} not found"
@@ -209,14 +208,13 @@ install_helper() {
 # Install SPL dtb and u-boot nodtb to datadir, 
 install_spl_helper() {
 	if [ -f "${SPL_DIR}/${SPL_DTB_BINARY}" ]; then
-		install -d ${D}${datadir}
-		install ${SPL_DIR}/${SPL_DTB_BINARY} ${D}${datadir}/${SPL_DTB_IMAGE}
+		install -Dm 0644 ${SPL_DIR}/${SPL_DTB_BINARY} ${D}${datadir}/${SPL_DTB_IMAGE}
 		ln -sf ${SPL_DTB_IMAGE} ${D}${datadir}/${SPL_DTB_BINARY}
 	else
 		bbwarn "${SPL_DTB_BINARY} not found"
 	fi
 	if [ -f "${UBOOT_NODTB_BINARY}" ] ; then
-		install ${UBOOT_NODTB_BINARY} ${D}${datadir}/${UBOOT_NODTB_IMAGE}
+		install -Dm 0644 ${UBOOT_NODTB_BINARY} ${D}${datadir}/${UBOOT_NODTB_IMAGE}
 		ln -sf ${UBOOT_NODTB_IMAGE} ${D}${datadir}/${UBOOT_NODTB_BINARY}
 	else
 		bbwarn "${UBOOT_NODTB_BINARY} not found"
-- 
2.31.1

