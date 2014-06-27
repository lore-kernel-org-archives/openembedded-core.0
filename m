Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B3D4C60425
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jun 2014 09:23:43 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s5R9Na4o021756 for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jun 2014 10:23:37 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id rCi3-A-4jBrv
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jun 2014 10:23:36 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s5R9NUZS021752
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jun 2014 10:23:32 +0100
Message-ID: <1403861003.28648.3.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 27 Jun 2014 10:23:23 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] distutils/distutils3: Fix bashism
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Jun 2014 09:23:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

read -d is a bashism. Replace with a direct exec to avoid the problem
in this case. This fixes silent build failures in do_install of
tasks on systems with dash as /bin/sh.

Also merge the fix to distutils for only changing necessary files
to disutils3 as well.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/distutils.bbclass b/meta/classes/distutils.bbclass
index 12f2603..6ed7ecc 100644
--- a/meta/classes/distutils.bbclass
+++ b/meta/classes/distutils.bbclass
@@ -42,12 +42,8 @@ distutils_do_install() {
         bbfatal "${PYTHON_PN} setup.py install execution failed."
 
         # support filenames with *spaces*
-        find ${D} -name "*.py" -print0 | while read -d $'\0' i ; do \
-            # only modify file if it contains path to avoid recompilation on the target
-            if grep -q "${D}" "$i"; then
-                sed -i -e s:${D}::g "$i"
-            fi
-        done
+        # only modify file if it contains path to avoid recompilation on the target
+        find ${D} -name "*.py" -exec grep -q ${D} {} \; -exec sed -i -e s:${D}::g {} \;
 
         if test -e ${D}${bindir} ; then	
             for i in ${D}${bindir}/* ; do \
diff --git a/meta/classes/distutils3.bbclass b/meta/classes/distutils3.bbclass
index bbd645c..e909ef4 100644
--- a/meta/classes/distutils3.bbclass
+++ b/meta/classes/distutils3.bbclass
@@ -64,9 +64,7 @@ distutils3_do_install() {
         bbfatal "${PYTHON_PN} setup.py install execution failed."
 
         # support filenames with *spaces*
-        find ${D} -name "*.py" -print0 | while read -d $'\0' i ; do \
-            sed -i -e s:${D}::g "$i"
-        done
+        find ${D} -name "*.py" -exec grep -q ${D} {} \; -exec sed -i -e s:${D}::g {} \;
 
         if test -e ${D}${bindir} ; then	
             for i in ${D}${bindir}/* ; do \



