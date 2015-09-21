Return-Path: <net147@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 28E7B60053
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Sep 2015 11:08:14 +0000 (UTC)
Received: by padbj2 with SMTP id bj2so4567477pad.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Sep 2015 04:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=7IV0BFkLh83Zgx3NVcm1OZDIkB7bzTZoE3mHUTlI6Rk=;
	b=f97UZXMth1NVa56gLYyXIH0NE9bWx3FUoeOWEJn7S13JYzJK/BD9TZhos0wyTY0eZ5
	7KTHKswMskS77AMDQVYDZdHJnpxqplXFfXe/O2N59dP1i2uFl4nH/U5ae7L/byjtgBaQ
	eYC99qJX+DzukKDvn42mrSkn+Lr1hKZ3aVNujxHJJYCHuAzxJO+Tyt4LrADdVCYg6Sme
	b2/a0vJiV8nvpcDsNW78z7OVOmcXX/l9jZhv9QwA/7fenlBV1oAbBxzSqxwJ2C6Qk2uZ
	UTjMiPNcQ/NDqWMfmxdL1axP5bJNf3WLk0t2ecB6NMtsnR1o+uJ1abx3Vv7bWZH9dfon
	wqaA==
X-Received: by 10.68.197.97 with SMTP id it1mr24482414pbc.4.1442833694827;
	Mon, 21 Sep 2015 04:08:14 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id x6sm23923514pbt.3.2015.09.21.04.08.13
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Sep 2015 04:08:14 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Sep 2015 21:09:26 +1000
Message-Id: <1442833766-16676-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH] opkg: create opkg.lock in /run instead of /var/run
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
X-List-Received-Date: Mon, 21 Sep 2015 11:08:15 -0000

This avoids a "Could not unlink" warning when extracting a /var/run
symbolic link pointing to /run from the base-files package as it is
unable to unlink the /var/run directory when it contains opkg.lock.

This also fixes an issue where /var/run is created as a directory
instead of a symbolic link to /run.

Signed-off-by: Jonathan Liu <net147@gmail.com>
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
index f4dbb2d..08fb62c 100644
--- a/meta/recipes-devtools/opkg/opkg_0.3.0.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.3.0.bb
@@ -15,6 +15,7 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz
            file://opkg-configure.service \
            file://opkg.conf \
            file://0001-opkg_archive-add-support-for-empty-compressed-files.patch \
+           file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch \
 "
 
 SRC_URI[md5sum] = "3412cdc71d78b98facc84b19331ec64e"
-- 
2.5.0


