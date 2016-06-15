Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 359F26FFA4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2016 09:40:59 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u5F9exnH015612
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2016 02:41:00 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.229) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Wed, 15 Jun 2016 02:40:59 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 15 Jun 2016 17:40:56 +0800
Message-ID: <362ada944ff0259a4b28174623429716be28fe37.1465983576.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1465983576.git.Qi.Chen@windriver.com>
References: <cover.1465983576.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] package_manager.py: specify tmpdir for opkg
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
X-List-Received-Date: Wed, 15 Jun 2016 09:41:00 -0000
Content-Type: text/plain

Specify tmpdir for opkg via '-t' option so that opkg does not use
the default 'TMPDIR' which usually is '/tmp' on build host.

This would solve race problems like below.

  sh: /tmp/opkg-rOG6Tl/opkg-intercept-iPoEp5/depmod: Permission denied

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oe/package_manager.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 4aaff8c..59d34e2 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -1567,7 +1567,7 @@ class OpkgPM(OpkgDpkgPM):
         self.deploy_dir = self.d.getVar("DEPLOY_DIR_IPK", True)
         self.deploy_lock_file = os.path.join(self.deploy_dir, "deploy.lock")
         self.opkg_cmd = bb.utils.which(os.getenv('PATH'), "opkg")
-        self.opkg_args = "--volatile-cache -f %s -o %s " % (self.config_file, target_rootfs)
+        self.opkg_args = "--volatile-cache -f %s -t %s -o %s " % (self.config_file, self.d.expand('${T}/ipktemp/') ,target_rootfs)
         self.opkg_args += self.d.getVar("OPKG_ARGS", True)
 
         opkg_lib_dir = self.d.getVar('OPKGLIBDIR', True)
-- 
1.9.1


