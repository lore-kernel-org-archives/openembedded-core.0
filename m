Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QZREt-0007z1-L8
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 19:29:20 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5MHPioq026852
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 10:25:44 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 22 Jun 2011 10:25:44 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 22 Jun 2011 12:36:25 -0500
Message-ID: <c16e6e8235a62136948732aea0f86bbb334b4cf0.1308763995.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1308763995.git.mark.hatle@windriver.com>
References: <cover.1308763995.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 31/40] tinylogin: Avoid stripped binaries
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Jun 2011 17:29:20 -0000
Content-Type: text/plain

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../tinylogin/tinylogin-1.4/avoid_static.patch     |   33 ++++++++++++++++++++
 meta/recipes-core/tinylogin/tinylogin_1.4.bb       |    7 ++--
 2 files changed, 37 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-core/tinylogin/tinylogin-1.4/avoid_static.patch

diff --git a/meta/recipes-core/tinylogin/tinylogin-1.4/avoid_static.patch b/meta/recipes-core/tinylogin/tinylogin-1.4/avoid_static.patch
new file mode 100644
index 0000000..8a06af0
--- /dev/null
+++ b/meta/recipes-core/tinylogin/tinylogin-1.4/avoid_static.patch
@@ -0,0 +1,33 @@
+tinylogin: Do not link statically when building debug
+
+For some reason if DODEBUG was enabled (to prevent stripping) the binary was
+also statically linked.  This patch prevents that behavior.
+
+Upstream-Status: Inappropriate [no upstream]
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+
+diff -ur tinylogin-1.4.orig/Makefile tinylogin-1.4/Makefile
+--- tinylogin-1.4.orig/Makefile	2011-06-18 11:00:23.073927349 -0500
++++ tinylogin-1.4/Makefile	2011-06-18 11:03:26.394849372 -0500
+@@ -123,20 +123,6 @@
+     LDFLAGS += -s -Wl,-warn-common 
+     STRIP    = $(STRIPTOOL) --remove-section=.note --remove-section=.comment $(PROG)
+ endif
+-ifeq ($(strip $(DODEBUG)),true)
+-    LDFLAGS += --static
+-    #
+-    #use '-ffunction-sections -fdata-sections' and '--gc-sections' (if they 
+-    # work) to try and strip out any unused junk.  Doesn't do much for me, 
+-    # but you may want to give it a shot...
+-    #
+-    #ifeq ($(shell $(CC) -ffunction-sections -fdata-sections -S \
+-    #	-o /dev/null -xc /dev/null 2>/dev/null && $(LD) \
+-    #			--gc-sections -v >/dev/null && echo 1),1)
+-    #	CFLAGS += -ffunction-sections -fdata-sections
+-    #	LDFLAGS += --gc-sections
+-    #endif
+-endif
+ ifeq ($(strip $(DOSTATIC)),true)
+     LDFLAGS += --static
+     #
diff --git a/meta/recipes-core/tinylogin/tinylogin_1.4.bb b/meta/recipes-core/tinylogin/tinylogin_1.4.bb
index 0b51b25..b620d45 100644
--- a/meta/recipes-core/tinylogin/tinylogin_1.4.bb
+++ b/meta/recipes-core/tinylogin/tinylogin_1.4.bb
@@ -7,7 +7,7 @@ and groups on an embedded system."
 HOMEPAGE = "http://tinylogin.busybox.net/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM="file://LICENSE;md5=f1060fa3a366f098b5b1d8c2077ba269"
-PR = "r6"
+PR = "r7"
 
 SRC_URI = "http://tinylogin.busybox.net/downloads/tinylogin-${PV}.tar.bz2 \
 	file://cvs-20040608.patch;patch=1;pnum=1 \
@@ -15,7 +15,8 @@ SRC_URI = "http://tinylogin.busybox.net/downloads/tinylogin-${PV}.tar.bz2 \
 	file://adduser-empty_pwd.patch;patch=1 \
 	file://remove-index.patch;patch=1 \
 	file://use_O2_option.patch \
-	file://passwd_rotate_check.patch"
+	file://passwd_rotate_check.patch \
+	file://avoid_static.patch"
 
 SRC_URI[md5sum] = "44da0ff2b727455669890b24305e351d"
 SRC_URI[sha256sum] = "5e542e4b7825305a3678bf73136c392feb0d44b8bbf926e8eda5453eea7ddd6b"
@@ -23,7 +24,7 @@ SRC_URI[sha256sum] = "5e542e4b7825305a3678bf73136c392feb0d44b8bbf926e8eda5453eea
 EXTRA_OEMAKE = ""
 
 do_compile () {
-	oe_runmake 'CC=${CC}' 'CROSS=${HOST_PREFIX}'
+	oe_runmake 'CC=${CC}' 'CROSS=${HOST_PREFIX}' 'DODEBUG=true'
 }
 
 do_install () {
-- 
1.7.3.4



