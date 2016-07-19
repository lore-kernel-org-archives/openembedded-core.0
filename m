Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5BFB56080F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2016 07:44:55 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u6J7iuKc011792
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2016 00:44:56 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Tue, 19 Jul 2016 00:44:56 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Jul 2016 15:42:32 +0800
Message-ID: <1468914152-4136-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] package_manager.py: Avoid installing an empty package list
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
X-List-Received-Date: Tue, 19 Jul 2016 07:44:56 -0000
Content-Type: text/plain

From: Mark Hatle <mark.hatle@windriver.com>

It is possible in an attempt only install, that everything listed is not
available to be installed.  This will have the effect of clearing the
package list.  However, we only check for an empty package list at
the beginning of the function.  We need to also check before running the
install, otherwise we can fail due to 'error: no package(s) given".

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/lib/oe/package_manager.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 2004a42..47f6831 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -1186,6 +1186,9 @@ class RpmPM(PackageManager):
                     new_depends[new_depend] = deps[depend]
                 pkgs = bb.utils.join_deps(new_depends, commasep=True).split(', ')
         pkgs = self._pkg_translate_oe_to_smart(pkgs, attempt_only)
+        if not pkgs:
+            bb.note("There are no packages to install")
+            return
         if not attempt_only:
             bb.note('to be installed: %s' % ' '.join(pkgs))
             cmd = "%s %s install -y %s" % \
-- 
2.8.1


