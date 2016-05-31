Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 7C6EE771C5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2016 09:51:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 14DF82E234
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2016 11:51:52 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id ksu2vlq5eUzN
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2016 11:51:50 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id BB6572E240
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2016 11:51:50 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id A2C241AEA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2016 11:51:50 +0200 (CEST)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id 94AF11A9A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2016 11:51:50 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 92DA9F39
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2016 11:51:50 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id u4V9po3I014498
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2016 11:51:50 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id u4V9povF014497
	for openembedded-core@lists.openembedded.org;
	Tue, 31 May 2016 11:51:50 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 May 2016 11:51:49 +0200
Message-Id: <34d687a62898106d88c01c1c0bf6e6311e6972ff.1464688273.git.pkj@axis.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1464688273.git.pkj@axis.com>
References: <cover.1464688273.git.pkj@axis.com>
In-Reply-To: <cover.1464688273.git.pkj@axis.com>
References: <cover.1464688273.git.pkj@axis.com>
Subject: [PATCH 1/1] tcl: Only set BINCONFIG_GLOB for target builds
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
X-List-Received-Date: Tue, 31 May 2016 09:51:54 -0000

The recent change of how ${bindir_crossscripts} is installed to the
sysroot had the unforeseen effect that tclConfig.sh in the sysroot
contained invalid paths, which caused postgresql to fail to build.
The change in the contents of tclConfig.sh was due to that it was
previously installed to the sysroot after binconfig had done its work,
and was thus unaffected by it.

This change makes sure the contents of tclConfig.sh is the same as
before, both in the sysroots and on target. This will make postgresql
build again.

This also changes the BINCONFIG_GLOB to only match tclConfig.sh.
Before it would also match itclConfig.sh, tclooConfig.sh and
tdbcConfig.sh, which were consequently installed to the sysroots.
However, that seems to have been accidentally introduced with the use
of binconfig (based on what is installed in do_install()).

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-devtools/tcltk/tcl_8.6.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.4.bb b/meta/recipes-devtools/tcltk/tcl_8.6.4.bb
index 61be81d..3a3fd83 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.6.4.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.6.4.bb
@@ -93,7 +93,7 @@ do_install_ptest() {
 }
 
 # Fix some paths that might be used by Tcl extensions
-BINCONFIG_GLOB = "*Config.sh"
+BINCONFIG_GLOB_class-target = "tclConfig.sh"
 
 # Fix the path in sstate
 SSTATE_SCAN_FILES += "*Config.sh"
-- 
2.1.0


