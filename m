Return-Path: <net147@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id AB5BE706D9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jan 2015 03:01:04 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id kq14so1827142pab.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Jan 2015 19:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=hNeTb5HHuoVYtNiLXQc6lsM4lGnIZLgaDQgh4DRCinM=;
	b=rCHvYXkaWpRJjBa8xlGX/YpG2t1yX1/6mr3+OORSog8g+5kfO7DPhhdIxKiNca2P3o
	xRzTRBZaEVmcCve6mOrWpTxs/Ipn/IpKtisFlv5cTedGEspQJawwR4osUXUx49GseMEq
	0zsaSb+jWqOAZQpiLCysPvKZFfzu2+WpLPE1EL7I+PlHZyUVbJc7zbaFZq/NJBXoHPBI
	isJetbkK2h70l27mwTZ5tVykr76KIQ1kG9dsr8tPSxTT3vi4QdPkGP6DwaAwb1qv4YAy
	Z5Xy7NeilDeMaEI6EtEjTh+BJ15zeKY1R/F6OAZacrkcu2U2/tJDn3ru4yBzodXt3Qc1
	0J1A==
X-Received: by 10.70.37.166 with SMTP id z6mr1143611pdj.102.1420599664663;
	Tue, 06 Jan 2015 19:01:04 -0800 (PST)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id q4sm202859pdh.79.2015.01.06.19.01.03
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Jan 2015 19:01:03 -0800 (PST)
From: Jonathan Liu <net147@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Date: Wed,  7 Jan 2015 14:15:39 +1100
Message-Id: <1420600539-24081-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.2.1
Cc: openembedded-core@lists.openembedded.org
Subject: [daisy][PATCH] systemd: backport patch to fix reading journal backwards
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
X-List-Received-Date: Wed, 07 Jan 2015 03:01:13 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
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
2.2.1


