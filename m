Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F3F1B6C8BD
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Mar 2014 09:18:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s259IbXj016243
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Mar 2014 01:18:37 -0800 (PST)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Wed, 5 Mar 2014 01:18:37 -0800
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 5 Mar 2014 17:18:34 +0800
Message-ID: <c00e7a2047ec6a4b4f46722f49176b08ded90509.1394010463.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1394010463.git.Chong.Lu@windriver.com>
References: <cover.1394010463.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] flex: not to build shared libraries
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
X-List-Received-Date: Wed, 05 Mar 2014 09:18:38 -0000
Content-Type: text/plain

Some packages do not link successfully using shared libraries.
When link something to libfl.so, we will get this:

	libfl.so: undefined reference to `yylex'

So we only build static libraries to fix this issue.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 .../files/flex-not-to-build-shared-libraries.patch | 39 ++++++++++++++++++++++
 meta/recipes-devtools/flex/flex.inc                |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-devtools/flex/files/flex-not-to-build-shared-libraries.patch

diff --git a/meta/recipes-devtools/flex/files/flex-not-to-build-shared-libraries.patch b/meta/recipes-devtools/flex/files/flex-not-to-build-shared-libraries.patch
new file mode 100644
index 0000000..a50569f
--- /dev/null
+++ b/meta/recipes-devtools/flex/files/flex-not-to-build-shared-libraries.patch
@@ -0,0 +1,39 @@
+flex: not to build shared libraries
+
+Some packages do not link successfully using shared libraries.
+When link something to libfl.so, we will get this:
+
+	libfl.so: undefined reference to `yylex'
+
+So we only build static libraries to fix this issue.
+
+Upstream-Status: Pending
+
+Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
+---
+ Makefile.am |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 1f90356..f3638aa 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -73,13 +73,13 @@ libfl_la_SOURCES = \
+ 	libmain.c \
+ 	libyywrap.c
+ 
+-libfl_la_LDFLAGS = -no-undefined -version-info @SHARED_VERSION_INFO@
++libfl_la_LDFLAGS = -all-static -no-undefined -version-info @SHARED_VERSION_INFO@
+ 
+ libfl_pic_la_SOURCES = \
+ 	libmain.c \
+ 	libyywrap.c
+ 
+-libfl_pic_la_LDFLAGS = -no-undefined -version-info @SHARED_VERSION_INFO@
++libfl_pic_la_LDFLAGS = -all-static -no-undefined -version-info @SHARED_VERSION_INFO@
+ 
+ noinst_HEADERS = \
+ 	flexdef.h \
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-devtools/flex/flex.inc b/meta/recipes-devtools/flex/flex.inc
index 75c10ef..616f4d7 100644
--- a/meta/recipes-devtools/flex/flex.inc
+++ b/meta/recipes-devtools/flex/flex.inc
@@ -7,6 +7,7 @@ SECTION = "devel"
 LICENSE = "BSD"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/flex/flex-${PV}.tar.bz2 \
+           file://flex-not-to-build-shared-libraries.patch \
            file://run-ptest \
 "
 
-- 
1.8.1.2


