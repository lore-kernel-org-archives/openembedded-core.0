Return-Path: <maxin.john@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 69EB87727C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Feb 2016 15:18:18 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP; 23 Feb 2016 07:18:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,489,1449561600"; d="scan'208";a="53240826"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga004.fm.intel.com with ESMTP; 23 Feb 2016 07:18:20 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 73FE26A4004
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Feb 2016 08:06:08 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Feb 2016 17:21:42 +0200
Message-Id: <1456240902-31768-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH] argp-standalone: make it available for non-musl systems too
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
X-List-Received-Date: Tue, 23 Feb 2016 15:18:19 -0000

Without this, uclibc build of rng-tools will fail with this error:

ERROR: Nothing PROVIDES 'argp-standalone'
(but rng-tools_5.bb DEPENDS on or otherwise requires it)
ERROR: argp-standalone was skipped: incompatible with host
x86_64-poky-linux-uclibc (not in COMPATIBLE_HOST)
ERROR: Required build target 'rng-tools' has no buildable providers.
Missing or unbuildable dependency chain was: ['rng-tools',
'argp-standalone']

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-support/argp-standalone/argp-standalone_1.3.bb | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb b/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb
index d61c8be..5148bbf 100644
--- a/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb
+++ b/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb
@@ -21,9 +21,8 @@ CFLAGS += "-fPIC -U__OPTIMIZE__"
 
 do_install() {
 	install -D -m 0644 ${B}/libargp.a ${D}${libdir}/libargp.a
-	install -D -m 0644 ${S}/argp.h ${D}${includedir}/argp.h
 }
-#
-# We will skip parsing for non-musl systems
-#
-COMPATIBLE_HOST = ".*-musl.*"
+
+do_install_append_libc-musl() {
+    install -D -m 0644 ${S}/argp.h ${D}${includedir}/argp.h
+}
-- 
2.4.0


