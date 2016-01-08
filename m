Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9797F60290
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 18:25:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u08IPP79017028; Fri, 8 Jan 2016 18:25:25 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Qr0n-PjO6psZ; Fri,  8 Jan 2016 18:25:25 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u08IPMw1017021
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 8 Jan 2016 18:25:23 GMT
Message-ID: <1452277522.7598.140.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 08 Jan 2016 18:25:22 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: "Eggleton, Paul" <paul.eggleton@intel.com>
Subject: [RFC PATCH] populate_sdk_ext: Change to include siginfo and non sstate task sigs
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
X-List-Received-Date: Fri, 08 Jan 2016 18:25:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Right now, the locked task hashes list for the extensible SDK locks
down only the sstate tasks.

Whilst aesthetically pleasing, this gives two problems:

* Half the task are left floating meaning checksum mismatches
  are a pain to debug
* The later code which copies relavent data files out the sstate
  cache can't use any of this data.

This patch modifies things so all the checksums are listed in the locked
file. An exclusion of tasks probably makes more sense for the library
function rather than an allowed list.

The only sstate task being deliberately excluded here was do_package
so add in a function to explictly exclude those sstate object files.

The net result of this that siginfo files for all tasks are included in
the SDK, which means commands like "bitbake -S printdiff" now function.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 317043d..3a65c07 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -171,10 +171,9 @@ python copy_buildsystem () {
     oe.copy_buildsystem.generate_locked_sigs(sigfile, d)
 
     # Filter the locked signatures file to just the sstate tasks we are interested in
-    allowed_tasks = ['do_populate_lic', 'do_populate_sysroot', 'do_packagedata', 'do_package_write_ipk', 'do_package_write_rpm', 'do_package_write_deb', 'do_package_qa', 'do_deploy']
     excluded_targets = d.getVar('SDK_TARGETS', True)
     lockedsigs_pruned = baseoutpath + '/conf/locked-sigs.inc'
-    oe.copy_buildsystem.prune_lockedsigs(allowed_tasks,
+    oe.copy_buildsystem.prune_lockedsigs([],
                                          excluded_targets,
                                          sigfile,
                                          lockedsigs_pruned)
@@ -187,6 +186,12 @@ python copy_buildsystem () {
                                                    d.getVar('SSTATE_DIR', True),
                                                    sstate_out, d,
                                                    fixedlsbstring)
+    # We don't need sstate do_package files
+    for root, dirs, files in os.walk(sstate_out):
+        for name in files:
+            if name.endswith("_package.tgz"):
+                f = os.path.join(root, name)
+                os.remove(f)
 }
 
 def extsdk_get_buildtools_filename(d):
diff --git a/meta/lib/oe/copy_buildsystem.py b/meta/lib/oe/copy_buildsystem.py
index 15af4eb..a5ca3df 100644
--- a/meta/lib/oe/copy_buildsystem.py
+++ b/meta/lib/oe/copy_buildsystem.py
@@ -75,7 +75,7 @@ def generate_locked_sigs(sigfile, d):
     tasks = ['%s.%s' % (v[2], v[1]) for v in depd.itervalues()]
     bb.parse.siggen.dump_lockedsigs(sigfile, tasks)
 
-def prune_lockedsigs(allowed_tasks, excluded_targets, lockedsigs, pruned_output):
+def prune_lockedsigs(excluded_tasks, excluded_targets, lockedsigs, pruned_output):
     with open(lockedsigs, 'r') as infile:
         bb.utils.mkdirhier(os.path.dirname(pruned_output))
         with open(pruned_output, 'w') as f:
@@ -84,7 +84,7 @@ def prune_lockedsigs(allowed_tasks, excluded_targets, lockedsigs, pruned_output)
                 if invalue:
                     if line.endswith('\\\n'):
                         splitval = line.strip().split(':')
-                        if splitval[1] in allowed_tasks and not splitval[0] in excluded_targets:
+                        if not splitval[1] in excluded_tasks and not splitval[0] in excluded_targets:
                             f.write(line)
                     else:
                         f.write(line)



