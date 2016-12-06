Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2F007719C1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 08:55:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uB68tPv4014544
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 6 Dec 2016 00:55:25 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 6 Dec 2016 00:55:24 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 6 Dec 2016 00:55:17 -0800
Message-ID: <dec27d4db9b37d740e7b462715afcde4b441eb47.1481014270.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1481014270.git.liezhi.yang@windriver.com>
References: <cover.1481014270.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 2/6] qemuboot.bbclass: use IMGDEPLOYDIR
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
X-List-Received-Date: Tue, 06 Dec 2016 08:55:25 -0000
Content-Type: text/plain

So that "bitbake <image> -ccleansstate" can remove qemuboot.conf

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/qemuboot.bbclass | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbclass
index 8b1d4d0..1f78a98 100644
--- a/meta/classes/qemuboot.bbclass
+++ b/meta/classes/qemuboot.bbclass
@@ -43,6 +43,7 @@ QB_OPT_APPEND ?= "-show-cursor"
 
 # Create qemuboot.conf
 addtask do_write_qemuboot_conf after do_rootfs before do_image
+IMGDEPLOYDIR ?= "${WORKDIR}/deploy-${PN}-image-complete"
 
 def qemuboot_vars(d):
     build_vars = ['MACHINE', 'TUNE_ARCH', 'DEPLOY_DIR_IMAGE',
@@ -55,8 +56,8 @@ do_write_qemuboot_conf[vardeps] += "${@' '.join(qemuboot_vars(d))}"
 python do_write_qemuboot_conf() {
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


