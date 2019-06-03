Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 19C906D61B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2019 06:57:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45HQpw3tC1z3k
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2019 08:57:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1559545048;
	bh=csGt91zUANtIylMdF9fGPRnBdxPzS2Zi5viZgSrmDz8=;
	h=From:To:Subject:Date:From;
	b=BzHGHnKOCTCcFMBXNBUiK5/lsH6VXZnd3S3mrxu5RddStmj4NfySTVGUGi+MBsocc
	ztOFvYTHNNzDVMnpXBMOtqetaK4aSO9vy8i7e2DiWnH494cRKjmlNg+cqt5NhGxsEm
	fPpoKSL7GYTnYP2K5bL8OwHRA/cjHFBlsZ1ZKWbcxUpZhXk8OdjBTAexUl/FOwSeYb
	7E0PP7Vs0aTlNnnyn2yfeKhgdeakZvGzXgxTdOmrpzw6/+necxiZpZYW/40G5SBdOl
	lG4mTeYdlqOo3PbcTSDSNxGmDx/h1H8XvZzV15y4CakMESLFItkxvOrfp7GCTyHahw
	axJcZEgqPwukr1RIUNF9X5ofjDZNaUxdVHc45hHZsp6J7VnISNCWvDIanGcAHvdAlg
	/P5FMev8wELF62iriAazfMZQKwjJQPu3RiLQhI1dCXnVnmT6cHTj49mXcHGVqAfz8T
	QoMdftEjg+QFOcjQaO5/WfMc1/1/kKHF+FE+5SiVsKcM+2p2rJ3sdwWmQgaezZLbNn
	bKthF/BicDiGmJ37Z5PysBkCFB6Kh8IsQIK8MseqFnpvl48OpMAG8HZU8Fs/uhymo8
	NyclZWD19s1u8rYksGB9Ki6r2HF/qXEJJ7bjOvBcGexgD44etaGr6oVTnBPF8HA7uw
	9h1GTLq5IMei7XwjxjBj4FUI=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Jun 2019 09:57:26 +0300
Message-Id: <20190603065727.8470-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH v2] lrzsz: Add implicit declaration fixes from Debian
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
X-List-Received-Date: Mon, 03 Jun 2019 06:57:28 -0000

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


