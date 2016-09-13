Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D3ACF7719C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Sep 2016 13:56:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u8DDuKNo017310 for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Sep 2016 14:56:20 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id NYoAk0fd8Ux7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Sep 2016 14:56:20 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u8DDuGSF017288
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Sep 2016 14:56:17 +0100
Message-ID: <1473774975.7207.32.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 13 Sep 2016 14:56:15 +0100
In-Reply-To: <1473760420.7207.30.camel@linuxfoundation.org>
References: <1473760420.7207.30.camel@linuxfoundation.org>
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Subject: [PATCH v2] autotools: Correctly filter m4 files view to setscene dependencies
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
X-List-Received-Date: Tue, 13 Sep 2016 13:56:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Currently when you run builds from sstate, you can see warnings like:

WARNING: systemd-1_230+gitAUTOINC+3a74d4fc90-r0 do_configure: /data/poky-master/tmp-glibc/sstate-control/manifest-intel-corei7-64-glibc-initial.populate_sysroot not found
WARNING: systemd-1_230+gitAUTOINC+3a74d4fc90-r0 do_configure: /data/poky-master/tmp-glibc/sstate-control/manifest-intel-corei7-64-libgcc-initial.populate_sysroot not found

This is due to co_configure wanting to copy a limited number of m4 macros,
only listed in a recipes DEPENDS but that set is still larger than the set of
recipes which get restored from sstate.

For build determinism and to avoid these warnings, we need to make this
function match what the sstate code does. We really don't want to duplicate
the functionality since keeping things in sync would be hard so we create
a data structure which can be passed into the same underlying function,
setscene_depvalid().

[YOCTO #10030]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index 5fda03d..3e75cf9 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -137,6 +137,8 @@ do_configure[postfuncs] += "autotools_postconfigure"
 ACLOCALDIR = "${WORKDIR}/aclocal-copy"
 
 python autotools_copy_aclocals () {
+    import copy
+
     s = d.getVar("AUTOTOOLS_SCRIPT_PATH", True)
     if not os.path.exists(s + "/configure.in") and not os.path.exists(s + "/configure.ac"):
         if not d.getVar("AUTOTOOLS_COPYACLOCAL", False):
@@ -165,36 +167,64 @@ python autotools_copy_aclocals () {
     if start is None:
         bb.fatal("Couldn't find ourself in BB_TASKDEPDATA?")
 
-    # We need to find configure tasks which are either from <target> -> <target>
-    # or <native> -> <native> but not <target> -> <native> unless they're direct
-    # dependencies. This mirrors what would get restored from sstate.
-    done = [start]
-    next = [start]
+    # We need to figure out which m4 files we need to expose to this do_configure task.
+    # This needs to match what would get restored from sstate, which is controlled 
+    # ultimately by calls from bitbake to setscene_depvalid().
+    # That function expects a setscene dependency tree. We build a dependency tree 
+    # condensed to do_populate_sysroot -> do_populate_sysroot dependencies, similar to 
+    # that used by setscene tasks. We can then call into setscene_depvalid() and decide
+    # which dependencies we can "see" and should expose the m4 files for.
+    setscenedeps = copy.deepcopy(taskdepdata)
+
+    start = set([start])
+
+    # Create collapsed do_populate_sysroot -> do_populate_sysroot tree
+    for dep in taskdepdata:
+        data = setscenedeps[dep]        
+        if data[1] != "do_populate_sysroot":
+            for dep2 in setscenedeps:
+                data2 = setscenedeps[dep2]
+                if dep in data2[3]:
+                    data2[3].update(setscenedeps[dep][3])
+                    data2[3].remove(dep)
+            if dep in start:
+                start.update(setscenedeps[dep][3])
+                start.remove(dep)
+            del setscenedeps[dep]
+
+    # Remove circular references
+    for dep in setscenedeps:
+        if dep in setscenedeps[dep][3]:
+            setscenedeps[dep][3].remove(dep)
+
+    # Direct dependencies should be present and can be depended upon
+    for dep in start:
+        configuredeps.append(setscenedeps[dep][0])
+
+    # Call into setscene_depvalid for each sub-dependency and only copy m4 files
+    # for ones that would be restored from sstate.
+    done = list(start)
+    next = list(start)
     while next:
         new = []
         for dep in next:
-            data = taskdepdata[dep]
+            data = setscenedeps[dep]
             for datadep in data[3]:
                 if datadep in done:
                     continue
-                if (not data[0].endswith("-native")) and taskdepdata[datadep][0].endswith("-native") and dep != start:
-                    continue
                 done.append(datadep)
+
+                taskdeps = {}
+                taskdeps[dep] = setscenedeps[dep][:2]
+                taskdeps[datadep] = setscenedeps[datadep][:2]
+                retval = setscene_depvalid(datadep, taskdeps, [], d)
+                if retval:
+                    bb.note("Skipping setscene dependency %s for m4 macro copying" % datadep)
+                    continue
                 new.append(datadep)
-                if taskdepdata[datadep][1] == "do_configure":
-                    configuredeps.append(taskdepdata[datadep][0])
+                configuredeps.append(setscenedeps[datadep][0])
         next = new
 
-    #configuredeps2 = []
-    #for dep in taskdepdata:
-    #    data = taskdepdata[dep]
-    #    if data[1] == "do_configure" and data[0] != pn:
-    #        configuredeps2.append(data[0])
-    #configuredeps.sort()
-    #configuredeps2.sort()
-    #bb.warn(str(configuredeps))
-    #bb.warn(str(configuredeps2))
-
     cp = []
     if nodeps:
         bb.warn("autotools: Unable to find task dependencies, -b being used? Pulling in all m4 files")



