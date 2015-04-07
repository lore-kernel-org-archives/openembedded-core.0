Return-Path: <denis@denix.org>
X-Greylist: delayed 3600 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 07 Apr 2015 21:54:27 UTC
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by mail.openembedded.org (Postfix) with ESMTP id 14367605F1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Apr 2015 21:54:27 +0000 (UTC)
Received: from gandalf.denix.org ([108.28.31.169]) by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NMG007M9FE2LXQ0@vms173017.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Tue, 07 Apr 2015 15:54:13 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WpCc6mbq c=1 sm=1 tr=0	a=fMO+sUsoiA3cqMJ/JkSOnA==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=e9J7MTPGsLIA:10
	a=sozttTNsAAAA:8	a=mQmndGCHv75K8PZ1HR4A:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id B646F20238;	Tue,
	7 Apr 2015 16:54:02 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 07 Apr 2015 16:53:55 -0400
Message-id: <1428440035-6307-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1428440035-6307-1-git-send-email-denis@denix.org>
References: <1428440035-6307-1-git-send-email-denis@denix.org>
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH 2/2] security_flags.inc: disable PIE for bash due to issues in mkbuiltins
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
X-List-Received-Date: Tue, 07 Apr 2015 21:54:28 -0000

From: Denys Dmytriyenko <denys@ti.com>

As bash builds a native tool called mkbuiltins, it fails with PIE flags:

ld: mkbuiltins.o: relocation R_X86_64_32 against `.rodata.str1.8' can not be used when making a shared object; recompile with -fPIC

Affects at least version 3.2 of bash.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta/conf/distro/include/security_flags.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index 21e1a53..3401c4b 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -16,6 +16,7 @@ SECURITY_CFLAGS_pn-lttng-tools_arm = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-elfutils_arm = "${SECURITY_NO_PIE_CFLAGS}"
 
 SECURITY_CFLAGS_pn-aspell = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-bash = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-beecrypt = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-blktrace = "${SECURITY_NO_PIE_CFLAGS}"
 # Curl seems to check for FORTIFY_SOURCE in CFLAGS, but even assigned
-- 
2.2.0


