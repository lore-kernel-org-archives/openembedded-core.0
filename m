Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 31631606E8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Feb 2015 09:07:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t1C97g9S022687
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Feb 2015 01:07:42 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 12 Feb 2015 01:07:41 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 12 Feb 2015 01:07:35 -0800
Message-ID: <c350ce001e1785f5fe8878cbcf5b5e07417d646a.1423732000.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1423732000.git.liezhi.yang@windriver.com>
References: <cover.1423732000.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/7] libtool: don't execute automake and autoconf on every invocation
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
X-List-Received-Date: Thu, 12 Feb 2015 09:07:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From the origin commit message:
Regression from 2.4.2 was causing noticable slow-down in builds
that call libtool many times.
* build-aux/ltmain.in (func_help): Override func_help() from
gl/build-aux/options-parser to only run automake --version and
autoconf --version when libtool --help is executed on the command
line.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/libtool/libtool-2.4.5.inc    |    1 +
 ...-t-execute-automake-and-autoconf-on-every.patch |   71 ++++++++++++++++++++
 2 files changed, 72 insertions(+)
 create mode 100644 meta/recipes-devtools/libtool/libtool/libtool-don-t-execute-automake-and-autoconf-on-every.patch

diff --git a/meta/recipes-devtools/libtool/libtool-2.4.5.inc b/meta/recipes-devtools/libtool/libtool-2.4.5.inc
index 88e281f..0f6bdc8 100644
--- a/meta/recipes-devtools/libtool/libtool-2.4.5.inc
+++ b/meta/recipes-devtools/libtool/libtool-2.4.5.inc
@@ -19,6 +19,7 @@ SRC_URI = "${GNU_MIRROR}/libtool/libtool-${PV}.tar.gz \
            file://fix-resolve-lt-sysroot.patch \
            file://nohardcodepaths.patch \
            file://unwind-opt-parsing.patch \
+           file://libtool-don-t-execute-automake-and-autoconf-on-every.patch \
           "
 
 SRC_URI[md5sum] = "7d30ed9fa6bb11270ebb31639a37bd54"
diff --git a/meta/recipes-devtools/libtool/libtool/libtool-don-t-execute-automake-and-autoconf-on-every.patch b/meta/recipes-devtools/libtool/libtool/libtool-don-t-execute-automake-and-autoconf-on-every.patch
new file mode 100644
index 0000000..f48f09c
--- /dev/null
+++ b/meta/recipes-devtools/libtool/libtool/libtool-don-t-execute-automake-and-autoconf-on-every.patch
@@ -0,0 +1,71 @@
+From 408cfb9c5fa8a666917167ffb806cb19deded429 Mon Sep 17 00:00:00 2001
+From: "Gary V. Vaughan" <gary@gnu.org>
+Date: Fri, 6 Feb 2015 12:58:34 +0000
+Subject: [PATCH] libtool: don't execute automake and autoconf on every
+ invocation.
+
+Regression from 2.4.2 was causing noticable slow-down in builds
+that call libtool many times.
+* build-aux/ltmain.in (func_help): Override func_help() from
+gl/build-aux/options-parser to only run automake --version and
+autoconf --version when libtool --help is executed on the command
+line.
+* NO-THANKS: Add Robert Yang.
+Reported by Robert Yang
+
+Signed-off-by: Gary V. Vaughan <gary@gnu.org>
+
+Updated: Change NO-THANKS to THANKS to apply the patch since upsream
+renamed it.
+
+Upstream-Stauts: Backport
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+
+---
+ THANKS           |    1 +
+ build-aux/ltmain.in |    9 ++++++++-
+ 2 files changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/THANKS b/THANKS
+index 0ab162d..aa7aa8c 100644
+--- a/THANKS
++++ b/THANKS
+@@ -258,6 +258,7 @@ Robert Garron                       Robert.Garron@Access3000.net
+ Robert Millan                       rmh@aybabtu.com
+ Robert Ögren                        lists@roboros.com
+ Roberto Bagnara                     bagnara@cs.unipr.it
++Robert Yang                         liezhi.yang@windriver.com
+ Roger Cornelius                     rac@tenzing.org
+ Roland Mainz                        roland.mainz@nrubsig.org
+ Roumen Petrov                       bugtrack@roumenpetrov.info
+diff --git a/build-aux/ltmain.in b/build-aux/ltmain.in
+index 46a0bb5..d5cf07a 100644
+--- a/build-aux/ltmain.in
++++ b/build-aux/ltmain.in
+@@ -127,7 +127,12 @@ usage_message="Options:
+ "
+ 
+ # Additional text appended to 'usage_message' in response to '--help'.
+-long_help_message=$long_help_message"
++func_help ()
++{
++    $debug_cmd
++
++    func_usage_message
++    $ECHO "$long_help_message
+ 
+ MODE must be one of the following:
+ 
+@@ -158,6 +163,8 @@ include the following information:
+ Report bugs to <@PACKAGE_BUGREPORT@>.
+ GNU @PACKAGE@ home page: <@PACKAGE_URL@>.
+ General help using GNU software: <http://www.gnu.org/gethelp/>."
++    exit 0
++}
+ 
+ 
+ # func_lo2o OBJECT-NAME
+-- 
+1.7.9.5
+
-- 
1.7.9.5


