Return-Path: <mark.hatle@windriver.com>
Received: from mail7.windriver.com (mail7.windriver.com [128.224.252.3])
	by mail.openembedded.org (Postfix) with ESMTP id DF8876B589
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Aug 2013 23:41:00 +0000 (UTC)
Received: from SAN-EXCH-DR.corp.ad.wrs.com (san-exch-dr.corp.ad.wrs.com
	[128.224.81.10])
	by mail7.windriver.com (8.14.5/8.14.3) with ESMTP id r79Nf0jg024522
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 9 Aug 2013 19:41:01 -0400 (EDT)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	SAN-EXCH-DR.corp.ad.wrs.com (128.224.81.10) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Fri, 9 Aug 2013 16:41:00 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 9 Aug 2013 18:41:05 -0500
Message-ID: <1376091665-24119-2-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <1376091665-24119-1-git-send-email-mark.hatle@windriver.com>
References: <1376091665-24119-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH] image.bbclass: Move runtime_mapping_rename to avoid conflict w/ multilib
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
X-List-Received-Date: Fri, 09 Aug 2013 23:41:01 -0000
Content-Type: text/plain

[YOCTO #4993]

Move the runtime_mapping_rename into a prefunc for the do_rootfs function.
Otherwise doing it in the python section could occur BEFORE the multilib
classes renaming.

If the package 'b' is a kernel module, then lib32-b and b should both
point to the same package.  The runtime_mapping code will do this
automatically.

Before if you ran: bitbake lib32-<image>

It may do:

start PACKAGE_INSTALL (a b c)
remap  (a b c)
MULTILIB naming (lib32-a lib32-b lib32-c)

What we want is:

start PACKAGE_INSTALL (a b c)
MULTILIB naming (lib32-a lib32-b lib32-c)
remap (lib32-a b lib32-c)

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/image.bbclass | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index cf02f88..4aae3a7 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -128,12 +128,6 @@ python () {
 
     d.setVar('IMAGE_FEATURES', ' '.join(list(remain_features)))
 
-    if d.getVar('BB_WORKERCONTEXT', True) is not None:
-        pn = d.getVar('PN', True)
-        runtime_mapping_rename("PACKAGE_INSTALL", pn, d)
-        runtime_mapping_rename("PACKAGE_INSTALL_ATTEMPTONLY", pn, d)
-        runtime_mapping_rename("BAD_RECOMMENDATIONS", pn, d)
-
     # Ensure we have the vendor list for complementary package handling
     ml_vendor_list = ""
     multilibs = d.getVar('MULTILIBS', True) or ""
@@ -271,6 +265,17 @@ read_only_rootfs_hook () {
 	fi
 }
 
+# We have to delay the runtime_mapping_rename until just before rootfs runs
+# otherwise, the multilib renaming could step in and squash any fixups that
+# may have occurred.
+python rootfs_runtime_mapping() {
+    pn = d.getVar('PN', True)
+    runtime_mapping_rename("PACKAGE_INSTALL", pn, d)
+    runtime_mapping_rename("PACKAGE_INSTALL_ATTEMPTONLY", pn, d)
+    runtime_mapping_rename("BAD_RECOMMENDATIONS", pn, d)
+}
+do_rootfs[prefuncs] += "rootfs_runtime_mapping"
+
 fakeroot do_rootfs () {
 	#set -x
 	# When use the rpm incremental image generation, don't remove the rootfs
-- 
1.8.3


