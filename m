Return-Path: <mcrowe@brightsign.biz>
Received: from elite.brightsigndigital.co.uk
	(cpc6-cmbg17-2-0-cust487.5-4.cable.virginm.net [86.30.57.232])
	by mail.openembedded.org (Postfix) with ESMTP id C4ED06D2A2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2013 15:20:28 +0000 (UTC)
Received: from chuckie.brightsign ([172.30.1.25])
	by elite.brightsigndigital.co.uk with esmtp (Exim 4.80)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1Vkxxb-0002bn-1O; Mon, 25 Nov 2013 15:20:27 +0000
Received: from mac by chuckie.brightsign with local (Exim 4.80)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1Vkxxb-0007n7-06; Mon, 25 Nov 2013 15:20:27 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Nov 2013 15:20:14 +0000
Message-Id: <1385392815-29916-1-git-send-email-mac@mcrowe.com>
X-Mailer: git-send-email 1.7.10.4
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH 1/2] sanity: Use random filename for maximum path length test
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
X-List-Received-Date: Mon, 25 Nov 2013 15:20:29 -0000

check_create_long_filename used a fixed filename for its test files. This
meant that os.remove(testfile) could fail with ENOENT if two instances were
running at the same time against the same sstate directory. Using a
randomly generated filename stops this from happening.

(Although it might seem unlikely, this race did appear to occur multiple
times with Jenkins - presumably because the matrix jobs were all kicked off
at the same time.)

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta/classes/sanity.bbclass |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 6807a23..0d40792 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -175,7 +175,8 @@ def check_conf_exists(fn, data):
     return False
 
 def check_create_long_filename(filepath, pathname):
-    testfile = os.path.join(filepath, ''.join([`num`[-1] for num in xrange(1,200)]))
+    import string, random
+    testfile = os.path.join(filepath, ''.join(random.choice(string.ascii_letters) for x in range(200)))
     try:
         if not os.path.exists(filepath):
             bb.utils.mkdirhier(filepath)
-- 
1.7.10.4


