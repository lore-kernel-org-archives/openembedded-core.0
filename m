Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Tfw4y-0008HU-PN
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 18:14:46 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qB4H0KRv026332
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Dec 2012 09:00:20 -0800 (PST)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Tue, 4 Dec 2012 09:00:19 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 4 Dec 2012 11:14:39 -0600
Message-ID: <4daca2b0586e70509c580abbb2544a3a7335fb45.1354641032.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1354641032.git.mark.hatle@windriver.com>
References: <cover.1354641032.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 07/22] rpm: Fix rpm relocation macro usage
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
X-List-Received-Date: Tue, 04 Dec 2012 17:14:49 -0000
Content-Type: text/plain

When RPM is setup to dynamically reconfigure itself at runtime, we need
to avoid hard coded settings for _usrlibrpm and _etcrpm.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../rpm/rpm/rpm-reloc-macros.patch                 |   31 ++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.9.bb             |    3 +-
 2 files changed, 33 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-reloc-macros.patch

diff --git a/meta/recipes-devtools/rpm/rpm/rpm-reloc-macros.patch b/meta/recipes-devtools/rpm/rpm/rpm-reloc-macros.patch
new file mode 100644
index 0000000..33ec8e2
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/rpm-reloc-macros.patch
@@ -0,0 +1,31 @@
+macros: Use dyanmic config vs hard coded settings
+
+When the dynamic, runtime relocation is enables we need to make sure that the 
+RPM macro file does not override the dynamic settings.  Fix this by forcing the
+dynamic version to be used in all cases.
+
+Upstream-Status: Inapproriate (OpenEmbedded specific)
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+
+Index: rpm-5.4.9/macros/macros.in
+===================================================================
+--- rpm-5.4.9.orig/macros/macros.in
++++ rpm-5.4.9/macros/macros.in
+@@ -27,11 +27,12 @@
+ #==============================================================================
+ # ---- filesystem macros.
+ #
+-%_usr			@usrprefix@
++%_usr			%{_usrlibrpm}/../..
+ %_usrsrc		%{_usr}/src
+-%_var			@varprefix@
+-%_usrlibrpm		@USRLIBRPM@
+-%_etcrpm		@SYSCONFIGDIR@
++%_var			%{_usr}/../var
++# The dynamic relocation code sets the following two items
++#%_usrlibrpm		@USRLIBRPM@
++#%_etcrpm		@SYSCONFIGDIR@
+ 
+ %__objext		@objext@
+ %__libext		@libext@
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
index ccf079a..59f3eef 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
@@ -43,7 +43,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 DEPENDS = "libpcre attr acl popt ossp-uuid file bison-native"
-PR = "r56"
+PR = "r57"
 
 # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It is needed
 # in order to extract the distribution SRPM into a format we can extract...
@@ -82,6 +82,7 @@ SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.9-0.20120508.src.rpm;ex
 	   file://rpm-db_buffer_small.patch \
 	   file://rpm-py-init.patch \
 	   file://python-rpm-rpmsense.patch \
+	   file://rpm-reloc-macros.patch \
 	  "
 
 SRC_URI[md5sum] = "60d56ace884340c1b3fcac6a1d58e768"
-- 
1.7.3.4



