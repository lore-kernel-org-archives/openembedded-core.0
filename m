Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3178273BBE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jun 2015 22:28:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t58MSO1G016061 for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Jun 2015 23:28:24 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id vS9kPTiHc-Yd
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jun 2015 23:28:24 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t58MSCP4016038
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Jun 2015 23:28:24 +0100
Message-ID: <1433802492.28975.112.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 08 Jun 2015 23:28:12 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] sstate: Add eventhandler which cleans up stale recipe data
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
X-List-Received-Date: Mon, 08 Jun 2015 22:28:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

"Incremental builds do not work well when renaming recipes or changing
architecture" is a long standing issue which causes people considerable
pain. We've struggled for a long time to come up with a way to
generically address the problem.

There are additional issues where removal of a layer caused data to
continue to exist and additionally, changing DISTRO_FEATURES also caused
problems in an existing TMPDIR.

This patch attempts to address this by adding a mapping between stamp
files and manifests. After parsing we can easily tell which stamp files
are still reachable, if any manifest has a stamp that can no longer be
reached, we can remove it. Since this code ties this to the sstate
architecture list, it will not remove data from other than the current
MACHINE (and its active architectures). It does not clean the sstate
cache so if another build activates something which was cleaned, it
should reinstall from sstate.

We can also go one step further, depending on the setting of
SSTATE_PRUNE_OBSOLETEWORKDIR, workdirs which are no longer active can
also be removed. This avoids the buildup of many old copies of data in
WORKDIR for example when versions are upgraded.

The one thing which may surprise people with this change is if you
remove a layer, data added by that layer will be "uninstalled" before
the next build continues. I believe this is a feature and a good thing
to do though.

This code is safe with existing builds. If something isn't in the new
index it simply isn't removed. Since changes to the sstate code trigger
a rebuild, after this merges, we can assume the code will start to
detect changes from that point onwards.

[YOCTO #4102]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 949ba4a..89df28a 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -33,6 +33,16 @@ SSTATE_SCAN_CMD ?= 'find ${SSTATE_BUILDDIR} \( -name "${@"\" -o -name \"".join(d
 
 BB_HASHFILENAME = "${SSTATE_EXTRAPATH} ${SSTATE_PKGSPEC} ${SSTATE_SWSPEC}"
 
+SSTATE_ARCHS = " \
+    ${BUILD_ARCH} \
+    ${BUILD_ARCH}_${SDK_ARCH}_${SDK_OS} \
+    ${BUILD_ARCH}_${TARGET_ARCH} \
+    ${SDK_ARCH}_${SDK_OS} \
+    ${SDK_ARCH}_${PACKAGE_ARCH} \
+    allarch \
+    ${PACKAGE_ARCH} \
+    ${MACHINE}"
+
 SSTATE_MANMACH ?= "${SSTATE_PKGARCH}"
 
 SSTATECREATEFUNCS = "sstate_hardcode_path"
@@ -233,6 +243,20 @@ def sstate_install(ss, d):
         f.write(di + "\n")
     f.close()
 
+    # Append to the list of manifests for this PACKAGE_ARCH
+
+    i = d2.expand("${SSTATE_MANIFESTS}/index-${SSTATE_MANMACH}")
+    l = bb.utils.lockfile(i + ".lock")
+    filedata = d.getVar("STAMP", True) + " " + d2.getVar("SSTATE_MANFILEPREFIX", True) + " " + d.getVar("WORKDIR", True) + "\n"
+    manifests = []
+    if os.path.exists(i):
+        with open(i, "r") as f:
+            manifests = f.readlines()
+    if filedata not in manifests:
+        with open(i, "a+") as f:
+            f.write(filedata)
+    bb.utils.unlockfile(l)
+
     # Run the actual file install
     for state in ss['dirs']:
         if os.path.exists(state[1]):
@@ -858,3 +882,44 @@ python sstate_eventhandler() {
         bb.siggen.dump_this_task(sstatepkg + '_' + taskname + ".tgz" ".siginfo", d)
 }
 
+SSTATE_PRUNE_OBSOLETEWORKDIR = "1"
+
+# Event handler which removes manifests and stamps file for
+# recipes which are no longer reachable in a build where they
+# once were.
+# Also optionally removes the workdir of those tasks/recipes
+#
+addhandler sstate_eventhandler2
+sstate_eventhandler2[eventmask] = "bb.event.ReachableStamps"
+python sstate_eventhandler2() {
+    import glob
+    d = e.data
+    stamps = e.stamps.values()
+    removeworkdir = (d.getVar("SSTATE_PRUNE_OBSOLETEWORKDIR") == "1")
+    seen = []
+    for a in d.getVar("SSTATE_ARCHS", True).split():
+        toremove = []
+        i = d.expand("${SSTATE_MANIFESTS}/index-" + a)
+        if not os.path.exists(i):
+            continue
+        with open(i, "r") as f:
+            lines = f.readlines()
+            for l in lines:
+                (stamp, manifest, workdir) = l.split()
+                if stamp not in stamps:
+                    toremove.append(l)
+                    if stamp not in seen:
+                        bb.note("Stamp %s is not reachable, removing related manifests" % stamp)
+                        seen.append(stamp)
+        for r in toremove:
+            (stamp, manifest, workdir) = r.split()
+            for m in glob.glob(manifest + ".*"):
+                sstate_clean_manifest(m, d)
+            bb.utils.remove(stamp + "*")
+            if removeworkdir:
+                bb.utils.remove(workdir, recurse = True)
+            lines.remove(r)
+        with open(i, "w") as f:
+            for l in lines:
+                f.write(l)
+}



