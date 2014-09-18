Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2604A6FC54
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Sep 2014 07:23:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8I7Npmh007889
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 18 Sep 2014 00:23:52 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Thu, 18 Sep 2014 00:23:51 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <mark.hatle@windriver.com>,
	<richard.purdie@linuxfoundation.org>
Date: Thu, 18 Sep 2014 15:23:43 +0800
Message-ID: <f45b0061e129e917e88cf64e7097b61e1426442e.1411023982.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1411023982.git.hongxu.jia@windriver.com>
References: <cover.1411023982.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] sstatesig: fix to support unincremental locked signature dump
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
X-List-Received-Date: Thu, 18 Sep 2014 07:23:52 -0000
Content-Type: text/plain

The condition of incremental locked signature dump is an
existed locked sig file is required and it is also the
dump sig file.

But if they are not the same file or simply no locked sig
file required, it should be unincremental.

In unincremental dump situation, we should write the locked
sig file rather than append.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/lib/oe/sstatesig.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index b2ffc7e..ce7c960 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -93,6 +93,7 @@ class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
         self.lockedhashfn = {}
         self.machine = data.getVar("MACHINE", True)
         self.mismatch_msgs = []
+        self.bbinclude = (data.getVar("BBINCLUDED", True) or "").split()
         pass
     def rundep_check(self, fn, recipename, task, dep, depname, dataCache = None):
         return sstate_rundepfilter(self, fn, recipename, task, dep, depname, dataCache)
@@ -166,6 +167,9 @@ class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
             bb.plain("Nothing added to %s" % sigfile)
             return
 
+        if os.path.abspath(sigfile) not in self.bbinclude:
+            open(sigfile, "w").close()
+
         with open(sigfile, "a") as f:
             for t in types:
                 f.write('SIGGEN_LOCKEDSIGS_%s += "\\\n' % t)
-- 
1.9.1


