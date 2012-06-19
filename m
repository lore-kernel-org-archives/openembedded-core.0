Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Sh4NS-0006yX-Le
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jun 2012 21:46:14 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 19 Jun 2012 12:35:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="158311553"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.12.212])
	by azsmga001.ch.intel.com with ESMTP; 19 Jun 2012 12:35:27 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jun 2012 12:35:25 -0700
Message-Id: <80c1ab1248ff38ba97cf5780fc05ff1321e14e10.1340132548.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.10.2
In-Reply-To: <cover.1340132548.git.josh@linux.intel.com>
References: <cover.1340132548.git.josh@linux.intel.com>
In-Reply-To: <cover.1340132548.git.josh@linux.intel.com>
References: <cover.1340132548.git.josh@linux.intel.com>
Subject: [2011-1 PATCH 3/3] apt 0.7.14: do_compile failed with gcc 4.7
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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Joshua Lock <josh@linux.intel.com>
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
index 61d9602..0d241a9 100644
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
index 8464b7f..9ace6d2 100644
--- a/meta/recipes-devtools/apt/apt_0.7.14.bb
+++ b/meta/recipes-devtools/apt/apt_0.7.14.bb
@@ -3,7 +3,7 @@ RDEPENDS_${PN} = "dpkg"
 LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=0636e73ff0215e8d672dc4c32c317bb3"
 require apt.inc
 
-PR = "r10"
+PR = "r11"
 
 SRC_URI += "file://nodoc.patch \
             file://includes-fix.patch "
-- 
1.7.10.2



