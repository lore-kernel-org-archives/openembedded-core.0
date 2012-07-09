Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SoGMi-00065I-Cq
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 17:59:13 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 09 Jul 2012 08:47:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="190292890"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.157])
	by fmsmga002.fm.intel.com with ESMTP; 09 Jul 2012 08:47:59 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jul 2012 08:47:28 -0700
Message-Id: <6ea46dc340514f635983aa0b4f8a997278b19ce9.1341802889.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1341802889.git.sgw@linux.intel.com>
References: <cover.1341802889.git.sgw@linux.intel.com>
In-Reply-To: <cover.1341802889.git.sgw@linux.intel.com>
References: <cover.1341802889.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 14/41] apt 0.7.14: runtime error: Method file has died unexpectedly
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
X-List-Received-Date: Mon, 09 Jul 2012 15:59:15 -0000

From: Robert Yang <liezhi.yang@windriver.com>

When the length of the tmpdir is longer than 400, there is an error
when run "apt-get update":

Method file has died unexpectedly!

This is because the "char S[1024]" is not enough for long URI, S[2048]
would be enough.

[YOCTO #2689]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../apt/apt-0.7.14/allocate-larger-memory.patch    |   75 ++++++++++++++++++++
 meta/recipes-devtools/apt/apt-native_0.7.14.bb     |    2 +-
 meta/recipes-devtools/apt/apt.inc                  |    1 +
 meta/recipes-devtools/apt/apt_0.7.14.bb            |    2 +-
 4 files changed, 78 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/apt/apt-0.7.14/allocate-larger-memory.patch

diff --git a/meta/recipes-devtools/apt/apt-0.7.14/allocate-larger-memory.patch b/meta/recipes-devtools/apt/apt-0.7.14/allocate-larger-memory.patch
new file mode 100644
index 0000000..36e1499
--- /dev/null
+++ b/meta/recipes-devtools/apt/apt-0.7.14/allocate-larger-memory.patch
@@ -0,0 +1,75 @@
+Method file has died unexpectedly
+
+"Method file has died unexpectedly!", this is because the "char S[1024]"
+is not enough for the long the URI, "char S[2048]" would be enough.
+
+It would be boring if we use malloc here since we can't know how much
+memory is needed except strelen() every component of it. So similarly
+use "char S[2048]" as it did before.
+
+Upstream-Status: Pending
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ apt-pkg/acquire-method.cc |   12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/apt-pkg/acquire-method.cc b/apt-pkg/acquire-method.cc
+--- a/apt-pkg/acquire-method.cc
++++ b/apt-pkg/acquire-method.cc
+@@ -95,7 +95,7 @@ void pkgAcqMethod::Fail(string Err,bool Transient)
+ 	 *I = ' ';
+    }
+    
+-   char S[1024];
++   char S[2048];
+    if (Queue != 0)
+    {
+       snprintf(S,sizeof(S)-50,"400 URI Failure\nURI: %s\n"
+@@ -132,7 +132,7 @@ void pkgAcqMethod::URIStart(FetchResult &Res)
+    if (Queue == 0)
+       abort();
+    
+-   char S[1024] = "";
++   char S[2048] = "";
+    char *End = S;
+    
+    End += snprintf(S,sizeof(S),"200 URI Start\nURI: %s\n",Queue->Uri.c_str());
+@@ -160,7 +160,7 @@ void pkgAcqMethod::URIDone(FetchResult &Res, FetchResult *Alt)
+    if (Queue == 0)
+       abort();
+    
+-   char S[1024] = "";
++   char S[2048] = "";
+    char *End = S;
+    
+    End += snprintf(S,sizeof(S),"201 URI Done\nURI: %s\n",Queue->Uri.c_str());
+@@ -242,7 +242,7 @@ void pkgAcqMethod::URIDone(FetchResult &Res, FetchResult *Alt)
+    to be ackd */
+ bool pkgAcqMethod::MediaFail(string Required,string Drive)
+ {
+-   char S[1024];
++   char S[2048];
+    snprintf(S,sizeof(S),"403 Media Failure\nMedia: %s\nDrive: %s\n\n",
+ 	    Required.c_str(),Drive.c_str());
+ 
+@@ -411,7 +411,7 @@ void pkgAcqMethod::Log(const char *Format,...)
+    va_start(args,Format);
+ 
+    // sprintf the description
+-   char S[1024];
++   char S[2048];
+    unsigned int Len = snprintf(S,sizeof(S)-4,"101 Log\nURI: %s\n"
+ 			       "Message: ",CurrentURI.c_str());
+ 
+@@ -435,7 +435,7 @@ void pkgAcqMethod::Status(const char *Format,...)
+    va_start(args,Format);
+ 
+    // sprintf the description
+-   char S[1024];
++   char S[2048];
+    unsigned int Len = snprintf(S,sizeof(S)-4,"102 Status\nURI: %s\n"
+ 			       "Message: ",CurrentURI.c_str());
+ 
+-- 
+1.7.10.4
+
diff --git a/meta/recipes-devtools/apt/apt-native_0.7.14.bb b/meta/recipes-devtools/apt/apt-native_0.7.14.bb
index 38e1fe6..46f39f5 100644
--- a/meta/recipes-devtools/apt/apt-native_0.7.14.bb
+++ b/meta/recipes-devtools/apt/apt-native_0.7.14.bb
@@ -1,6 +1,6 @@
 require apt-native.inc
 
-PR = "r9"
+PR = "r10"
 
 SRC_URI += "file://nodoc.patch \
             file://noconfigure.patch \
diff --git a/meta/recipes-devtools/apt/apt.inc b/meta/recipes-devtools/apt/apt.inc
index 563eda1..973ccb5 100644
--- a/meta/recipes-devtools/apt/apt.inc
+++ b/meta/recipes-devtools/apt/apt.inc
@@ -9,6 +9,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/a/apt/apt_${PV}.tar.gz \
            file://makerace.patch \
            file://remove-redeclaration.patch \
            file://truncate-filename.patch \
+           file://allocate-larger-memory.patch \
            "
 
 inherit autotools gettext
diff --git a/meta/recipes-devtools/apt/apt_0.7.14.bb b/meta/recipes-devtools/apt/apt_0.7.14.bb
index 12dd1f2..667b700 100644
--- a/meta/recipes-devtools/apt/apt_0.7.14.bb
+++ b/meta/recipes-devtools/apt/apt_0.7.14.bb
@@ -3,7 +3,7 @@ RDEPENDS_${PN} = "dpkg"
 LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=0636e73ff0215e8d672dc4c32c317bb3"
 require apt.inc
 
-PR = "r14"
+PR = "r15"
 
 SRC_URI += "file://nodoc.patch \
             file://includes-fix.patch "
-- 
1.7.7.6



