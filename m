Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id ADD2978225
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jul 2017 09:26:33 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="21837042"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Jul 2017 17:26:30 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id EC58C402BB76
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jul 2017 17:26:27 +0800 (CST)
Received: from localhost.localdomain (10.167.235.93) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Wed, 26 Jul 2017 17:26:27 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Jul 2017 17:26:10 +0800
Message-ID: <1501061170-3010-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.235.93]
X-yoursite-MailScanner-ID: EC58C402BB76.A6AE2
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH v2] opkg: 0.3.4 -> 0.3.5
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
X-List-Received-Date: Wed, 26 Jul 2017 09:26:34 -0000
Content-Type: text/plain

1) Update opkg from 0.3.4 to 0.3.5.
2) Delete status-conffile.patch, since it is integrated upstream

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../opkg/opkg/status-conffile.patch                | 69 ----------------------
 .../opkg/{opkg_0.3.4.bb => opkg_0.3.5.bb}          |  5 +-
 2 files changed, 2 insertions(+), 72 deletions(-)
 delete mode 100644 meta/recipes-devtools/opkg/opkg/status-conffile.patch
 rename meta/recipes-devtools/opkg/{opkg_0.3.4.bb => opkg_0.3.5.bb} (93%)

diff --git a/meta/recipes-devtools/opkg/opkg/status-conffile.patch b/meta/recipes-devtools/opkg/opkg/status-conffile.patch
deleted file mode 100644
index 6fc405b..0000000
--- a/meta/recipes-devtools/opkg/opkg/status-conffile.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-Upstream-Status: Submitted
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 086d5083dfe0102368cb7c8ce89b0c06b64ca773 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Tue, 10 Jan 2017 15:24:59 +0000
-Subject: [PATCH 1/2] opkg_cmd: only look at conffile status if we're going to
- output it
-
-The loop to compare the recorded conffile hash with their hash on disk is
-outputted at level INFO but the loop was executed at level NOTICE and higher.
-
-This means that if a conffile had been deleted the status operation would
-produce error messages for output it isn't displaying.
-
-Signed-off-by: Ross Burton <ross.burton@intel.com>
----
- libopkg/opkg_cmd.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libopkg/opkg_cmd.c b/libopkg/opkg_cmd.c
-index ba57c6a..37416fd 100644
---- a/libopkg/opkg_cmd.c
-+++ b/libopkg/opkg_cmd.c
-@@ -638,7 +638,7 @@ static int opkg_info_status_cmd(int argc, char **argv, int installed_only)
- 
-         pkg_formatted_info(stdout, pkg);
- 
--        if (opkg_config->verbosity >= NOTICE) {
-+        if (opkg_config->verbosity >= INFO) {
-             conffile_list_elt_t *iter;
-             for (iter = nv_pair_list_first(&pkg->conffiles); iter;
-                  iter = nv_pair_list_next(&pkg->conffiles, iter)) {
--- 
-2.8.1
-
-From 225e30e0f9fa7cfeaa3f89e2713e5147ab371def Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Tue, 10 Jan 2017 15:28:47 +0000
-Subject: [PATCH 2/2] conffile: gracefully handle deleted conffiles in
- conffile_has_been_modified
-
-Handle conffiles that don't exist gracefully so that instead of showing an error
-message from file_md5sum_alloc() a notice that the file has been deleted is
-shown instead.
-
-Signed-off-by: Ross Burton <ross.burton@intel.com>
----
- libopkg/conffile.c | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/libopkg/conffile.c b/libopkg/conffile.c
-index b2f2469..7b4b87b 100644
---- a/libopkg/conffile.c
-+++ b/libopkg/conffile.c
-@@ -51,6 +51,11 @@ int conffile_has_been_modified(conffile_t * conffile)
-     }
- 
-     root_filename = root_filename_alloc(filename);
-+    if (!file_exists(root_filename)) {
-+        opkg_msg(INFO, "Conffile %s deleted\n", conffile->name);
-+        free(root_filename);
-+        return 1;
-+    }
- 
-     md5sum = file_md5sum_alloc(root_filename);
- 
--- 
-2.8.1
diff --git a/meta/recipes-devtools/opkg/opkg_0.3.4.bb b/meta/recipes-devtools/opkg/opkg_0.3.5.bb
similarity index 93%
rename from meta/recipes-devtools/opkg/opkg_0.3.4.bb
rename to meta/recipes-devtools/opkg/opkg_0.3.5.bb
index a21fde1..3e511b6 100644
--- a/meta/recipes-devtools/opkg/opkg_0.3.4.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.3.5.bb
@@ -15,11 +15,10 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz
            file://opkg-configure.service \
            file://opkg.conf \
            file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch \
-           file://status-conffile.patch \
 "
 
-SRC_URI[md5sum] = "6c52a065499056a196e0b45a27e392de"
-SRC_URI[sha256sum] = "750b900b53b62a9b280b601a196f02da81091eda2f3478c509512aa5a1ec93be"
+SRC_URI[md5sum] = "d202d09ea0932943071b842626cab13c"
+SRC_URI[sha256sum] = "734bc21dea11262113fa86b928d09812618b3966f352350cf916a6ae0d343f32"
 
 inherit autotools pkgconfig systemd
 
-- 
2.7.4




