Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0F05C6FFED
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2016 07:35:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uAT7Zpci007917
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 28 Nov 2016 23:35:51 -0800
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 28 Nov 2016 23:35:50 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 28 Nov 2016 23:35:45 -0800
Message-ID: <efd88ecc9bc8a1f1e7342af5f5d6e193cf30534d.1480404884.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1480404884.git.liezhi.yang@windriver.com>
References: <cover.1480404884.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/5] runqemu: fix checking for <file>.cpio.gz
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
X-List-Received-Date: Tue, 29 Nov 2016 07:35:51 -0000
Content-Type: text/plain

When "runqemu /path/to/<file>.cpio.gz", it used the last suffix "gz" as
the fstype which was wrong. Check filename against self.fstypes firstly
can fix the problem.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/runqemu | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index af25423..c737eb2 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -269,19 +269,29 @@ class BaseConfig(object):
             self.kernel =  p
         elif os.path.exists(p) and (not os.path.isdir(p)) and re.search('-image-', os.path.basename(p)):
             self.rootfs = p
-            dirpath = os.path.dirname(p)
-            m = re.search('(.*)\.(.*)$', p)
-            if m:
-                qb = '%s%s' % (re.sub('\.rootfs$', '', m.group(1)), '.qemuboot.conf')
+            # Check filename against self.fstypes can hanlde <file>.cpio.gz,
+            # otherwise, its type would be "gz", which is incorrect.
+            fst = ""
+            for t in self.fstypes:
+                if p.endswith(t):
+                    fst = t
+                    break
+            if not fst:
+                m = re.search('.*\.(.*)$', self.rootfs)
+                if m:
+                    fst =  m.group(1)
+            if fst:
+                self.check_arg_fstype(fst)
+                qb = re.sub('\.' + fst + "$", '', self.rootfs)
+                qb = '%s%s' % (re.sub('\.rootfs$', '', qb), '.qemuboot.conf')
                 if os.path.exists(qb):
                     self.qemuboot = qb
                     self.qbconfload = True
                 else:
                     logger.warn("%s doesn't exist" % qb)
-                fst = m.group(2)
-                self.check_arg_fstype(fst)
             else:
                 raise Exception("Can't find FSTYPE from: %s" % p)
+
         elif os.path.isdir(p) or re.search(':', arg) and re.search('/', arg):
             if self.is_deploy_dir_image(p):
                 logger.info('DEPLOY_DIR_IMAGE: %s' % p)
-- 
2.9.0


