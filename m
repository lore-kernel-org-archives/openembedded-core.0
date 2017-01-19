Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id EDA2671E1B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 22:53:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0JMrQi8005703; Thu, 19 Jan 2017 22:53:31 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id hhLTXB9cDF8Z; Thu, 19 Jan 2017 22:53:31 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0JMrNRJ005651
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 19 Jan 2017 22:53:24 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cULa7-0004hB-Ib; Thu, 19 Jan 2017 22:53:23 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jan 2017 22:52:45 +0000
Message-Id: <1484866395-17971-3-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1484866395-17971-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1484866395-17971-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 03/33] sstate: Drop the depchain isPostDep() checks
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
X-List-Received-Date: Thu, 19 Jan 2017 22:53:35 -0000

The dependencies of do_package_write_* tasks are either going to be packaging
tools needed to build the packages, or, native tools needed at postinst
time. Now we've formalised this dependency pattern, drop the hardcoded
list and work based on the rule. The package creation tools are usually
the same tools needed at rootfs/postinst time anyway so the difference is
moot.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sstate.bbclass | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index b56e95a..f1faf48 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -871,17 +871,14 @@ BB_SETSCENE_DEPVALID = "setscene_depvalid"
 def setscene_depvalid(task, taskdependees, notneeded, d):
     # taskdependees is a dict of tasks which depend on task, each being a 3 item list of [PN, TASKNAME, FILENAME]
     # task is included in taskdependees too
+    # Return - False - We need this dependency
+    #        - True - We can skip this dependency
 
     bb.debug(2, "Considering setscene task: %s" % (str(taskdependees[task])))
 
     def isNativeCross(x):
         return x.endswith("-native") or "-cross-" in x or "-crosssdk" in x
 
-    def isPostInstDep(x):
-        if x in ["qemu-native", "gdk-pixbuf-native", "qemuwrapper-cross", "depmodwrapper-cross", "systemd-systemctl-native", "gtk-icon-utils-native", "ca-certificates-native"]:
-            return True
-        return False
-
     # We only need to trigger populate_lic through direct dependencies
     if taskdependees[task][1] == "do_populate_lic":
         return True
@@ -903,10 +900,11 @@ def setscene_depvalid(task, taskdependees, notneeded, d):
         # do_package_write_* and do_package doesn't need do_package
         if taskdependees[task][1] == "do_package" and taskdependees[dep][1] in ['do_package', 'do_package_write_deb', 'do_package_write_ipk', 'do_package_write_rpm', 'do_packagedata', 'do_package_qa']:
             continue
-        # do_package_write_* and do_package doesn't need do_populate_sysroot, unless is a postinstall dependency
-        if taskdependees[task][1] == "do_populate_sysroot" and taskdependees[dep][1] in ['do_package', 'do_package_write_deb', 'do_package_write_ipk', 'do_package_write_rpm', 'do_packagedata', 'do_package_qa']:
-            if isPostInstDep(taskdependees[task][0]) and taskdependees[dep][1] in ['do_package_write_deb', 'do_package_write_ipk', 'do_package_write_rpm']:
-                return False
+        # do_package_write_* need do_populate_sysroot as they're mainly postinstall dependencies
+        if taskdependees[task][1] == "do_populate_sysroot" and taskdependees[dep][1] in ['do_package_write_deb', 'do_package_write_ipk', 'do_package_write_rpm']:
+            return False
+        # do_package/packagedata/package_qa don't need do_populate_sysroot
+        if taskdependees[task][1] == "do_populate_sysroot" and taskdependees[dep][1] in ['do_package', 'do_packagedata', 'do_package_qa']:
             continue
         # Native/Cross packages don't exist and are noexec anyway
         if isNativeCross(taskdependees[dep][0]) and taskdependees[dep][1] in ['do_package_write_deb', 'do_package_write_ipk', 'do_package_write_rpm', 'do_packagedata', 'do_package', 'do_package_qa']:
-- 
2.7.4


