Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id A75286B6FF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 15:11:05 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s1OFB0E1016300 for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 15:11:00 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id TemtYh86KsxN
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 15:11:00 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s1OFAunl016296
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 15:10:58 GMT
Message-ID: <1393254649.31769.7.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Feb 2014 15:10:49 +0000
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] sstate: Drop 'SafeDep' code from setscene validation function
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
X-List-Received-Date: Mon, 24 Feb 2014 15:11:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I have a feeling this code exists from the time before we had proper
coverage of one sstate task by another task. At that time it was a
"poor" persons version of that idea, we now have much better
code internal to bitbake which handles this.

Worse, this code actually breaks certain rebuild scenarios,
e.g.:

bitbake libtool-cross
bitbake libtool-cross -c cleansstate
rm tmp -rf
bitbake libtool-cross

would fail as binutils-cross wasn't installed from sstate.

The easiest fix is to remove the obsolete/broken code.

[YOCTO #5773]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index f7bd117..947440f 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -699,19 +699,12 @@ def setscene_depvalid(task, taskdependees, notneeded, d):
 
     def isNativeCross(x):
         return x.endswith("-native") or x.endswith("-cross") or x.endswith("-cross-initial") or x.endswith("-crosssdk") or x.endswith("-crosssdk-initial")
-    def isSafeDep(x):
-        if x in ["quilt-native", "autoconf-native", "automake-native", "gnu-config-native", "libtool-native", "pkgconfig-native", "gcc-cross", "binutils-cross", "gcc-cross-initial", "gcc-crosssdk", "binutils-crosssdk", "gcc-crosssdk-initial"]:
-            return True
-        return False
+
     def isPostInstDep(x):
         if x in ["qemu-native", "gdk-pixbuf-native", "qemuwrapper-cross", "depmodwrapper-cross", "systemd-systemctl-native", "gtk-update-icon-cache-native"]:
             return True
         return False
 
-    # We can skip these "safe" dependencies since the aren't runtime dependencies, just build time
-    if isSafeDep(taskdependees[task][0]) and taskdependees[task][1] == "do_populate_sysroot":
-        return True
-
     # We only need to trigger populate_lic through direct dependencies
     if taskdependees[task][1] == "do_populate_lic":
         return True



