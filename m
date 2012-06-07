Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eflanagan@envy.jf.intel.com>) id 1ScmQW-00047k-3i
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jun 2012 01:47:40 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 07 Jun 2012 16:37:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="154476644"
Received: from envy.jf.intel.com ([10.7.201.175])
	by orsmga002.jf.intel.com with ESMTP; 07 Jun 2012 16:37:07 -0700
Received: from envy.jf.intel.com (localhost [127.0.0.1])
	by envy.jf.intel.com (8.14.4/8.14.4/Debian-2ubuntu2) with ESMTP id
	q57NbK3v006583 for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Jun 2012 16:37:20 -0700
Received: (from eflanagan@localhost)
	by envy.jf.intel.com (8.14.4/8.14.4/Submit) id q57NbKr1006582
	for openembedded-core@lists.openembedded.org;
	Thu, 7 Jun 2012 16:37:20 -0700
From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jun 2012 16:37:08 -0700
Message-Id: <520fc7502eaf163e093c022ad09f5d505d3d836a.1339111944.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <480358f458a7874b5705fc48547489d19a9df72c.1339111944.git.elizabeth.flanagan@intel.com>
References: <480358f458a7874b5705fc48547489d19a9df72c.1339111944.git.elizabeth.flanagan@intel.com>
In-Reply-To: <cover.1339111944.git.elizabeth.flanagan@intel.com>
References: <cover.1339111944.git.elizabeth.flanagan@intel.com>
Subject: [Consolidated Pull 20/22] apt-get 0.7.14: hangs at runtime
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
X-List-Received-Date: Thu, 07 Jun 2012 23:47:41 -0000

From: Robert Yang <liezhi.yang@windriver.com>

This patch had a little problem, it made a infinite loop:

for (K = CmdL.FileList + 1; *K != 0; J++)

But the value of "K" will nerver change, so the apt-get hangs, revert
this patch first, and will fix the problem in another patch.

Note: Increment the PR from 11 to 12

Revert "apt: Fix a latent bug exposed by gcc 4.7"

This reverts commit 9d526462fe97564652771812ad1d363e9962b1e3.

[YOCTO #2488]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
---
 .../apt/apt-0.7.14/remove-redeclaration.patch      |   57 --------------------
 meta/recipes-devtools/apt/apt_0.7.14.bb            |    6 +--
 2 files changed, 2 insertions(+), 61 deletions(-)
 delete mode 100644 meta/recipes-devtools/apt/apt-0.7.14/remove-redeclaration.patch

diff --git a/meta/recipes-devtools/apt/apt-0.7.14/remove-redeclaration.patch b/meta/recipes-devtools/apt/apt-0.7.14/remove-redeclaration.patch
deleted file mode 100644
index 68cb0b0..0000000
--- a/meta/recipes-devtools/apt/apt-0.7.14/remove-redeclaration.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-Fix build errors
-
-deb/deblistparser.cc: In member function 'virtual short unsigned int debListParser::VersionHash()':
-deb/deblistparser.cc:212:13: error: redeclaration of 'char* I'
-deb/deblistparser.cc:202:22: error: 'const char** I' previously declared here
-
-Upstream-Status: Backport
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Index: apt-0.7.14/apt-pkg/deb/deblistparser.cc
-===================================================================
---- apt-0.7.14.orig/apt-pkg/deb/deblistparser.cc	2012-03-30 11:17:09.112456632 -0700
-+++ apt-0.7.14/apt-pkg/deb/deblistparser.cc	2012-03-30 11:25:40.484481643 -0700
-@@ -209,18 +209,18 @@
-       /* Strip out any spaces from the text, this undoes dpkgs reformatting
-          of certain fields. dpkg also has the rather interesting notion of
-          reformatting depends operators < -> <= */
--      char *I = S;
-+      char *J = S;
-       for (; Start != End; Start++)
-       {
- 	 if (isspace(*Start) == 0)
--	    *I++ = tolower(*Start);
-+	    *J++ = tolower(*Start);
- 	 if (*Start == '<' && Start[1] != '<' && Start[1] != '=')
--	    *I++ = '=';
-+	    *J++ = '=';
- 	 if (*Start == '>' && Start[1] != '>' && Start[1] != '=')
--	    *I++ = '=';
-+	    *J++ = '=';
-       }
- 
--      Result = AddCRC16(Result,S,I - S);
-+      Result = AddCRC16(Result,S,J - S);
-    }
-    
-    return Result;
-Index: apt-0.7.14/cmdline/apt-get.cc
-===================================================================
---- apt-0.7.14.orig/cmdline/apt-get.cc	2012-03-30 11:28:56.048490824 -0700
-+++ apt-0.7.14/cmdline/apt-get.cc	2012-03-30 11:32:00.248499740 -0700
-@@ -1752,12 +1752,12 @@
- 	 if ((*Cache)[I].Install() == false)
- 	    continue;
- 
--	 const char **J;
--	 for (J = CmdL.FileList + 1; *J != 0; J++)
--	    if (strcmp(*J,I.Name()) == 0)
-+	 const char **K;
-+	 for (K = CmdL.FileList + 1; *K != 0; J++)
-+	    if (strcmp(*K,I.Name()) == 0)
- 		break;
- 	 
--	 if (*J == 0) {
-+	 if (*K == 0) {
- 	    List += string(I.Name()) + " ";
- 	    VersionsList += string(Cache[I].CandVersion) + "\n";
- 	 }
diff --git a/meta/recipes-devtools/apt/apt_0.7.14.bb b/meta/recipes-devtools/apt/apt_0.7.14.bb
index 6354f8e..4055294 100644
--- a/meta/recipes-devtools/apt/apt_0.7.14.bb
+++ b/meta/recipes-devtools/apt/apt_0.7.14.bb
@@ -3,12 +3,10 @@ RDEPENDS_${PN} = "dpkg"
 LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=0636e73ff0215e8d672dc4c32c317bb3"
 require apt.inc
 
-PR = "r11"
+PR = "r12"
 
 SRC_URI += "file://nodoc.patch \
-            file://includes-fix.patch \
-            file://remove-redeclaration.patch \
-           "
+            file://includes-fix.patch "
 
 SRC_URI[md5sum] = "19efa18fb1ef20c58b9b44e94258b814"
 SRC_URI[sha256sum] = "8fc06effaf8a4e4333308eedcdc6840f1c8056f2e924210f151dfc076bcd4045"
-- 
1.7.5.4



