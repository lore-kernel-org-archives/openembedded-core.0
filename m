Return-Path: <tgamblin@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 00FCA7E5FB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 12:55:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id x9GCsx0Z023591
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 05:54:59 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Wed, 16 Oct 2019 05:54:59 -0700
Received: by ala-lpggp2.wrs.com (Postfix, from userid 20958)	id 4D9ABC610F8;
	Wed, 16 Oct 2019 05:54:59 -0700 (PDT)
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 16 Oct 2019 05:54:56 -0700
Message-ID: <20191016125456.49624-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [zeus][PATCH] aspell: fix CVE-2019-17544
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
X-List-Received-Date: Wed, 16 Oct 2019 12:55:02 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Backport CVE-2019-17544 fix to zeus.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 ...1-Fix-various-bugs-found-by-OSS-Fuze.patch | 56 +++++++++++++++++++
 meta/recipes-support/aspell/aspell_0.60.7.bb  |  4 +-
 2 files changed, 59 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/aspell/aspell/0001-Fix-various-bugs-found-by-OSS-Fuze.patch

diff --git a/meta/recipes-support/aspell/aspell/0001-Fix-various-bugs-found-by-OSS-Fuze.patch b/meta/recipes-support/aspell/aspell/0001-Fix-various-bugs-found-by-OSS-Fuze.patch
new file mode 100644
index 0000000000..259075b37c
--- /dev/null
+++ b/meta/recipes-support/aspell/aspell/0001-Fix-various-bugs-found-by-OSS-Fuze.patch
@@ -0,0 +1,56 @@
+From 80fa26c74279fced8d778351cff19d1d8f44fe4e Mon Sep 17 00:00:00 2001
+From: Kevin Atkinson <kevina@gnu.org>
+Date: Sun, 4 Aug 2019 04:20:29 -0400
+Subject: [PATCH] Fix various bugs found by OSS-Fuze.
+
+---
+ common/config.cpp    | 2 +-
+ common/file_util.cpp | 1 +
+ common/getdata.cpp   | 2 +-
+ 3 files changed, 3 insertions(+), 2 deletions(-)
+
+Upstream-Status: Backport [https://github.com/GNUAspell/aspell/commit/80fa26c74279fced8d778351cff19d1d8f44fe4e]
+CVE: CVE-2019-17544
+Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
+
+diff --git a/common/config.cpp b/common/config.cpp
+index 017e741..e117d3c 100644
+--- a/common/config.cpp
++++ b/common/config.cpp
+@@ -763,7 +763,7 @@ namespace acommon {
+       }
+       res.append(':');
+     }
+-    if (res.back() == ':') res.pop_back();
++    if (!res.empty() && res.back() == ':') res.pop_back();
+   }
+ 
+   struct ListAddHelper : public AddableContainer 
+diff --git a/common/file_util.cpp b/common/file_util.cpp
+index 8515832..56ea501 100644
+--- a/common/file_util.cpp
++++ b/common/file_util.cpp
+@@ -181,6 +181,7 @@ namespace acommon {
+     while ( (dir = els.next()) != 0 ) 
+     {
+       path = dir;
++      if (path.empty()) continue;
+       if (path.back() != '/') path += '/';
+       unsigned dir_len = path.size();
+       path += filename;
+diff --git a/common/getdata.cpp b/common/getdata.cpp
+index 7e822c9..1b04823 100644
+--- a/common/getdata.cpp
++++ b/common/getdata.cpp
+@@ -64,7 +64,7 @@ namespace acommon {
+   char * unescape(char * dest, const char * src)
+   {
+     while (*src) {
+-      if (*src == '\\') {
++      if (*src == '\\' && src[1]) {
+ 	++src;
+ 	switch (*src) {
+ 	case 'n': *dest = '\n'; break;
+-- 
+2.17.1
+
diff --git a/meta/recipes-support/aspell/aspell_0.60.7.bb b/meta/recipes-support/aspell/aspell_0.60.7.bb
index da99d12630..b565cb3c6e 100644
--- a/meta/recipes-support/aspell/aspell_0.60.7.bb
+++ b/meta/recipes-support/aspell/aspell_0.60.7.bb
@@ -6,7 +6,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
 PR = "r1"
 
-SRC_URI = "${GNU_MIRROR}/aspell/aspell-${PV}.tar.gz"
+SRC_URI = "${GNU_MIRROR}/aspell/aspell-${PV}.tar.gz \
+           file://0001-Fix-various-bugs-found-by-OSS-Fuze.patch \
+          "
 SRC_URI[md5sum] = "8ef2252609c511cd2bb26f3a3932ef28"
 SRC_URI[sha256sum] = "5ca8fc8cb0370cc6c9eb5b64c6d1bc5d57b3750dbf17887726c3407d833b70e4"
 
-- 
2.23.0


