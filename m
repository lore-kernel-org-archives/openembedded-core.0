Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id AEEFF60EE1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2013 14:43:48 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 20 Sep 2013 07:43:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,944,1371106800"; d="scan'208";a="297315507"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.234])
	by AZSMGA002.ch.intel.com with ESMTP; 20 Sep 2013 07:43:47 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Sep 2013 15:43:45 +0100
Message-Id: <1379688225-29241-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] glib-2.0: fix broken python script header on machines using buildtools
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
X-List-Received-Date: Fri, 20 Sep 2013 14:43:48 -0000

With buildtools (which contains Python) installed on a build machine,
glib-2.0's gtester-report script was ending up with the full path to
the installed python binary in the shebang, which when rpm packaging
was used led to this being added as a per-file dependency by rpmdeps for
the libglib-2.0-utils package in which it ends up. This of course broke
do_rootfs when the package was included in the rootfs and had been
restored from sstate from another machine, as happened on the Yocto
Project autobuilder.

We were already trying to sed this script apparently only for the
shebang (since it appears that there are no other paths in the script)
so let's just sed the shebang properly; it also seems sensible to do
this for native as well instead of explicitly trying to exclude that
case.

Fixes [YOCTO #5205].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-core/glib-2.0/glib.inc | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index aa1d400..e57d2ac 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -46,7 +46,5 @@ ARM_INSTRUCTION_SET = "arm"
 USE_NLS = "yes"
 
 do_install_append () {
-	if [ "${PN}" != "glib-2.0-native" ]; then
-		sed ${D}${bindir}/gtester-report -i -e 's,${STAGING_BINDIR_NATIVE},${bindir},g'
-	fi
+	sed ${D}${bindir}/gtester-report -i -e '1s|^#!.*|#!/usr/bin/env python|'
 }
-- 
1.8.1.2


