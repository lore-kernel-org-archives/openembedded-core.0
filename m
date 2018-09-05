Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1F40778A06
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Sep 2018 12:37:09 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w85Cb9on012278
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 5 Sep 2018 05:37:09 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 5 Sep 2018 05:37:03 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Wed, 5 Sep 2018 08:36:03 -0400
Message-ID: <1536150963-173280-3-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1536150963-173280-1-git-send-email-hongxu.jia@windriver.com>
References: <1536150963-173280-1-git-send-email-hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] prelink: do not use 'exit 0' to incorrectly postpone to first boot
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
X-List-Received-Date: Wed, 05 Sep 2018 12:37:09 -0000
Content-Type: text/plain

After postinst was executed at do_rootfs successfully,
there will be no first boot to redo.

Since `229f4e9 package.bbclass: add support for
pkg_postinst_ontarget()' applied in oe-core, use
pkg_postinst_ontarget to instead.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/prelink/prelink_git.bb | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/meta/recipes-devtools/prelink/prelink_git.bb b/meta/recipes-devtools/prelink/prelink_git.bb
index c5eaedd..c110bd2 100644
--- a/meta/recipes-devtools/prelink/prelink_git.bb
+++ b/meta/recipes-devtools/prelink/prelink_git.bb
@@ -158,13 +158,7 @@ do_install_append () {
 # Prelinking during a cross install should be handled by the image-prelink
 # bbclass.  If the user desires this to run on the target at first boot
 # they will need to create a custom boot script.
-pkg_postinst_prelink() {
-#!/bin/sh
-
-if [ "x$D" != "x" ]; then
-  exit 0
-fi
-
+pkg_postinst_ontarget_prelink() {
 prelink -a
 }
 
-- 
2.8.1


