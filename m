Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 539ED65D59
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Sep 2014 08:09:00 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8H890aJ000247
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 17 Sep 2014 01:09:00 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 17 Sep 2014 01:09:00 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <mark.hatle@windriver.com>,
	<richard.purdie@linuxfoundation.org>
Date: Wed, 17 Sep 2014 16:08:33 +0800
Message-ID: <7e57c471b593b7be818545b5da25869cb506bde1.1410939794.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1410939794.git.hongxu.jia@windriver.com>
References: <cover.1410939794.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 9/9] sstatesig: incremental dump lockedsigs
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
X-List-Received-Date: Wed, 17 Sep 2014 08:09:00 -0000
Content-Type: text/plain

The idea of incremental sig is:

New sig file = Old sig file (if available) + New sig items in current build.

Limit the modification within the dump_lockedsigs, and add two variables
'self.lockedsigs_types' and 'self.lockedsigs_raw' keep old sig file.

How to config for incremental dump:
...
USER_CLASSES += "sstate_lockedsig"
SIGGEN_LOCKEDSIGS_CONFIG = "${TOPDIR}/locked-sigs.inc"
require ${SIGGEN_LOCKEDSIGS_CONFIG}
...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/lib/oe/sstatesig.py | 33 +++++++++++++++++++--------------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index af7617e..d8cd8e6 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -93,6 +93,10 @@ class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
         self.lockedhashfn = {}
         self.machine = data.getVar("MACHINE", True)
         self.mismatch_msgs = []
+        self.lockedsigs_types = (data.getVar("SIGGEN_LOCKEDSIGS_TYPES", True) or "").split()
+        self.lockedsigs_raw = {}
+        for t in self.lockedsigs_types:
+            self.lockedsigs_raw[t] = (data.getVar("SIGGEN_LOCKEDSIGS_%s" % t, True) or "").split()
         pass
     def rundep_check(self, fn, recipename, task, dep, depname, dataCache = None):
         return sstate_rundepfilter(self, fn, recipename, task, dep, depname, dataCache)
@@ -142,28 +146,29 @@ class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
             sigfile = os.getcwd() + "/locked-sigs.inc"
 
         bb.plain("Writing locked sigs to %s" % sigfile)
-        types = {}
         for k in self.runtaskdeps:
             fn = k.rsplit(".",1)[0]
             t = self.lockedhashfn[fn].split(" ")[1].split(":")[5]
             t = 't-' + t.replace('_', '-')
-            if t not in types:
-                types[t] = []
-            types[t].append(k)
+            if t not in self.lockedsigs_types:
+                self.lockedsigs_types.append(t)
+                self.lockedsigs_raw[t] = []
+
+            pn = self.lockedpnmap[fn]
+            task = k.rsplit(".",1)[1]
+            hash = self.taskhash[k]
+            lockedsig = "%s:%s:%s" % (pn, task, hash)
+            if lockedsig not in self.lockedsigs_raw[t]:
+                self.lockedsigs_raw[t].append(lockedsig)
 
         with open(sigfile, "w") as f:
-            for t in types:
+            for t in sorted(self.lockedsigs_types):
                 f.write('SIGGEN_LOCKEDSIGS_%s = "\\\n' % t)
-                types[t].sort()
-                sortedk = sorted(types[t], key=lambda k: self.lockedpnmap[k.rsplit(".",1)[0]])
-                for k in sortedk:
-                    fn = k.rsplit(".",1)[0]
-                    task = k.rsplit(".",1)[1]
-                    if k not in self.taskhash:
-                        continue
-                    f.write("    " + self.lockedpnmap[fn] + ":" + task + ":" + self.taskhash[k] + " \\\n")
+                for ls in sorted(self.lockedsigs_raw[t]):
+                    f.write("    " + ls + " \\\n")
                 f.write('    "\n')
-            f.write('SIGGEN_LOCKEDSIGS_TYPES_%s = "%s"' % (self.machine, " ".join(types.keys())))
+            f.write('SIGGEN_LOCKEDSIGS_TYPES_%s = "%s"' %
+                    (self.machine, " ".join(sorted(self.lockedsigs_types))))
 
     def checkhashes(self, missed, ret, sq_fn, sq_task, sq_hash, sq_hashfn, d):
         checklevel = d.getVar("SIGGEN_LOCKEDSIGS_CHECK_LEVEL", True)
-- 
1.9.1


