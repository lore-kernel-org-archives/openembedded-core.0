Return-Path: <net147@gmail.com>
Received: from mail-pd0-f173.google.com (mail-pd0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id C0577724D3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Dec 2014 13:02:54 +0000 (UTC)
Received: by mail-pd0-f173.google.com with SMTP id ft15so7153964pdb.32
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Dec 2014 05:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=aFOZiNsqZTuTHtuYxeEhoKPNZEXda2hrhIfN9wqB5I0=;
	b=sUnDR1T1qc1RhjQENhqby09ikQsaK1sSO+7RXQT1ySROStWHPsko9p9eEvjtW3vqYi
	9rFxbjXRfzqfr2FIa3fmeIyaS93Zk/8+bb/LjItiFE/mxwbjQYgV/F2b9+qHnEk1Ftis
	dLWpziHCsZP0L/lHlK5wcgaWriSwKWL7+c/HlNOGjjd1wuwwGYwJwuEIP1wvb2skb+LY
	O7kA1dfQwNVrsiLHDl7Isf+AWxsckE0VDnwuhJV9u5HzMQuqZeLUBDB1J0JVkpsZEjk6
	tr54BrJJYlpIuxP5DCz4ranlW8gpfHNpsPTgI/S8V8B5v+g25D1Iy3Rn/biCbVKETA/S
	sVCg==
X-Received: by 10.68.88.3 with SMTP id bc3mr26799211pbb.150.1418389374774;
	Fri, 12 Dec 2014 05:02:54 -0800 (PST)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id ay4sm1566381pbb.29.2014.12.12.05.02.53
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 12 Dec 2014 05:02:54 -0800 (PST)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 13 Dec 2014 00:16:29 +1100
Message-Id: <1418390189-25444-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.1.3
Subject: [PATCH] systemd: backport patch to fix reading journal backwards
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
X-List-Received-Date: Fri, 12 Dec 2014 13:02:58 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 ...-Fix-navigating-backwards-missing-entries.patch | 34 ++++++++++++++++++++++
 meta/recipes-core/systemd/systemd_216.bb           |  1 +
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
diff --git a/meta/recipes-core/systemd/systemd_216.bb b/meta/recipes-core/systemd/systemd_216.bb
index 536b7be..eceead9 100644
--- a/meta/recipes-core/systemd/systemd_216.bb
+++ b/meta/recipes-core/systemd/systemd_216.bb
@@ -34,6 +34,7 @@ SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;branch=master;protocol=
            file://0001-missing.h-add-fake-__NR_memfd_create-for-MIPS.patch \
            file://0001-Make-root-s-home-directory-configurable.patch \
            file://0001-systemd-user-avoid-using-system-auth.patch \
+           file://0001-journal-Fix-navigating-backwards-missing-entries.patch \
            file://touchscreen.rules \
            file://00-create-volatile.conf \
            file://init \
-- 
2.1.3


