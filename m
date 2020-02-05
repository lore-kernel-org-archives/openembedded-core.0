Return-Path: <anuj.mittal@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 734886062B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Feb 2020 07:39:51 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Feb 2020 23:39:52 -0800
X-IronPort-AV: E=Sophos;i="5.70,404,1574150400"; d="scan'208";a="220015673"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.221.21.206])
	by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Feb 2020 23:39:51 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Feb 2020 15:39:37 +0800
Message-Id: <20200205073938.38227-2-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200205073938.38227-1-anuj.mittal@intel.com>
References: <20200205073938.38227-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [zeus][PATCH 2/3] curl: fix CVE-2019-15601
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
X-List-Received-Date: Wed, 05 Feb 2020 07:39:51 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../curl/curl/CVE-2019-15601.patch            | 46 +++++++++++++++++++
 meta/recipes-support/curl/curl_7.66.0.bb      |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2019-15601.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2019-15601.patch b/meta/recipes-support/curl/curl/CVE-2019-15601.patch
new file mode 100644
index 0000000000..7bfaae7b21
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2019-15601.patch
@@ -0,0 +1,46 @@
+Upstream-Status: Backport [https://github.com/curl/curl/commit/1b71bc532bde8621fd3260843f8197182a467ff2]
+CVE: CVE-2019-15601
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+
+From 1b71bc532bde8621fd3260843f8197182a467ff2 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Thu, 7 Nov 2019 10:13:01 +0100
+Subject: [PATCH] file: on Windows, refuse paths that start with \\
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+... as that might cause an unexpected SMB connection to a given host
+name.
+
+Reported-by: Fernando Muñoz
+CVE-2019-15601
+Bug: https://curl.haxx.se/docs/CVE-2019-15601.html
+---
+ lib/file.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/lib/file.c b/lib/file.c
+index d349cd9241..166931d7f1 100644
+--- a/lib/file.c
++++ b/lib/file.c
+@@ -136,7 +136,7 @@ static CURLcode file_connect(struct connectdata *conn, bool *done)
+   struct Curl_easy *data = conn->data;
+   char *real_path;
+   struct FILEPROTO *file = data->req.protop;
+-  int fd;
++  int fd = -1;
+ #ifdef DOS_FILESYSTEM
+   size_t i;
+   char *actual_path;
+@@ -181,7 +181,9 @@ static CURLcode file_connect(struct connectdata *conn, bool *done)
+       return CURLE_URL_MALFORMAT;
+     }
+ 
+-  fd = open_readonly(actual_path, O_RDONLY|O_BINARY);
++  if(strncmp("\\\\", actual_path, 2))
++    /* refuse to open path that starts with two backslashes */
++    fd = open_readonly(actual_path, O_RDONLY|O_BINARY);
+   file->path = actual_path;
+ #else
+   if(memchr(real_path, 0, real_path_len)) {
diff --git a/meta/recipes-support/curl/curl_7.66.0.bb b/meta/recipes-support/curl/curl_7.66.0.bb
index d1975f2460..a54e0536e9 100644
--- a/meta/recipes-support/curl/curl_7.66.0.bb
+++ b/meta/recipes-support/curl/curl_7.66.0.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=be5d9e1419c4363f4b32037a2d3b7ffa"
 
 SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://0001-replace-krb5-config-with-pkg-config.patch \
+           file://CVE-2019-15601.patch \
 "
 
 SRC_URI[md5sum] = "c238aa394e3aa47ca4fcb0491774149f"
-- 
2.24.1


