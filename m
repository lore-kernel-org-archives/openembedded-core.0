Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TTfkj-0007kj-D4
	for openembedded-core@lists.openembedded.org;
	Wed, 31 Oct 2012 22:23:09 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q9VL9WhS012411
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Oct 2012 14:09:32 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Wed, 31 Oct 2012 14:09:31 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 31 Oct 2012 16:19:26 -0500
Message-ID: <2af18f94bad2ed1f02d5a14cfbd7b0d3de0966d3.1351718092.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1351718092.git.mark.hatle@windriver.com>
References: <cover.1351718092.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 4/4] python-smartpm: Add basic knowledge of RPMSENSE_MISSINGOK
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
X-List-Received-Date: Wed, 31 Oct 2012 21:23:09 -0000
Content-Type: text/plain

Currently smart does not support recommend dependencies.  Add the first set
of 'support' for RPMSENSE_MISSINGOK (the flag that makes something a
recommend).  This initial support ends up ignoring the recommendation, but is
written in a way that it will be the basis of eventual support.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../python/python-smartpm/smart-missingok.patch    |   43 ++++++++++++++++++++
 .../python/python-smartpm_1.4.1.bb                 |    3 +-
 2 files changed, 45 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python-smartpm/smart-missingok.patch

diff --git a/meta/recipes-devtools/python/python-smartpm/smart-missingok.patch b/meta/recipes-devtools/python/python-smartpm/smart-missingok.patch
new file mode 100644
index 0000000..7e13869
--- /dev/null
+++ b/meta/recipes-devtools/python/python-smartpm/smart-missingok.patch
@@ -0,0 +1,43 @@
+backends/rpm: Identify recommended packages
+
+We identify and store recommended packages (and later throw that data away.)
+
+This is indended to be the starting work to add support for recommended
+packages to smart.
+
+Upstream-status: Inappropriate [ Code isn't finished! ]
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+
+Index: smart-1.4.1/smart/backends/rpm/header.py
+===================================================================
+--- smart-1.4.1.orig/smart/backends/rpm/header.py
++++ smart-1.4.1/smart/backends/rpm/header.py
+@@ -292,6 +292,7 @@ class RPMHeaderLoader(Loader):
+                     f = [0]
+                 elif type(f) != list:
+                     f = [f]
++                recdict = {}
+                 reqdict = {}
+                 for i in range(len(n)):
+                     ni = n[i]
+@@ -308,10 +309,17 @@ class RPMHeaderLoader(Loader):
+                             # RPMSENSE_SCRIPT_PREUN |
+                             # RPMSENSE_SCRIPT_POST |
+                             # RPMSENSE_SCRIPT_POSTUN == 7744
+-                            reqdict[(f[i]&7744 and PreReq or Req,
+-                                     intern(ni), r, vi)] = True
++                            if (f[i]&rpm.RPMSENSE_MISSINGOK):
++                                print "Ignoring Recommend Dependency: %s" % (ni)
++                                recdict[(f[i]&7744 and PreReq or Req,
++                                         intern(ni), r, vi)] = True
++                            else:
++                                reqdict[(f[i]&7744 and PreReq or Req,
++                                         intern(ni), r, vi)] = True
++                recargs = collapse_libc_requires(recdict.keys())
+                 reqargs = collapse_libc_requires(reqdict.keys())
+             else:
++                recargs = None
+                 reqargs = None
+ 
+             n = h[1054] # RPMTAG_CONFLICTNAME
diff --git a/meta/recipes-devtools/python/python-smartpm_1.4.1.bb b/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
index 485cec3..f69bd83 100644
--- a/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
+++ b/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
@@ -11,13 +11,14 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=393a5ca445f6965873eca0259a17f833"
 
 DEPENDS = "python rpm"
-PR = "r0"
+PR = "r1"
 SRCNAME = "smart"
 
 SRC_URI = "\
           http://launchpad.net/smart/trunk/${PV}/+download/${SRCNAME}-${PV}.tar.bz2 \
           file://smartpm-rpm5-nodig.patch \
           file://smart-rpm-root.patch \
+          file://smart-missingok.patch \
           "
 
 SRC_URI[md5sum] = "573ef32ba177a6b3c4bf7ef04873fcb6"
-- 
1.7.3.4



