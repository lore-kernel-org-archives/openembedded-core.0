Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SmMo6-0007Go-6J
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jul 2012 12:27:39 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q64AGZ73010279
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Jul 2012 03:16:35 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Wed, 4 Jul 2012 03:16:34 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 4 Jul 2012 18:16:29 +0800
Message-ID: <85b956c4f1546f1d68feb422d315b249c5ebbdf7.1341392163.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1341392163.git.liezhi.yang@windriver.com>
References: <cover.1341392163.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 2/2] apt 0.7.14: runtime error: Method file has died unexpectedly
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
X-List-Received-Date: Wed, 04 Jul 2012 10:27:39 -0000
Content-Type: text/plain

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
1.7.1



