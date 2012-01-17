Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1Rn7Kp-0008U4-Qt
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 12:36:15 +0100
Received: by werf1 with SMTP id f1so1853166wer.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2012 03:28:38 -0800 (PST)
Received: by 10.216.135.162 with SMTP id u34mr6948596wei.1.1326799718726;
	Tue, 17 Jan 2012 03:28:38 -0800 (PST)
Received: from localhost.localdomain ([89.121.200.106])
	by mx.google.com with ESMTPS id dr7sm13084936wib.3.2012.01.17.03.28.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Jan 2012 03:28:37 -0800 (PST)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jan 2012 13:28:31 +0200
Message-Id: <1326799711-31142-1-git-send-email-andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.5.4
Cc: flocirel@gmail.com, Andrei Gherzan <andrei.gherzan@windriver.com>
Subject: [PATCH] busybox uglic: remove obsolete check for "kernel24"
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
X-List-Received-Date: Tue, 17 Jan 2012 11:36:15 -0000

From: Andrei Gherzan <andrei.gherzan@windriver.com>

Busybox checks if MACHINE_FEATURES contains "kernel24". If so, CONFIG_FEATURE_2_4_MODULES will be on "y".
kernel24 is no longer present in any machine configuration. The same situation is in uglibc with a
different CONFIG mapping.

[YOCTO #1901]

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta/recipes-core/busybox/busybox.inc      |    4 +---
 meta/recipes-core/uclibc/uclibc-config.inc |    4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index a107a02..f35779d 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -47,18 +47,16 @@ def busybox_cfg(feature, features, tokens, cnf, rem):
 	else:
 		cnf.extend(['# ' + token + ' is not set' for token in tokens])
 
-# Map distro and machine features to config settings
+# Map distro features to config settings
 def features_to_busybox_settings(d):
 	cnf, rem = ([], [])
 	distro_features = d.getVar('DISTRO_FEATURES', True).split()
-	machine_features = d.getVar('MACHINE_FEATURES', True).split()
 	busybox_cfg('ipv6', distro_features, 'CONFIG_FEATURE_IPV6', cnf, rem)
 	busybox_cfg('largefile', distro_features, 'CONFIG_LFS', cnf, rem)
 	busybox_cfg('largefile', distro_features, 'CONFIG_FDISK_SUPPORT_LARGE_DISKS', cnf, rem)
 	busybox_cfg('nls',  distro_features, 'CONFIG_LOCALE_SUPPORT', cnf, rem)
 	busybox_cfg('ipv4', distro_features, 'CONFIG_FEATURE_IFUPDOWN_IPV4', cnf, rem)
 	busybox_cfg('ipv6', distro_features, 'CONFIG_FEATURE_IFUPDOWN_IPV6', cnf, rem)
-	busybox_cfg('kernel24', machine_features, 'CONFIG_FEATURE_2_4_MODULES', cnf, rem)
 	return "\n".join(cnf), "\n".join(rem)
 
 # X, Y = ${@features_to_uclibc_settings(d)}
diff --git a/meta/recipes-core/uclibc/uclibc-config.inc b/meta/recipes-core/uclibc/uclibc-config.inc
index 3de3845..8bb0948 100644
--- a/meta/recipes-core/uclibc/uclibc-config.inc
+++ b/meta/recipes-core/uclibc/uclibc-config.inc
@@ -91,11 +91,10 @@ def uclibc_cfg(feature, features, tokens, cnf, rem):
 	else:
 		cnf.extend(['# ' + token + ' is not set' for token in tokens])
 
-# Map distro and machine features to config settings
+# Map distro features to config settings
 def features_to_uclibc_settings(d):
 	cnf, rem = ([], [])
 	distro_features = d.getVar('DISTRO_FEATURES', True).split()
-	machine_features = d.getVar('MACHINE_FEATURES', True).split()
 	uclibc_cfg('ipv4',      distro_features, 'UCLIBC_HAS_IPV4', cnf, rem)
 	uclibc_cfg('ipv6',      distro_features, 'UCLIBC_HAS_IPV6', cnf, rem)
 	uclibc_cfg('largefile', distro_features, 'UCLIBC_HAS_LFS', cnf, rem)
@@ -104,7 +103,6 @@ def features_to_uclibc_settings(d):
 	uclibc_cfg('xattr',     distro_features, 'UCLIBC_HAS_XATTR', cnf, rem)
 	uclibc_cfg('ssp',       distro_features, 'UCLIBC_HAS_SSP', cnf, rem)
 	uclibc_cfg('argp',       distro_features, 'UCLIBC_HAS_ARGP', cnf, rem)
-	uclibc_cfg('kernel24',  machine_features,'UCLIBC_LINUX_MODULE_24', cnf, rem)
 	uclibc_cfg('libc-posix-clang-wchar',  distro_features,'UCLIBC_HAS_WCHAR', cnf, rem)
 	return "\n".join(cnf), "\n".join(rem)
 # X, Y = ${@features_to_uclibc_settings(d)}
-- 
1.7.5.4



