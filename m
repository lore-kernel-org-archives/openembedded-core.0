Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Tfw53-0008JA-8Q
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 18:14:50 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qB4H0QSQ026341
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Dec 2012 09:00:26 -0800 (PST)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Tue, 4 Dec 2012 09:00:25 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 4 Dec 2012 11:14:45 -0600
Message-ID: <cedeb53fe7db724f81c0e8624885ef36ded46d28.1354641032.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1354641032.git.mark.hatle@windriver.com>
References: <cover.1354641032.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 13/22] python-smartpm: fix package metadata not being read from rpm-md feeds
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Dec 2012 17:15:08 -0000
Content-Type: text/plain

From: Paul Eggleton <paul.eggleton@linux.intel.com>

The XML indexes in rpm-md were being parsed incorrectly leading to the
package metadata (e.g. dependencies) not being read.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../python/python-smartpm/smart-rpm-md-parse.patch |   26 ++++++++++++++++++++
 .../python/python-smartpm_1.4.1.bb                 |    3 +-
 2 files changed, 28 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python-smartpm/smart-rpm-md-parse.patch

diff --git a/meta/recipes-devtools/python/python-smartpm/smart-rpm-md-parse.patch b/meta/recipes-devtools/python/python-smartpm/smart-rpm-md-parse.patch
new file mode 100644
index 0000000..97cecc1
--- /dev/null
+++ b/meta/recipes-devtools/python/python-smartpm/smart-rpm-md-parse.patch
@@ -0,0 +1,26 @@
+backends/rpm: fix parsing of rpm-md metadata
+
+If assertions are disabled then the queue.pop() wasn't being executed,
+leading to requires, recommends etc. not being read properly.
+
+Upstream-Status: Pending
+
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+
+diff --git a/smart/backends/rpm/metadata.py b/smart/backends/rpm/metadata.py
+index 2c54f39..dc9df22 100644
+--- a/smart/backends/rpm/metadata.py
++++ b/smart/backends/rpm/metadata.py
+@@ -188,7 +188,8 @@ class RPMMetaDataLoader(Loader):
+ 
+             elif event == "end":
+ 
+-                assert queue.pop() is elem
++                popped = queue.pop()
++                assert popped is elem
+ 
+                 if skip:
+                     if tag == skip:
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-devtools/python/python-smartpm_1.4.1.bb b/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
index ff153a7..2d0f7cd 100644
--- a/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
+++ b/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
@@ -11,7 +11,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=393a5ca445f6965873eca0259a17f833"
 
 DEPENDS = "python rpm"
-PR = "r1"
+PR = "r2"
 SRCNAME = "smart"
 
 SRC_URI = "\
@@ -19,6 +19,7 @@ SRC_URI = "\
           file://smartpm-rpm5-nodig.patch \
           file://smart-rpm-root.patch \
           file://smart-recommends.patch \
+          file://smart-rpm-md-parse.patch \
           "
 
 SRC_URI[md5sum] = "573ef32ba177a6b3c4bf7ef04873fcb6"
-- 
1.7.3.4



