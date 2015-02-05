Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 4A75672DF4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 18:40:15 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 05 Feb 2015 10:33:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,525,1418112000"; d="scan'208";a="523192623"
Received: from swold-mobl.jf.intel.com ([10.24.2.202])
	by orsmga003.jf.intel.com with ESMTP; 05 Feb 2015 10:32:03 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Feb 2015 10:39:43 -0800
Message-Id: <1423161588-6867-6-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1423161588-6867-1-git-send-email-sgw@linux.intel.com>
References: <1423161588-6867-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 05/10] systemd: backport patch to fix reading journal backwards
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
X-List-Received-Date: Thu, 05 Feb 2015 18:40:15 -0000

From: Jonathan Liu <net147@gmail.com>

Signed-off-by: Jonathan Liu <net147@gmail.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 ...-Fix-navigating-backwards-missing-entries.patch | 34 ++++++++++++++++++++++
 meta/recipes-core/systemd/systemd_211.bb           |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-journal-Fix-navigating-backwards-missing-entries.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-journal-Fix-navigating-backwards-missing-entries.patch b/meta/recipes-core/systemd/systemd/0001-journal-Fix-navigating-backwards-missing-entries.patch
new file mode 100644
index 0000000..621a0da
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-journal-Fix-navigating-backwards-missing-entries.patch
@@ -0,0 +1,34 @@
+From 2173cbf847fc53ca24950e77958c902edecfc207 Mon Sep 17 00:00:00 2001
+From: Olivier Brunel <jjk@jjacky.com>
+Date: Fri, 5 Dec 2014 16:06:45 +0100
+Subject: [PATCH] journal: Fix navigating backwards missing entries
+
+With DIRECTION_UP (i.e. navigating backwards) in generic_array_bisect() when the
+needle was found as the last item in the array, it wasn't actually processed as
+match, resulting in entries being missed.
+
+https://bugs.freedesktop.org/show_bug.cgi?id=86855
+
+Upstream-Status: Backport
+
+Signed-off-by: Jonathan Liu <net147@gmail.com>
+---
+ src/journal/journal-file.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/journal/journal-file.c b/src/journal/journal-file.c
+index 7858435..c5d2d19 100644
+--- a/src/journal/journal-file.c
++++ b/src/journal/journal-file.c
+@@ -1657,7 +1657,7 @@ static int generic_array_bisect(
+                         }
+                 }
+ 
+-                if (k > n) {
++                if (k >= n) {
+                         if (direction == DIRECTION_UP) {
+                                 i = n;
+                                 subtract_one = true;
+-- 
+2.1.3
+
diff --git a/meta/recipes-core/systemd/systemd_211.bb b/meta/recipes-core/systemd/systemd_211.bb
index 44b1965..567c323 100644
--- a/meta/recipes-core/systemd/systemd_211.bb
+++ b/meta/recipes-core/systemd/systemd_211.bb
@@ -32,6 +32,7 @@ SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;branch=master;protocol=
            file://uclibc-sysinfo_h.patch \
            file://uclibc-get-physmem.patch \
            file://sd-bus-don-t-use-assert_return-to-check-for-disconne.patch \
+           file://0001-journal-Fix-navigating-backwards-missing-entries.patch \
            \
            file://touchscreen.rules \
            file://00-create-volatile.conf \
-- 
2.1.0


