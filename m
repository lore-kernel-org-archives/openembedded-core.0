Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D81C173206
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 10:34:37 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga101.jf.intel.com with ESMTP; 22 Feb 2016 02:34:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,483,1449561600"; d="scan'208";a="52368914"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga004.fm.intel.com with ESMTP; 22 Feb 2016 02:34:32 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 8BD486A4004
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 03:22:21 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Feb 2016 12:37:27 +0200
Message-Id: <1456137447-22103-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH] alsa-lib: topology: Add missing include sys/stat.h
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
X-List-Received-Date: Mon, 22 Feb 2016 10:34:39 -0000

Fixes this build error with uclibc:

alsa-lib-1.1.0/src/topology/parser.c: In function 'snd_tplg_build_file':
alsa-lib-1.1.0/src/topology/parser.c:262:35: error: 'S_IRUSR' undeclared
(first use in this function)
open(outfile, O_RDWR | O_CREAT, S_IRUSR | S_IWUSR);

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 ...1-topology-Add-missing-include-sys-stat.h.patch | 35 ++++++++++++++++++++++
 meta/recipes-multimedia/alsa/alsa-lib_1.1.0.bb     |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/0001-topology-Add-missing-include-sys-stat.h.patch

diff --git a/meta/recipes-multimedia/alsa/alsa-lib/0001-topology-Add-missing-include-sys-stat.h.patch b/meta/recipes-multimedia/alsa/alsa-lib/0001-topology-Add-missing-include-sys-stat.h.patch
new file mode 100644
index 0000000..0ead0cd
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-lib/0001-topology-Add-missing-include-sys-stat.h.patch
@@ -0,0 +1,35 @@
+From 3f1dba9a821b53b42001605f9a126a958804884f Mon Sep 17 00:00:00 2001
+From: Takashi Iwai <tiwai@suse.de>
+Date: Mon, 9 Nov 2015 13:37:26 +0100
+Subject: [PATCH] topology: Add missing include sys/stat.h
+
+Necessary for proper definitions of S_IRUSR & co. Otherwise it
+results in compile errors with old glibc and uclibc:
+  parser.c: In function 'snd_tplg_build_file':
+  parser.c:262: error: 'S_IRUSR' undeclared (first use in this function)
+  parser.c:262: error: (Each undeclared identifier is reported only once
+  parser.c:262: error: for each function it appears in.)
+
+Upstream-Status: Backport
+
+Signed-off-by: Takashi Iwai <tiwai@suse.de>
+Signed-off-by: Maxin B. John <maxin.john@intel.com>
+---
+ src/topology/parser.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/topology/parser.c b/src/topology/parser.c
+index 80a0ae0..18bb9c7 100644
+--- a/src/topology/parser.c
++++ b/src/topology/parser.c
+@@ -16,6 +16,7 @@
+            Liam Girdwood <liam.r.girdwood@linux.intel.com>
+ */
+ 
++#include <sys/stat.h>
+ #include "list.h"
+ #include "tplg_local.h"
+ 
+-- 
+2.4.0
+
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.1.0.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.1.0.bb
index c0bf9ac..a73da28 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.1.0.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.1.0.bb
@@ -17,6 +17,7 @@ ARM_INSTRUCTION_SET = "arm"
 SRC_URI = "ftp://ftp.alsa-project.org/pub/lib/${BP}.tar.bz2 \
            file://Check-if-wordexp-function-is-supported.patch \
            file://avoid-including-sys-poll.h-directly.patch \
+           file://0001-topology-Add-missing-include-sys-stat.h.patch \
 "
 SRC_URI[md5sum] = "69515ca73c3c4a212ef45160dea846c1"
 SRC_URI[sha256sum] = "dfde65d11e82b68f82e562ab6228c1fb7c78854345d3c57e2c68a9dd3dae1f15"
-- 
2.4.0


