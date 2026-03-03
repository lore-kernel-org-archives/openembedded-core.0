Return-Path: <andrej.kozemcak@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1C71EC144A
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 13:37:18 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18345.1772545032259990277
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Mar 2026 05:37:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=andrej.kozemcak@siemens.com header.s=fm2 header.b=RrE/EpXe;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-1334352-2026030313370912f5047d2d0002075b-txtdin@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 2026030313370912f5047d2d0002075b
        for <openembedded-core@lists.openembedded.org>;
        Tue, 03 Mar 2026 14:37:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=andrej.kozemcak@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=5xHP1E9Fl2cZ0e7ppdVsXv1SHWsM26DkZymT7aTE78Q=;
 b=RrE/EpXeFJAKVzIP1hNTEh6WNb6XclLJJUocjHNXGPXu5GFJEhNux7O9tEuLYswPAlBucG
 13lkt9QAcjhLMx99LigtCFXOFPcM1cTJbP2DLGfdGFSI2tePOdJ1BOgxhEp/avsBYDQFyNd/
 xSDa/YsVisV6A5QSmhzmlcknlZI6rpZx9ugbcnIj6cGKIZhiziWqSIlUSeOf9sD0uiewJVyE
 e0iuEtAhaMCZirFVM4NjDnV3om4J3WjAlyyf6OQX3GjHfF+Ls46RGt2u/QVIT5GTcxZkCMgK
 AVikILbBe0rnnsmpGOcxE/StfKzdxG8yJCmk5hURUdKOXNrsqIGeKo2g==;
From: Andrej Kozemcak <andrej.kozemcak@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Andrej Kozemcak <andrej.kozemcak@siemens.com>
Subject: [PATCH 3/6] iproute2: upgrade 6.18.0 -> 6.19.0
Date: Tue,  3 Mar 2026 14:36:42 +0100
Message-ID: <20260303133645.1449-3-andrej.kozemcak@siemens.com>
In-Reply-To: <20260303133645.1449-1-andrej.kozemcak@siemens.com>
References: <20260303133645.1449-1-andrej.kozemcak@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1334352:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 13:37:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232310

Drop fix-musl.patch as it was merged upstream.

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
 .../iproute2/iproute2/fix-musl.patch          | 43 -------------------
 ...{iproute2_6.18.0.bb => iproute2_6.19.0.bb} |  3 +-
 2 files changed, 1 insertion(+), 45 deletions(-)
 delete mode 100644 meta/recipes-connectivity/iproute2/iproute2/fix-musl.patch
 rename meta/recipes-connectivity/iproute2/{iproute2_6.18.0.bb => iproute2_6.19.0.bb} (96%)

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
similarity index 96%
rename from meta/recipes-connectivity/iproute2/iproute2_6.18.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_6.19.0.bb
index c68b2adc0f..a9462aa083 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_6.18.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_6.19.0.bb
@@ -13,10 +13,9 @@ DEPENDS = "flex-native bison-native libcap"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://0001-include-libnetlink.h-add-missing-include-for-htobe64.patch \
-           file://fix-musl.patch \
            "
 
-SRC_URI[sha256sum] = "6ba520e1975e4c50dc931eeae91ea37c198b8a173744885f8895b84325f9d456"
+SRC_URI[sha256sum] = "9332213d35480b647086a70c302de8568de83455a98774d35de216c4ce191006"
 
 inherit update-alternatives bash-completion pkgconfig
 
-- 
2.47.3


