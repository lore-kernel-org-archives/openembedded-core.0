Return-Path: <Zhenbo.Gao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F180A6FF5D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 07:11:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u4P7BBKF019708
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 00:11:11 -0700 (PDT)
Received: from pek-zgao-d1.corp.ad.wrs.com (128.224.162.191) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 25 May 2016 00:11:10 -0700
From: Zhenbo Gao <zhenbo.gao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 25 May 2016 15:11:05 +0800
Message-ID: <1464160265-16527-1-git-send-email-zhenbo.gao@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] connman: add alias for connman
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
X-List-Received-Date: Wed, 25 May 2016 07:11:16 -0000
Content-Type: text/plain

connman get conflicts with networkmanager when building
the project.

here introduce alias virtual/networkmanager for these
two recipes, so setting PREFERRED_PROVIDER to the proper
one can solve the conflicts.

this patch is for connman recipe.

Signed-off-by: Zhenbo Gao <zhenbo.gao@windriver.com>
---
 meta/recipes-connectivity/connman/connman.inc               | 1 +
 meta/recipes-core/packagegroups/packagegroup-self-hosted.bb | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index c375251..b5fc572 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -94,6 +94,7 @@ do_install_append() {
 
 # These used to be plugins, but now they are core
 RPROVIDES_${PN} = "\
+	virtual/networkmanager \
 	connman-plugin-loopback \
 	connman-plugin-ethernet \
 	${@bb.utils.contains('PACKAGECONFIG', 'bluetooth','connman-plugin-bluetooth', '', d)} \
diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index aa88cf9..6d7d6af 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -28,7 +28,7 @@ RDEPENDS_packagegroup-self-hosted = "\
     "
 
 RDEPENDS_packagegroup-self-hosted-host-tools = "\
-    connman \
+    virtual/networkmanager \
     connman-plugin-ethernet \
     dhcp-client \
     e2fsprogs \
-- 
1.9.1


