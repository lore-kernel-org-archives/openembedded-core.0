Return-Path: <net147@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id C8B3C76E04
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Sep 2015 23:33:28 +0000 (UTC)
Received: by pacex6 with SMTP id ex6so118322488pac.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Sep 2015 16:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=VftrcAla6go8bVRwnWGF6kHT3Zpmw7YqaFYnxxg6fEY=;
	b=siyX5kDqLEX7ViB25g6fHttkB+xI/Npxcw1iBjHSU1AIAz0CL9I8o46EA8GQmknOsn
	yAqmPPPk4vtdSOJEOmVI9kG6jRibNAp+cs0uJZpHmaoQsh/FKqSwhIY6RPP2m58yDVxF
	nFnlQXEEgGMw6fEUCMS3yifVkqyeC+vQQK0Qryjqwgnw+ft8UB93KJk0rKeF1o947KCh
	hmMTXtaePwQUtp5nmyfhVsBS0G0qij00cNUh9PK1VEaULG2kdO31ojrwHUGa8kEof5sn
	S/sRFA0mApy4orHOQ4D95cMFjzTe4RMNsZhNzkESdo+MwVabW0n/yN0JSzWfaIc4YTjd
	anLg==
X-Received: by 10.67.12.166 with SMTP id er6mr10598087pad.40.1443224008212;
	Fri, 25 Sep 2015 16:33:28 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	rx8sm5844892pbb.90.2015.09.25.16.33.27
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Sep 2015 16:33:27 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 26 Sep 2015 09:34:21 +1000
Message-Id: <1443224061-4281-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.5.0
Subject: [meta-oe][PATCH v2] opkg: create opkg.lock in /run instead of /var/run
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
X-List-Received-Date: Fri, 25 Sep 2015 23:33:29 -0000

This avoids a "Could not unlink" warning when extracting a /var/run
symbolic link pointing to /run from the base-files package as it is
unable to unlink the /var/run directory when it contains opkg.lock.

This also fixes an issue where /var/run is created as a directory
instead of a symbolic link to /run.

Signed-off-by: Jonathan Liu <net147@gmail.com>
Acked-by: Anders Darander <anders@chargestorm.se>
---
 ...reate-opkg.lock-in-run-instead-of-var-run.patch | 34 ++++++++++++++++++++++
 meta/recipes-devtools/opkg/opkg_0.3.0.bb           |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-devtools/opkg/opkg/0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch

diff --git a/meta/recipes-devtools/opkg/opkg/0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch b/meta/recipes-devtools/opkg/opkg/0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch
new file mode 100644
index 0000000..255021b
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch
@@ -0,0 +1,34 @@
+From a4628a6171f393add9a2b287483ca39bb72b4dd6 Mon Sep 17 00:00:00 2001
+From: Jonathan Liu <net147@gmail.com>
+Date: Mon, 21 Sep 2015 20:23:23 +1000
+Subject: [PATCH] opkg_conf: create opkg.lock in /run instead of /var/run
+
+This avoids a "Could not unlink" warning when extracting a /var/run
+symbolic link pointing to /run from a package as it is unable to
+unlink the /var/run directory when it contains opkg.lock.
+
+This also fixes an issue where /var/run is created as a directory
+instead of a symbolic link to /run.
+
+Upstream-Status: Inappropriate [OE-Specific]
+Signed-off-by: Jonathan Liu <net147@gmail.com>
+---
+ libopkg/opkg_conf.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libopkg/opkg_conf.h b/libopkg/opkg_conf.h
+index 7bca948..5a1bc44 100644
+--- a/libopkg/opkg_conf.h
++++ b/libopkg/opkg_conf.h
+@@ -40,7 +40,7 @@ extern "C" {
+ #define OPKG_CONF_DEFAULT_STATUS_FILE   "/var/lib/opkg/status"
+ #define OPKG_CONF_DEFAULT_CACHE_DIR     "/var/cache/opkg"
+ #define OPKG_CONF_DEFAULT_CONF_FILE_DIR "/etc/opkg"
+-#define OPKG_CONF_DEFAULT_LOCK_FILE     "/var/run/opkg.lock"
++#define OPKG_CONF_DEFAULT_LOCK_FILE     "/run/opkg.lock"
+ 
+ /* In case the config file defines no dest */
+ #define OPKG_CONF_DEFAULT_DEST_NAME "root"
+-- 
+2.5.0
+
diff --git a/meta/recipes-devtools/opkg/opkg_0.3.0.bb b/meta/recipes-devtools/opkg/opkg_0.3.0.bb
index 884368f..588250e 100644
--- a/meta/recipes-devtools/opkg/opkg_0.3.0.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.3.0.bb
@@ -16,6 +16,7 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz
            file://opkg.conf \
            file://0001-opkg_archive-add-support-for-empty-compressed-files.patch \
            file://0001-libopkg-include-stdio.h-for-getting-FILE-defined.patch \
+           file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch \
 "
 
 SRC_URI[md5sum] = "3412cdc71d78b98facc84b19331ec64e"
-- 
2.5.0


