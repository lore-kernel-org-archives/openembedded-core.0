Received: from mga07.intel.com (mga07.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.36702.1606144038537265324
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2020 07:07:32 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: SvrPfZdq1YaKq59FxNbnR6g5KJucY5AgN/fGrhhdNXXdnptH5HVUAln8wZZnQVq1ELxbBxfa1Y
 /FJRHW4U6oLw==
X-IronPort-AV: E=McAfee;i="6000,8403,9813"; a="235920763"
X-IronPort-AV: E=Sophos;i="5.78,363,1599548400"; 
   d="scan'208";a="235920763"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2020 07:07:31 -0800
IronPort-SDR: 64hYpvw4LCz5XuJ5QJT0ppyZMOq2NR7CsIdQbMACdD2hE9Qbk/Anl38HxAyrV3HI2QGCNM+qg+
 1bkM0Napqj6w==
X-IronPort-AV: E=Sophos;i="5.78,363,1599548400"; 
   d="scan'208";a="361475243"
Received: from kpteh-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.244.15])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2020 07:07:30 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 19/21] libproxy: fix CVE-2020-26154
Date: Mon, 23 Nov 2020 23:06:49 +0800
Message-Id: <af85169a4dfb2fc4dc820409eb4a7756dc14e894.1606111370.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1606111370.git.anuj.mittal@intel.com>
References: <cover.1606111370.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../libproxy/libproxy/CVE-2020-26154.patch    | 98 +++++++++++++++++++
 .../libproxy/libproxy_0.4.15.bb               |  1 +
 2 files changed, 99 insertions(+)
 create mode 100644 meta/recipes-support/libproxy/libproxy/CVE-2020-26154.patch

diff --git a/meta/recipes-support/libproxy/libproxy/CVE-2020-26154.patch b/meta/recipes-support/libproxy/libproxy/CVE-2020-26154.patch
new file mode 100644
index 0000000000..0ccb99da81
--- /dev/null
+++ b/meta/recipes-support/libproxy/libproxy/CVE-2020-26154.patch
@@ -0,0 +1,98 @@
+From 4411b523545b22022b4be7d0cac25aa170ae1d3e Mon Sep 17 00:00:00 2001
+From: Fei Li <lifeibiren@gmail.com>
+Date: Fri, 17 Jul 2020 02:18:37 +0800
+Subject: [PATCH] Fix buffer overflow when PAC is enabled
+
+The bug was found on Windows 10 (MINGW64) when PAC is enabled. It turned
+out to be the large PAC file (more than 102400 bytes) returned by a
+local proxy program with no content-length present.
+
+Upstream-Status: Backport [https://github.com/libproxy/libproxy/commit/6d342b50366a048d3d543952e2be271b5742c5f8]
+CVE: CVE-2020-26154
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+
+---
+ libproxy/url.cpp | 44 +++++++++++++++++++++++++++++++-------------
+ 1 file changed, 31 insertions(+), 13 deletions(-)
+
+diff --git a/libproxy/url.cpp b/libproxy/url.cpp
+index ee776b2..8684086 100644
+--- a/libproxy/url.cpp
++++ b/libproxy/url.cpp
+@@ -54,7 +54,7 @@ using namespace std;
+ #define PAC_MIME_TYPE_FB "text/plain"
+ 
+ // This is the maximum pac size (to avoid memory attacks)
+-#define PAC_MAX_SIZE 102400
++#define PAC_MAX_SIZE 0x800000
+ // This is the default block size to use when receiving via HTTP
+ #define PAC_HTTP_BLOCK_SIZE 512
+ 
+@@ -478,15 +478,13 @@ char* url::get_pac() {
+ 		}
+ 
+ 		// Get content
+-		unsigned int recvd = 0;
+-		buffer = new char[PAC_MAX_SIZE];
+-		memset(buffer, 0, PAC_MAX_SIZE);
++		std::vector<char> dynamic_buffer;
+ 		do {
+ 			unsigned int chunk_length;
+ 
+ 			if (chunked) {
+ 				// Discard the empty line if we received a previous chunk
+-				if (recvd > 0) recvline(sock);
++				if (!dynamic_buffer.empty()) recvline(sock);
+ 
+ 				// Get the chunk-length line as an integer
+ 				if (sscanf(recvline(sock).c_str(), "%x", &chunk_length) != 1 || chunk_length == 0) break;
+@@ -498,21 +496,41 @@ char* url::get_pac() {
+ 
+ 			if (content_length >= PAC_MAX_SIZE) break;
+ 
+-			while (content_length == 0 || recvd != content_length) {
+-				int r = recv(sock, buffer + recvd,
+-				             content_length == 0 ? PAC_HTTP_BLOCK_SIZE
+-				                                 : content_length - recvd, 0);
++			while (content_length == 0 || dynamic_buffer.size() != content_length) {
++				// Calculate length to recv
++				unsigned int length_to_read = PAC_HTTP_BLOCK_SIZE;
++				if (content_length > 0)
++					length_to_read = content_length - dynamic_buffer.size();
++
++				// Prepare buffer
++				dynamic_buffer.resize(dynamic_buffer.size() + length_to_read);
++
++				int r = recv(sock, dynamic_buffer.data() + dynamic_buffer.size() - length_to_read, length_to_read, 0);
++
++				// Shrink buffer to fit
++				if (r >= 0)
++					dynamic_buffer.resize(dynamic_buffer.size() - length_to_read + r);
++
++				// PAC size too large, discard
++				if (dynamic_buffer.size() >= PAC_MAX_SIZE) {
++					chunked = false;
++					dynamic_buffer.clear();
++					break;
++				}
++
+ 				if (r <= 0) {
+ 					chunked = false;
+ 					break;
+ 				}
+-				recvd += r;
+ 			}
+ 		} while (chunked);
+ 
+-		if (content_length != 0 && string(buffer).size() != content_length) {
+-			delete[] buffer;
+-			buffer = NULL;
++		if (content_length == 0 || content_length == dynamic_buffer.size()) {
++			buffer = new char[dynamic_buffer.size() + 1];
++			if (!dynamic_buffer.empty()) {
++				memcpy(buffer, dynamic_buffer.data(), dynamic_buffer.size());
++			}
++			buffer[dynamic_buffer.size()] = '\0';
+ 		}
+ 	}
+ 
diff --git a/meta/recipes-support/libproxy/libproxy_0.4.15.bb b/meta/recipes-support/libproxy/libproxy_0.4.15.bb
index a14c358cc2..6f704d7a91 100644
--- a/meta/recipes-support/libproxy/libproxy_0.4.15.bb
+++ b/meta/recipes-support/libproxy/libproxy_0.4.15.bb
@@ -11,6 +11,7 @@ DEPENDS = "glib-2.0"
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz \
            file://0001-get-pac-test-Fix-build-with-clang-libc.patch \
            file://CVE-2020-25219.patch \
+           file://CVE-2020-26154.patch \
           "
 SRC_URI[md5sum] = "f6b1d2a1e17a99cd3debaae6d04ab152"
 SRC_URI[sha256sum] = "654db464120c9534654590b6683c7fa3887b3dad0ca1c4cd412af24fbfca6d4f"
-- 
2.28.0

