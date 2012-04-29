Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SOPvc-0001p9-Sm
	for openembedded-core@lists.openembedded.org;
	Sun, 29 Apr 2012 10:56:24 +0200
Received: by wera1 with SMTP id a1so1382869wer.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Apr 2012 01:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=VPUHgIw1aUREqyMIvvhWDGFXB5fH2PFV99CqDi9b5S0=;
	b=kB1P+yoOuj9dNG6X0ZkSBWiGHGM5mUn6ulZu+Ve9uY/fOTNEI4oUQqUqT00dfvRC1Y
	rbJ6DKvvCOXi9V3jaHtuNWI/VHWD5sEYYKLy/9tNKU+gnJsJciglSejxr6CZHfgGg3Eo
	1LQlMa6K+C2JwL892UWPQ96oBeS3+fPhBPqBjeTg+TPU09xOK6BRAykhl56JQABb9Cr4
	gEXuyKOwRvo/tsvI/mqefsEN6mbSj7YP4+uJ7spkIxac1mh8JTo1GSNdw5tYieny9fsk
	bACcbaMhfOlG24fLQliGG0KViJ3AMeZ7+QSuixLo4/mi6Ux4t6HrzKefywxFoGC1qeH/
	rVJg==
Received: by 10.180.24.66 with SMTP id s2mr20183900wif.7.1335689204681;
	Sun, 29 Apr 2012 01:46:44 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ff2sm30396966wib.9.2012.04.29.01.46.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 Apr 2012 01:46:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Apr 2012 10:46:42 +0200
Message-Id: <1335689202-30557-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <20120429084538.GA350@jama.jama.net>
References: <20120429084538.GA350@jama.jama.net>
Subject: [PATCH] ofono: upgrade to 1.6
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
X-List-Received-Date: Sun, 29 Apr 2012 08:56:25 -0000

* 1.5 is not compatible with glib-2.32 and newer
  | In file included from gisi/client.h:30:0,
  |                  from gisi/client.c:33:
  |/OE/shr-core/tmp-eglibc/sysroots/spitz/usr/include/glib-2.0/glib/gtypes.h:28:2: error: #error "Only <glib.h> can be included directly."

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-connectivity/ofono/ofono_1.5.bb |   14 --------------
 meta/recipes-connectivity/ofono/ofono_1.6.bb |   15 +++++++++++++++
 2 files changed, 15 insertions(+), 14 deletions(-)
 delete mode 100644 meta/recipes-connectivity/ofono/ofono_1.5.bb
 create mode 100644 meta/recipes-connectivity/ofono/ofono_1.6.bb

diff --git a/meta/recipes-connectivity/ofono/ofono_1.5.bb b/meta/recipes-connectivity/ofono/ofono_1.5.bb
deleted file mode 100644
index dad813f..0000000
--- a/meta/recipes-connectivity/ofono/ofono_1.5.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-require ofono.inc
-
-PR = "r1"
-
-SRC_URI  = "${KERNELORG_MIRROR}/linux/network/ofono/${BPN}-${PV}.tar.bz2 \
-	          file://ofono"
-
-EXTRA_OECONF += "\
-    --enable-test \
-    ${@base_contains('DISTRO_FEATURES', 'bluetooth','--enable-bluetooth', '--disable-bluetooth', d)} \
-"
-
-SRC_URI[md5sum] = "a54935a2a86b90300410c6c033284f6c"
-SRC_URI[sha256sum] = "3a70608c17f3dca34c1e057aacdf836021322dfdcaf9edc777119eafe48076b3"
diff --git a/meta/recipes-connectivity/ofono/ofono_1.6.bb b/meta/recipes-connectivity/ofono/ofono_1.6.bb
new file mode 100644
index 0000000..386ffee
--- /dev/null
+++ b/meta/recipes-connectivity/ofono/ofono_1.6.bb
@@ -0,0 +1,15 @@
+require ofono.inc
+
+SRC_URI  = "\
+  ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.bz2 \
+  file://ofono \
+"
+SRC_URI[md5sum] = "d863b2b650a525cf75056085398bc8ef"
+SRC_URI[sha256sum] = "63e38ea1cf35b00ecbab7611c6caa2adcd33eb10495f7a9f72013d4ab7a14c98"
+
+
+EXTRA_OECONF += "\
+    --enable-test \
+    ${@base_contains('DISTRO_FEATURES', 'bluetooth','--enable-bluetooth', '--disable-bluetooth', d)} \
+"
+
-- 
1.7.8.6



