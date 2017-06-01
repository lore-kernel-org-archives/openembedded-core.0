Return-Path: <Dengke.Du@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3A0C777CEC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jun 2017 09:38:51 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v519cqUn023998
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Jun 2017 02:38:53 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 1 Jun 2017 02:38:52 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 1 Jun 2017 05:38:42 -0400
Message-ID: <2e58303955baf2a28aefdcab16c24f20fb0686f8.1496309470.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1496309470.git.dengke.du@windriver.com>
References: <cover.1496309470.git.dengke.du@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] dropbear: upgrade 2016.74 -> 2017.75
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
X-List-Received-Date: Thu, 01 Jun 2017 09:38:52 -0000
Content-Type: text/plain

Drop patch support-out-of-tree-builds.patch:

    Because the upstream has already contain it.

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 .../dropbear/support-out-of-tree-builds.patch      | 43 ----------------------
 meta/recipes-core/dropbear/dropbear_2016.74.bb     |  7 ----
 meta/recipes-core/dropbear/dropbear_2017.75.bb     |  5 +++
 3 files changed, 5 insertions(+), 50 deletions(-)
 delete mode 100644 meta/recipes-core/dropbear/dropbear/support-out-of-tree-builds.patch
 delete mode 100644 meta/recipes-core/dropbear/dropbear_2016.74.bb
 create mode 100644 meta/recipes-core/dropbear/dropbear_2017.75.bb

diff --git a/meta/recipes-core/dropbear/dropbear/support-out-of-tree-builds.patch b/meta/recipes-core/dropbear/dropbear/support-out-of-tree-builds.patch
deleted file mode 100644
index df6efb4..0000000
--- a/meta/recipes-core/dropbear/dropbear/support-out-of-tree-builds.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From: =?UTF-8?q?Henrik=20Nordstr=C3=B6m?= <henrik@knc.nu>
-Date: Wed, 11 May 2016 12:35:06 +0200
-Subject: [PATCH] Support out-of-tree builds usign bundled libtom
-
-When building out-of-tree we need both source and generated
-folders in include paths to find both distributed and generated
-headers.
-
-
-
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Upstream-Status: Backport
----
- libtomcrypt/Makefile.in | 2 +-
- libtommath/Makefile.in  | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/libtomcrypt/Makefile.in b/libtomcrypt/Makefile.in
-index 3056ef0..7970700 100644
---- a/libtomcrypt/Makefile.in
-+++ b/libtomcrypt/Makefile.in
-@@ -19,7 +19,7 @@ srcdir=@srcdir@
- 
- # Compilation flags. Note the += does not write over the user's CFLAGS!
- # The rest of the flags come from the parent Dropbear makefile
--CFLAGS += -c -I$(srcdir)/src/headers/ -I$(srcdir)/../ -DLTC_SOURCE -I$(srcdir)/../libtommath/
-+CFLAGS += -c -Isrc/headers/ -I$(srcdir)/src/headers/ -I../ -I$(srcdir)/../ -DLTC_SOURCE -I../libtommath/ -I$(srcdir)/../libtommath/
- 
- # additional warnings (newer GCC 3.4 and higher)
- ifdef GCC_34
-diff --git a/libtommath/Makefile.in b/libtommath/Makefile.in
-index 06aba68..019c50b 100644
---- a/libtommath/Makefile.in
-+++ b/libtommath/Makefile.in
-@@ -9,7 +9,7 @@ VPATH=@srcdir@
- srcdir=@srcdir@
- 
- # So that libtommath can include Dropbear headers for options and m_burn()
--CFLAGS += -I$(srcdir)/../libtomcrypt/src/headers/ -I$(srcdir)/../
-+CFLAGS += -I. -I$(srcdir) -I../libtomcrypt/src/headers/ -I$(srcdir)/../libtomcrypt/src/headers/ -I../ -I$(srcdir)/../
- 
- ifndef IGNORE_SPEED
- 
diff --git a/meta/recipes-core/dropbear/dropbear_2016.74.bb b/meta/recipes-core/dropbear/dropbear_2016.74.bb
deleted file mode 100644
index a702097..0000000
--- a/meta/recipes-core/dropbear/dropbear_2016.74.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require dropbear.inc
-
-SRC_URI += "file://support-out-of-tree-builds.patch"
-
-SRC_URI[md5sum] = "9ad0172731e0f16623937804643b5bd8"
-SRC_URI[sha256sum] = "2720ea54ed009af812701bcc290a2a601d5c107d12993e5d92c0f5f81f718891"
-
diff --git a/meta/recipes-core/dropbear/dropbear_2017.75.bb b/meta/recipes-core/dropbear/dropbear_2017.75.bb
new file mode 100644
index 0000000..cfb0d19
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear_2017.75.bb
@@ -0,0 +1,5 @@
+require dropbear.inc
+
+SRC_URI[md5sum] = "e57e9b9d25705dcb073ba15c416424fd"
+SRC_URI[sha256sum] = "6cbc1dcb1c9709d226dff669e5604172a18cf5dbf9a201474d5618ae4465098c"
+
-- 
2.8.1


