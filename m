Return-Path: <kergoth@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 13C5176DC0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 20:22:16 +0000 (UTC)
Received: by wicne3 with SMTP id ne3so28135678wic.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 13:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=J1NekR/19S1rQIdi5zAtF+6JVI6X65ky+fVwvjVEc5c=;
	b=yDjvvUSkmsgTP1dO7/BkWgn0b4hXxwRlOlhL9UjdQFb8IobzGQki4UboU4KHna3ajP
	BM2vs4cwEQJkEz/G8g26zTh6e4VcQY6SlKgghEbOIlf5OBw2Bdvuolu09tFzIXaqgbmN
	lV+IEUSmX1YvrNvDi1FUpZu+t9xo9tW+ycqO3bW9+hTMkXuwk2uAOI8pC4rsdUr/9EUp
	rm4th6DaskuqltOGRbI3EDhbI5/coLYbaJtziDIT+at1B5QBVsjBfF19as4uQ1K2vNqp
	rxstlUaTRj58ghK7/asrjl53YgWrmFP896r2G/UEp+1pBeRRFzHA2lp+f6XQRavScxD0
	FBfQ==
X-Received: by 10.180.74.167 with SMTP id u7mr6158834wiv.44.1440793336478;
	Fri, 28 Aug 2015 13:22:16 -0700 (PDT)
Received: from quark.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	fa8sm5331474wib.14.2015.08.28.13.22.14
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Aug 2015 13:22:15 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Aug 2015 13:23:02 -0700
Message-Id: <8db55546dd57ab4017c301c3d58c5f7e8206935d.1440793291.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <9a2ca49a3f1695810eaf999dde1cc44a336cbf8f.1440793291.git.chris_larson@mentor.com>
References: <9a2ca49a3f1695810eaf999dde1cc44a336cbf8f.1440793291.git.chris_larson@mentor.com>
In-Reply-To: <cover.1440793291.git.chris_larson@mentor.com>
References: <cover.1440793291.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCHv2 4/5] iw: support and enable separate build dir
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
X-List-Received-Date: Fri, 28 Aug 2015 20:22:18 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 .../iw/iw/separate-objdir.patch                    | 57 ++++++++++++++++++++++
 meta/recipes-connectivity/iw/iw_4.1.bb             |  4 ++
 2 files changed, 61 insertions(+)
 create mode 100644 meta/recipes-connectivity/iw/iw/separate-objdir.patch

diff --git a/meta/recipes-connectivity/iw/iw/separate-objdir.patch b/meta/recipes-connectivity/iw/iw/separate-objdir.patch
new file mode 100644
index 0000000..883f8b2
--- /dev/null
+++ b/meta/recipes-connectivity/iw/iw/separate-objdir.patch
@@ -0,0 +1,57 @@
+From 9e27fc2e1b3dc8c36ef6a502edffc3a3d84d9dd9 Mon Sep 17 00:00:00 2001
+From: Christopher Larson <chris_larson@mentor.com>
+Date: Wed, 26 Aug 2015 17:23:48 -0700
+Subject: [PATCH] Support separation of SRCDIR and OBJDIR
+
+Typical use of VPATH to locate the sources.
+
+Upstream-Status: Pending
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


