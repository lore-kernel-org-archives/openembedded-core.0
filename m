Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 437EA60273
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Sep 2018 07:37:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w847b294018990
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 4 Sep 2018 00:37:02 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Tue, 4 Sep 2018 00:37:01 -0700
From: <kai.kang@windriver.com>
To: <alex.kanavin@gmail.com>
Date: Tue, 4 Sep 2018 14:58:43 +0800
Message-ID: <5519d410560db4e901f268ce3164adc5d7434df1.1536044290.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1536044290.git.kai.kang@windriver.com>
References: <cover.1536044290.git.kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] package_manager.py: add noarch to buildarch_compat
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
X-List-Received-Date: Tue, 04 Sep 2018 07:37:02 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

It fails to run rpmbuild to build a noarch package on target when it
contains 'BuildArch: noarch' in the spec file:

| error: No compatible architectures found for build

Add 'noarch' to buildarch_compat in configure file rpmrc to fix it.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/lib/oe/package_manager.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 398838835e..da53e06c33 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -766,7 +766,9 @@ class RpmPM(PackageManager):
         rpmrcconfdir = "%s/%s" %(self.target_rootfs, "etc/")
         bb.utils.mkdirhier(platformconfdir)
         open(platformconfdir + "platform", 'w').write("%s-pc-linux" % self.primary_arch)
-        open(rpmrcconfdir + "rpmrc", 'w').write("arch_compat: %s: %s\n" % (self.primary_arch, self.archs if len(self.archs) > 0 else self.primary_arch))
+        with open(rpmrcconfdir + "rpmrc", 'w') as f:
+            f.write("arch_compat: %s: %s\n" % (self.primary_arch, self.archs if len(self.archs) > 0 else self.primary_arch))
+            f.write("buildarch_compat: %s: noarch\n" % self.primary_arch)
 
         open(platformconfdir + "macros", 'w').write("%_transaction_color 7\n")
         if self.d.getVar('RPM_PREFER_ELF_ARCH'):
-- 
2.18.0


