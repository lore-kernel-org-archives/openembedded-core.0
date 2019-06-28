Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B723D7E90E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2019 11:52:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5SBplLV023501
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2019 04:52:07 -0700
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.439.0; Fri, 28 Jun 2019 04:51:37 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 28 Jun 2019 20:15:52 +0800
Message-ID: <8ed4c92b7a1618a5bc2781e7af04889f65b0baa7.1561724112.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1561724112.git.liezhi.yang@windriver.com>
References: <cover.1561724112.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] devupstream.bbclass: Disable devupstream when multilib is enabled
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
X-List-Received-Date: Fri, 28 Jun 2019 11:52:16 -0000
Content-Type: text/plain

Fixed:
MACHINE = "qemux86-64"
require conf/multilib.conf
MULTILIBS = "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 = "x86"

PREFERRED_VERSION_lttng-modules = "2.10.10+git%"

$ bitbake world

NOTE: preferred version 2.10.10+git% of lttng-modules not available (for item lib32-lttng-modules)
NOTE: versions of lttng-modules available: 2.10.10
ERROR: Multiple versions of lttng-modules are due to be built (/path/to/lttng-modules_2.10.10.bb virtual:devupstream:target:/path/to/lttng-modules_2.10.10.bb). Only one version of a given PN should be built in any given build. You likely need to set PREFERRED_VERSION_lttng-modules to select the correct version or don't depend on multiple versions.

This is because 2.10.10+git% will be built for non-multilib lttng-modules since
the PREFERRED_VERSION is set, but this version doesn't provide
lib32-lttng-modules, so 2.10.10 will be built, then the error happens.

Bitbake can't extend an extended recipe, for example:
virtual:multilib:lib32:virtual:devupstream:target

Or in a reverse order:
virtual:devupstream:target:virtual:multilib:lib32

So disable devupstream when multilib is enabled.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/devupstream.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes/devupstream.bbclass b/meta/classes/devupstream.bbclass
index 7780c54..25403da 100644
--- a/meta/classes/devupstream.bbclass
+++ b/meta/classes/devupstream.bbclass
@@ -19,6 +19,12 @@
 CLASSOVERRIDE .= ":class-devupstream"
 
 python devupstream_virtclass_handler () {
+    # bitbake can't extend an extended recipe, for example:
+    # virtual:multilib:lib32:virtual:devupstream:target
+    # So disable devupstream when multilib is enabled.
+    if d.getVar('MULTILIBS'):
+        raise bb.parse.SkipRecipe("Disable devupstream when multilib is enabled")
+
     # Do nothing if this is inherited, as it's for BBCLASSEXTEND
     if "devupstream" not in (d.getVar('BBCLASSEXTEND') or ""):
         bb.error("Don't inherit devupstream, use BBCLASSEXTEND")
-- 
2.7.4


