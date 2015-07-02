Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4BD3E607BB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jul 2015 09:10:36 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t629AbYK019955
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 2 Jul 2015 02:10:37 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Thu, 2 Jul 2015 02:10:36 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 2 Jul 2015 17:10:51 +0800
Message-ID: <1435828251-10712-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] security_flags: eliminate FORTIFY_SOURCE for debug builds
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
X-List-Received-Date: Thu, 02 Jul 2015 09:10:39 -0000
Content-Type: text/plain

From: Joe Slater <jslater@windriver.com>

If -D_FORTIFY_SOURCE=2 is included in CFLAGS for debug builds,
many warnings will be generated and some packages will fail to
build.  So, only conditionally include it.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 meta/conf/distro/include/security_flags.inc | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index 104a6cb..9dbce57 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -5,13 +5,18 @@
 # From a Yocto Project perspective, this file is included and tested
 # in the DISTRO="poky-lsb" configuration.
 
-SECURITY_CFLAGS ?= "-fstack-protector-all -pie -fpie -D_FORTIFY_SOURCE=2"
-SECURITY_NO_PIE_CFLAGS ?= "-fstack-protector-all -D_FORTIFY_SOURCE=2"
+# _FORTIFY_SOURCE does not play well with debug builds
+#
+lcl_maybe_fortify = "${@base_conditional('DEBUG_BUILD','1','','-D_FORTIFY_SOURCE=2',d)}"
+
+SECURITY_CFLAGS ?= "-fstack-protector-all -pie -fpie ${lcl_maybe_fortify}"
+SECURITY_NO_PIE_CFLAGS ?= "-fstack-protector-all ${lcl_maybe_fortify}"
+
 SECURITY_LDFLAGS ?= "-Wl,-z,relro,-z,now"
 SECURITY_X_LDFLAGS ?= "-Wl,-z,relro"
 
 # powerpc does not get on with pie for reasons not looked into as yet
-SECURITY_CFLAGS_powerpc = "-fstack-protector-all -D_FORTIFY_SOURCE=2"
+SECURITY_CFLAGS_powerpc = "-fstack-protector-all ${lcl_maybe_fortify}"
 # Deal with ppc specific linker failures when using the cflags
 SECURITY_CFLAGS_pn-dbus_powerpc = ""
 SECURITY_CFLAGS_pn-dbus-ptest_powerpc = ""
-- 
1.9.1


