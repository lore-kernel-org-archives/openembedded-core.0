Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eflanagan@envy.jf.intel.com>) id 1ScmQW-00047r-R7
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jun 2012 01:47:42 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 07 Jun 2012 16:37:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="154476652"
Received: from envy.jf.intel.com ([10.7.201.175])
	by orsmga002.jf.intel.com with ESMTP; 07 Jun 2012 16:37:07 -0700
Received: from envy.jf.intel.com (localhost [127.0.0.1])
	by envy.jf.intel.com (8.14.4/8.14.4/Debian-2ubuntu2) with ESMTP id
	q57NbKi0006587 for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Jun 2012 16:37:20 -0700
Received: (from eflanagan@localhost)
	by envy.jf.intel.com (8.14.4/8.14.4/Submit) id q57NbKIW006586
	for openembedded-core@lists.openembedded.org;
	Thu, 7 Jun 2012 16:37:20 -0700
From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jun 2012 16:37:09 -0700
Message-Id: <730b0396d57d2f310eade7ccec47f509b4e8106b.1339111944.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <480358f458a7874b5705fc48547489d19a9df72c.1339111944.git.elizabeth.flanagan@intel.com>
References: <480358f458a7874b5705fc48547489d19a9df72c.1339111944.git.elizabeth.flanagan@intel.com>
In-Reply-To: <cover.1339111944.git.elizabeth.flanagan@intel.com>
References: <cover.1339111944.git.elizabeth.flanagan@intel.com>
Subject: [Consolidated Pull 21/22] apt 0.7.14: do_compile failed with gcc 4.7
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
X-List-Received-Date: Thu, 07 Jun 2012 23:47:42 -0000

From: Robert Yang <liezhi.yang@windriver.com>

apt do_compile failed with gcc 4.7:

deb/deblistparser.cc: In member function 'virtual short unsigned int debListParser::VersionHash()':
deb/deblistparser.cc:212:13: error: redeclaration of 'char* I'
deb/deblistparser.cc:202:22: error: 'const char** I' previously declared here

Backport the patch from the upstream would fix the problem, both target and
native apt need it.

[YOCTO #2488]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
---
 .../apt/apt-0.7.14/remove-redeclaration.patch      |   63 ++++++++++++++++++++
 meta/recipes-devtools/apt/apt-native_0.7.14.bb     |    2 +-
 meta/recipes-devtools/apt/apt.inc                  |    1 +
 meta/recipes-devtools/apt/apt_0.7.14.bb            |    2 +-
 4 files changed, 66 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/apt/apt-0.7.14/remove-redeclaration.patch

diff --git a/meta/recipes-devtools/apt/apt-0.7.14/remove-redeclaration.patch b/meta/recipes-devtools/apt/apt-0.7.14/remove-redeclaration.patch
new file mode 100644
index 0000000..8d7c891
--- /dev/null
+++ b/meta/recipes-devtools/apt/apt-0.7.14/remove-redeclaration.patch
@@ -0,0 +1,63 @@
+Fix build errors on gcc 4.7:
+
+deb/deblistparser.cc: In member function 'virtual short unsigned int debListParser::VersionHash()':
+deb/deblistparser.cc:212:13: error: redeclaration of 'char* I'
+deb/deblistparser.cc:202:22: error: 'const char** I' previously declared here
+
+Upstream-Status: Backport
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ apt-pkg/deb/deblistparser.cc |   10 +++++-----
+ cmdline/apt-get.cc           |    8 ++++----
+ 2 files changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/apt-pkg/deb/deblistparser.cc b/apt-pkg/deb/deblistparser.cc
+--- a/apt-pkg/deb/deblistparser.cc
++++ b/apt-pkg/deb/deblistparser.cc
+@@ -209,18 +209,18 @@ unsigned short debListParser::VersionHash()
+       /* Strip out any spaces from the text, this undoes dpkgs reformatting
+          of certain fields. dpkg also has the rather interesting notion of
+          reformatting depends operators < -> <= */
+-      char *I = S;
++      char *J = S;
+       for (; Start != End; Start++)
+       {
+ 	 if (isspace(*Start) == 0)
+-	    *I++ = tolower(*Start);
++	    *J++ = tolower(*Start);
+ 	 if (*Start == '<' && Start[1] != '<' && Start[1] != '=')
+-	    *I++ = '=';
++	    *J++ = '=';
+ 	 if (*Start == '>' && Start[1] != '>' && Start[1] != '=')
+-	    *I++ = '=';
++	    *J++ = '=';
+       }
+ 
+-      Result = AddCRC16(Result,S,I - S);
++      Result = AddCRC16(Result,S,J - S);
+    }
+    
+    return Result;
+diff --git a/cmdline/apt-get.cc b/cmdline/apt-get.cc
+--- a/cmdline/apt-get.cc
++++ b/cmdline/apt-get.cc
+@@ -1752,12 +1752,12 @@ bool DoInstall(CommandLine &CmdL)
+ 	 if ((*Cache)[I].Install() == false)
+ 	    continue;
+ 
+-	 const char **J;
+-	 for (J = CmdL.FileList + 1; *J != 0; J++)
+-	    if (strcmp(*J,I.Name()) == 0)
++	 const char **K;
++	 for (K = CmdL.FileList + 1; *K != 0; K++)
++	    if (strcmp(*K,I.Name()) == 0)
+ 		break;
+ 	 
+-	 if (*J == 0) {
++	 if (*K == 0) {
+ 	    List += string(I.Name()) + " ";
+ 	    VersionsList += string(Cache[I].CandVersion) + "\n";
+ 	 }
+-- 
+1.7.1
+
diff --git a/meta/recipes-devtools/apt/apt-native_0.7.14.bb b/meta/recipes-devtools/apt/apt-native_0.7.14.bb
index ec3fd20..ca5476b 100644
--- a/meta/recipes-devtools/apt/apt-native_0.7.14.bb
+++ b/meta/recipes-devtools/apt/apt-native_0.7.14.bb
@@ -1,6 +1,6 @@
 require apt-native.inc
 
-PR = "r7"
+PR = "r8"
 
 SRC_URI += "file://nodoc.patch \
             file://noconfigure.patch \
diff --git a/meta/recipes-devtools/apt/apt.inc b/meta/recipes-devtools/apt/apt.inc
index 9d32ddb..1f6343a 100644
--- a/meta/recipes-devtools/apt/apt.inc
+++ b/meta/recipes-devtools/apt/apt.inc
@@ -7,6 +7,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/a/apt/apt_${PV}.tar.gz \
            file://use-host.patch \
            file://localefixes.patch \
            file://makerace.patch \
+           file://remove-redeclaration.patch \
            "
 
 inherit autotools gettext
diff --git a/meta/recipes-devtools/apt/apt_0.7.14.bb b/meta/recipes-devtools/apt/apt_0.7.14.bb
index 4055294..a627728 100644
--- a/meta/recipes-devtools/apt/apt_0.7.14.bb
+++ b/meta/recipes-devtools/apt/apt_0.7.14.bb
@@ -3,7 +3,7 @@ RDEPENDS_${PN} = "dpkg"
 LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=0636e73ff0215e8d672dc4c32c317bb3"
 require apt.inc
 
-PR = "r12"
+PR = "r13"
 
 SRC_URI += "file://nodoc.patch \
             file://includes-fix.patch "
-- 
1.7.5.4



