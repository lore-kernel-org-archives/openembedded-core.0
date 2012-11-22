Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TbeiR-0000sZ-4G for openembedded-core@lists.openembedded.org;
	Thu, 22 Nov 2012 22:53:48 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAMLdet2029682
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2012 21:39:40 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26715-09 for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2012 21:39:35 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAMLdT94029676
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2012 21:39:30 GMT
Message-ID: <1353620368.10459.62.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Nov 2012 21:39:28 +0000
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] sstate: Explicitly define populate_sysroot task relationships
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
X-List-Received-Date: Thu, 22 Nov 2012 21:53:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Clean up and clarify the populate_sysroot task dependencies. Target sysroot
packages do need their dependencies installed, as do some target/cross
relationships. We can whitelist the *-initial dependencies as these are
never needed indirectly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index b8a766b..e1bc89d 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -633,7 +633,7 @@ def setscene_depvalid(task, taskdependees, notneeded, d):
     def isNativeCross(x):
         return x.endswith("-native") or x.endswith("-cross") or x.endswith("-cross-initial")
     def isSafeDep(x):
-        if x in ["quilt-native", "autoconf-native", "automake-native", "gnu-config-native", "libtool-native", "pkgconfig-native", "gcc-cross", "binutils-cross"]:
+        if x in ["quilt-native", "autoconf-native", "automake-native", "gnu-config-native", "libtool-native", "pkgconfig-native", "gcc-cross", "binutils-cross", "gcc-cross-initial"]:
             return True
         return False
 
@@ -660,16 +660,23 @@ def setscene_depvalid(task, taskdependees, notneeded, d):
         # Native/Cross packages don't exist and are noexec anyway
         if isNativeCross(taskdependees[dep][0]) and taskdependees[dep][1] in ['do_package_write_deb', 'do_package_write_ipk', 'do_package_write_rpm']:
             continue
-        # Native/Cross populate_sysroot need their dependencies
-        if isNativeCross(taskdependees[task][0]) and isNativeCross(taskdependees[dep][0]) and taskdependees[task][1] == 'do_populate_sysroot' and taskdependees[dep][1] == 'do_populate_sysroot':
-            return False
-        # Target populate_sysroot depended on by cross tools need to be installed
-        if taskdependees[task][1] == 'do_populate_sysroot' and taskdependees[dep][1] == 'do_populate_sysroot' and isNativeCross(taskdependees[dep][0]):
-            return False
 
-        # Target populate_sysroot do not need their dependencies
+        # Consider sysroot depending on sysroot tasks
         if taskdependees[task][1] == 'do_populate_sysroot' and taskdependees[dep][1] == 'do_populate_sysroot':
-            continue
+            # Nothing need depend on libc-initial/gcc-cross-initial
+            if taskdependees[task][0].endswith("-initial"):
+                continue
+            # Native/Cross populate_sysroot need their dependencies
+            if isNativeCross(taskdependees[task][0]) and isNativeCross(taskdependees[dep][0]):
+                return False
+            # Target populate_sysroot depended on by cross tools need to be installed
+            if isNativeCross(taskdependees[dep][0]):
+                return False
+            # Native/cross tools depended upon by target sysroot are not needed
+            if isNativeCross(taskdependees[task][0]):
+                continue
+            # Target populate_sysroot need their dependencies
+            return False
 
         # Safe fallthrough default
         bb.debug(2, " Default setscene dependency fall through due to dependency: %s" % (str(taskdependees[dep])))




