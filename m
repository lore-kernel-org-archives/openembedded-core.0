Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id DDB4573289
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2016 10:45:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u8FAjG3Q014314 for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2016 11:45:16 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id lc_RjiQvp485
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2016 11:45:16 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u8FAjEio014310
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2016 11:45:15 +0100
Message-ID: <1473936314.7207.79.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 15 Sep 2016 11:45:14 +0100
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Subject: [PATCH] sstate: Add postrm command support
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
X-List-Received-Date: Thu, 15 Sep 2016 10:45:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

There are some issues in sstate which can't be handled by file removal
alone. Currently there is no way to execute a command against sstate and
doing so is potentially problematic for things like dependencies. This
patch adds a mechanism where any "postrm" script is executed if its present
allowing some openjade/sgml issues to be resolved.

[YOCTO #8273]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 8b6ac50..0498a38 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -175,6 +175,8 @@ def sstate_install(ss, d):
     if os.access(manifest, os.R_OK):
         bb.fatal("Package already staged (%s)?!" % manifest)
 
+    d.setVar("SSTATE_INST_POSTRM", manifest + ".postrm")
+
     locks = []
     for lock in ss['lockfiles-shared']:
         locks.append(bb.utils.lockfile(lock, True))
@@ -407,6 +409,13 @@ def sstate_clean_manifest(manifest, d):
         except OSError:
             pass
 
+    postrm = manifest + ".postrm"
+    if os.path.exists(manifest + ".postrm"):
+        import subprocess
+        os.chmod(postrm, 0o755)
+        subprocess.call(postrm, shell=True)
+        oe.path.remove(postrm)
+
     oe.path.remove(manifest)
 
 def sstate_clean(ss, d):
@@ -1011,6 +1020,8 @@ python sstate_eventhandler2() {
         for r in toremove:
             (stamp, manifest, workdir) = r.split()
             for m in glob.glob(manifest + ".*"):
+                if m.endswith(".postrm"):
+                    continue
                 sstate_clean_manifest(m, d)
             bb.utils.remove(stamp + "*")
             if removeworkdir:



