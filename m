Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 8DAC96969C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2013 16:52:00 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r57Gv5dx000734 for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Jun 2013 17:57:05 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id mK2cDa7tdSEt
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2013 17:57:05 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r57Guxbw000721
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Jun 2013 17:57:01 +0100
Message-ID: <1370623904.6864.49.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 07 Jun 2013 17:51:44 +0100
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] base/useradd/sstate: Ensure do_package setscene has correct fakeroot dependencies
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
X-List-Received-Date: Fri, 07 Jun 2013 16:52:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The do_package_setscene task needs to depend on fakeroot in order to correctly
install its files.

We can whitelist the dependency in the sstate handling code for some
performance improvements since we only need this if we're installing the
package from sstate.

Also use an append operator in base.bbclass for clarity.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index b1642a2..8af104f 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -501,6 +501,7 @@ python () {
         d.setVarFlag('do_package', 'fakeroot', 1)
         d.setVarFlag('do_package', 'umask', 022)
         d.setVarFlag('do_package_setscene', 'fakeroot', 1)
+        d.appendVarFlag('do_package_setscene', 'depends', ' virtual/fakeroot-native:do_populate_sysroot')
         d.setVarFlag('do_devshell', 'fakeroot', 1)
         d.appendVarFlag('do_devshell', 'depends', ' virtual/fakeroot-native:do_populate_sysroot')
     source_mirror_fetch = d.getVar('SOURCE_MIRROR_FETCH', 0)
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 950be55..e74c642 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -711,7 +711,7 @@ def setscene_depvalid(task, taskdependees, notneeded, d):
 
         # This is due to the [depends] in useradd.bbclass complicating matters
         # The logic *is* reversed here due to the way hard setscene dependencies are injected
-        if taskdependees[task][1] == 'do_package' and taskdependees[dep][0].endswith(('shadow-native', 'shadow-sysroot', 'base-passwd')) and taskdependees[dep][1] == 'do_populate_sysroot':
+        if taskdependees[task][1] == 'do_package' and taskdependees[dep][0].endswith(('shadow-native', 'shadow-sysroot', 'base-passwd', 'pseudo-native')) and taskdependees[dep][1] == 'do_populate_sysroot':
             continue
 
         # Safe fallthrough default
diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index fd61019..e50c889 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -150,7 +150,7 @@ USERADDSETSCENEDEPS = "${MLPREFIX}base-passwd:do_populate_sysroot_setscene shado
 USERADDSETSCENEDEPS_virtclass-cross = ""
 USERADDSETSCENEDEPS_class-native = ""
 USERADDSETSCENEDEPS_class-nativesdk = ""
-do_package_setscene[depends] = "${USERADDSETSCENEDEPS}"
+do_package_setscene[depends] += "${USERADDSETSCENEDEPS}"
 
 # Recipe parse-time sanity checks
 def update_useradd_after_parse(d):



