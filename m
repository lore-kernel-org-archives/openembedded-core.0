Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Sh4NR-0006yX-TM
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jun 2012 21:46:14 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 19 Jun 2012 12:35:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="158311548"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.12.212])
	by azsmga001.ch.intel.com with ESMTP; 19 Jun 2012 12:35:27 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jun 2012 12:35:24 -0700
Message-Id: <440a6d5aacf7807536feee5d09484712ba34ca80.1340132548.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.10.2
In-Reply-To: <cover.1340132548.git.josh@linux.intel.com>
References: <cover.1340132548.git.josh@linux.intel.com>
In-Reply-To: <cover.1340132548.git.josh@linux.intel.com>
References: <cover.1340132548.git.josh@linux.intel.com>
Subject: [2011-1 PATCH 2/3] apt: Fix parallel make race
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
X-List-Received-Date: Tue, 19 Jun 2012 19:46:14 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

I was just going to turn off parallel make but ended up fixing this properly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 .../recipes-devtools/apt/apt-0.7.14/makerace.patch |   23 ++++++++++++++++++++
 meta/recipes-devtools/apt/apt-native_0.7.14.bb     |    2 +-
 meta/recipes-devtools/apt/apt.inc                  |    1 +
 meta/recipes-devtools/apt/apt_0.7.14.bb            |    2 +-
 4 files changed, 26 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/apt/apt-0.7.14/makerace.patch

diff --git a/meta/recipes-devtools/apt/apt-0.7.14/makerace.patch b/meta/recipes-devtools/apt/apt-0.7.14/makerace.patch
new file mode 100644
index 0000000..403711f
--- /dev/null
+++ b/meta/recipes-devtools/apt/apt-0.7.14/makerace.patch
@@ -0,0 +1,23 @@
+I was seeing various issues with parallel make, mainly due to to what was likely 
+partially installed headers. If you change into the source directory and
+"NOISY=1 make  ../obj/apt-pkg/sourcelist.opic" in apt-pkg, you'll see it 
+doesn't have any dependencies on the headers being installed. This patch
+fixes that so things build correctly.
+
+RP 2012/3/19
+
+Upstream-Status: Pending
+
+Index: apt-0.7.14/buildlib/library.mak
+===================================================================
+--- apt-0.7.14.orig/buildlib/library.mak
++++ apt-0.7.14/buildlib/library.mak
+@@ -61,7 +61,7 @@ $(LIB)/lib$(LIBRARY)$(LIBEXT).so.$(MAJOR
+ 
+ # Compilation rules
+ vpath %.cc $(SUBDIRS)
+-$(OBJ)/%.opic: %.cc
++$(OBJ)/%.opic: %.cc $($(LOCAL)-HEADERS)
+ 	echo Compiling $< to $@
+ 	$(CXX) -c $(INLINEDEPFLAG) $(CPPFLAGS) $(CXXFLAGS) $(PICFLAGS) -o $@ $<
+ 	$(DoDep)
diff --git a/meta/recipes-devtools/apt/apt-native_0.7.14.bb b/meta/recipes-devtools/apt/apt-native_0.7.14.bb
index 37368ac..ec3fd20 100644
--- a/meta/recipes-devtools/apt/apt-native_0.7.14.bb
+++ b/meta/recipes-devtools/apt/apt-native_0.7.14.bb
@@ -1,6 +1,6 @@
 require apt-native.inc
 
-PR = "r6"
+PR = "r7"
 
 SRC_URI += "file://nodoc.patch \
             file://noconfigure.patch \
diff --git a/meta/recipes-devtools/apt/apt.inc b/meta/recipes-devtools/apt/apt.inc
index 9d3268d..61d9602 100644
--- a/meta/recipes-devtools/apt/apt.inc
+++ b/meta/recipes-devtools/apt/apt.inc
@@ -6,6 +6,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/a/apt/apt_${PV}.tar.gz \
            file://no-ko-translation.patch \
            file://use-host.patch \
            file://localefixes.patch \
+           file://makerace.patch \
            "
 
 inherit autotools gettext
diff --git a/meta/recipes-devtools/apt/apt_0.7.14.bb b/meta/recipes-devtools/apt/apt_0.7.14.bb
index bd1116f..8464b7f 100644
--- a/meta/recipes-devtools/apt/apt_0.7.14.bb
+++ b/meta/recipes-devtools/apt/apt_0.7.14.bb
@@ -3,7 +3,7 @@ RDEPENDS_${PN} = "dpkg"
 LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=0636e73ff0215e8d672dc4c32c317bb3"
 require apt.inc
 
-PR = "r9"
+PR = "r10"
 
 SRC_URI += "file://nodoc.patch \
             file://includes-fix.patch "
-- 
1.7.10.2



