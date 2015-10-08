Return-Path: <Jian.Liu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id ECAB776AE2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Oct 2015 06:47:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t986lrF5015189
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 7 Oct 2015 23:47:53 -0700 (PDT)
Received: from localhost.localdomain (128.224.153.43) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 7 Oct 2015 23:47:52 -0700
From: Jian Liu <jian.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 8 Oct 2015 14:47:51 +0800
Message-ID: <1444286871-8615-1-git-send-email-jian.liu@windriver.com>
X-Mailer: git-send-email 1.7.0.5
MIME-Version: 1.0
Subject: [PATCH] base.bbclass: considering multilib when setting LICENSE_EXCLUSION
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
X-List-Received-Date: Thu, 08 Oct 2015 06:47:56 -0000
Content-Type: text/plain

The PACKAGES is not mapped with MLPREFIX when setting LICENSE_EXCLUSION
in base.bbclass. For example,
  For libgcc-dev,
    LICENSE_EXCLUSION-libgcc-dev=1
   but for lib32-libgcc-dev,
    LICENSE_EXCLUSION-libgcc-dev=1
Obviously it is wrong for lib32-libgcc-dev.

Add MLPREFIX before the package name during setting LICENSE_EXCLUSION

Signed-off-by: Jian Liu <jian.liu@windriver.com>
---
 meta/classes/base.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index f078001..89c8f04 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -512,7 +512,8 @@ python () {
                 if unskipped_pkgs:
                     for pkg in skipped_pkgs:
                         bb.debug(1, "SKIPPING the package " + pkg + " at do_rootfs because it's " + recipe_license)
-                        d.setVar('LICENSE_EXCLUSION-' + pkg, 1)
+                        mlprefix = d.getVar('MLPREFIX', True)
+                        d.setVar('LICENSE_EXCLUSION-' + mlprefix + pkg, 1)
                     for pkg in unskipped_pkgs:
                         bb.debug(1, "INCLUDING the package " + pkg)
                 elif all_skipped or incompatible_license(d, bad_licenses):
-- 
1.8.5.2.233.g932f7e4


