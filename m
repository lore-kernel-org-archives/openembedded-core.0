Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5D44873430
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Feb 2015 08:15:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t1D8Fcnj022780
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Feb 2015 00:15:38 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 13 Feb 2015 00:15:38 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Feb 2015 00:15:29 -0800
Message-ID: <00a56814b14d5c614780b04ac0ca662bbfb30361.1423808841.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1423808841.git.liezhi.yang@windriver.com>
References: <cover.1423808841.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 05/12] mtools: fix and enable parallel build
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
X-List-Received-Date: Fri, 13 Feb 2015 08:15:37 -0000
Content-Type: text/plain

Fixed do_install error:
mkdir: cannot create directory `/path/to/image/usr': File exists
mkdir: cannot create directory `/path/to/image/usr/share': File exists

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/mtools/mtools_3.9.9.bb  |    8 ++++++--
 meta/recipes-devtools/mtools/mtools_4.0.18.bb |    8 ++++++--
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/mtools/mtools_3.9.9.bb b/meta/recipes-devtools/mtools/mtools_3.9.9.bb
index f6dd336..9cd1c57 100644
--- a/meta/recipes-devtools/mtools/mtools_3.9.9.bb
+++ b/meta/recipes-devtools/mtools/mtools_3.9.9.bb
@@ -44,6 +44,10 @@ inherit autotools texinfo
 
 EXTRA_OECONF = "--without-x"
 
-PARALLEL_MAKEINST = ""
-
 BBCLASSEXTEND = "native nativesdk"
+
+do_install_prepend () {
+    # Create bindir to fix parallel installation issues
+    mkdir -p ${D}/${bindir}
+    mkdir -p ${D}/${datadir}
+}
diff --git a/meta/recipes-devtools/mtools/mtools_4.0.18.bb b/meta/recipes-devtools/mtools/mtools_4.0.18.bb
index 6c71f0a..b2cfe9a 100644
--- a/meta/recipes-devtools/mtools/mtools_4.0.18.bb
+++ b/meta/recipes-devtools/mtools/mtools_4.0.18.bb
@@ -35,6 +35,10 @@ inherit autotools texinfo
 
 EXTRA_OECONF = "--without-x"
 
-PARALLEL_MAKEINST = ""
-
 BBCLASSEXTEND = "native nativesdk"
+
+do_install_prepend () {
+    # Create bindir to fix parallel installation issues
+    mkdir -p ${D}/${bindir}
+    mkdir -p ${D}/${datadir}
+}
-- 
1.7.9.5


