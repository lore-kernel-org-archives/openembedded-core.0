Return-Path: <Yuanjie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 65AB06011F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Nov 2015 02:40:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tAR2eM85012354
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Nov 2015 18:40:22 -0800 (PST)
Received: from Flora.wrs.com (128.224.163.135) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 26 Nov 2015 18:40:22 -0800
From: Yuanjie Huang <Yuanjie.Huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 27 Nov 2015 10:45:48 +0800
Message-ID: <1448592348-16830-1-git-send-email-Yuanjie.Huang@windriver.com>
X-Mailer: git-send-email 2.6.2
MIME-Version: 1.0
Subject: [PATCH] gcc-cross-initial: make dependency on gnu-config-native and autoconf-native explicit
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
X-List-Received-Date: Fri, 27 Nov 2015 02:40:24 -0000
Content-Type: text/plain

From: Yuanjie Huang <yuanjie.huang@windriver.com>

When a project is configure to use sstate cache and has the host tool sysroot
cleaned, gcc-cross-initial may fail to be configured due to lack of
gnu-configize tool.

gcc-cross-initial recipe has autotools dependency inhibited, and the same flag
variable also excludes the gnu-config-native.  Though there is an indirect
dependency through libmpc-native, it's not safe with sstate cache being used.

Moreover, gnu-config-native requires a perl package from autoconf-native to
run, otherwise it will fail with "Can't locate Autom4te/ChannelDefs.pm in @INC"
message.

This patch makes both dependencies explicit for gcc-cross-initial's
configuration.

Upstream-status: Inappropriate[configuration]

Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-cross-initial.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-cross-initial.inc b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
index 7197447..1cb341b 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-initial.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
@@ -5,6 +5,9 @@ PACKAGES = ""
 INHIBIT_AUTOTOOLS_DEPS = "1"
 INHIBIT_DEFAULT_DEPS = "1"
 
+# We still need gnu-config-native
+DEPENDS_prepend = "gnu-config-native autoconf-native"
+
 PN = "gcc-cross-initial-${TARGET_ARCH}"
 
 CROSS_TARGET_SYS_DIR_append = ".${PN}"
-- 
2.6.2


