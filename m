Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 7B24873D91
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 11:01:52 +0000 (UTC)
Received: by wgso17 with SMTP id o17so147204232wgs.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 04:01:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=hTzurkyMMkcupqm9fvVcQ9l0LLfBe9LGt4r0n4j4yn4=;
	b=QDwj09YYUjKsSNv7YFf1yK2N8f29wXY7hrQcN5Ep4Uwre879aGuJpfFg5TJyil8b0T
	3nKNCzWDdabEZKszLw6MXofOUgbivNsIOvNFP6BDtvOymNXX7PtU6eyYpKkmrpy0Mbck
	/hqbWzLkcdY9kKPS8R+SZUZ/1gCn2NpOGQWd/+eybJ5xL2UWSwoSxXSXFEJkPagx2BbH
	QdO+zze/ynYPI43MViosfC6l4bGnJR/N1G381LYzvbRZGCBrpfO2AAtR61eVQN5qkdQ+
	gpQb/uWVlKDbBrX1cVQaGGiK820GKgR470GzTrrk4x+qdfoekXqQoZ3NFKts+I1O409D
	pFuA==
X-Gm-Message-State: ALoCoQmkFav0B+pZfAjKU1dLP0KXcn4kEc+CloV0mQ65gFh9eBuBJZqrO5w7bTDFMBJkve6MglS+
X-Received: by 10.194.22.40 with SMTP id a8mr31819034wjf.134.1430218913276;
	Tue, 28 Apr 2015 04:01:53 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id qt2sm33614148wjc.7.2015.04.28.04.01.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 28 Apr 2015 04:01:52 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Apr 2015 11:58:11 +0100
Message-Id: <1430218691-6679-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] xserver-xorg: use GCC 5 patch from upstream
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
X-List-Received-Date: Tue, 28 Apr 2015 11:01:52 -0000

Upstream has already fixed the GCC 5 problem, so use the patch from upstream.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...sdksyms.sh-Make-sdksyms.sh-work-with-gcc5.patch | 76 +++++++++++-----------
 1 file changed, 37 insertions(+), 39 deletions(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-sdksyms.sh-Make-sdksyms.sh-work-with-gcc5.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-sdksyms.sh-Make-sdksyms.sh-work-with-gcc5.patch
index 215c044..9c9f595 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-sdksyms.sh-Make-sdksyms.sh-work-with-gcc5.patch
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-sdksyms.sh-Make-sdksyms.sh-work-with-gcc5.patch
@@ -1,50 +1,48 @@
-Upstream-Status: Pending
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
 
-From 612eb45a2e7a0b35cc3790870e6d0cc42eb50c74 Mon Sep 17 00:00:00 2001
-From: Hans de Goede <hdegoede@redhat.com>
-Date: Wed, 11 Feb 2015 16:26:40 +0100
-Subject: [PATCH] sdksyms.sh: Make sdksyms.sh work with gcc5.
+From 21b896939c5bb242f3aacc37baf12379e43254b6 Mon Sep 17 00:00:00 2001
+From: Egbert Eich <eich@freedesktop.org>
+Date: Tue, 3 Mar 2015 16:27:05 +0100
+Subject: symbols: Fix sdksyms.sh to cope with gcc5
 
-gcc5's cpp inserts patterns like this:
+Gcc5 adds additional lines stating line numbers before and
+after __attribute__() which need to be skipped.
 
-extern
-      __attribute__((visibility("default")))
-                int WaitForSomething(int *
-    );
+Signed-off-by: Egbert Eich <eich@freedesktop.org>
+Tested-by: Daniel Stone <daniels@collabora.com>
+Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
 
-This patch make sdksyms.sh work with this. Note my awk skills are weak, so
-there likely is a better way to deal with this.
-
-Signed-off-by: Hans de Goede <hdegoede@redhat.com>
----
- hw/xfree86/sdksyms.sh | 17 +++++++++++++++++
- 1 file changed, 17 insertions(+)
-
-Index: xorg-server-1.16.3/hw/xfree86/sdksyms.sh
-===================================================================
---- xorg-server-1.16.3.orig/hw/xfree86/sdksyms.sh
-+++ xorg-server-1.16.3/hw/xfree86/sdksyms.sh
-@@ -353,6 +353,23 @@ BEGIN {
+diff --git a/hw/xfree86/sdksyms.sh b/hw/xfree86/sdksyms.sh
+index 2305073..05ac410 100755
+--- a/hw/xfree86/sdksyms.sh
++++ b/hw/xfree86/sdksyms.sh
+@@ -350,13 +350,25 @@ BEGIN {
      if (sdk) {
  	n = 3;
  
-+	# detect the following gcc5 cpp pattern and skip it:
-+	# extern
-+	# # 320 "../../include/os.h" 3 4
-+	#     __attribute__((visibility("default")))
-+	# # 320 "../../include/os.h"
-+	# Note in this case the "extern " or "extern void " always has
-+	# a trailing space
-+	if ($0 ~ "^extern.* $") {
-+	    getline;
-+	    getline;
-+	    getline;
-+	    getline;
-+	    n = 1;
-+	    while ($n == " ")
-+		n++;
-+	}
++        # skip line numbers GCC 5 adds before __attribute__
++        while ($n == "" || $0 ~ /^# [0-9]+ "/) {
++           getline;
++           n = 1;
++        }
 +
  	# skip attribute, if any
  	while ($n ~ /^(__attribute__|__global)/ ||
  	    # skip modifiers, if any
+ 	    $n ~ /^\*?(unsigned|const|volatile|struct|_X_EXPORT)$/ ||
+ 	    # skip pointer
+-	    $n ~ /^[a-zA-Z0-9_]*\*$/)
++	    $n ~ /^[a-zA-Z0-9_]*\*$/) {
+ 	    n++;
++            # skip line numbers GCC 5 adds after __attribute__
++            while ($n == "" || $0 ~ /^# [0-9]+ "/) {
++               getline;
++               n = 1;
++            }
++        }
+ 
+ 	# type specifier may not be set, as in
+ 	#   extern _X_EXPORT unsigned name(...)
+-- 
+cgit v0.10.2
-- 
2.1.4


