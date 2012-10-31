Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TTfki-0007ki-R6
	for openembedded-core@lists.openembedded.org;
	Wed, 31 Oct 2012 22:23:09 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q9VL9VhL007871
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Oct 2012 14:09:31 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Wed, 31 Oct 2012 14:09:30 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 31 Oct 2012 16:19:25 -0500
Message-ID: <fffce9ae3d863d08d541d3325943161324de25c1.1351718092.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1351718092.git.mark.hatle@windriver.com>
References: <cover.1351718092.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 3/4] rpm: Add additional RPMSENSE values to python module
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

We add a number of additional RPMSENSE values to the python module to better
support the dependency calculations in SMART.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../rpm/rpm/python-rpm-rpmsense.patch              |   33 ++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.9.bb             |    3 +-
 2 files changed, 35 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/rpm/rpm/python-rpm-rpmsense.patch

diff --git a/meta/recipes-devtools/rpm/rpm/python-rpm-rpmsense.patch b/meta/recipes-devtools/rpm/rpm/python-rpm-rpmsense.patch
new file mode 100644
index 0000000..61f1e0c
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/python-rpm-rpmsense.patch
@@ -0,0 +1,33 @@
+rpmmodule.c: Export a few additional RPMSENSE values
+
+We want to see the RPMSENSE_SCRIPT values for use with SMART.  We also
+want to see the MISSINGOK value so we can avoid recommended packages causing
+failures.
+
+Upstream-status: Pending
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+
+Index: rpm-5.4.9/python/rpmmodule.c
+===================================================================
+--- rpm-5.4.9.orig/python/rpmmodule.c
++++ rpm-5.4.9/python/rpmmodule.c
+@@ -494,12 +494,16 @@ void init_rpm(void)
+     REGISTER_ENUM(RPMSENSE_EQUAL);
+     REGISTER_ENUM(RPMSENSE_NOTEQUAL);
+     REGISTER_ENUM(RPMSENSE_FIND_REQUIRES);
+-#if defined(RPM_VENDOR_MANDRIVA)
++#if defined(RPM_VENDOR_MANDRIVA) || defined(RPM_VENDOR_WINDRIVER) || defined(RPM_VENDOR_POKY)
+     REGISTER_ENUM(RPMSENSE_PREREQ);
+     REGISTER_ENUM(RPMSENSE_SCRIPT_PRE);
+     REGISTER_ENUM(RPMSENSE_SCRIPT_POST);
+     REGISTER_ENUM(RPMSENSE_SCRIPT_PREUN);
+-    REGISTER_ENUM(RPMSENSE_SCRIPT_POSTUN)
++    REGISTER_ENUM(RPMSENSE_SCRIPT_POSTUN);
++#endif
++
++#if defined(RPM_VENDOR_WINDRIVER) || defined(RPM_VENDOR_POKY)
++    REGISTER_ENUM(RPMSENSE_MISSINGOK);
+ #endif
+ 
+     REGISTER_ENUM(RPMDEPS_FLAG_NOUPGRADE);
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
index ee28061..29876e8 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
@@ -43,7 +43,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 DEPENDS = "libpcre attr acl popt ossp-uuid file bison-native"
-PR = "r53"
+PR = "r54"
 
 # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It is needed
 # in order to extract the distribution SRPM into a format we can extract...
@@ -81,6 +81,7 @@ SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.9-0.20120508.src.rpm;ex
 	   file://rpm-stub-out-git_strerror.patch \
 	   file://rpm-db_buffer_small.patch \
 	   file://rpm-py-init.patch \
+	   file://python-rpm-rpmsense.patch \
 	  "
 
 SRC_URI[md5sum] = "60d56ace884340c1b3fcac6a1d58e768"
-- 
1.7.3.4



