Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5864771AC0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2016 07:35:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uAT7Zq6T002946
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 28 Nov 2016 23:35:52 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 28 Nov 2016 23:35:51 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 28 Nov 2016 23:35:46 -0800
Message-ID: <988e70df530fd597721f1bf3d76544774c5ae2bd.1480404884.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1480404884.git.liezhi.yang@windriver.com>
References: <cover.1480404884.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/5] qemuboot.bbclass: use IMGDEPLOYDIR
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
X-List-Received-Date: Tue, 29 Nov 2016 07:35:52 -0000
Content-Type: text/plain

So that "bitbake <image> -ccleansstate" can remove qemuboot.conf

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/qemuboot.bbclass | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbclass
index 39df3ad..eb0ee57 100644
--- a/meta/classes/qemuboot.bbclass
+++ b/meta/classes/qemuboot.bbclass
@@ -43,6 +43,7 @@ QB_OPT_APPEND ?= "-show-cursor"
 
 # Create qemuboot.conf
 ROOTFS_POSTPROCESS_COMMAND += "write_qemuboot_conf; "
+IMGDEPLOYDIR ?= "${WORKDIR}/deploy-${PN}-image-complete"
 
 def qemuboot_vars(d):
     build_vars = ['MACHINE', 'TUNE_ARCH', 'DEPLOY_DIR_IMAGE',
@@ -55,8 +56,8 @@ write_qemuboot_conf[vardeps] += "${@' '.join(qemuboot_vars(d))}"
 python write_qemuboot_conf() {
     import configparser
 
-    qemuboot = "%s/%s.qemuboot.conf" % (d.getVar('DEPLOY_DIR_IMAGE', True), d.getVar('IMAGE_NAME', True))
-    qemuboot_link = "%s/%s.qemuboot.conf" % (d.getVar('DEPLOY_DIR_IMAGE', True), d.getVar('IMAGE_LINK_NAME', True))
+    qemuboot = "%s/%s.qemuboot.conf" % (d.getVar('IMGDEPLOYDIR', True), d.getVar('IMAGE_NAME', True))
+    qemuboot_link = "%s/%s.qemuboot.conf" % (d.getVar('IMGDEPLOYDIR', True), d.getVar('IMAGE_LINK_NAME', True))
     cf = configparser.ConfigParser()
     cf.add_section('config_bsp')
     for k in qemuboot_vars(d):
-- 
2.9.0


