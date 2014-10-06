Return-Path: <blloyd@familyhonor.net>
Received: from mho-02-ewr.mailhop.org (mho-02-ewr.mailhop.org [204.13.248.72])
	by mail.openembedded.org (Postfix) with ESMTP id 00061601A8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Oct 2014 04:47:50 +0000 (UTC)
Received: from dynamic30-98-142-75.dobsonteleco.com ([98.142.75.30]
	helo=lloydserv.home.familyhonor.net)
	by mho-02-ewr.mailhop.org with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.72) (envelope-from <blloyd@familyhonor.net>)
	id 1XazTU-000NYJ-Mh for openembedded-core@lists.openembedded.org;
	Mon, 06 Oct 2014 04:00:40 +0000
Received: from omclinuxballt.home.familyhonor.net ([192.168.0.65])
	(authenticated bits=0)
	by lloydserv.home.familyhonor.net (8.14.7/8.14.6) with ESMTP id
	s9640Jl8021670
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Sun, 5 Oct 2014 23:00:39 -0500
X-Mail-Handler: Dyn Standard SMTP by Dyn
X-Originating-IP: 98.142.75.30
X-Report-Abuse-To: abuse@dyndns.com (see
	http://www.dyndns.com/services/sendlabs/outbound_abuse.html for
	abuse reporting information)
X-MHO-User: U2FsdGVkX18Yb03tQTURyXtwRZQWKZGsL+SI1kdjbek=
From: Brian Lloyd <blloyd@familyhonor.net>
To: openembedded-core@lists.openembedded.org
Date: Sun,  5 Oct 2014 23:00:10 -0500
Message-Id: <db80bc9966ae3e2fd569431b82c70db9ece21be6.1412567765.git.blloyd@familyhonor.net>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1412567765.git.blloyd@familyhonor.net>
References: <cover.1412567765.git.blloyd@familyhonor.net>
In-Reply-To: <cover.1412567765.git.blloyd@familyhonor.net>
References: <cover.1412567765.git.blloyd@familyhonor.net>
Cc: blloyd@familyhonor.net
Subject: [PATCH 1/1] Backports inclusion of config.h to be compatible with newer kernels.
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
X-List-Received-Date: Mon, 06 Oct 2014 04:47:52 -0000

Signed-off-by: Brian Lloyd <blloyd@familyhonor.net>
---
 ...1-Add-config.h-include-to-src-lx_memory.c.patch | 40 ++++++++++++++++++++++
 .../xorg-driver/xf86-video-geode_2.11.16.bb        |  2 +-
 2 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-video-geode/0001-Add-config.h-include-to-src-lx_memory.c.patch

diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode/0001-Add-config.h-include-to-src-lx_memory.c.patch b/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode/0001-Add-config.h-include-to-src-lx_memory.c.patch
new file mode 100644
index 0000000..d07c4c4
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode/0001-Add-config.h-include-to-src-lx_memory.c.patch
@@ -0,0 +1,40 @@
+From 621d946e56efac2c779b83b1a5c6b645169c4ebd Mon Sep 17 00:00:00 2001
+From: "Brian A. Lloyd" <brian.lloyd@familyhonor.net>
+Date: Wed, 1 Oct 2014 12:35:18 +0300
+Subject: [PATCH 1/1] Add config.h include to src/lx_memory.c
+
+The src/lx_memory.c file uses the xf86.h header file.  This file must have
+HAVE_STRNDUP defined before calling it when the building platform has a strndup
+function.  When using config.h, this file doesn't have that define and so fails
+to compile.
+
+The attached patch adds the conditional config.h to this file so it may compile
+on the affected platforms.
+
+The patch is trivial and may be included and used under whatever licensing
+desired.
+
+Closes: Free Desktop Bug #84541
+
+Signed-off-by: Brian A. Lloyd <brian.lloyd@familyhonor.net>
+---
+ src/lx_memory.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/lx_memory.c b/src/lx_memory.c
+index f26d280..992446f 100644
+--- a/src/lx_memory.c
++++ b/src/lx_memory.c
+@@ -22,6 +22,9 @@
+  * contributors may be used to endorse or promote products derived from this
+  * software without specific prior written permission.
+  */
++#if HAVE_CONFIG_H
++#include "config.h"
++#endif
+ 
+ #include "xf86.h"
+ #include "geode.h"
+-- 
+1.9.3
+
diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.16.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.16.bb
index 4e8df46..c09063d 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.16.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.16.bb
@@ -1,6 +1,6 @@
 require recipes-graphics/xorg-driver/xorg-driver-video.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=e7f3e39474aeea5af381a8e103dafc36"
-
+SRC_URI += "file://0001-Add-config.h-include-to-src-lx_memory.c.patch"
 SUMMARY = "X.org server -- Geode GX2/LX display driver"
 PR = "${INC_PR}.0"
 
-- 
1.9.3


