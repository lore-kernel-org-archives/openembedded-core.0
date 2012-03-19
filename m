Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S9f4E-0001mv-K0 for openembedded-core@lists.openembedded.org;
	Mon, 19 Mar 2012 17:04:18 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2JFtReV031507
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2012 15:55:27 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 31030-05 for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2012 15:55:20 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2JFtIG3031501
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2012 15:55:19 GMT
Message-ID: <1332172520.9740.35.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 19 Mar 2012 15:55:20 +0000
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: apt: Fix parallel make race
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
X-List-Received-Date: Mon, 19 Mar 2012 16:04:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I was just going to turn off parallel make but ended up fixing this properly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/apt/apt-0.7.14/makerace.patch b/meta/recipes-devtools/apt/apt-0.7.14/makerace.patch
new file mode 100644
index 0000000..403711f
--- a/dev/null
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
index 6265203..9d32ddb 100644
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




