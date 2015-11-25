Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0D4AB6057B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 20:44:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tAPKiYoJ016369
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 12:44:34 -0800 (PST)
Received: from msp-dhcp23.wrs.com (172.25.34.23) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 25 Nov 2015 12:44:33 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 25 Nov 2015 14:44:29 -0600
Message-ID: <1448484269-132667-4-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1448484269-132667-1-git-send-email-mark.hatle@windriver.com>
References: <1448484269-132667-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] package_manager.py: Avoid installing an empty package list
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
X-List-Received-Date: Wed, 25 Nov 2015 20:44:38 -0000
Content-Type: text/plain

It is possible in an attempt only install, that everything listed is not
available to be installed.  This will have the effect of clearing the
package list.  However, we only check for an empty package list at
the beginning of the function.  We need to also check before running the
install, otherwise we can fail due to 'error: no package(s) given".

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/lib/oe/package_manager.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 36bd29f..2483e97 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -1171,6 +1171,9 @@ class RpmPM(PackageManager):
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
1.9.3


