Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 81AE17719E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 23:30:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0RNU1eH023337; Wed, 27 Jan 2016 23:30:32 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id YIuBFFU7sc7j; Wed, 27 Jan 2016 23:30:32 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0RNUUOH023425
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 27 Jan 2016 23:30:31 GMT
Message-ID: <1453937430.10340.16.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 27 Jan 2016 23:30:30 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: "Witt, Randy E" <randy.e.witt@intel.com>
Subject: [PATCH] sstate: Improve handling of useradd dependencies
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
X-List-Received-Date: Wed, 27 Jan 2016 23:30:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

useradd has sstate [depends] for both do_package and do_populate_sysroot
yet the dependency validation code only covers do_package.

Add coverage of populate_sysroot, else the order inversion that [depends]
creates means unexpected installation of users of useradd.bbclass (e.g.
avahi do_populate_sysroot) in cases where it shouldn't be (e.g.
libnss-mdns -c packagedata).

The code needs to move above the other populate_sysroot intercept code
since there are specific cases we need to cover before that code.

The result of this change is more optimal installation of sstate objects
in common usage scenarios.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 57aaf487..18d6fb7 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -876,6 +876,11 @@ def setscene_depvalid(task, taskdependees, notneeded, d):
         if isNativeCross(taskdependees[dep][0]) and taskdependees[dep][1] in ['do_package_write_deb', 'do_package_write_ipk', 'do_package_write_rpm', 'do_packagedata', 'do_package', 'do_package_qa']:
             continue
 
+        # This is due to the [depends] in useradd.bbclass complicating matters
+        # The logic *is* reversed here due to the way hard setscene dependencies are injected
+        if (taskdependees[task][1] == 'do_package' or taskdependees[task][1] == 'do_populate_sysroot') and taskdependees[dep][0].endswith(('shadow-native', 'shadow-sysroot', 'base-passwd', 'pseudo-native')) and taskdependees[dep][1] == 'do_populate_sysroot':
+            continue
+
         # Consider sysroot depending on sysroot tasks
         if taskdependees[task][1] == 'do_populate_sysroot' and taskdependees[dep][1] == 'do_populate_sysroot':
             # base-passwd/shadow-sysroot don't need their dependencies
@@ -902,10 +907,6 @@ def setscene_depvalid(task, taskdependees, notneeded, d):
         if taskdependees[dep][1] == "do_populate_lic":
             continue
 
-        # This is due to the [depends] in useradd.bbclass complicating matters
-        # The logic *is* reversed here due to the way hard setscene dependencies are injected
-        if taskdependees[task][1] == 'do_package' and taskdependees[dep][0].endswith(('shadow-native', 'shadow-sysroot', 'base-passwd', 'pseudo-native')) and taskdependees[dep][1] == 'do_populate_sysroot':
-            continue
 
         # Safe fallthrough default
         bb.debug(2, " Default setscene dependency fall through due to dependency: %s" % (str(taskdependees[dep])))



