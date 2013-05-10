Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1UadPO-0000Yf-Ac
	for openembedded-core@lists.openembedded.org;
	Fri, 10 May 2013 04:50:11 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r4A2W1GN007662
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 9 May 2013 19:32:01 -0700 (PDT)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Thu, 9 May 2013 19:32:01 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 10 May 2013 10:31:45 +0800
Message-ID: <9f338ccfac379193ada0c814cdb83c2710c74223.1368153038.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1368153038.git.liezhi.yang@windriver.com>
References: <cover.1368153038.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [RFC PATCH 1/1] bbclass: remove more nostamps for image generation
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 10 May 2013 02:50:21 -0000
Content-Type: text/plain

We have removed the nostamps for do_rootfs and do_build, so it seems
reasonable to remove the stamps for do_bootimg, do_bootdirectdisk and
do_vmdkimg.

The current problem is that the do_vmdkimg always re-run, but the
do_rootfs may not, so the code like below in the do_rootfs function
doesn't re-run and cause problems (the symlink exists when the
do_vmdkimg creates the symlink again):

    if d.getVar('IMAGE_LINK_NAME', True):
        cmds += "\trm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.*"

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/boot-directdisk.bbclass | 1 -
 meta/classes/bootimg.bbclass         | 1 -
 meta/classes/image-vmdk.bbclass      | 1 -
 3 files changed, 3 deletions(-)

diff --git a/meta/classes/boot-directdisk.bbclass b/meta/classes/boot-directdisk.bbclass
index d265485..2a8823d 100644
--- a/meta/classes/boot-directdisk.bbclass
+++ b/meta/classes/boot-directdisk.bbclass
@@ -97,4 +97,3 @@ python do_bootdirectdisk() {
 }
 
 addtask bootdirectdisk before do_build
-do_bootdirectdisk[nostamp] = "1"
diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
index 117929e..90a241d 100644
--- a/meta/classes/bootimg.bbclass
+++ b/meta/classes/bootimg.bbclass
@@ -198,4 +198,3 @@ python do_bootimg() {
 }
 
 addtask bootimg before do_build
-do_bootimg[nostamp] = "1"
diff --git a/meta/classes/image-vmdk.bbclass b/meta/classes/image-vmdk.bbclass
index 6f7df3f..089d019 100644
--- a/meta/classes/image-vmdk.bbclass
+++ b/meta/classes/image-vmdk.bbclass
@@ -28,7 +28,6 @@ python do_vmdkimg() {
 
 #addtask vmdkimg after do_bootimg before do_build
 addtask vmdkimg after do_bootdirectdisk before do_build
-do_vmdkimg[nostamp] = "1"
 
 do_vmdkimg[depends] += "qemu-native:do_populate_sysroot" 
 
-- 
1.8.1.2



