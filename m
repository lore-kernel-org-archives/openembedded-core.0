Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4A5BA731DA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Feb 2017 12:05:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v11C5CFZ011935; Wed, 1 Feb 2017 12:05:12 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id fIMjrXI_RMPa; Wed,  1 Feb 2017 12:05:12 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v11C5A7Q011902
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 1 Feb 2017 12:05:11 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cYtew-0000FH-A4; Wed, 01 Feb 2017 12:05:10 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Feb 2017 12:05:07 +0000
Message-Id: <1485950707-878-3-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1485950707-878-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1485950707-878-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 3/3] meta-environment: Clean up the task structure to reduce manifest warnings
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
X-List-Received-Date: Wed, 01 Feb 2017 12:05:13 -0000

This puts the dependencies on the correct task and removes pointless
noexec tasks allowing for a slightly cleaner task structure.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/meta/meta-environment.bb | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-core/meta/meta-environment.bb b/meta/recipes-core/meta/meta-environment.bb
index 1128a56..c7ac05d 100644
--- a/meta/recipes-core/meta/meta-environment.bb
+++ b/meta/recipes-core/meta/meta-environment.bb
@@ -19,12 +19,10 @@ SDKTARGETSYSROOT = "${SDKPATH}/sysroots/${REAL_MULTIMACH_TARGET_SYS}"
 
 inherit cross-canadian
 
-# Need to ensure we have the virtual mappings and site files for all multtilib 
-# variants
-DEPENDS += "${@all_multilib_tune_values(d, 'TOOLCHAIN_NEED_CONFIGSITE_CACHE')}"
-
 do_generate_content[cleandirs] = "${SDK_OUTPUT}"
 do_generate_content[dirs] = "${SDK_OUTPUT}/${SDKPATH}"
+# Need to ensure we have the virtual mappings and site files for all multtilib variants
+do_generate_content[depends] = "${@oe.utils.build_depends_string(all_multilib_tune_values(d, 'TOOLCHAIN_NEED_CONFIGSITE_CACHE'), 'do_populate_sysroot')}"
 python do_generate_content() {
     # Handle multilibs in the SDK environment, siteconfig, etc files...
     localdata = bb.data.createCopy(d)
@@ -74,6 +72,6 @@ FILES_${PN}= " \
 deltask do_fetch
 deltask do_unpack
 deltask do_patch
-do_configure[noexec] = "1"
-do_compile[noexec] = "1"
-do_populate_sysroot[noexec] = "1"
+deltask do_configure
+deltask do_compile
+deltask do_populate_sysroot
-- 
2.7.4


