Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B2F0877DAF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jan 2018 16:43:18 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Jan 2018 08:43:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,397,1511856000"; d="scan'208";a="21652273"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 22 Jan 2018 08:43:19 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Jan 2018 18:37:26 +0200
Message-Id: <20180122163726.16636-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.1
Subject: [PATCH] gnupg: add a patch to avoid native vs. host gpg-agent clashes
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
X-List-Received-Date: Mon, 22 Jan 2018 16:43:19 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...c-use-a-custom-value-for-the-location-of-.patch | 30 ++++++++++++++++++++++
 meta/recipes-support/gnupg/gnupg_2.2.4.bb          |  2 ++
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch

diff --git a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
new file mode 100644
index 00000000000..3e3a64df2f5
--- /dev/null
+++ b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
@@ -0,0 +1,30 @@
+From 0b97148c3aad0993a9aeb088596fa63a2fec5328 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Mon, 22 Jan 2018 18:00:21 +0200
+Subject: [PATCH] configure.ac: use a custom value for the location of
+ gpg-agent socket in the filesystem
+
+This should avoid clashes with the host gpg-agent observed on autobuilders.
+
+Upstream-Status: Inappropriate [oe-core specific, and only for -native]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 382ef1d..0570d7c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1818,7 +1818,7 @@ AC_DEFINE_UNQUOTED(GPGCONF_DISP_NAME, "GPGConf",
+ 
+ AC_DEFINE_UNQUOTED(GPGTAR_NAME, "gpgtar", [The name of the gpgtar tool])
+ 
+-AC_DEFINE_UNQUOTED(GPG_AGENT_SOCK_NAME, "S.gpg-agent",
++AC_DEFINE_UNQUOTED(GPG_AGENT_SOCK_NAME, "S.gpg-agent.yocto-native",
+                    [The name of the agent socket])
+ AC_DEFINE_UNQUOTED(GPG_AGENT_EXTRA_SOCK_NAME, "S.gpg-agent.extra",
+                    [The name of the agent socket for remote access])
+-- 
+2.15.1
+
diff --git a/meta/recipes-support/gnupg/gnupg_2.2.4.bb b/meta/recipes-support/gnupg/gnupg_2.2.4.bb
index e15bcf298ac..d3f1a8f4c4d 100644
--- a/meta/recipes-support/gnupg/gnupg_2.2.4.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.2.4.bb
@@ -15,6 +15,8 @@ SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0003-dirmngr-uses-libgpg-error.patch \
            file://0004-autogen.sh-fix-find-version-for-beta-checking.patch \
           "
+SRC_URI_append_class-native = " file://0001-configure.ac-use-a-custom-value-for-the-location-of-.patch"
+
 
 SRC_URI[md5sum] = "709e5af5bba84d251c520222e720972f"
 SRC_URI[sha256sum] = "401a3e64780fdfa6d7670de0880aa5c9d589b3db7a7098979d7606cec546f2ec"
-- 
2.15.1


