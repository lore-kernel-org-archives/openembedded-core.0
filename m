Return-Path: <andrej.valek@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 9B43B7C7A3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Feb 2019 19:42:01 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x1GJg1br012998
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Feb 2019 20:42:01 +0100
Received: from dev.vm6.ccp.siemens.com ([139.22.33.63])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id x1GJg1aM027385;
	Sat, 16 Feb 2019 20:42:01 +0100
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 2A67D98F566;
	Sat, 16 Feb 2019 20:42:01 +0100 (CET)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 16 Feb 2019 20:40:48 +0100
Message-Id: <20190216194048.6256-2-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190216194048.6256-1-andrej.valek@siemens.com>
References: <20190216194048.6256-1-andrej.valek@siemens.com>
In-Reply-To: <20190215082252.2726-1-andrej.valek@siemens.com>
References: <20190215082252.2726-1-andrej.valek@siemens.com>
Subject: [PATCH v2 2/2] bc: fix conflict with busybox
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
X-List-Received-Date: Sat, 16 Feb 2019 19:42:02 -0000

- make bc compatible with update alternative
- disable bc applet in busybox by default

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 meta/recipes-core/busybox/busybox/defconfig | 1 +
 meta/recipes-extended/bc/bc_1.07.1.bb       | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-core/busybox/busybox/defconfig
index d11707abc3..2633bc067b 100644
--- a/meta/recipes-core/busybox/busybox/defconfig
+++ b/meta/recipes-core/busybox/busybox/defconfig
@@ -784,6 +784,7 @@ CONFIG_FEATURE_BEEP_LENGTH_MS=0
 # CONFIG_FEATURE_CHAT_CLR_ABORT is not set
 # CONFIG_CHRT is not set
 # CONFIG_CRONTAB is not set
+# CONFIG_BC is not set
 CONFIG_DC=y
 # CONFIG_FEATURE_DC_LIBM is not set
 # CONFIG_DEVFSD is not set
diff --git a/meta/recipes-extended/bc/bc_1.07.1.bb b/meta/recipes-extended/bc/bc_1.07.1.bb
index e80857745e..10e222a3cc 100644
--- a/meta/recipes-extended/bc/bc_1.07.1.bb
+++ b/meta/recipes-extended/bc/bc_1.07.1.bb
@@ -27,7 +27,7 @@ do_compile_prepend() {
     cp -f ${WORKDIR}/libmath.h ${B}/bc/libmath.h
 }
 
-ALTERNATIVE_${PN} = "dc"
+ALTERNATIVE_${PN} = "bc dc"
 ALTERNATIVE_PRIORITY = "100"
 
 BBCLASSEXTEND = "native"
\ No newline at end of file
-- 
2.11.0


