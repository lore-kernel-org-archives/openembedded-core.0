Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Tfw59-0008KA-TL
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 18:15:09 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qB4H0THw026347
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Dec 2012 09:00:29 -0800 (PST)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Tue, 4 Dec 2012 09:00:28 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 4 Dec 2012 11:14:49 -0600
Message-ID: <5af457657b7e5af1cf00a8355615a8153f43e50e.1354641032.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1354641032.git.mark.hatle@windriver.com>
References: <cover.1354641032.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 17/22] python-smartpm: Fix incorrect comparison arguments
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
X-List-Received-Date: Tue, 04 Dec 2012 17:15:12 -0000
Content-Type: text/plain

Built-in provides were not being compared properly within smart.
This was caused by an incorrect argument to the match function.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../python-smartpm/smart-metadata-match.patch      |   28 ++++++++++++++++++++
 .../python/python-smartpm_1.4.1.bb                 |    3 +-
 2 files changed, 30 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python-smartpm/smart-metadata-match.patch

diff --git a/meta/recipes-devtools/python/python-smartpm/smart-metadata-match.patch b/meta/recipes-devtools/python/python-smartpm/smart-metadata-match.patch
new file mode 100644
index 0000000..d06f416
--- /dev/null
+++ b/meta/recipes-devtools/python/python-smartpm/smart-metadata-match.patch
@@ -0,0 +1,28 @@
+smart - backends/rmp/metadata.py: Fix incorrect call to the match function
+
+The match function should take three parameters, name, comparison, version...
+The original code was passing it a reference to the object holding the data
+instead, which caused the comparison in match to always fail.
+
+Upstream-Status: Pending
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+
+--- a/smart/backends/rpm/metadata.py
++++ b/smart/backends/rpm/metadata.py
+@@ -332,13 +332,13 @@
+                     reqargs = [x for x in reqdict
+                                if not ((x[2] is None or "=" in x[2]) and
+                                        (RPMProvides, x[1], x[3]) in prvdict or
+-                                       system_provides.match(*x[:3]))]
++                                       system_provides.match(x[1], x[2], x[3]))]
+                     reqargs = collapse_libc_requires(reqargs)
+ 
+                     recargs = [x for x in recdict
+                                if not ((x[2] is None or "=" in x[2]) and
+                                        (RPMProvides, x[1], x[3]) in prvdict or
+-                                       system_provides.match(*x[:3]))]
++                                       system_provides.match(x[1], x[2], x[3]))]
+ 
+                     prvargs = prvdict.keys()
+                     cnfargs = cnfdict.keys()
diff --git a/meta/recipes-devtools/python/python-smartpm_1.4.1.bb b/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
index 4694d51..bbaa530 100644
--- a/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
+++ b/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
@@ -11,7 +11,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=393a5ca445f6965873eca0259a17f833"
 
 DEPENDS = "python rpm"
-PR = "r2"
+PR = "r3"
 SRCNAME = "smart"
 
 SRC_URI = "\
@@ -23,6 +23,7 @@ SRC_URI = "\
           file://smart-dflags.patch \
           file://smart-rpm-md-parse.patch \
           file://smart-tmpdir.patch \
+          file://smart-metadata-match.patch \
           "
 
 SRC_URI[md5sum] = "573ef32ba177a6b3c4bf7ef04873fcb6"
-- 
1.7.3.4



