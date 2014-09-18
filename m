Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EE9356FC54
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Sep 2014 07:23:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8I7Nlmg007881
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 18 Sep 2014 00:23:47 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Thu, 18 Sep 2014 00:23:47 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <mark.hatle@windriver.com>,
	<richard.purdie@linuxfoundation.org>
Date: Thu, 18 Sep 2014 15:23:41 +0800
Message-ID: <afb9eb87d6ebebd33c1f6febf8f37111db63a614.1411023982.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1411023982.git.hongxu.jia@windriver.com>
References: <cover.1411023982.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] sstatesig: Only dump incremental locked signatures
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
X-List-Received-Date: Thu, 18 Sep 2014 07:23:50 -0000
Content-Type: text/plain

The idea of incremental sig is:

New sig file = Old sig file (if available) + New sig items in current build.

The condition of incremental locked signature dump is an existed locked sig
file is required and it is also the dump sig file.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/lib/oe/sstatesig.py | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index af7617e..56fd953 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -151,19 +151,23 @@ class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
                 types[t] = []
             types[t].append(k)
 
-        with open(sigfile, "w") as f:
+        with open(sigfile, "a") as f:
             for t in types:
-                f.write('SIGGEN_LOCKEDSIGS_%s = "\\\n' % t)
+                f.write('SIGGEN_LOCKEDSIGS_%s += "\\\n' % t)
                 types[t].sort()
                 sortedk = sorted(types[t], key=lambda k: self.lockedpnmap[k.rsplit(".",1)[0]])
                 for k in sortedk:
                     fn = k.rsplit(".",1)[0]
+                    pn = self.lockedpnmap[fn]
                     task = k.rsplit(".",1)[1]
                     if k not in self.taskhash:
                         continue
-                    f.write("    " + self.lockedpnmap[fn] + ":" + task + ":" + self.taskhash[k] + " \\\n")
+                    if pn in self.lockedsigs and task in self.lockedsigs[pn] and self.taskhash[k] == self.lockedsigs[pn][task]:
+                        continue
+                    sigentry = pn + ":" + task + ":" + self.taskhash[k]
+                    f.write("    " + sigentry + " \\\n")
                 f.write('    "\n')
-            f.write('SIGGEN_LOCKEDSIGS_TYPES_%s = "%s"' % (self.machine, " ".join(types.keys())))
+            f.write('SIGGEN_LOCKEDSIGS_TYPES_%s += "%s"\n' % (self.machine, " ".join(types.keys())))
 
     def checkhashes(self, missed, ret, sq_fn, sq_task, sq_hash, sq_hashfn, d):
         checklevel = d.getVar("SIGGEN_LOCKEDSIGS_CHECK_LEVEL", True)
-- 
1.9.1


