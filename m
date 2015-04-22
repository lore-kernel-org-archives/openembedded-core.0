Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f180.google.com (mail-ie0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 9C7D673D6D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Apr 2015 07:50:05 +0000 (UTC)
Received: by iebrs15 with SMTP id rs15so31546026ieb.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Apr 2015 00:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=WNlupIFKH4JHjIbyE2bVI5qtpLD/cXCId1hilGHfOic=;
	b=Eek9RTBT5OOTfAwctUlUvpJfI9v5mlVCPoOGcOnsk/3vsd5j6CF/LWpKpvXYv09Qyk
	GHemqkyR1JJ+FMlimyib/UKBbuA8Mf7VoV4ejKqyotn227EhrRWQZlVlgOgVPhtyLFUE
	TsUX++2gHlWBVzAuSbSFO7zhHD5jhYoFcx80hIeMnaPuZlUTEO/UXQJQKZOjopcjGdtV
	LYjVdGcQe5jrvJ+yNd1pEaulrCHAgcwKe3MG8dbsTnqOpuu8Ap2Us+nive6WVcrEqI9s
	/1JntEVmmk/u0BgH9BQJY2XvZ7m3hK6ZPhj5fi/ElrIXZWIJbXOXtUmBHpwSzRM3CnUz
	ywYA==
X-Received: by 10.107.138.130 with SMTP id c2mr34095300ioj.74.1429689007049;
	Wed, 22 Apr 2015 00:50:07 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id l1sm2686434ioe.32.2015.04.22.00.50.06
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Apr 2015 00:50:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Apr 2015 07:49:53 +0000
Message-Id: <bb5483ed3f6dcb98996ab4282a152a81a2020126.1429688786.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <42999018b09a752082a381b1c595f0bd7411e305.1429688786.git.raj.khem@gmail.com>
References: <42999018b09a752082a381b1c595f0bd7411e305.1429688786.git.raj.khem@gmail.com>
In-Reply-To: <cover.1429688786.git.raj.khem@gmail.com>
References: <cover.1429688786.git.raj.khem@gmail.com>
Subject: [PATCH 04/10] xserver-xorg: Fix build with gcc-5
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
X-List-Received-Date: Wed, 22 Apr 2015 07:50:07 -0000

Backport a patch from fedora details are in patch header

Change-Id: I6b8dfaae3b751071bf8b0d88b15a4f95c19877f6
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...sdksyms.sh-Make-sdksyms.sh-work-with-gcc5.patch | 50 ++++++++++++++++++++++
 .../xorg-xserver/xserver-xorg_1.16.3.bb            |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-sdksyms.sh-Make-sdksyms.sh-work-with-gcc5.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-sdksyms.sh-Make-sdksyms.sh-work-with-gcc5.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-sdksyms.sh-Make-sdksyms.sh-work-with-gcc5.patch
new file mode 100644
index 0000000..215c044
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-sdksyms.sh-Make-sdksyms.sh-work-with-gcc5.patch
@@ -0,0 +1,50 @@
+Upstream-Status: Pending
+
+From 612eb45a2e7a0b35cc3790870e6d0cc42eb50c74 Mon Sep 17 00:00:00 2001
+From: Hans de Goede <hdegoede@redhat.com>
+Date: Wed, 11 Feb 2015 16:26:40 +0100
+Subject: [PATCH] sdksyms.sh: Make sdksyms.sh work with gcc5.
+
+gcc5's cpp inserts patterns like this:
+
+extern
+      __attribute__((visibility("default")))
+                int WaitForSomething(int *
+    );
+
+This patch make sdksyms.sh work with this. Note my awk skills are weak, so
+there likely is a better way to deal with this.
+
+Signed-off-by: Hans de Goede <hdegoede@redhat.com>
+---
+ hw/xfree86/sdksyms.sh | 17 +++++++++++++++++
+ 1 file changed, 17 insertions(+)
+
+Index: xorg-server-1.16.3/hw/xfree86/sdksyms.sh
+===================================================================
+--- xorg-server-1.16.3.orig/hw/xfree86/sdksyms.sh
++++ xorg-server-1.16.3/hw/xfree86/sdksyms.sh
+@@ -353,6 +353,23 @@ BEGIN {
+     if (sdk) {
+ 	n = 3;
+ 
++	# detect the following gcc5 cpp pattern and skip it:
++	# extern
++	# # 320 "../../include/os.h" 3 4
++	#     __attribute__((visibility("default")))
++	# # 320 "../../include/os.h"
++	# Note in this case the "extern " or "extern void " always has
++	# a trailing space
++	if ($0 ~ "^extern.* $") {
++	    getline;
++	    getline;
++	    getline;
++	    getline;
++	    n = 1;
++	    while ($n == " ")
++		n++;
++	}
++
+ 	# skip attribute, if any
+ 	while ($n ~ /^(__attribute__|__global)/ ||
+ 	    # skip modifiers, if any
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.16.3.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.16.3.bb
index 7eeadd1..780ece0 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.16.3.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.16.3.bb
@@ -9,6 +9,7 @@ SRC_URI += "file://fix_open_max_preprocessor_error.patch \
             file://0001-xkb-Don-t-swap-XkbSetGeometry-data-in-the-input-buff.patch \
             file://0001-xkb-Check-strings-length-against-request-size.patch \
             file://0001-use-__GLIBC__-guard-for-glibc-specific-code.patch \
+	    file://0001-sdksyms.sh-Make-sdksyms.sh-work-with-gcc5.patch \
            "
 
 SRC_URI[md5sum] = "afd93977235584a9caa7528a737c1b52"
-- 
2.1.4


