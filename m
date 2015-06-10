Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B9E6F6E277
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jun 2015 07:32:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t5A7WUas019130
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jun 2015 00:32:30 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 10 Jun 2015 00:32:30 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 10 Jun 2015 00:32:29 -0700
Message-ID: <159f0f3bce202ba9d9eedf5a14ba686373ca3929.1433921514.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1433921514.git.liezhi.yang@windriver.com>
References: <cover.1433921514.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] multilib.bbclass: use package_qa_handle_error
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
X-List-Received-Date: Wed, 10 Jun 2015 07:32:31 -0000
Content-Type: text/plain

Use package_qa_handle_error to handle the QA issue.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/insane.bbclass   |    2 +-
 meta/classes/multilib.bbclass |    5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 14d4a3c..c1afde5 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -30,7 +30,7 @@ WARN_QA ?= "ldflags useless-rpaths rpaths staticdev libdir xorg-driver-abi \
             textrel already-stripped incompatible-license files-invalid \
             installed-vs-shipped compile-host-path install-host-path \
             pn-overrides infodir build-deps file-rdeps \
-            unknown-configure-option symlink-to-sysroot \
+            unknown-configure-option symlink-to-sysroot multilib \
             "
 ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
             perms dep-cmp pkgvarcheck perm-config perm-line perm-link \
diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index 2b5d356..8f61d8d 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -132,8 +132,9 @@ python do_package_qa_multilib() {
                 (not i.startswith("rtld")) and (not i.startswith('kernel-vmlinux')):
                 candidates.append(i)
         if len(candidates) > 0:
-            bb.warn("Multilib QA Issue: %s package %s - suspicious values '%s' in %s" 
-                   % (d.getVar('PN', True), pkg, ' '.join(candidates), var))
+            msg = "%s package %s - suspicious values '%s' in %s" \
+                   % (d.getVar('PN', True), pkg, ' '.join(candidates), var)
+            package_qa_handle_error("multilib", msg, d)
 
     ml = d.getVar('MLPREFIX', True)
     if not ml:
-- 
1.7.9.5


