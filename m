Return-Path: <kergoth@gmail.com>
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 775C170F28
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Sep 2014 17:28:22 +0000 (UTC)
Received: by mail-pd0-f177.google.com with SMTP id r10so11426835pdi.22
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Sep 2014 10:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=xck2eujReWpM7sVvACfFvvF3Vah1CSmDRYuaBW2Vluo=;
	b=ccaQA1K1ETpfWhDXRooBaZFIINopxlNzX9LtDaKBojsLMUTz4nqYUI/jrzXbfytdkF
	JZO2nG8IVXEWE6OzJ7ROWvjU1l1iDUYXCRyRr+Ag5T6MiEpBtby/al6pTRRW17IdqNKT
	sP+hMOHc0vdmsHOi0cH9yfdSMYhQ47OOmadg3wkLHT9VZoMTbiXuGCpYeA7Cfy3kwnHP
	iJJ68U2hWtJ0cRHTekhAqjYtdOGhrqZEKD7jh5UB5y9PQp15/GHzjIRyLcXyJer9dUmK
	eaCwgKg1aRif2UGCQVt87GHiThm4QuNM//TrEv7E7VW7zSGgmxybSXQVI0ZzpZ6yojvy
	Lvxw==
X-Received: by 10.66.227.71 with SMTP id ry7mr60795430pac.32.1409765299241;
	Wed, 03 Sep 2014 10:28:19 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id zm5sm7367263pbb.76.2014.09.03.10.28.17
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 03 Sep 2014 10:28:18 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Sep 2014 10:27:46 -0700
Message-Id: <75bc00cf71e871a28e5d5b43053c3bfa85157674.1409764769.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <cover.1409764769.git.chris_larson@mentor.com>
References: <cover.1409764769.git.chris_larson@mentor.com>
In-Reply-To: <cover.1409764769.git.chris_larson@mentor.com>
References: <cover.1409764769.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 7/8] irda-utils: obey LDFLAGS
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
X-List-Received-Date: Wed, 03 Sep 2014 17:28:25 -0000

From: Christopher Larson <chris_larson@mentor.com>

While we're at it, also switch to explicit variable passing rather than
relying on make -e, and pass V=1 so the actual commands hit the logs.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 .../irda-utils/irda-utils-0.9.18/ldflags.patch     | 79 ++++++++++++++++++++++
 .../irda-utils/irda-utils_0.9.18.bb                | 18 +++--
 2 files changed, 92 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-connectivity/irda-utils/irda-utils-0.9.18/ldflags.patch

diff --git a/meta/recipes-connectivity/irda-utils/irda-utils-0.9.18/ldflags.patch b/meta/recipes-connectivity/irda-utils/irda-utils-0.9.18/ldflags.patch
new file mode 100644
index 0000000..a79dca7
--- /dev/null
+++ b/meta/recipes-connectivity/irda-utils/irda-utils-0.9.18/ldflags.patch
@@ -0,0 +1,79 @@
+---
+ findchip/Makefile |    2 +-
+ irattach/Makefile |    4 ++--
+ irdadump/Makefile |    2 +-
+ irdaping/Makefile |    2 +-
+ irnetd/Makefile   |    2 +-
+ psion/Makefile    |    2 +-
+ 6 files changed, 7 insertions(+), 7 deletions(-)
+
+--- irda-utils-0.9.18.orig/findchip/Makefile
++++ irda-utils-0.9.18/findchip/Makefile
+@@ -65,5 +65,5 @@ install: findchip
+ 
+ gfindchip: gfindchip.c 
+ 	$(prn_cc)
+-	$(ECMD))$(CC) $(CFLAGS) `gtk-config --cflags`  $< -o $@ `gtk-config --libs`
++	$(ECMD)$(CC) $(CFLAGS) $(LDFLAGS) `gtk-config --cflags`  $< -o $@ `gtk-config --libs`
+ 
+--- irda-utils-0.9.18.orig/irattach/Makefile
++++ irda-utils-0.9.18/irattach/Makefile
+@@ -49,13 +49,13 @@ all: $(TARGETS)
+ 
+ irattach: irattach.o util.o
+ 	$(prn_cc_o)
+-	$(ECMD)$(CC) $(CFLAGS) irattach.o util.o -o $@
++	$(ECMD)$(CC) $(CFLAGS) $(LDFLAGS) irattach.o util.o -o $@
+ 
+ 
+ 
+ dongle_attach: dongle_attach.o
+ 	$(prn_cc_o)
+-	$(ECMD)$(CC) $(CFLAGS) dongle_attach.o -o $@
++	$(ECMD)$(CC) $(CFLAGS) $(LDFLAGS) dongle_attach.o -o $@
+ 
+ 
+ install: $(TARGETS)
+--- irda-utils-0.9.18.orig/irdadump/Makefile
++++ irda-utils-0.9.18/irdadump/Makefile
+@@ -40,7 +40,7 @@ lib_irdadump.a: $(LIBIRDADUMP_OBJS)
+ 
+ irdadump: $(IRDADUMP_OBJS) $(LIBIRDADUMP_TARGET)
+ 	$(prn_cc_o)
+-	$(ECMD)$(CC) $(CFLAGS) `pkg-config --libs glib-2.0` -o  $(IRDADUMP_TARGET) $< $(LIBIRDADUMP_TARGET)
++	$(ECMD)$(CC) $(CFLAGS) $(LDFLAGS) `pkg-config --libs glib-2.0` -o  $(IRDADUMP_TARGET) $< $(LIBIRDADUMP_TARGET)
+ 
+ 
+ .c.o:
+--- irda-utils-0.9.18.orig/irdaping/Makefile
++++ irda-utils-0.9.18/irdaping/Makefile
+@@ -56,7 +56,7 @@ all: $(TARGETS)
+ 
+ irdaping: $(OBJS)
+ 	$(prn_cc_o)
+-	$(ECMD)$(CC) $(CFLAGS) $(OBJS) -o $@
++	$(ECMD)$(CC) $(CFLAGS) $(LDFLAGS) $(OBJS) -o $@
+ 
+ 
+ .c.o:
+--- irda-utils-0.9.18.orig/irnetd/Makefile
++++ irda-utils-0.9.18/irnetd/Makefile
+@@ -50,7 +50,7 @@ all: $(TARGETS)
+ 
+ irnetd: $(OBJS)
+ 	$(prn_cc_o)
+-	$(ECMD)$(CC) $(CFLAGS) $(OBJS) -o $@
++	$(ECMD)$(CC) $(CFLAGS) $(LDFLAGS) $(OBJS) -o $@
+ 
+ 
+ install: irnetd
+--- irda-utils-0.9.18.orig/psion/Makefile
++++ irda-utils-0.9.18/psion/Makefile
+@@ -25,4 +25,4 @@ install: $(PSION_TARGETS)
+ CFLAGS += -g -I../include -Wall -Wstrict-prototypes $(RPM_OPT_FLAGS)
+ irpsion5: 
+ 	$(prn_cc_o)
+-	$(ECMD)$(CC) $(CFLAGS) $(PSION_SRC) -o $@
+\ No newline at end of file
++	$(ECMD)$(CC) $(CFLAGS) $(LDFLAGS) $(PSION_SRC) -o $@
+\ No newline at end of file
diff --git a/meta/recipes-connectivity/irda-utils/irda-utils_0.9.18.bb b/meta/recipes-connectivity/irda-utils/irda-utils_0.9.18.bb
index 7403dc9..21891b2 100644
--- a/meta/recipes-connectivity/irda-utils/irda-utils_0.9.18.bb
+++ b/meta/recipes-connectivity/irda-utils/irda-utils_0.9.18.bb
@@ -12,21 +12,29 @@ LIC_FILES_CHKSUM = "file://irdadump/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f
                     file://irdadump/irdadump.c;beginline=1;endline=24;md5=d78b9dce3cd78c2220250c9c7a2be178"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/irda/irda-utils-${PV}.tar.gz \
-          file://init"
+           file://ldflags.patch \
+           file://init"
 
 SRC_URI[md5sum] = "84dc12aa4c3f61fccb8d8919bf4079bb"
 SRC_URI[sha256sum] = "61980551e46b2eaa9e17ad31cbc1a638074611fc33bff34163d10c7a67a9fdc6"
 
-export SYS_INCLUDES="-I${STAGING_INCDIR}"
-
 inherit autotools-brokensep update-rc.d
 
+EXTRA_OEMAKE = "\
+    'CC=${CC}' \
+    'LD=${LD}' \
+    'CFLAGS=${CFLAGS}' \
+    'LDFLAGS=${LDFLAGS}' \
+    'SYS_INCLUDES=' \
+    'V=1' \
+"
+
 INITSCRIPT_NAME = "irattach"
 INITSCRIPT_PARAMS = "defaults 20"
 
 do_compile () {
-    oe_runmake -e -C irattach
-    oe_runmake -e -C irdaping
+	oe_runmake -C irattach
+	oe_runmake -C irdaping
 }
 
 do_install () {
-- 
1.8.3.4


