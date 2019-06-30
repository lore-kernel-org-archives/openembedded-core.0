Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id A94797E951
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Jun 2019 09:19:58 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id n9so10584690wru.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Jun 2019 02:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=oHolQnO9xA5hstWBapofbfncDCsMSdUcdCmEdLR4aeA=;
	b=f2QVhOVkAOcuE2Lt6WhS6OCwQVmaL4nitqJ+bpS02NkWpX8QeUhpQY2wn87EPHZ4nu
	adXPWb7NcwBo7Fv0P43EIy0j4XuYQG3auN+zqybYIRIK+vSFcJgBhLE9KMopOjp3UDh8
	NOMR9OyZ0LH8EcObqB/iyyg9S/BMQSLFx+x/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=oHolQnO9xA5hstWBapofbfncDCsMSdUcdCmEdLR4aeA=;
	b=D163biA2GiSJy4uM82ehTzmSawBP0DYZSrWBbMVxvFtnMwtw2umz/+mTf7BN9jPPxm
	XpU2b7om2xl3l5hLTFr2aYKm0T2LaucAh/6bkgwT5Gjs5ICosay+SWeXGzTmFaEAPHP5
	MOpfBf5dldwAkIvOQjCvPKgs8ERRT5d59noJ10HqMlUaXa6s4ueey9D5uvNVPfN8+QEV
	JebVj4VKj3ZGTFJuRpDpT+UtZuqRZV6IGL+z6gkwyHlvoWDO3/fOV2O6zjfR5KRGea9d
	8ODfxODOT7DYXhApKWO3aV0eUfeuIxEYvbRBFiViwE5YVGbLcpkddZuvQk9qiPmiYA/K
	TKzg==
X-Gm-Message-State: APjAAAVEbBZkKUsRXUe/+HuBEurxWy2yKGiQmq/6VfAlHcRt/YgoeM8k
	qWo6fgidkvNF1DjiQDvHrL4m++EDWs4=
X-Google-Smtp-Source: APXvYqwpvbI4/ocLQS58qzb+tqkTfWbxBGnEHz1CExz4QXxqx/gbaZ4B/pgpMws4SRCD1w2IqMtU6A==
X-Received: by 2002:adf:dfc5:: with SMTP id q5mr15479051wrn.142.1561886399076; 
	Sun, 30 Jun 2019 02:19:59 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	h90sm9198701wrh.15.2019.06.30.02.19.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 30 Jun 2019 02:19:58 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 30 Jun 2019 10:19:56 +0100
Message-Id: <20190630091956.3314-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190630091956.3314-1-richard.purdie@linuxfoundation.org>
References: <20190630091956.3314-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 2/2] package: Build pkgdata specific to the current recipe
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
X-List-Received-Date: Sun, 30 Jun 2019 09:19:59 -0000
Content-Transfer-Encoding: 8bit

This switches the code to build pkgdata specific to the current recipe
which means that its filtered to the recipes dependencies and can perform
better as we can drop the lockfile.

It uses a similar method to the staging code to do this, using BB_TASKDEPDATA
to construct a list of packagedata task output which this recipe should "see".

The original pkgdata store is left unaltered so existing code works.

The lock file was there to prevent files disappearing as they were read or as
directories were listed. Since we have a copy of the data and only access output
from completed tasks (as per their manifests), we can remove the lock.

The lock was causing starvation issues on systems with parallelism.

There was also a potential determinism problem as the current code could "see"
data from recipes which it doesn't depend upon.

[YOCTO #13412]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package.bbclass         |  16 +--
 meta/classes/package_pkgdata.bbclass | 167 +++++++++++++++++++++++++++
 2 files changed, 170 insertions(+), 13 deletions(-)
 create mode 100644 meta/classes/package_pkgdata.bbclass

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 70babb3812c..8adf6e16508 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -40,6 +40,7 @@
 
 inherit packagedata
 inherit chrpath
+inherit package_pkgdata
 
 # Need the package_qa_handle_error() in insane.bbclass
 inherit insane
@@ -1571,7 +1572,7 @@ python package_do_filedeps() {
         d.setVar("FILERPROVIDESFLIST_" + pkg, " ".join(provides_files[pkg]))
 }
 
-SHLIBSDIRS = "${PKGDATA_DIR}/${MLPREFIX}shlibs2"
+SHLIBSDIRS = "${WORKDIR_PKGDATA}/${MLPREFIX}shlibs2"
 SHLIBSWORKDIR = "${PKGDESTWORK}/${MLPREFIX}shlibs2"
 
 python package_do_shlibs() {
@@ -1729,10 +1730,7 @@ python package_do_shlibs() {
 
     needed = {}
 
-    # Take shared lock since we're only reading, not writing
-    lf = bb.utils.lockfile(d.expand("${PACKAGELOCK}"), True)
     shlib_provider = oe.package.read_shlib_providers(d)
-    bb.utils.unlockfile(lf)
 
     for pkg in shlib_pkgs:
         private_libs = d.getVar('PRIVATE_LIBS_' + pkg) or d.getVar('PRIVATE_LIBS') or ""
@@ -1918,9 +1916,6 @@ python package_do_pkgconfig () {
                 f.write('%s\n' % p)
             f.close()
 
-    # Take shared lock since we're only reading, not writing
-    lf = bb.utils.lockfile(d.expand("${PACKAGELOCK}"), True)
-
     # Go from least to most specific since the last one found wins
     for dir in reversed(shlibs_dirs):
         if not os.path.exists(dir):
@@ -1936,8 +1931,6 @@ python package_do_pkgconfig () {
                 for l in lines:
                     pkgconfig_provided[pkg].append(l.rstrip())
 
-    bb.utils.unlockfile(lf)
-
     for pkg in packages.split():
         deps = []
         for n in pkgconfig_needed[pkg]:
@@ -2134,6 +2127,7 @@ def gen_packagevar(d):
 PACKAGE_PREPROCESS_FUNCS ?= ""
 # Functions for setting up PKGD
 PACKAGEBUILDPKGD ?= " \
+                package_prepare_pkgdata \
                 perform_packagecopy \
                 ${PACKAGE_PREPROCESS_FUNCS} \
                 split_and_strip_files \
@@ -2261,12 +2255,8 @@ do_packagedata () {
 addtask packagedata before do_build after do_package
 
 SSTATETASKS += "do_packagedata"
-# PACKAGELOCK protects readers of PKGDATA_DIR against writes
-# whilst code is reading in do_package
-PACKAGELOCK = "${STAGING_DIR}/package-output.lock"
 do_packagedata[sstate-inputdirs] = "${PKGDESTWORK}"
 do_packagedata[sstate-outputdirs] = "${PKGDATA_DIR}"
-do_packagedata[sstate-lockfile] = "${PACKAGELOCK}"
 do_packagedata[stamp-extra-info] = "${MACHINE_ARCH}"
 
 python do_packagedata_setscene () {
diff --git a/meta/classes/package_pkgdata.bbclass b/meta/classes/package_pkgdata.bbclass
new file mode 100644
index 00000000000..18b7ed62e03
--- /dev/null
+++ b/meta/classes/package_pkgdata.bbclass
@@ -0,0 +1,167 @@
+WORKDIR_PKGDATA = "${WORKDIR}/pkgdata-sysroot"
+
+def package_populate_pkgdata_dir(pkgdatadir, d):
+    import glob
+
+    postinsts = []
+    seendirs = set()
+    stagingdir = d.getVar("PKGDATA_DIR")
+    pkgarchs = ['${MACHINE_ARCH}']
+    pkgarchs = pkgarchs + list(reversed(d.getVar("PACKAGE_EXTRA_ARCHS").split()))
+    pkgarchs.append('allarch')
+
+    bb.utils.mkdirhier(pkgdatadir)
+    for pkgarch in pkgarchs:
+        for manifest in glob.glob(d.expand("${SSTATE_MANIFESTS}/manifest-%s-*.packagedata" % pkgarch)):
+            with open(manifest, "r") as f:
+                for l in f:
+                    l = l.strip()
+                    dest = l.replace(stagingdir, "")
+                    if l.endswith("/"):
+                        staging_copydir(l, pkgdatadir, dest, seendirs)
+                        continue
+                    try:
+                        staging_copyfile(l, pkgdatadir, dest, postinsts, seendirs)
+                    except FileExistsError:
+                        continue
+
+python package_prepare_pkgdata() {
+    import copy
+    import glob
+
+    taskdepdata = d.getVar("BB_TASKDEPDATA", False)
+    mytaskname = d.getVar("BB_RUNTASK")
+    if mytaskname.endswith("_setscene"):
+        mytaskname = mytaskname.replace("_setscene", "")
+    workdir = d.getVar("WORKDIR")
+    pn = d.getVar("PN")
+    stagingdir = d.getVar("PKGDATA_DIR")
+    pkgdatadir = d.getVar("WORKDIR_PKGDATA")
+
+    # Detect bitbake -b usage
+    nodeps = d.getVar("BB_LIMITEDDEPS") or False
+    if nodeps:
+        staging_package_populate_pkgdata_dir(pkgdatadir, d)
+        return
+
+    start = None
+    configuredeps = []
+    for dep in taskdepdata:
+        data = taskdepdata[dep]
+        if data[1] == mytaskname and data[0] == pn:
+            start = dep
+            break
+    if start is None:
+        bb.fatal("Couldn't find ourself in BB_TASKDEPDATA?")
+
+    # We need to figure out which sysroot files we need to expose to this task.
+    # This needs to match what would get restored from sstate, which is controlled
+    # ultimately by calls from bitbake to setscene_depvalid().
+    # That function expects a setscene dependency tree. We build a dependency tree
+    # condensed to inter-sstate task dependencies, similar to that used by setscene
+    # tasks. We can then call into setscene_depvalid() and decide
+    # which dependencies we can "see" and should expose in the recipe specific sysroot.
+    setscenedeps = copy.deepcopy(taskdepdata)
+
+    start = set([start])
+
+    sstatetasks = d.getVar("SSTATETASKS").split()
+    # Add recipe specific tasks referenced by setscene_depvalid()
+    sstatetasks.append("do_stash_locale")
+
+    # If start is an sstate task (like do_package) we need to add in its direct dependencies
+    # else the code below won't recurse into them.
+    for dep in set(start):
+        for dep2 in setscenedeps[dep][3]:
+            start.add(dep2)
+        start.remove(dep)
+
+    # Create collapsed do_populate_sysroot -> do_populate_sysroot tree
+    for dep in taskdepdata:
+        data = setscenedeps[dep]
+        if data[1] not in sstatetasks:
+            for dep2 in setscenedeps:
+                data2 = setscenedeps[dep2]
+                if dep in data2[3]:
+                    data2[3].update(setscenedeps[dep][3])
+                    data2[3].remove(dep)
+            if dep in start:
+                start.update(setscenedeps[dep][3])
+                start.remove(dep)
+            del setscenedeps[dep]
+
+    # Remove circular references
+    for dep in setscenedeps:
+        if dep in setscenedeps[dep][3]:
+            setscenedeps[dep][3].remove(dep)
+
+    # Direct dependencies should be present and can be depended upon
+    for dep in set(start):
+        if setscenedeps[dep][1] == "do_packagedata":
+            if dep not in configuredeps:
+                configuredeps.append(dep)
+
+    msgbuf = []
+    # Call into setscene_depvalid for each sub-dependency and only copy sysroot files
+    # for ones that would be restored from sstate.
+    done = list(start)
+    next = list(start)
+    while next:
+        new = []
+        for dep in next:
+            data = setscenedeps[dep]
+            for datadep in data[3]:
+                if datadep in done:
+                    continue
+                taskdeps = {}
+                taskdeps[dep] = setscenedeps[dep][:2]
+                taskdeps[datadep] = setscenedeps[datadep][:2]
+                retval = setscene_depvalid(datadep, taskdeps, [], d, msgbuf)
+                done.append(datadep)
+                new.append(datadep)
+                if retval:
+                    msgbuf.append("Skipping setscene dependency %s" % datadep)
+                    continue
+                if datadep not in configuredeps and setscenedeps[datadep][1] == "do_packagedata":
+                    configuredeps.append(datadep)
+                    msgbuf.append("Adding dependency on %s" % setscenedeps[datadep][0])
+                else:
+                    msgbuf.append("Following dependency on %s" % setscenedeps[datadep][0])
+        next = new
+
+    # This logging is too verbose for day to day use sadly
+    #bb.debug(2, "\n".join(msgbuf))
+
+    seendirs = set()
+    postinsts = []
+    multilibs = {}
+    manifests = {}
+
+    msg_adding = []
+
+    for dep in configuredeps:
+        c = setscenedeps[dep][0]
+        msg_adding.append(c)
+
+        manifest, d2 = oe.sstatesig.find_sstate_manifest(c, setscenedeps[dep][2], "packagedata", d, multilibs)
+        destsysroot = pkgdatadir
+
+        if manifest:
+            targetdir = destsysroot
+            with open(manifest, "r") as f:
+                manifests[dep] = manifest
+                for l in f:
+                    l = l.strip()
+                    dest = targetdir + l.replace(stagingdir, "")
+                    if l.endswith("/"):
+                        staging_copydir(l, targetdir, dest, seendirs)
+                        continue
+                    staging_copyfile(l, targetdir, dest, postinsts, seendirs)
+
+    bb.note("Installed into pkgdata-sysroot: %s" % str(msg_adding))
+
+}
+package_prepare_pkgdata[cleandirs] = "${WORKDIR_PKGDATA}"
+package_prepare_pkgdata[vardepsexclude] += "MACHINE_ARCH PACKAGE_EXTRA_ARCHS SDK_ARCH BUILD_ARCH SDK_OS BB_TASKDEPDATA"
+
+
-- 
2.20.1


