Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B10F5731AF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 17:45:58 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 09 Feb 2016 09:45:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,421,1449561600"; d="scan'208";a="649651318"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Feb 2016 09:45:59 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id DE3EE6A4004
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 10:33:50 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Feb 2016 19:48:51 +0200
Message-Id: <1455040131-22507-3-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1455040131-22507-1-git-send-email-maxin.john@intel.com>
References: <1455040131-22507-1-git-send-email-maxin.john@intel.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] iproute2: update to version 4.4.0
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
X-List-Received-Date: Tue, 09 Feb 2016 17:45:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

4.3.0 -> 4.4.0

Added iproute2-fix-building-with-musl.patch to fix build with
musl.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../iproute2/iproute2-fix-building-with-musl.patch | 24 ++++++++++++++++++++++
 .../{iproute2_4.3.0.bb => iproute2_4.4.0.bb}       |  5 +++--
 2 files changed, 27 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-connectivity/iproute2/iproute2/iproute2-fix-building-with-musl.patch
 rename meta/recipes-connectivity/iproute2/{iproute2_4.3.0.bb => iproute2_4.4.0.bb} (63%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2/iproute2-fix-building-with-musl.patch b/meta/recipes-connectivity/iproute2/iproute2/iproute2-fix-building-with-musl.patch
new file mode 100644
index 0000000..c83a243
--- /dev/null
+++ b/meta/recipes-connectivity/iproute2/iproute2/iproute2-fix-building-with-musl.patch
@@ -0,0 +1,24 @@
+iproute2: fix building with musl
+
+We need limits.h for PATH_MAX, fixes:
+
+rt_names.c:364:13: error: ‘PATH_MAX’ undeclared (first use in this
+function)
+
+Upstream-Status: Backport
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Signed-off-by: Maxin B. John <maxin.john@intel.com>
+---
+diff --git a/lib/rt_names.c b/lib/rt_names.c
+index f6d17c0..b665d3e 100644
+--- a/lib/rt_names.c
++++ b/lib/rt_names.c
+@@ -18,6 +18,7 @@
+ #include <sys/time.h>
+ #include <sys/socket.h>
+ #include <dirent.h>
++#include <limits.h>
+ 
+ #include <asm/types.h>
+ #include <linux/rtnetlink.h>
diff --git a/meta/recipes-connectivity/iproute2/iproute2_4.3.0.bb b/meta/recipes-connectivity/iproute2/iproute2_4.4.0.bb
similarity index 63%
rename from meta/recipes-connectivity/iproute2/iproute2_4.3.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_4.4.0.bb
index 60f0a8d..7979e8b 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_4.3.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_4.4.0.bb
@@ -4,9 +4,10 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://configure-cross.patch \
            file://0001-iproute2-de-bash-scripts.patch \
            file://iproute2-4.3.0-musl.patch \
+           file://iproute2-fix-building-with-musl.patch \
           "
-SRC_URI[md5sum] = "1a2bbb80cfc7ab3f3e987e18b3207c2f"
-SRC_URI[sha256sum] = "f03b1188dd6c039512424de82ff7a8f3b446680bd4e908ff42a7b9b137422995"
+SRC_URI[md5sum] = "d762653ec3e1ab0d4a9689e169ca184f"
+SRC_URI[sha256sum] = "bc91c367288a19f78ef800cd6840363be1f22da8436fbae88e1a7250490d6514"
 
 # CFLAGS are computed in Makefile and reference CCOPTS
 #
-- 
2.4.0


