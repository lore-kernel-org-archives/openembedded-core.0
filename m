Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TZO7x-0001nI-DV for openembedded-core@lists.openembedded.org;
	Fri, 16 Nov 2012 16:46:45 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAGFWke3000752
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Nov 2012 15:32:46 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 32677-07 for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Nov 2012 15:32:40 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAGFWc0n000744
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Nov 2012 15:32:39 GMT
Message-ID: <1353079960.3709.93.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 16 Nov 2012 15:32:40 +0000
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] sstate: Implement a setscene dependency validation routine to allow skipping of some sstate installation
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
X-List-Received-Date: Fri, 16 Nov 2012 15:46:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This is a first attempt at logic to determine when a sstate dependency needs
to be installed and when it does not. Its a start at the logic and errs on the
side of caution, as it gets wider testing, we can refine the logic as needed.

This code should allow a significant performance speedup to certain workflows, for
example "bitbake xxx-image -c rootfs" will not populate the target sysroot.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index c085c62..470e0ee 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -620,3 +620,55 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d):
 
     return ret
 
+BB_SETSCENE_DEPVALID = "setscene_depvalid"
+
+def setscene_depvalid(task, taskdependees, notneeded, d):
+    # taskdependees is a dict of tasks which depend on task, each being a 3 item list of [PN, TASKNAME, FILENAME]
+    # task is included in taskdependees too
+
+    bb.debug(2, "Considering setscene task: %s" % (str(taskdependees[task])))
+
+    def isNative(x):
+        return x.endswith("-native")
+    def isNativeCross(x):
+        return x.endswith("-native") or x.endswith("-cross") or x.endswith("-cross-initial")
+    def isSafeDep(x):
+        if x in ["quilt-native", "autoconf-native", "automake-native", "gnu-config-native", "libtool-native", "pkgconfig-native", "gcc-cross", "binutils-cross"]:
+            return True
+        return False
+
+    # We can skip these "safe" dependencies since the aren't runtime dependencies, just build time
+    if isSafeDep(taskdependees[task][0]) and taskdependees[task][1] == "do_populate_sysroot":
+        return True
+
+    # We only need to trigger populate_lic through direct dependencies
+    if taskdependees[task][1] == "do_populate_lic":
+        return True
+
+    for dep in taskdependees:
+        bb.debug(2, "  considering dependency: %s" % (str(taskdependees[dep])))
+        if task == dep:
+            continue
+        if dep in notneeded:
+            continue
+        # do_package_write_* and do_package doesn't need do_package
+        if taskdependees[task][1] == "do_package" and taskdependees[dep][1] in ['do_package', 'do_package_write_deb', 'do_package_write_ipk', 'do_package_write_rpm']:
+            continue
+        # do_package_write_* and do_package doesn't need do_populate_sysroot
+        if taskdependees[task][1] == "do_populate_sysroot" and taskdependees[dep][1] in ['do_package', 'do_package_write_deb', 'do_package_write_ipk', 'do_package_write_rpm']:
+            continue
+        # Native/Cross packages don't exist and are noexec anyway
+        if isNativeCross(taskdependees[dep][0]) and taskdependees[dep][1] in ['do_package_write_deb', 'do_package_write_ipk', 'do_package_write_rpm']:
+            continue
+        # Native/Cross populate_sysroot need their dependencies
+        if isNativeCross(taskdependees[task][0]) and isNativeCross(taskdependees[dep][0]) and taskdependees[task][1] == 'do_populate_sysroot' and taskdependees[dep][1] == 'do_populate_sysroot':
+            return False
+        # Target populate_sysroot do not need their dependencies
+        if taskdependees[task][1] == 'do_populate_sysroot' and taskdependees[dep][1] == 'do_populate_sysroot':
+            continue
+
+        # Safe fallthrough default
+        bb.debug(2, " Default setscene dependency fall through due to dependency: %s" % (str(taskdependees[dep])))
+        return False
+    return True
+




