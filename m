Return-Path: <Fupan.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0F50E6FF77
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Dec 2015 05:51:27 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tBO5pPCs000374
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Dec 2015 21:51:25 -0800 (PST)
Received: from pek-lpdfs01.wrs.com (128.224.153.15) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 23 Dec 2015 21:51:24 -0800
From: <fupan.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 24 Dec 2015 00:51:23 -0500
Message-ID: <1450936283-177234-1-git-send-email-fupan.li@windriver.com>
X-Mailer: git-send-email 2.6.4
MIME-Version: 1.0
Subject: [PATCH] oe-core:package_manager extract target arch from TARGET_SYS and add it into package_archs
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
X-List-Received-Date: Thu, 24 Dec 2015 05:51:29 -0000
Content-Type: text/plain

From: fli <fupan.li@windriver.com>

Since the rpmbuild on the target will use TARGET_SYS as the
'target' to build the source rpm packages, which will extracted
the target arch from TARGET_SYS, such as if TARGET_SYS values
'arm-poky-linux-gnueabi', the target arch will be 'arm'.

In order to make the rpm pkgs built out on the target compatilbe
with target, extract the arch from TARGET_SYS and add it into
package archs which will be write into the rootfs's /etc/rpm/platform.

Signed-off-by: fli <fupan.li@windriver.com>
---
 meta/lib/oe/package_manager.py | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 04812d2..e4b53a0 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -55,6 +55,16 @@ class RpmIndexer(Indexer):
             target_os['default'] = self.d.getVar(os_var, True).strip()
         else:
             package_archs['default'] = self.d.getVar("PACKAGE_ARCHS", True).split()
+
+            #add the compatible arch extracted from TARGET_SYS.
+            #TARGET_SYS usually values as "arm-poky-linux-gnueabi",
+            #so the arch is 'arm'
+            target_sys = self.d.getVar("TARGET_SYS", True)
+            if target_sys:
+                target_arch = target_sys.split('-')[0]
+            if target_arch not in package_archs['default']:
+                package_archs['default'].append(target_arch)
+                
             # arch order is reversed.  This ensures the -best- match is
             # listed first!
             package_archs['default'].reverse()
-- 
1.9.1


