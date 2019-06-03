Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 4EBF66D61B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2019 06:47:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45HQZw36lJz23
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2019 08:47:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1559544424;
	bh=csGt91zUANtIylMdF9fGPRnBdxPzS2Zi5viZgSrmDz8=;
	h=From:To:Subject:Date:From;
	b=IxLQ5JANNmUAs8gHI+TBDG+2TDe2Btasp1sTKNUYPMOEPLjSqVf2OHNftvm7y7td5
	MFnAl/Ju16JyC+Gu8sJljzvHFeoCMAUbKXg7oE9lYFQ8bUro9qy4+QBYKQTORftieb
	4EcmFaFlbLRRcYvqusZ0z4RIQf7boEDVKPzFAP2oqQzliwl7dzLGkm6p5xrWtI9zEA
	swZnbDbONPKspARUb30MEy4sfj7uTwaYkYG9tyggtoRmPqzC5+qbdAnTgn9JNt3oXL
	NUy3rTtUgxMgJE4Fnzq849EqBdFTOZnEGi8jp3w9z98H+2WD20OxAhjJkOCZKhrZ7S
	Wu+VMX27viPdA9Ay+zQJywTTxb6UVqjdoueoCKhMzf+nnrG0+LoCiVbh1n6HOQL92K
	c+/POTDlLknt4gs+po8TFLwHq4Cti3fogsVxox32VoWHCbnIURQ1+UuyTPJgkXE1cQ
	P3qyJvV7eawIdXJ5AdxCDXwqjPGC4ttOn7qP/kr+EetwmcqELOa6J0v2AzY6pcHcaN
	/LVV9avbc3x9jP4qrouvkDX/EYvAvKeTxulvY9Vh9+ged7UUytciXsQlzUfC5Vi+Vw
	oj0iX5cG7hyPR97oeX18vrLWnGqskFaRo1ZAkL5/ILEYdBUoDWLjEIsdosTqrSrhJC
	F6g9CO0WSOmwNVPTVkmgxB3M=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Jun 2019 09:47:02 +0300
Message-Id: <20190603064703.17474-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] lrzsz: Add implicit declaration fixes from Debian
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
X-List-Received-Date: Mon, 03 Jun 2019 06:47:04 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
--
v2: Add comment in the patch header.
---
 .../lrzsz/lrzsz-0.12.20/include.patch         | 25 +++++++++++++++++++
 meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb       |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-bsp/lrzsz/lrzsz-0.12.20/include.patch

diff --git a/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/include.patch b/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/include.patch
new file mode 100644
index 0000000000..5fcb3aa92b
--- /dev/null
+++ b/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/include.patch
@@ -0,0 +1,25 @@
+Implicit declaration compile warning fixes from Debian
+
+Signed-off-by: Adrian Bunk <bunk@stusta.de>
+Upstream-Status: Inappropriate [upstream is dead]
+
+--- lrzsz-0.12.21.orig/lib/long-options.c
++++ lrzsz-0.12.21/lib/long-options.c
+@@ -22,6 +22,7 @@
+ #endif
+ 
+ #include <stdio.h>
++#include <stdlib.h>
+ #include <getopt.h>
+ #include "long-options.h"
+ 
+--- lrzsz-0.12.21.orig/src/lsyslog.c
++++ lrzsz-0.12.21/src/lsyslog.c
+@@ -22,6 +22,7 @@
+ #ifdef ENABLE_SYSLOG
+ #include "zglobal.h"
+ #include <pwd.h>
++#include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
+ #endif
diff --git a/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb b/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
index 002c774c6d..34556b2c29 100644
--- a/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
+++ b/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
@@ -20,6 +20,7 @@ SRC_URI = "http://www.ohse.de/uwe/releases/lrzsz-${PV}.tar.gz \
 	   file://lrzsz_fix_for_automake-1.12.patch \
            file://lrzsz-check-locale.h.patch \
            file://cve-2018-10195.patch \
+           file://include.patch \
            "
 
 SRC_URI[md5sum] = "b5ce6a74abc9b9eb2af94dffdfd372a4"
-- 
2.17.1


