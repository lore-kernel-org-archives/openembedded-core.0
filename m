Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1USQ3b-0003EE-PM for openembedded-core@lists.openembedded.org;
	Wed, 17 Apr 2013 12:58:00 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3HAeamQ013850 for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2013 11:40:37 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id j3LHAukP47nO
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2013 11:40:36 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3HAeUsO013839
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2013 11:40:31 +0100
Message-ID: <1366195198.25282.29.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Apr 2013 11:39:58 +0100
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Subject: [PATCH] augeas: Fix missing files with separate build directory
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
X-List-Received-Date: Wed, 17 Apr 2013 10:58:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

${datadir} was empty when building ${B} != ${S}, this patch addresses that 
problem and means the -lenses package is no longer empty.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-extended/augeas/augeas.inc b/meta/recipes-extended/augeas/augeas.inc
index c956621..da41d42 100644
--- a/meta/recipes-extended/augeas/augeas.inc
+++ b/meta/recipes-extended/augeas/augeas.inc
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=bbb461211a33b134d42ed5ee802b37ff"
 
 SRC_URI = "http://download.augeas.net/${BP}.tar.gz \
            file://add-missing-argz-conditional.patch \
+           file://sepbuildfix.patch \
           "
 
 DEPENDS = "readline libxml2"
diff --git a/meta/recipes-extended/augeas/augeas/sepbuildfix.patch b/meta/recipes-extended/augeas/augeas/sepbuildfix.patch
new file mode 100644
index 0000000..b82a3ee
--- /dev/null
+++ b/meta/recipes-extended/augeas/augeas/sepbuildfix.patch
@@ -0,0 +1,22 @@
+Ensure that builds in separate builddirs (${B} != ${S}) correctly install the 
+lenses files.
+
+Upstream-Status: Pending
+
+RP 2013/4/17
+
+Index: augeas-1.0.0/Makefile.am
+===================================================================
+--- augeas-1.0.0.orig/Makefile.am	2012-11-02 15:20:11.000000000 +0000
++++ augeas-1.0.0/Makefile.am	2013-04-17 10:36:24.033400125 +0000
+@@ -5,8 +5,8 @@
+ lensdir=$(datadir)/augeas/lenses/dist
+ lenstestdir=$(datadir)/augeas/lenses/dist/tests
+ 
+-dist_lens_DATA=$(wildcard lenses/*.aug)
+-dist_lenstest_DATA=$(wildcard lenses/tests/*.aug)
++dist_lens_DATA=$(wildcard $(top_srcdir)/lenses/*.aug)
++dist_lenstest_DATA=$(wildcard $(top_srcdir)lenses/tests/*.aug)
+ 
+ EXTRA_DIST=augeas.spec build/aux/move-if-change Makefile.am HACKING
+ 




