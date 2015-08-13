Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 722D676312
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Aug 2015 07:37:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t7D7bMTA000229
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Aug 2015 00:37:22 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Thu, 13 Aug 2015 00:37:22 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 13 Aug 2015 00:37:20 -0700
Message-ID: <529ac22ac47e062b63c4b3b8ce7c0f9def00f359.1439449078.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1439449078.git.liezhi.yang@windriver.com>
References: <cover.1439449078.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] populate_sdk_base.bbclass: help rpm to pull in multilib toolchain
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
X-List-Received-Date: Thu, 13 Aug 2015 07:37:22 -0000
Content-Type: text/plain

When configure multilib, "bitbake <image_bb> -c populate_sdk" should
install all arch toolchains (for example, 32 and 64bit), but rpm not
handle the multilib requires correctly, for example:
lib32-packagegroup-core-standalone-sdk-target requires lib32-libc6, rpm
may pull in libc6 rather than lib32-libc6, if we directly use something
like IMAGE_INSTALL_append = " lib32-libc6", then it works well, so
update TOOLCHAIN_TARGET_TASK to include the RDEPENDS packages will fix
the issue.

[YOCTO #8089]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/populate_sdk_base.bbclass |   32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index a9e9bd7..c2491ea 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -83,8 +83,40 @@ POPULATE_SDK_POST_HOST_COMMAND_append = " write_host_sdk_manifest; "
 fakeroot python do_populate_sdk() {
     from oe.sdk import populate_sdk
     from oe.manifest import create_manifest, Manifest
+    import oe.packagedata
 
     pn = d.getVar('PN', True)
+    # Help rpm to pull in multilib requires since it may not pull in
+    # them correctly, for example,
+    # lib32-packagegroup-core-standalone-sdk-target requires
+    # lib32-libc6, rpm may pull in libc6 rather than lib32-libc6, but
+    # directly use
+    # TOOLCHAIN_TARGET_TASK_append = " lib32-libc6" works well.
+    for pkg in (d.getVar('TOOLCHAIN_TARGET_TASK', True) or "").split():
+        sub_data = oe.packagedata.read_subpkgdata(pkg, d)
+        sub_rdep = sub_data.get("RDEPENDS_" + pkg)
+        if not sub_rdep:
+            continue
+        done = sub_rdep.split()
+        next = done
+        # Find all the rdepends on the dependency chain
+        while next:
+            new = []
+            for sub_pkg in next:
+                sub_data = oe.packagedata.read_subpkgdata(sub_pkg, d)
+                sub_pkg_rdep = sub_data.get("RDEPENDS_" + sub_pkg)
+                if not sub_pkg_rdep:
+                    continue
+                for p in sub_pkg_rdep.split():
+                    if p in done:
+                        continue
+                    if not p.startswith('(') and \
+                            oe.packagedata.has_subpkgdata(p, d):
+                        # It's a new rdep
+                        done.append(p)
+                        new.append(p)
+            next = new
+        d.appendVar('TOOLCHAIN_TARGET_TASK', ' ' + " ".join(done))
     runtime_mapping_rename("TOOLCHAIN_TARGET_TASK", pn, d)
     runtime_mapping_rename("TOOLCHAIN_TARGET_TASK_ATTEMPTONLY", pn, d)
 
-- 
1.7.9.5


