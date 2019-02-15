Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 70F977C69C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 07:56:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x1F7uOWA022752
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2019 23:56:24 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.435.0; Thu, 14 Feb 2019 23:56:23 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 15 Feb 2019 16:14:52 +0800
Message-ID: <2a17f8cd911f6eb9da079bcb17e2a2c789844782.1550218244.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1550218243.git.liezhi.yang@windriver.com>
References: <cover.1550218243.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] runqemu: Make QB_MEM easier to set
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
X-List-Received-Date: Fri, 15 Feb 2019 07:56:23 -0000
Content-Type: text/plain

It only could be set as the following in the past:
QB_MEM = "-m 256"

Now it also can be set as:
QB_MEM = "-m 256M (or m)"
QB_MEM = "256M (or m)"

[YOCTO #11522]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/runqemu | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/scripts/runqemu b/scripts/runqemu
index 10f61e4..d171c4f 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -679,6 +679,17 @@ class BaseConfig(object):
             logger.info('QB_MEM is not set, use 512M by default')
             self.set('QB_MEM', '-m 512')
 
+        # Check and remove M or m suffix
+        qb_mem = self.get('QB_MEM')
+        if qb_mem.endswith('M') or qb_mem.endswith('m'):
+            qb_mem = qb_mem[:-1]
+
+        # Add -m prefix it not present
+        if not qb_mem.startswith('-m'):
+            qb_mem = '-m %s' % qb_mem
+
+        self.set('QB_MEM', qb_mem)
+
         mach = self.get('MACHINE')
         if not mach.startswith('qemumips'):
             self.kernel_cmdline_script += ' mem=%s' % self.get('QB_MEM').replace('-m','').strip() + 'M'
-- 
2.7.4


