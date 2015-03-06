Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2E9416017E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Mar 2015 19:53:25 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t26JrQa6008141
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Mar 2015 11:53:26 -0800 (PST)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Fri, 6 Mar 2015 11:53:25 -0800
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 6 Mar 2015 11:53:25 -0800
Message-ID: <1425671605-6763-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [PATCH 1/1] security_flags: eliminate FORTIFY_SOURCE for debug builds
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
X-List-Received-Date: Fri, 06 Mar 2015 19:53:26 -0000
Content-Type: text/plain

If -D_FORTIFY_SOURCE=2 is included in CFLAGS for debug builds,
many warnings will be generated and some packages will fail to
build.  So, only conditionally include it.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 meta/conf/distro/include/security_flags.inc |   11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index f3f0082..287f30f 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -1,10 +1,15 @@
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
1.7.9.5


