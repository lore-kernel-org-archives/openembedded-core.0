Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1TCEN2-00042h-1E
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Sep 2012 20:42:36 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q8DIU1mO020800
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2012 11:30:01 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.64) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Thu, 13 Sep 2012 11:30:00 -0700
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 13 Sep 2012 13:29:59 -0500
Message-ID: <82333322e10699bb82f724f14c906d2eabbb60a2.1347559925.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1347559925.git.peter.seebach@windriver.com>
References: <cover.1347559925.git.peter.seebach@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] pseudo_1.4.1.bb: update to pseudo 1.4.1, fixing 32-bit host problems
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
X-List-Received-Date: Thu, 13 Sep 2012 18:42:36 -0000
Content-Type: text/plain

There were a number of cases where pseudo used plain old stat()
to get dev/inode data for files; on 32-bit hosts, this could fail
if the files were over 2GB, causing pseudo to prevent removing of
large files. This is fixed in 1.4.1.

Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
---
 meta/recipes-devtools/pseudo/pseudo_1.4.1.bb |    8 ++++++++
 meta/recipes-devtools/pseudo/pseudo_1.4.bb   |    8 --------
 meta/recipes-devtools/pseudo/pseudo_git.bb   |    6 +++---
 3 files changed, 11 insertions(+), 11 deletions(-)
 create mode 100644 meta/recipes-devtools/pseudo/pseudo_1.4.1.bb
 delete mode 100644 meta/recipes-devtools/pseudo/pseudo_1.4.bb

diff --git a/meta/recipes-devtools/pseudo/pseudo_1.4.1.bb b/meta/recipes-devtools/pseudo/pseudo_1.4.1.bb
new file mode 100644
index 0000000..70fe9c0
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/pseudo_1.4.1.bb
@@ -0,0 +1,8 @@
+require pseudo.inc
+
+PR = "r13"
+
+SRC_URI = "http://www.yoctoproject.org/downloads/${BPN}/${BPN}-${PV}.tar.bz2"
+
+SRC_URI[md5sum] = "b49bb87c7e1de33f37fea479ddb99dca"
+SRC_URI[sha256sum] = "ae4bfba2bd1e3954ea8f83bf06571ee4958bf7623e4fa897056281dddfe6446d"
diff --git a/meta/recipes-devtools/pseudo/pseudo_1.4.bb b/meta/recipes-devtools/pseudo/pseudo_1.4.bb
deleted file mode 100644
index e1e1f6f..0000000
--- a/meta/recipes-devtools/pseudo/pseudo_1.4.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require pseudo.inc
-
-PR = "r12"
-
-SRC_URI = "http://www.yoctoproject.org/downloads/${BPN}/${BPN}-${PV}.tar.bz2"
-
-SRC_URI[md5sum] = "bc04c6c9d13cfdb789ffc2f3cca9ab08"
-SRC_URI[sha256sum] = "147fa7b177061a145d330b9e159529a185be94550f123c6acb0d3b75d480c5b4"
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 27ae4b2..e394ffb 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -1,8 +1,8 @@
 require pseudo.inc
 
-SRCREV = "9b792e4cb91bc22374f47d0b0902dbc4ecd7d6dd"
-PV = "1.4+git${SRCPV}"
-PR = "r27"
+SRCREV = "398a264490713c912b4ce465251a8a82a7905f45"
+PV = "1.4.1+git${SRCPV}"
+PR = "r28"
 
 DEFAULT_PREFERENCE = "-1"
 
-- 
1.7.0.4



