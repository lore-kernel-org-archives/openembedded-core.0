Return-Path: <mcrowe@brightsign.biz>
Received: from relay.appriver.com (relay.appriver.com [207.97.230.34])
	by mail.openembedded.org (Postfix) with ESMTP id 7EB41605FE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Nov 2015 11:21:18 +0000 (UTC)
Received: from [86.30.112.98] (HELO elite.brightsign)
	by relay.appriver.com (CommuniGate Pro SMTP 6.1.2)
	with ESMTP id 642866358; Thu, 19 Nov 2015 06:21:18 -0500
Received: from chuckie.brightsign ([172.30.1.25] helo=chuckie)
	by elite.brightsign with esmtp (Exim 4.84)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1ZzNHB-000E4j-KG; Thu, 19 Nov 2015 11:21:17 +0000
Received: from mac by chuckie with local (Exim 4.84)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1ZzNHB-0007m5-Jj; Thu, 19 Nov 2015 11:21:17 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Nov 2015 11:21:16 +0000
Message-Id: <1447932076-29848-1-git-send-email-mac@mcrowe.com>
X-Mailer: git-send-email 2.1.4
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH 2/2] image.py: Avoid creating empty .env file in _write_wic_env
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
X-List-Received-Date: Thu, 19 Nov 2015 11:21:18 -0000

Creating a file for every image containing a few variables isn't
necessary if wic is not being used, so don't write the file if WICVARS
is empty.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta/lib/oe/image.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/image.py b/meta/lib/oe/image.py
index 8c797ec..ceaade7 100644
--- a/meta/lib/oe/image.py
+++ b/meta/lib/oe/image.py
@@ -336,6 +336,10 @@ class Image(ImageDepGraph):
         Write environment variables used by wic
         to tmp/sysroots/<machine>/imgdata/<image>.env
         """
+        wicvars = self.d.getVar('WICVARS', True)
+        if not wicvars:
+            return
+
         stdir = self.d.getVar('STAGING_DIR_TARGET', True)
         outdir = os.path.join(stdir, 'imgdata')
         try:
@@ -350,7 +354,7 @@ class Image(ImageDepGraph):
                 raise
         basename = self.d.getVar('IMAGE_BASENAME', True)
         with open(os.path.join(outdir, basename) + '.env', 'w') as envf:
-            for var in self.d.getVar('WICVARS', True).split():
+            for var in wicvars.split():
                 value = self.d.getVar(var, True)
                 if value:
                     envf.write('%s="%s"\n' % (var, value.strip()))
-- 
2.1.4


