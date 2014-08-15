Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2D955601A8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Aug 2014 03:05:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7F354YZ022092
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 20:05:04 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Thu, 14 Aug 2014 20:05:03 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 15 Aug 2014 11:00:56 +0800
Message-ID: <1408071656-12285-1-git-send-email-Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] mesa: fix Multilib QA Issue
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
X-List-Received-Date: Fri, 15 Aug 2014 03:05:05 -0000
Content-Type: text/plain

This patch fixed warning:
WARNING: Multilib QA Issue: lib32-mesa package lib32-mesa-megadriver - suspicious values
'mesa-driver-swrast mesa-driver-nouveau-vieux mesa-driver-r200 mesa-driver-i915 mesa-driver-radeon mesa-driver-i965' in RPROVIDES
WARNING: Multilib QA Issue: lib32-mesa package lib32-mesa-megadriver - suspicious values
'mesa-driver-swrast mesa-driver-nouveau-vieux mesa-driver-r200 mesa-driver-i915 mesa-driver-radeon mesa-driver-i965' in RREPLACES
WARNING: Multilib QA Issue: lib32-mesa package lib32-mesa-megadriver - suspicious values
'mesa-driver-swrast mesa-driver-nouveau-vieux mesa-driver-r200 mesa-driver-i915 mesa-driver-radeon mesa-driver-i965' in RCONFLICTS

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 3298e00..1857f3c 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -143,7 +143,7 @@ python mesa_populate_packages() {
     for p in dri_pkgs:
         m = re.match('^(.*)_dri\.so$', p)
         if m:
-            pkg_name = " mesa-driver-%s" % legitimize_package_name(m.group(1))
+            pkg_name = " ${MLPREFIX}mesa-driver-%s" % legitimize_package_name(m.group(1))
             d.appendVar("RPROVIDES_%s" % lib_name, pkg_name)
             d.appendVar("RCONFLICTS_%s" % lib_name, pkg_name)
             d.appendVar("RREPLACES_%s" % lib_name, pkg_name)
-- 
1.9.1


