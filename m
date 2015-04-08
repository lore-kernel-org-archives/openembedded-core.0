Return-Path: <jukka.rissanen@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 7F87372A23
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Apr 2015 11:36:20 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 08 Apr 2015 04:36:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,544,1422950400"; d="scan'208";a="478273760"
Received: from jrissane-mobl.ger.corp.intel.com ([10.237.67.151])
	by FMSMGA003.fm.intel.com with ESMTP; 08 Apr 2015 04:36:21 -0700
From: Jukka Rissanen <jukka.rissanen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Apr 2015 14:36:19 +0300
Message-Id: <1428492979-32353-1-git-send-email-jukka.rissanen@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH] connman: Create connman.service at proper moment
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
X-List-Received-Date: Wed, 08 Apr 2015 11:36:24 -0000

ConnMan commit ac332c5d01b0737c18cb58c8ccc67cf6b0427e1d changes
how the connman.service file is created from .in file. After
that commit, the file is created by Makefile instead of configure.
This means that we need to tweak the service file in compile
time instead of configure time because the generated file will not
be there after the configuration.

This commit can be used even with older ConnMan version as the
connman.service file is there when the compilation happens.

Signed-off-by: Jukka Rissanen <jukka.rissanen@linux.intel.com>
---
 meta/recipes-connectivity/connman/connman.inc | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index e281e39..d068ba8 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -71,16 +71,14 @@ SYSTEMD_WIRED_SETUP = "ExecStartPre=-${libdir}/connman/wired-setup"
 
 inherit autotools pkgconfig systemd update-rc.d
 
-do_configure_append () {
-	sed -i "s#ExecStart=#${SYSTEMD_WIRED_SETUP}\nExecStart=#" ${B}/src/connman.service
-}
-
 # This allows *everyone* to access ConnMan over DBus, without any access
 # control.  Really the at_console flag should work, which would mean that
 # both this and the xuser patch can be dropped.
 do_compile_append() {
 	sed -i -e s:deny:allow:g ${S}/src/connman-dbus.conf
 	sed -i -e s:deny:allow:g ${S}/vpn/vpn-dbus.conf
+
+	sed -i "s#ExecStart=#${SYSTEMD_WIRED_SETUP}\nExecStart=#" ${B}/src/connman.service
 }
 
 do_install_append() {
-- 
2.1.0


