Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TGrvQ-0001EX-Lk for openembedded-core@lists.openembedded.org;
	Wed, 26 Sep 2012 15:45:16 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8QDWLKi019967
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2012 14:32:21 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19437-08 for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2012 14:32:17 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8QDWDMK019961
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2012 14:32:13 +0100
Message-ID: <1348666333.8662.105.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Sep 2012 14:32:13 +0100
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] sstate: Remove master manifest usage
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
X-List-Received-Date: Wed, 26 Sep 2012 13:45:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This was added to allow detection of duplicate files being installed by sstate.
There is a much simpler way, just check if the file already exists. This
effectively uses the kernel VFS as the cache which is much more efficient.

This resolves a significant performance bottleneck (lock contention on a
single file) when running builds that are just being generated from sstate
cache files.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 0037ce5..6878e1a 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -3,7 +3,6 @@ SSTATE_VERSION = "2"
 SSTATE_MANIFESTS ?= "${TMPDIR}/sstate-control"
 SSTATE_MANFILEBASE = "${SSTATE_MANIFESTS}/manifest-${SSTATE_MANMACH}-"
 SSTATE_MANFILEPREFIX = "${SSTATE_MANFILEBASE}${PN}"
-SSTATE_MASTERMANIFEST = "${SSTATE_MANIFESTS}/master.list"
 
 def generate_sstatefn(spec, hash, d):
     if not hash:
@@ -142,17 +141,11 @@ def sstate_install(ss, d):
                     dstdir = dstdir + "/"
                 shareddirs.append(dstdir)
 
-    # Check the file list for conflicts against the master manifest
-    mastermanifest = d.getVar("SSTATE_MASTERMANIFEST", True)
+    # Check the file list for conflicts against files which already exist
     whitelist = (d.getVar("SSTATE_DUPWHITELIST", True) or "").split()
-    lock = bb.utils.lockfile(mastermanifest + ".lock")
-    if not os.path.exists(mastermanifest):
-        open(mastermanifest, "w").close()
-    fileslist = [line.strip() for line in open(mastermanifest)]
-    bb.utils.unlockfile(lock)
     match = []
     for f in sharedfiles:
-        if f in fileslist:
+        if os.path.exists(f):
             realmatch = True
             for w in whitelist:
                 if f.startswith(w):
@@ -163,14 +156,10 @@ def sstate_install(ss, d):
     if match:
         bb.warn("The recipe is trying to install files into a shared area when those files already exist. Those files are:\n   %s" % "\n   ".join(match))
 
-    # Write out the manifest and add to the task's manifest file
-    lock = bb.utils.lockfile(mastermanifest + ".lock")
-    mf = open(mastermanifest, "a")
+    # Write out the manifest
     f = open(manifest, "w")
     for file in sharedfiles:
-        mf.write(file + "\n")
         f.write(file + "\n")
-    bb.utils.unlockfile(lock)
 
     # We want to ensure that directories appear at the end of the manifest
     # so that when we test to see if they should be deleted any contents
@@ -301,20 +290,6 @@ def sstate_clean_manifest(manifest, d):
         except OSError:
             pass
 
-    # Remove the entries from the master manifest
-    mastermanifest = d.getVar("SSTATE_MASTERMANIFEST", True)
-    lock = bb.utils.lockfile(mastermanifest + ".lock")
-    if not os.path.exists(mastermanifest):
-        open(mastermanifest, "w").close()
-    mf = open(mastermanifest + ".new", "w")
-    for line in open(mastermanifest, "r"):
-        if not line or line in entries:
-            continue
-        mf.write(line)
-    mf.close()
-    os.rename(mastermanifest + ".new", mastermanifest)
-    bb.utils.unlockfile(lock)
-
     oe.path.remove(manifest)
 
 def sstate_clean(ss, d):




