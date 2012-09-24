Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TG80w-0001fT-QV
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 14:43:55 +0200
Received: from mail-we0-f175.google.com ([74.125.82.175])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 24 Sep 2012 05:31:05 -0700
Received: by weyt44 with SMTP id t44so2172919wey.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2012 05:31:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=I8ELGqsRF1UsMRuhJIMC1CncCir+lBDHLppBVfxfDs4=;
	b=iTp3pakGdDOzeBaR7kTa3TQ/FdsRbEILNr9GxFoA81GGzWMkaYbIsqFuFYoSwyIp3Z
	2WRQxeNDuZnO7zpeC5jOctjpwfjO1COKj8s7DDo53el4uvfBVvPoDaq4lnMr9bKY+9vO
	ln+S1lg9u6a4SNhxrd61SDNHchcr69rUKz/R+9CCYPYj7QmSoF7BiCa9E3qTnYAx1yMN
	7pKN49btllXlDaxoTeX5AqMMO3C/u4Ql7PGK+NhPseMsOVdQ7ysP6SCnMbt3lliDAmtg
	f7ruO05qj7WfRKs8ta6khdwd/mf8p1aVqOoh/5OTqpqvBsIPS+P4GYE05+dPf066WuAy
	XNGQ==
Received: by 10.180.78.102 with SMTP id a6mr1970939wix.20.1348489860179;
	Mon, 24 Sep 2012 05:31:00 -0700 (PDT)
Received: from melchett.burtonini.com ([81.2.106.35])
	by mx.google.com with ESMTPS id ga2sm4588850wib.2.2012.09.24.05.30.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 24 Sep 2012 05:30:59 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Sep 2012 13:30:02 +0100
Message-Id: <1348489802-5044-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQn2fblQqYjyRVTp44qa1IoyXmPxK3MVqtGezbiQpc1CIOSjNi9Y/S15AZcBAenI0zY8QfZw
Subject: [PATCH] xserver-xorg: merge version-specific .inc into .bb
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Sep 2012 12:43:55 -0000

The version-specific .inc was shared with the xserver-xorg-lite package, but
that doesn't exist anymore.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc |   11 -----------
 meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.2.bb |   13 ++++++++++++-
 2 files changed, 12 insertions(+), 12 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
deleted file mode 100644
index 35cb33a..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
+++ /dev/null
@@ -1,11 +0,0 @@
-# Misc build failure for master HEAD
-SRC_URI += "file://crosscompile.patch \
-            file://fix_open_max_preprocessor_error.patch \
-            file://gcc-47-warning.patch \
-	    file://mips64-compiler.patch \
-           "
-
-SRC_URI[md5sum] = "8796fff441e5435ee36a72579008af24"
-SRC_URI[sha256sum] = "fa415decf02027ca278b06254ccfbcceba2a83c2741405257ebf749da4a73cf2"
-
-PR = "r8"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.2.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.2.bb
index 0f94fe2..c707567 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.2.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.2.bb
@@ -1,2 +1,13 @@
 require xserver-xorg.inc
-require xserver-xorg-${PV}.inc
+
+# Misc build failure for master HEAD
+SRC_URI += "file://crosscompile.patch \
+            file://fix_open_max_preprocessor_error.patch \
+            file://gcc-47-warning.patch \
+	    file://mips64-compiler.patch \
+           "
+
+SRC_URI[md5sum] = "8796fff441e5435ee36a72579008af24"
+SRC_URI[sha256sum] = "fa415decf02027ca278b06254ccfbcceba2a83c2741405257ebf749da4a73cf2"
+
+PR = "r8"
-- 
1.7.10



