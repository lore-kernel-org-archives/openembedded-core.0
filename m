Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by mx.groups.io with SMTP id smtpd.web11.7104.1605779011820187920
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2020 01:43:32 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.151, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: q+Pzi5Y6JAjsHBsM31zNb+agliWF2/Tj17m2jGC0dM1jCWL9BXYe5oIWdI+QjgY8IjKdP7wM//
 2bbn3jx0+RqA==
X-IronPort-AV: E=McAfee;i="6000,8403,9809"; a="151109743"
X-IronPort-AV: E=Sophos;i="5.77,490,1596524400"; 
   d="scan'208";a="151109743"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2020 01:43:30 -0800
IronPort-SDR: U6uPLm9enj7wKMHcTQs9MSQCG9MJjdnDu0i0S+8wJ0qgg88iM53Gh5brjj4QocVPLT1367zLB+
 MiGblX6bK3HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,490,1596524400"; 
   d="scan'208";a="311010152"
Received: from unknown (HELO guest1-ubuntu1804.png.intel.com) ([10.221.183.51])
  by fmsmga008.fm.intel.com with ESMTP; 19 Nov 2020 01:43:30 -0800
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 1/3] libproxy: fix CVE-2020-26154
Date: Thu, 19 Nov 2020 17:43:27 +0800
Message-Id: <20201119094329.37712-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.17.1

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
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
2.17.1

