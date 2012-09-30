Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TI7My-0001nF-DN
	for openembedded-core@lists.openembedded.org;
	Sun, 30 Sep 2012 02:26:52 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q8U0DukV020477
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Sep 2012 17:13:56 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.309.2;
	Sat, 29 Sep 2012 17:13:56 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 29 Sep 2012 19:19:16 -0500
Message-ID: <873ccb3fb781c3b76d69c8a598f355b243b58379.1348963477.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1348963477.git.mark.hatle@windriver.com>
References: <cover.1348963477.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 10/12] rpm: Fix file contention issue
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
X-List-Received-Date: Sun, 30 Sep 2012 00:26:53 -0000
Content-Type: text/plain

There is an issue that is caused when doing the install step of rpm on systems
with high parallelization where two jobs of make will fight for the same file
while installing the sub-directory lua. This is caused by the same makefile rule
being called twice in a way that both could be trying to install at the same
time.

This fix renames the linking rule so it will always be run after the needed
files are added and removed it's dependency so the required rule would only
run once.

This was tested heavily using ppss to run mutliple installs in parallel. This
wouldn't happen in practise but it was tested will all the individual rules as
well.

Signed-off-by: Morgan Little <morgan.little@windriver.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../rpm/rpm/makefile-am-exec-hook.patch            |   31 ++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.9.bb             |    3 +-
 2 files changed, 33 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/rpm/rpm/makefile-am-exec-hook.patch

diff --git a/meta/recipes-devtools/rpm/rpm/makefile-am-exec-hook.patch b/meta/recipes-devtools/rpm/rpm/makefile-am-exec-hook.patch
new file mode 100644
index 0000000..12f85b7
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/makefile-am-exec-hook.patch
@@ -0,0 +1,31 @@
+rpm: Resolve parallel install issue when installing lua
+
+When lua is being installed on some systems that are being run with high levels
+of parallelization there are cases where install-data-am and install-exec-hook
+are processed at the same or a very short time apart. This causes
+install-pkgbinPROGRAMS, which is a dependency of both, to be run at around the
+same time This sometimes causes file contention and will sometimes be in a state
+where install-exec-hook is looking for a file that is being installed or both
+install-pkgbinPROGRAMS being run are installing the same file and fail because
+it cannon create a new file.
+
+This patch allows install-exec-hook to be called by install-data-am instead of
+install-exec-am. It also removed the dependency in install-data-hook on
+install-pkgbinPROGRAMS. This means install-pkgbinPROGRAMS will only be run once
+so there whould be any file contention.
+
+Upstream-Status: Pending
+
+Signed-off-by: Morgan Little <morgan.little@windriver.com>
+
+--- a/lua/Makefile.am.orig
++++ b/lua/Makefile.am
+@@ -320,7 +320,7 @@
+ # XXX Build & install as rpmlua/rpmluac with hardlinks to lua/luac post install.
+ # XXX CVS has lua/luac sub-directories in the Attic that collide with the
+ # XXX lua/luac executable names when using cvs update.
+-install-exec-hook:	install-pkgbinPROGRAMS
++install-data-hook:	
+ 	mkdir -p $(DESTDIR)$(pkgbindir)
+ 	$(__RM) -f $(DESTDIR)$(pkgbindir)/lua
+ 	$(__LN) $(DESTDIR)$(pkgbindir)/rpmlua $(DESTDIR)$(pkgbindir)/lua
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
index 2a4c8d8..4aea2f6 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
@@ -43,7 +43,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 DEPENDS = "libpcre attr acl popt ossp-uuid file bison-native"
-PR = "r49"
+PR = "r50"
 
 # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It is needed
 # in order to extract the distribution SRPM into a format we can extract...
@@ -77,6 +77,7 @@ SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.9-0.20120508.src.rpm;ex
 	   file://fstack-protector-configure-check.patch \
 	   file://dbconvert.patch \
 	   file://rpm-uuid-include.patch \
+	   file://makefile-am-exec-hook.path \
 	  "
 
 SRC_URI[md5sum] = "60d56ace884340c1b3fcac6a1d58e768"
-- 
1.7.3.4



