Return-Path: <kergoth@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 558B776DC3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 18:47:45 +0000 (UTC)
Received: by widdq5 with SMTP id dq5so884297wid.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 11:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=QVy25xytkppBK33ib3Qum8Ir6a4dm5sNPaSlpntToa4=;
	b=SlX9sowMnGTt2Th0WtNe/NdTkKwxH3UdYxJeuYyrYs74QkWFdFSzi8x7djNF9gM7SL
	I/4QOCbUS00zEknLuan4C9X3pO2e/QArEO3TM64tVVp5tCO7w7tPJkDvQvoNl6rCdkkP
	hfRQmMNXs9crTjUnw0MxguKhmvtdBJ9SgAY5LwAnN1shrvcnd8tYxjd6qEB2so2L6IBE
	snXRdo1u7aI4LbZcVDWhsHpa2x8I3Eax156VLT/FHkGHR621YYTjH82LrXbdNpINPrz+
	3xkMvq9QUXHDg4VtggWUPWrTvYfU0HHNdjVtwD4dy5KqBGUw5sWdPm7BO9urlMl2mMyf
	Zabg==
X-Received: by 10.180.99.193 with SMTP id es1mr81446wib.29.1440701265139;
	Thu, 27 Aug 2015 11:47:45 -0700 (PDT)
Received: from quark.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	ul1sm4326362wjc.30.2015.08.27.11.47.43
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Aug 2015 11:47:43 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Aug 2015 11:48:27 -0700
Message-Id: <88b9e990cf8f26a6e5dc1fe1d8fa60ab9f5b3443.1440700983.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <9a2ca49a3f1695810eaf999dde1cc44a336cbf8f.1440700983.git.chris_larson@mentor.com>
References: <9a2ca49a3f1695810eaf999dde1cc44a336cbf8f.1440700983.git.chris_larson@mentor.com>
In-Reply-To: <cover.1440700983.git.chris_larson@mentor.com>
References: <cover.1440700983.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 4/5] iw: support and enable separate build dir
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
X-List-Received-Date: Thu, 27 Aug 2015 18:47:45 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 .../iw/iw/separate-objdir.patch                    | 55 ++++++++++++++++++++++
 meta/recipes-connectivity/iw/iw_4.1.bb             |  4 ++
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-connectivity/iw/iw/separate-objdir.patch

diff --git a/meta/recipes-connectivity/iw/iw/separate-objdir.patch b/meta/recipes-connectivity/iw/iw/separate-objdir.patch
new file mode 100644
index 0000000..e29e461
--- /dev/null
+++ b/meta/recipes-connectivity/iw/iw/separate-objdir.patch
@@ -0,0 +1,55 @@
+From 9e27fc2e1b3dc8c36ef6a502edffc3a3d84d9dd9 Mon Sep 17 00:00:00 2001
+From: Christopher Larson <chris_larson@mentor.com>
+Date: Wed, 26 Aug 2015 17:23:48 -0700
+Subject: [PATCH] Support separation of SRCDIR and OBJDIR
+
+Typical use of VPATH to locate the sources.
+
+Signed-off-by: Christopher Larson <chris_larson@mentor.com>
+
+---
+ Makefile   | 7 +++++--
+ version.sh | 2 +-
+ 2 files changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 548591a..da8d33a 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1,5 +1,8 @@
+ MAKEFLAGS += --no-print-directory
+ 
++SRCDIR ?= $(dir $(lastword $(MAKEFILE_LIST)))
++OBJDIR ?= $(PWD)
++VPATH = $(SRCDIR)
+ PREFIX ?= /usr
+ SBINDIR ?= $(PREFIX)/sbin
+ MANDIR ?= $(PREFIX)/share/man
+@@ -95,11 +98,11 @@ VERSION_OBJS := $(filter-out version.o, $(OBJS))
+ version.c: version.sh $(patsubst %.o,%.c,$(VERSION_OBJS)) nl80211.h iw.h Makefile \
+ 		$(wildcard .git/index .git/refs/tags)
+ 	@$(NQ) ' GEN ' $@
+-	$(Q)./version.sh $@
++	$(Q)cd $(SRCDIR) && ./version.sh $(OBJDIR)/$@
+ 
+ %.o: %.c iw.h nl80211.h
+ 	@$(NQ) ' CC  ' $@
+-	$(Q)$(CC) $(CFLAGS) -c -o $@ $<
++	$(Q)$(CC) -I$(SRCDIR) $(CFLAGS) -c -o $@ $<
+ 
+ ifeq ($(IW_ANDROID_BUILD),)
+ iw:	$(OBJS)
+diff --git a/version.sh b/version.sh
+index 5354383..fa954cf 100755
+--- a/version.sh
++++ b/version.sh
+@@ -5,5 +5,5 @@ OUT="$1"
+ 
+ v="$VERSION"
+ 
+-echo '#include "iw.h"' > "$OUT"
++echo '#include <iw.h>' > "$OUT"
+ echo "const char iw_version[] = \"$v\";" >> "$OUT"
+-- 
+2.2.1
+
diff --git a/meta/recipes-connectivity/iw/iw_4.1.bb b/meta/recipes-connectivity/iw/iw_4.1.bb
index 8e27862..fafb0e3 100644
--- a/meta/recipes-connectivity/iw/iw_4.1.bb
+++ b/meta/recipes-connectivity/iw/iw_4.1.bb
@@ -11,6 +11,7 @@ DEPENDS = "libnl"
 
 SRC_URI = "http://www.kernel.org/pub/software/network/iw/${BP}.tar.gz \
            file://0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch \
+           file://separate-objdir.patch \
 "
 
 SRC_URI[md5sum] = "68c282285c71c956069957e9ca10a6a7"
@@ -19,10 +20,13 @@ SRC_URI[sha256sum] = "14bfc627b37f7f607e4ffa63a70ded15fa2ea85177f703cb17d7fe36f9
 inherit pkgconfig
 
 EXTRA_OEMAKE = "\
+    -f '${S}/Makefile' \
+    \
     'PREFIX=${prefix}' \
     'SBINDIR=${sbindir}' \
     'MANDIR=${mandir}' \
 "
+B = "${WORKDIR}/build"
 
 do_install() {
     oe_runmake 'DESTDIR=${D}' install
-- 
2.2.1


