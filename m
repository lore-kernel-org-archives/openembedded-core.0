Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F35136E36D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2014 06:43:30 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s0H6hWZ1021443
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2014 22:43:32 -0800 (PST)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.347.0;
	Thu, 16 Jan 2014 22:43:31 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 17 Jan 2014 14:43:22 +0800
Message-ID: <981567c4dfef59be08373f124b36739449a546a1.1389940146.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1389940146.git.liezhi.yang@windriver.com>
References: <cover.1389940146.git.liezhi.yang@windriver.com>
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
X-List-Received-Date: Fri, 17 Jan 2014 06:43:31 -0000
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
 meta/classes/sstate.bbclass | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 35c3f85..bad8b78 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -331,11 +331,18 @@ def sstate_clean_manifest(manifest, d):
 
 def sstate_clean(ss, d):
     import oe.path
+    import glob
+    import re
 
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
@@ -350,15 +357,12 @@ def sstate_clean(ss, d):
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
+    # Remove the current and previous stamps, but keep the sigdata
+    re_sigdata = ".*\.do_%s\.sigdata\." % ss['task']
+    for stfile in glob.glob(wildcard_stfile):
+        # Keep the sigdata
+        if not re.match(re_sigdata, stfile):
+            oe.path.remove(stfile)
 
 CLEANFUNCS += "sstate_cleanall"
 
-- 
1.8.3.1


