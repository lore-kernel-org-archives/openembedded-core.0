Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T5Iml-0003MD-9i for openembedded-core@lists.openembedded.org;
	Sat, 25 Aug 2012 18:00:31 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7PFmNKY008260
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Aug 2012 16:48:23 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17462-09 for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Aug 2012 16:48:18 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7PFmCIp008254
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Aug 2012 16:48:14 +0100
Message-ID: <1345909694.14369.113.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sat, 25 Aug 2012 16:48:14 +0100
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] sstate.bbclass: Detect overwriting files in sstate controlled directories
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
X-List-Received-Date: Sat, 25 Aug 2012 16:00:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We have a potential problem where two sstate packages try and touch the same
file. This adds code which will print a warning whenever this happens.

The implementation does but by maintaining a master file list and comparing
file accesses against this. There are a number of places we have duplicate
accesses which are harmless, mostly in the deploy directory so these
are whitelisted.

For now the code prints warnings, this could be strengthened in future to
become error messages. Whilst working on this code on and off over the past
few months various issues were uncovered, some serious.

[YOCTO #238]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 6762e32..02594a7 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -3,6 +3,7 @@ SSTATE_VERSION = "2"
 SSTATE_MANIFESTS ?= "${TMPDIR}/sstate-control"
 SSTATE_MANFILEBASE = "${SSTATE_MANIFESTS}/manifest-${SSTATE_MANMACH}-"
 SSTATE_MANFILEPREFIX = "${SSTATE_MANFILEBASE}${PN}"
+SSTATE_MASTERMANIFEST = "${SSTATE_MANIFESTS}/master.list"
 
 def generate_sstatefn(spec, hash, d):
     if not hash:
@@ -17,6 +18,7 @@ SSTATE_EXTRAPATH   = ""
 SSTATE_EXTRAPATHWILDCARD = ""
 SSTATE_PATHSPEC   = "${SSTATE_DIR}/${SSTATE_EXTRAPATHWILDCARD}*/${SSTATE_PKGSPEC}"
 
+SSTATE_DUPWHITELIST = "${DEPLOY_DIR_IMAGE}/ ${DEPLOY_DIR}/licenses/ ${DEPLOY_DIR_IPK}/all/ ${DEPLOY_DIR_RPM}/all ${DEPLOY_DIR_DEB}/all/"
 
 SSTATE_SCAN_FILES ?= "*.la *-config *_config"
 SSTATE_SCAN_CMD ?= 'find ${SSTATE_BUILDDIR} \( -name "${@"\" -o -name \"".join(d.getVar("SSTATE_SCAN_FILES", True).split())}" \) -type f'
@@ -125,7 +127,6 @@ def sstate_install(ss, d):
         locks.append(bb.utils.lockfile(lock))
 
     for state in ss['dirs']:
-        oe.path.copytree(state[1], state[2])
         for walkroot, dirs, files in os.walk(state[1]):
             bb.debug(2, "Staging files from %s to %s" % (state[1], state[2]))
             for file in files:
@@ -140,9 +141,35 @@ def sstate_install(ss, d):
                 if not dstdir.endswith("/"):
                     dstdir = dstdir + "/"
                 shareddirs.append(dstdir)
+
+    # Check the file list for conflicts against the master manifest
+    mastermanifest = d.getVar("SSTATE_MASTERMANIFEST", True)
+    whitelist = d.getVar("SSTATE_DUPWHITELIST", True)
+    lock = bb.utils.lockfile(mastermanifest + ".lock")
+    fileslist = [line.strip() for line in open(mastermanifest)]
+    bb.utils.unlockfile(lock)
+    match = []
+    for f in sharedfiles:
+        if f in fileslist:
+            realmatch = True
+            for w in whitelist:
+                if f.startswith(w):
+                    realmatch = False
+                    break
+            if realmatch:
+                match.append(f)
+    if match:
+        bb.warn("The recipe is trying to install files into a shared area when those files already exist. Those files are:\n   %s" % "\n   ".join(match))
+
+    # Write out the manifest and add to the task's manifest file
+    lock = bb.utils.lockfile(mastermanifest + ".lock")
+    mf = open(mastermanifest, "a")
     f = open(manifest, "w")
     for file in sharedfiles:
+        mf.write(file + "\n")
         f.write(file + "\n")
+    bb.utils.unlockfile(lock)
+
     # We want to ensure that directories appear at the end of the manifest
     # so that when we test to see if they should be deleted any contents
     # added by the task will have been removed first.
@@ -152,6 +179,10 @@ def sstate_install(ss, d):
         f.write(di + "\n")
     f.close()
 
+    # Run the actual file install
+    for state in ss['dirs']:
+        oe.path.copytree(state[1], state[2])
+
     for postinst in (d.getVar('SSTATEPOSTINSTFUNCS', True) or '').split():
         bb.build.exec_func(postinst, d)
 
@@ -268,6 +299,18 @@ def sstate_clean_manifest(manifest, d):
         except OSError:
             pass
 
+    # Remove the entries from the master manifest
+    mastermanifest = d.getVar("SSTATE_MASTERMANIFEST", True)
+    lock = bb.utils.lockfile(mastermanifest + ".lock")
+    mf = open(mastermanifest + ".new", "w")
+    for line in open(mastermanifest, "r"):
+        if not line or line in entries:
+            continue
+        mf.write(line)
+    mf.close()
+    os.rename(mastermanifest + ".new", mastermanifest)
+    bb.utils.unlockfile(lock)
+
     oe.path.remove(manifest)
 
 def sstate_clean(ss, d):




