Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D20D56A4AC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2013 08:09:37 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5E89bbf026526
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2013 01:09:37 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Fri, 14 Jun 2013 01:09:34 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 14 Jun 2013 16:09:33 +0800
Message-ID: <1371197373-10741-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
Subject: [PATCH] do not pass CFLAGS to gcc while building libcap
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
X-List-Received-Date: Fri, 14 Jun 2013 08:09:37 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

During do_configure(), we modify the BUILD_CFLAGS used
but do not remove the default inclusion of CFLAGS
in BUILD_CFLAGS.  This fix removes CFLAGS inclusion
by modifying do_configure().

Signed-off-by: Joe Slater <jslater@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/recipes-support/libcap/libcap.inc |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/libcap/libcap.inc b/meta/recipes-support/libcap/libcap.inc
index 2fd5718..5ace7d7 100644
--- a/meta/recipes-support/libcap/libcap.inc
+++ b/meta/recipes-support/libcap/libcap.inc
@@ -12,15 +12,17 @@ DEPENDS_class-native = "perl-native-runtime"

 SRC_URI = "${DEBIAN_MIRROR}/main/libc/libcap2/${BPN}2_${PV}.orig.tar.gz"

-PR = "r2"
+PR = "r3"

 inherit lib_package

+# do NOT pass target cflags to host compilations
+#
 do_configure() {
 	# libcap uses := for compilers, fortunately, it gives us a hint
 	# on what should be replaced with ?=
 	sed -e 's,:=,?=,g' -i Make.Rules
-	sed -e 's,BUILD_CFLAGS ?=,BUILD_CFLAGS := $(BUILD_CFLAGS),' -i Make.Rules
+	sed -e 's,^BUILD_CFLAGS ?= $(CFLAGS),BUILD_CFLAGS := $(BUILD_CFLAGS),' -i Make.Rules
 }

 EXTRA_OEMAKE = " \
--
1.7.4.1


