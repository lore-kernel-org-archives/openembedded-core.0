Return-Path: <andrej.kozemcak@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29AA0FEFB6B
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 09:23:32 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40480.1772702602608740055
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 01:23:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=andrej.kozemcak@siemens.com header.s=fm1 header.b=CRybaPmg;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-1334352-20260305092319819d1c753500020767-bqyg_y@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20260305092319819d1c753500020767
        for <openembedded-core@lists.openembedded.org>;
        Thu, 05 Mar 2026 10:23:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=andrej.kozemcak@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=6VYY+l7HSir95C1CSyE0BixUEMeUNsDKioHl7GMgNaA=;
 b=CRybaPmgeUIuG3mTCJDHMy/17O6gianbMRF1ntmbXUaqohPALKtDbIq0m2yW0kjvomPEIS
 PaYTUFzf8+y3QwialF9ZOzfdxHCix7wRK24rMMt6ydUrC3tj8JOpA2RdrMyGey8pcBkoKd9t
 X0p6EeDfaBb+ph19RJY8LUkrrdz6jpfBkif6pMIQ8UMA+b1/oOgysqkR5AGlwD1dPo9mQmkJ
 vOnj5fA80yN7+wKuzVP80MvxDiPYZ5WyBUU4e5NAstlHAg+ZDS5fO/kHyimj4okXk07GL5xy
 loZUQYDmGvzz61ElMYNr7sP3DU13RlnRmIcE45QlkuTucj+F9XlnZP0g==;
From: Andrej Kozemcak <andrej.kozemcak@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Andrej Kozemcak <andrej.kozemcak@siemens.com>
Subject: [OE-core][PATCH v2] iproute2: upgrade 6.18.0 -> 6.19.0
Date: Thu,  5 Mar 2026 10:20:25 +0100
Message-ID: <20260305092024.1243675-2-andrej.kozemcak@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1334352:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 09:23:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232468

Hi Mathieu,

I fix the `musl` build. I hope it builds without errors now.

Best Regards,
Andrej

---

Drop fix-musl.patch as it was merged upstream.
Add missing include for types (linux/types.h).

Changes:
  - new dpll command for managing Digital Phase-Locked Loop devices via netlink.
  - expanded CAN XL support
  - MPTCP improvements
  - devlink:
    - added support for 64‑bit parameters
    - added new SWITCHDEV_INACTIVE eswitch mode
    - added burst period configuration for health reporters
  - genl:
    - supports JSON output
  - ifstat, nstat, lnstat:
    - converted to use the high-level json_print API for unified JSON output

Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
---
 ...olor.h-add-missing-include-for-types.patch | 28 ++++++++++++
 .../iproute2/iproute2/fix-musl.patch          | 43 -------------------
 ...{iproute2_6.18.0.bb => iproute2_6.19.0.bb} |  4 +-
 3 files changed, 30 insertions(+), 45 deletions(-)
 create mode 100644 meta/recipes-connectivity/iproute2/iproute2/0002-include-color.h-add-missing-include-for-types.patch
 delete mode 100644 meta/recipes-connectivity/iproute2/iproute2/fix-musl.patch
 rename meta/recipes-connectivity/iproute2/{iproute2_6.18.0.bb => iproute2_6.19.0.bb} (95%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2/0002-include-color.h-add-missing-include-for-types.patch b/meta/recipes-connectivity/iproute2/iproute2/0002-include-color.h-add-missing-include-for-types.patch
new file mode 100644
index 0000000000..f35e3aee52
--- /dev/null
+++ b/meta/recipes-connectivity/iproute2/iproute2/0002-include-color.h-add-missing-include-for-types.patch
@@ -0,0 +1,28 @@
+From e5d1c40915564df6974d6451b2a038c92773f2bd Mon Sep 17 00:00:00 2001
+From: Andrej Kozemcak <andrej.kozemcak@siemens.com>
+Date: Thu, 5 Mar 2026 08:06:54 +0100
+Subject: [PATCH] include/color.h: add missing include for types
+
+Fix `musl` build error
+
+Upstream-Status: Submitted [by email to netdev@vger.kernel.org]
+Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
+---
+ include/color.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/include/color.h b/include/color.h
+index b543c267..3794a2aa 100644
+--- a/include/color.h
++++ b/include/color.h
+@@ -3,6 +3,7 @@
+ #define __COLOR_H__ 1
+ 
+ #include <stdbool.h>
++#include <linux/types.h>
+ 
+ enum color_attr {
+ 	COLOR_IFNAME,
+-- 
+2.47.3
+
diff --git a/meta/recipes-connectivity/iproute2/iproute2/fix-musl.patch b/meta/recipes-connectivity/iproute2/iproute2/fix-musl.patch
deleted file mode 100644
index 20907dad50..0000000000
--- a/meta/recipes-connectivity/iproute2/iproute2/fix-musl.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 6c1113633fde51b0e60f02243cfad1b3d09762cc Mon Sep 17 00:00:00 2001
-From: Akhilesh Nema <nemaakhilesh@gmail.com>
-Date: Tue, 2 Dec 2025 18:11:24 -0800
-Subject: fix 'UINT_MAX' undeclared with build with musl libc
-
-- utils_math.c:136:20: error: 'UINT_MAX' undeclared (first use in this function)
-- tc_core.c:51:22: error: 'UINT_MAX' undeclared (first use in this function)
-
-Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
-Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/commit/?id=6c1113633fde51b0e60f02243cfad1b3d09762cc]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- lib/utils_math.c | 1 +
- tc/tc_core.c     | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/lib/utils_math.c b/lib/utils_math.c
-index a7e747440..fd2ddc7c7 100644
---- a/lib/utils_math.c
-+++ b/lib/utils_math.c
-@@ -4,6 +4,7 @@
- #include <stdlib.h>
- #include <string.h>
- #include <math.h>
-+#include <limits.h>
- #include <asm/types.h>
- 
- #include "utils.h"
-diff --git a/tc/tc_core.c b/tc/tc_core.c
-index a422e02c8..b13b7d78a 100644
---- a/tc/tc_core.c
-+++ b/tc/tc_core.c
-@@ -11,6 +11,7 @@
- #include <unistd.h>
- #include <fcntl.h>
- #include <math.h>
-+#include <limits.h>
- #include <sys/socket.h>
- #include <netinet/in.h>
- #include <arpa/inet.h>
--- 
-cgit 1.2.3-korg
-
diff --git a/meta/recipes-connectivity/iproute2/iproute2_6.18.0.bb b/meta/recipes-connectivity/iproute2/iproute2_6.19.0.bb
similarity index 95%
rename from meta/recipes-connectivity/iproute2/iproute2_6.18.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_6.19.0.bb
index c68b2adc0f..28ed1093ab 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_6.18.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_6.19.0.bb
@@ -13,10 +13,10 @@ DEPENDS = "flex-native bison-native libcap"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://0001-include-libnetlink.h-add-missing-include-for-htobe64.patch \
-           file://fix-musl.patch \
+           file://0002-include-color.h-add-missing-include-for-types.patch \
            "
 
-SRC_URI[sha256sum] = "6ba520e1975e4c50dc931eeae91ea37c198b8a173744885f8895b84325f9d456"
+SRC_URI[sha256sum] = "9332213d35480b647086a70c302de8568de83455a98774d35de216c4ce191006"
 
 inherit update-alternatives bash-completion pkgconfig
 
-- 
2.47.3


