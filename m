Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2142271A60
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 08:27:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uBD8RxpD003488
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 00:27:59 -0800 (PST)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 13 Dec 2016 00:27:58 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 13 Dec 2016 16:24:48 +0800
Message-ID: <20161213082448.16812-1-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
MIME-Version: 1.0
Subject: [PATCH] extrausers.bbclass: Use PACKAGE_INSTALL instead of IMAGE_INSTALL
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
X-List-Received-Date: Tue, 13 Dec 2016 08:27:59 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The initramfs image recipes changed to use PACKAGE_INSTALL
so they will not be affected by IMAGE_INSTALL, and will cause
error when inherit extrausers:

| ERROR: core-image-minimal-initramfs-1.0-r0 do_rootfs:
  core-image-minimal-initramfs: usermod command did not succeed.

So use PACKAGE_INSTALL as well in extrausers.bbclass to fix it.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/classes/extrausers.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/extrausers.bbclass b/meta/classes/extrausers.bbclass
index 43900f3..852810e 100644
--- a/meta/classes/extrausers.bbclass
+++ b/meta/classes/extrausers.bbclass
@@ -15,7 +15,7 @@
 
 inherit useradd_base
 
-IMAGE_INSTALL_append = " ${@['', 'base-passwd shadow'][bool(d.getVar('EXTRA_USERS_PARAMS', True))]}"
+PACKAGE_INSTALL_append = " ${@['', 'base-passwd shadow'][bool(d.getVar('EXTRA_USERS_PARAMS', True))]}"
 
 # Image level user / group settings
 ROOTFS_POSTPROCESS_COMMAND_append = " set_user_group;"
-- 
2.8.3


