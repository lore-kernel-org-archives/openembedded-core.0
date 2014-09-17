Return-Path: <kergoth@gmail.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 77F2A714A6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Sep 2014 01:17:28 +0000 (UTC)
Received: by mail-wg0-f43.google.com with SMTP id x12so632433wgg.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Sep 2014 18:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=dfuyNK4Rpv1iRseOjVR3LBU/BfrOcA68VB/ZH8raitk=;
	b=oVSFKbD3Y58GP1ofXLAYgtwuz5SKn5wUIgySScXERYgNWnXeT3ZXVrJcfHKObBd+rM
	JtDdB8oH0YiRcnyrWyn6wjKXf307Zs1B6iIGZMPJ4YJ/t3KcmtELTR8f6u/XGUDp57dD
	ywnBJN1sqQWbv5oCNS+5mLlLLhrwcR5sLLAvT12DJX5qZO//2eF61xU/+BSQSjlhSnFi
	/QQQNK5OMjVb4ahyZSd3vuKNbXyWQ8EKHHchoLLIIbo4CwbK1pUX3O7kxTUykSiUGxIL
	dmqBltzRlIjytVJt0zgRtVvUb2lH9ncQhb/GyWVdj+PP0vOeSJg2tvw2/E3RgJ0ZZ6vP
	eFLQ==
X-Received: by 10.180.107.100 with SMTP id hb4mr1772880wib.59.1410916649976;
	Tue, 16 Sep 2014 18:17:29 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id
	bg10sm20164661wjc.47.2014.09.16.18.17.28 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 16 Sep 2014 18:17:29 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Sep 2014 18:17:01 -0700
Message-Id: <1410916622-26204-8-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <1410916622-26204-1-git-send-email-kergoth@gmail.com>
References: <1410916622-26204-1-git-send-email-kergoth@gmail.com>
In-Reply-To: <cover.1409764769.git.chris_larson@mentor.com>
References: <cover.1409764769.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH v2 7/8] irda-utils: obey LDFLAGS
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
X-List-Received-Date: Wed, 17 Sep 2014 01:17:29 -0000

From: Christopher Larson <chris_larson@mentor.com>

While we're at it, also switch to explicit variable passing rather than
relying on make -e, and pass V=1 so the actual commands hit the logs.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 .../irda-utils/irda-utils-0.9.18/ldflags.patch     | 75 ++++++++++++++++++++++
 .../irda-utils/irda-utils_0.9.18.bb                | 18 ++++--
 2 files changed, 88 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-connectivity/irda-utils/irda-utils-0.9.18/ldflags.patch

diff --git a/meta/recipes-connectivity/irda-utils/irda-utils-0.9.18/ldflags.patch b/meta/recipes-connectivity/irda-utils/irda-utils-0.9.18/ldflags.patch
new file mode 100644
index 0000000..2cdd1ac
--- /dev/null
+++ b/meta/recipes-connectivity/irda-utils/irda-utils-0.9.18/ldflags.patch
@@ -0,0 +1,75 @@
+Obey LDFLAGS
+
+Signed-off-by: Christopher Larson <chris_larson@mentor.com>
+Upstream-status: Pending
+
+--- irda-utils-0.9.18.orig/findchip/Makefile
++++ irda-utils-0.9.18/findchip/Makefile
+@@ -65,5 +65,5 @@ install: findchip
+
+ gfindchip: gfindchip.c
+	$(prn_cc)
+-	$(ECMD))$(CC) $(CFLAGS) `gtk-config --cflags`  $< -o $@ `gtk-config --libs`
++	$(ECMD)$(CC) $(CFLAGS) $(LDFLAGS) `gtk-config --cflags`  $< -o $@ `gtk-config --libs`
+
+--- irda-utils-0.9.18.orig/irattach/Makefile
++++ irda-utils-0.9.18/irattach/Makefile
+@@ -49,13 +49,13 @@ all: $(TARGETS)
+
+ irattach: irattach.o util.o
+	$(prn_cc_o)
+-	$(ECMD)$(CC) $(CFLAGS) irattach.o util.o -o $@
++	$(ECMD)$(CC) $(CFLAGS) $(LDFLAGS) irattach.o util.o -o $@
+
+
+
+ dongle_attach: dongle_attach.o
+	$(prn_cc_o)
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
+	$(prn_cc_o)
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
+	$(prn_cc_o)
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
+	$(prn_cc_o)
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
+	$(prn_cc_o)
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


