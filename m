Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1R6YYa-0001Qp-FZ
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Sep 2011 03:58:32 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p8M1rCq5011972
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2011 18:53:12 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 21 Sep 2011 18:53:11 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 21 Sep 2011 20:55:33 -0500
Message-ID: <ad8caef7798471d4c8d93980aef9ae7c2982bffd.1316656491.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1316656491.git.mark.hatle@windriver.com>
References: <cover.1316656491.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 1/6 v2] python: Fix cgi.py runtime issue
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Sep 2011 01:58:32 -0000
Content-Type: text/plain

By default cgi.py attempts to use /usr/local/bin/python as its
interpreter.  However, on my Linux systems, including OE-Core,
python is installed into {bindir}.  Adjust this one file based on
the comment at the top of the upstream file.

This resolves an issue where a runtime dependency discovered during
RPM packaging breaks the rootfs construction.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-devtools/python/python/cgi_py.patch |   23 ++++++++++++++++++++++
 meta/recipes-devtools/python/python_2.6.6.bb     |    3 +-
 2 files changed, 25 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python/cgi_py.patch

diff --git a/meta/recipes-devtools/python/python/cgi_py.patch b/meta/recipes-devtools/python/python/cgi_py.patch
new file mode 100644
index 0000000..de504f9
--- /dev/null
+++ b/meta/recipes-devtools/python/python/cgi_py.patch
@@ -0,0 +1,23 @@
+Lib/cgi.py: Update the script as mentioned in the comment
+
+Upstream-Status: Inappropriate [distribution]
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+
+--- Python-2.6.6/Lib/cgi.py.orig	2010-08-01 22:14:27.000000000 -0500
++++ Python-2.6.6/Lib/cgi.py	2011-09-21 15:28:40.478208631 -0500
+@@ -1,13 +1,4 @@
+-#! /usr/local/bin/python
+-
+-# NOTE: the above "/usr/local/bin/python" is NOT a mistake.  It is
+-# intentionally NOT "/usr/bin/env python".  On many systems
+-# (e.g. Solaris), /usr/local/bin is not in $PATH as passed to CGI
+-# scripts, and /usr/local/bin is the default directory where Python is
+-# installed, so /usr/bin/env would be unable to find python.  Granted,
+-# binary installations by Linux vendors often install Python in
+-# /usr/bin.  So let those vendors patch cgi.py to match their choice
+-# of installation.
++#! /usr/bin/env python
+ 
+ """Support module for CGI (Common Gateway Interface) scripts.
+ 
diff --git a/meta/recipes-devtools/python/python_2.6.6.bb b/meta/recipes-devtools/python/python_2.6.6.bb
index c9c1a13..aa7ec3c 100644
--- a/meta/recipes-devtools/python/python_2.6.6.bb
+++ b/meta/recipes-devtools/python/python_2.6.6.bb
@@ -1,7 +1,7 @@
 require python.inc
 DEPENDS = "python-native db gdbm openssl readline sqlite3 zlib"
 DEPENDS_sharprom = "python-native db readline zlib gdbm openssl"
-PR = "${INC_PR}.9"
+PR = "${INC_PR}.10"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=38fdd546420fab09ac6bd3d8a1c83eb6"
 
 DISTRO_SRC_URI ?= "file://sitecustomize.py"
@@ -20,6 +20,7 @@ SRC_URI = "\
   ${DISTRO_SRC_URI} \
   file://multilib.patch \
   file://security_issue_2254_fix.patch \
+  file://cgi_py.patch \
 "
 
 SRC_URI[md5sum] = "cf4e6881bb84a7ce6089e4a307f71f14"
-- 
1.7.3.4



