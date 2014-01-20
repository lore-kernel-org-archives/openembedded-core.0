Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9AAD46E51F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2014 11:42:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s0KBgPuR000474
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2014 03:42:26 -0800 (PST)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Mon, 20 Jan 2014 03:42:26 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 20 Jan 2014 19:42:34 +0800
Message-ID: <47b1d3283f93b4b12ba5da4c6b049d46f64e7414.1390210254.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1390210254.git.liezhi.yang@windriver.com>
References: <cover.1390210254.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] sstate.bbclass: remove previous version's stamp
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
X-List-Received-Date: Mon, 20 Jan 2014 11:42:25 -0000
Content-Type: text/plain

There is a potential problem if we don't remove the previous version's
stamp, for example:

The depend chain is:
libtool-native -> autoconf-native -> m4-native
We have two m4-native: 1.4.9 and 1.4.7

1) Clean all of them to make a fresh build so that we can reproduce the
   problem
$ bitbake m4-native autoconf-native libtool-native -ccleansstate

2) Build libtool-native so that the m4-native_1.4.17 will be built
$ bitbake libtool-native

3) Set PREFERRED_VERSION_m4-native = "1.4.9" and build again
$ bitbake libtool-native

4) Set PREFERRED_VERSION_m4-native = "1.4.17" and build again
$ bitbake libtool-native -ccleansstate && bitbake libtool-native

Then the build will fail:
[snip]
| m4: unrecognized option '--gnu'
| Try `m4 --help' for more information.
| autom4te: m4 failed with exit status: 1
[snip]

The is because when we change m4-native to 1.4.17 and build
libtool-native again:
5) libtool-native depends on autoconf-native, and autoconf-native's
   version isn't change, so it can remove the current stamp and mirror
   the sstate (the one depends on m4-native_1.4.9) from the SSTATE_DIR
   correctly.

6) The mirrored autoconf-native depends on m4-native_1.4.17's
   do_populate_sysroot, and the stamp is already there (which is made
   by step 2), so it would do nothing, but this is incorrect, since
   the one that really in the sysroot is m4-native_1.4.9, then the
   error happens.

Remove previous version's stamp in sstate_clean() will fix the problem.

[YOCTO #5422]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/sstate.bbclass | 31 ++++++++++++++++++++++---------
 1 file changed, 22 insertions(+), 9 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 35c3f85..23d7de6 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -331,11 +331,17 @@ def sstate_clean_manifest(manifest, d):
 
 def sstate_clean(ss, d):
     import oe.path
+    import glob
 
     d2 = d.createCopy()
+    stamp_clean = d.getVar("STAMPCLEAN", True)
     extrainf = d.getVarFlag("do_" + ss['task'], 'stamp-extra-info', True)
     if extrainf:
         d2.setVar("SSTATE_MANMACH", extrainf)
+        wildcard_stfile = "%s.do_%s*.%s" % (stamp_clean, ss['task'], extrainf)
+    else:
+        wildcard_stfile = "%s.do_%s*" % (stamp_clean, ss['task'])
+
     manifest = d2.expand("${SSTATE_MANFILEPREFIX}.%s" % ss['name'])
 
     if os.path.exists(manifest):
@@ -350,15 +356,22 @@ def sstate_clean(ss, d):
         for lock in locks:
             bb.utils.unlockfile(lock)
 
-    stfile = d.getVar("STAMP", True) + ".do_" + ss['task']
-    oe.path.remove(stfile)
-    oe.path.remove(stfile + "_setscene")
-    if extrainf:
-        oe.path.remove(stfile + ".*" + extrainf)
-        oe.path.remove(stfile + "_setscene" + ".*" + extrainf)
-    else:
-        oe.path.remove(stfile + ".*")
-        oe.path.remove(stfile + "_setscene" + ".*")
+    # Remove the current and previous stamps, but keep the sigdata.
+    #
+    # The glob() matches do_task* which may match multiple tasks, for
+    # example: do_package and do_package_write_ipk, so we need to
+    # exactly match *.do_task.* and *.do_task_setscene.*
+    rm_stamp = '.do_%s.' % ss['task']
+    rm_setscene = '.do_%s_setscene.' % ss['task']
+    # For BB_SIGNATURE_HANDLER = "noop"
+    rm_nohash = ".do_%s" % ss['task']
+    for stfile in glob.glob(wildcard_stfile):
+        # Keep the sigdata
+        if ".sigdata." in stfile:
+            continue
+        if rm_stamp in stfile or rm_setscene in stfile or \
+                stfile.endswith(rm_nohash):
+            oe.path.remove(stfile)
 
 CLEANFUNCS += "sstate_cleanall"
 
-- 
1.8.3.1


