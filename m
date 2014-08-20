Return-Path: <paul.betafive@gmail.com>
Received: from mail-lb0-f179.google.com (mail-lb0-f179.google.com
	[209.85.217.179])
	by mail.openembedded.org (Postfix) with ESMTP id 9659E65D53
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Aug 2014 10:14:35 +0000 (UTC)
Received: by mail-lb0-f179.google.com with SMTP id v6so6522753lbi.38
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Aug 2014 03:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=rFewJq9daO8cuGKBbfChRrf8fBD6napgj0x+QX8lydE=;
	b=ir0Nmo0oOy/FUhItl5pFVyKUON3XpzN5dnN30x0Dgh3Y5+sSGYjUFHalsjDwQF9zZ0
	XdZgtk4U8wFF0Gjfct2051cmvaSHZgt8YOvNnaKyVxKc4fWn1y++kV2bbKtbNxaA9STF
	FF8uSqzLIHoY1xnmGpPPwbE0aUjHqcUYYPZPGsFyrkAwkRNIFtxd41dNWqiRsET9rsTF
	1dQmSjIP0sk+QXU4XqkaUC0WDPY4EX62H8fG6OVimWv2FvOEYhCOOhVBqG+kZDkzHBwP
	kgafi1/JQx4YUiyCvjzJ7kPCJZP1lSmflcbU+Ln5CUCWmV+Xfoz//1IQ14mFaCKrEYFE
	VCNg==
X-Received: by 10.112.57.195 with SMTP id k3mr38175408lbq.48.1408529675815;
	Wed, 20 Aug 2014 03:14:35 -0700 (PDT)
Received: from localhost.localdomain (ygg.betafive.co.uk. [5.9.90.21])
	by mx.google.com with ESMTPSA id
	zf7sm36445724lbb.23.2014.08.20.03.14.34 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Aug 2014 03:14:35 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Aug 2014 10:14:03 +0000
Message-Id: <1408529643-27065-1-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 2.0.4
Subject: [PATCH] procps: Fix musl build failure
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
X-List-Received-Date: Wed, 20 Aug 2014 10:14:39 -0000

This is a simple fix, <limits.h> just needs to be included before PATH_MAX is
used.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 .../procps-3.2.8/0001-Fix-musl-build-failure.patch | 29 ++++++++++++++++++++++
 meta/recipes-extended/procps/procps_3.2.8.bb       |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-extended/procps/procps-3.2.8/0001-Fix-musl-build-failure.patch

diff --git a/meta/recipes-extended/procps/procps-3.2.8/0001-Fix-musl-build-failure.patch b/meta/recipes-extended/procps/procps-3.2.8/0001-Fix-musl-build-failure.patch
new file mode 100644
index 0000000..71dc3f0
--- /dev/null
+++ b/meta/recipes-extended/procps/procps-3.2.8/0001-Fix-musl-build-failure.patch
@@ -0,0 +1,29 @@
+From 6f2fd55ef7621fd7ab7897aee2c2651b6faf9e6a Mon Sep 17 00:00:00 2001
+From: Paul Barker <paul@paulbarker.me.uk>
+Date: Wed, 20 Aug 2014 11:56:11 +0200
+Subject: [PATCH] Fix musl build failure
+
+Include <limits.h> for PATH_MAX.
+
+Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
+
+Upstream-status: Pending
+---
+ proc/readproc.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/proc/readproc.c b/proc/readproc.c
+index 4fad11d..c5b1869 100644
+--- a/proc/readproc.c
++++ b/proc/readproc.c
+@@ -26,6 +26,7 @@
+ #include <sys/dir.h>
+ #include <sys/types.h>
+ #include <sys/stat.h>
++#include <limits.h>
+ 
+ // sometimes it's easier to do this manually, w/o gcc helping
+ #ifdef PROF
+-- 
+1.9.1
+
diff --git a/meta/recipes-extended/procps/procps_3.2.8.bb b/meta/recipes-extended/procps/procps_3.2.8.bb
index b314bfe..6211a7c 100644
--- a/meta/recipes-extended/procps/procps_3.2.8.bb
+++ b/meta/recipes-extended/procps/procps_3.2.8.bb
@@ -12,6 +12,7 @@ SRC_URI += "file://procmodule.patch \
             file://procps-3.2.7-top-remcpu.patch \
             file://procps-3.2.8-ps-cgroup.patch \
             file://detect_bitness.patch \
+            file://0001-Fix-musl-build-failure.patch \
            "
 
 SRC_URI[md5sum] = "9532714b6846013ca9898984ba4cd7e0"
-- 
2.0.4


