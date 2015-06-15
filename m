Return-Path: <changhyeok.bae@lge.com>
Received: from lgeamrelo04.lge.com (lgeamrelo04.lge.com [156.147.1.127])
	by mail.openembedded.org (Postfix) with ESMTP id 5616B7598B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jun 2015 06:48:53 +0000 (UTC)
Received: from unknown (HELO CHBae0915) (10.177.222.197)
	by 156.147.1.127 with ESMTP; 15 Jun 2015 15:48:53 +0900
X-Original-SENDERIP: 10.177.222.197
X-Original-MAILFROM: changhyeok.bae@lge.com
From: "Changhyeok Bae" <changhyeok.bae@lge.com>
To: <openembedded-core@lists.openembedded.org>
References: <1433826505-23893-1-git-send-email-changhyeok.bae@lge.com>
In-Reply-To: <1433826505-23893-1-git-send-email-changhyeok.bae@lge.com>
Date: Mon, 15 Jun 2015 15:48:56 +0900
Message-ID: <008001d0a737$5a096770$0e1c3650$@lge.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQE5Pu0PBGRk/iwSOoynevCgWOFdWZ7b8M9w
Subject: Re: [PATCH] {python, python3}-native: fix TypeError
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
X-List-Received-Date: Mon, 15 Jun 2015 06:48:58 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: ko

ping

-----Original Message-----
From: Changhyeok Bae [mailto:changhyeok.bae@lge.com] 
Sent: Tuesday, June 09, 2015 2:08 PM
To: openembedded-core@lists.openembedded.org
Cc: Changhyeok Bae
Subject: [OE-Core][PATCH] {python,python3}-native: fix TypeError

g-ir-core in meta-gir is building with python-native.
When the g-ir-core(v1.42.0) is building, following error is occurred.

Error in g-ir-core:
EXEC_PREFIX = os.path.normpath(sys.exec_prefix).replace(
os.getenv("BUILD_SYS"), os.getenv("HOST_SYS") )
| TypeError: expected a character buffer object

Signed-off-by: Changhyeok Bae <changhyeok.bae@lge.com>
---
 ...2-distutils-prefix-is-inside-staging-area.patch |    4 ++--
 .../recipes-devtools/python/python-native_2.7.9.bb |    2 +-
 .../python/python3-native_3.4.3.bb                 |    2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git
a/meta/recipes-devtools/python/python-native/12-distutils-prefix-is-inside-s
taging-area.patch
b/meta/recipes-devtools/python/python-native/12-distutils-prefix-is-inside-s
taging-area.patch
index f89aaff..b9cc4d9 100644
---
a/meta/recipes-devtools/python/python-native/12-distutils-prefix-is-inside-s
taging-area.patch
+++ b/meta/recipes-devtools/python/python-native/12-distutils-prefix-is-
+++ inside-staging-area.patch
@@ -12,8 +12,8 @@ Upstream-Status: Inappropriate [embedded specific]
  # These are needed in a couple of spots, so just compute them once.
 -PREFIX = os.path.normpath(sys.prefix)
 -EXEC_PREFIX = os.path.normpath(sys.exec_prefix)
-+PREFIX = os.path.normpath(sys.prefix).replace( os.getenv("BUILD_SYS"), 
-+os.getenv("HOST_SYS") ) EXEC_PREFIX = 
-+os.path.normpath(sys.exec_prefix).replace( os.getenv("BUILD_SYS"), 
-+os.getenv("HOST_SYS") )
++PREFIX = os.path.normpath(sys.prefix).replace( 
++str(os.getenv("BUILD_SYS")), str(os.getenv("HOST_SYS")) ) EXEC_PREFIX 
++= os.path.normpath(sys.exec_prefix).replace( 
++str(os.getenv("BUILD_SYS")), str(os.getenv("HOST_SYS")) )
  
  # Path to the base directory of the project. On Windows the binary may
  # live in project/PCBuild9.  If we're dealing with an x64 Windows build,
diff --git a/meta/recipes-devtools/python/python-native_2.7.9.bb
b/meta/recipes-devtools/python/python-native_2.7.9.bb
index 34f5c29..5be7bb9 100644
--- a/meta/recipes-devtools/python/python-native_2.7.9.bb
+++ b/meta/recipes-devtools/python/python-native_2.7.9.bb
@@ -2,7 +2,7 @@ require python.inc
 
 EXTRANATIVEPATH += "bzip2-native"
 DEPENDS = "openssl-native bzip2-replacement-native zlib-native
readline-native sqlite3-native"
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 SRC_URI += "\
             file://05-enable-ctypes-cross-build.patch \ diff --git
a/meta/recipes-devtools/python/python3-native_3.4.3.bb
b/meta/recipes-devtools/python/python3-native_3.4.3.bb
index 464ff05..105c0c9 100644
--- a/meta/recipes-devtools/python/python3-native_3.4.3.bb
+++ b/meta/recipes-devtools/python/python3-native_3.4.3.bb
@@ -1,6 +1,6 @@
 require recipes-devtools/python/python.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 PYTHON_MAJMIN = "3.4"
 DISTRO_SRC_URI ?= "file://sitecustomize.py"
 DISTRO_SRC_URI_linuxstdbase = ""
--
1.7.9.5


