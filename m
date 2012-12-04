Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Tfw4y-0008I1-PK
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 18:14:46 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qB4H0K7a008387
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Dec 2012 09:00:20 -0800 (PST)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Tue, 4 Dec 2012 09:00:20 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 4 Dec 2012 11:14:40 -0600
Message-ID: <b5c843f9711867381da27fdc9df74fa9c8a00c96.1354641032.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1354641032.git.mark.hatle@windriver.com>
References: <cover.1354641032.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 08/22] rpm: Fixup platform matching code
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

On ARM systems the platform matching code could fail in some cases, as
the system macros file could override the 'platform' file settings.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-devtools/rpm/rpm/rpm-platform2.patch |   56 +++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.9.bb            |    3 +-
 2 files changed, 58 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-platform2.patch

diff --git a/meta/recipes-devtools/rpm/rpm/rpm-platform2.patch b/meta/recipes-devtools/rpm/rpm/rpm-platform2.patch
new file mode 100644
index 0000000..3d50e46
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/rpm-platform2.patch
@@ -0,0 +1,56 @@
+Fix up platform and related sysinfo file loading (part 2).
+
+Upstream-Status: Pending
+
+We need to ensure that we set the _gnu flag somehow.  We do this by reading
+from the platform file, and setting a new platform_gnu and related vars.
+
+We then check for the existance of these things and change the configure
+time defaults to the run-time values as necessary.
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+
+Index: rpm-5.4.9/lib/rpmrc.c
+===================================================================
+--- rpm-5.4.9.orig/lib/rpmrc.c
++++ rpm-5.4.9/lib/rpmrc.c
+@@ -487,9 +487,10 @@ static rpmRC rpmPlatform(const char * pl
+ 	}
+ 
+ 	if (!parseCVOG(p, &cvog) && cvog != NULL) {
+-	    addMacro(NULL, "_host_cpu", NULL, cvog->cpu, -1);
+-	    addMacro(NULL, "_host_vendor", NULL, cvog->vendor, -1);
+-	    addMacro(NULL, "_host_os", NULL, cvog->os, -1);
++	    addMacro(NULL, "_platform_cpu", NULL, cvog->cpu, -1);
++	    addMacro(NULL, "_platform_vendor", NULL, cvog->vendor, -1);
++	    addMacro(NULL, "_platform_os", NULL, cvog->os, -1);
++	    addMacro(NULL, "_platform_gnu", NULL, cvog->gnu, -1);
+ 	}
+ 
+ #if defined(RPM_VENDOR_OPENPKG) /* explicit-platform */
+Index: rpm-5.4.9/macros/macros.in
+===================================================================
+--- rpm-5.4.9.orig/macros/macros.in
++++ rpm-5.4.9/macros/macros.in
+@@ -873,7 +873,7 @@ $_arbitrary_tags_tests	Foo:Bar
+ %_build_arch		@RPMCANONARCH@
+ %_vendor		@RPMCANONVENDOR@
+ %_os			@RPMCANONOS@
+-%_gnu			@RPMCANONGNU@
++%_gnu			%{?_platform_gnu:-%{_platform_gnu}}%{!?_platform_gnu:@RPMCANONGNU@}
+ 
+ %_host_platform		%{_host_cpu}-%{_host_vendor}-%{_host_os}%{?_gnu}
+ %_build_platform	%{_build_cpu}-%{_build_vendor}-%{_build_os}%{?_gnu}
+@@ -920,9 +920,9 @@ $_arbitrary_tags_tests	Foo:Bar
+ %_build_os		%{_host_os}
+ %_host			@host@
+ %_host_alias		@host_alias@%{nil}
+-%_host_cpu		@host_cpu@
+-%_host_vendor		@host_vendor@
+-%_host_os		@host_os@
++%_host_cpu		%{?_platform_cpu}%{!?_platform_cpu:@host_cpu@}
++%_host_vendor		%{?_platform_vendor}%{!?_platform_vendor:@host_vendor@}
++%_host_os		%{?_platform_os}%{!?_platform_os:@host_os@}
+ %_target		%{_host}
+ %_target_alias		%{_host_alias}
+ %_target_cpu		%{_host_cpu}
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
index 59f3eef..7311d0e 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
@@ -43,7 +43,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 DEPENDS = "libpcre attr acl popt ossp-uuid file bison-native"
-PR = "r57"
+PR = "r58"
 
 # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It is needed
 # in order to extract the distribution SRPM into a format we can extract...
@@ -83,6 +83,7 @@ SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.9-0.20120508.src.rpm;ex
 	   file://rpm-py-init.patch \
 	   file://python-rpm-rpmsense.patch \
 	   file://rpm-reloc-macros.patch \
+	   file://rpm-platform2.patch \
 	  "
 
 SRC_URI[md5sum] = "60d56ace884340c1b3fcac6a1d58e768"
-- 
1.7.3.4



