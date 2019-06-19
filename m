Return-Path: <anuj.mittal@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2125D7E6DB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 03:13:27 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Jun 2019 20:13:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,391,1557212400"; d="scan'208";a="335065034"
Received: from anmitta2-mobl1.png.intel.com ([10.221.16.224])
	by orsmga005.jf.intel.com with ESMTP; 18 Jun 2019 20:13:28 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Jun 2019 11:13:26 +0800
Message-Id: <20190619031326.9372-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] runtime/cases/logrotate: make test more reliable
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
X-List-Received-Date: Wed, 19 Jun 2019 03:13:28 -0000
Content-Transfer-Encoding: 8bit

By default logrotate uses 'dateext' in logrotate.conf which results in a
date string being appended at the end of log name. In cases when a test
that installs configuration in logrotate.d is executed first (dnf for
example), it might result in errors when logrotate test is executed:

error: destination /var/log/dnf.librepo.log-20190528 already exists, skipping rotation
error: destination /var/log/dnf.rpm.log-20190528 already exists, skipping rotation
error: destination /var/log/hawkey.log-20190528 already exists, skipping rotation

Tweak the test to use it's own temporary configuration that doesn't
enable dateext.

Fixes [YOCTO #13363]

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oeqa/runtime/cases/logrotate.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/logrotate.py b/meta/lib/oeqa/runtime/cases/logrotate.py
index 8358793a24..bfa57c534a 100644
--- a/meta/lib/oeqa/runtime/cases/logrotate.py
+++ b/meta/lib/oeqa/runtime/cases/logrotate.py
@@ -35,7 +35,9 @@ class LogrotateTest(OERuntimeTestCase):
 
     @OETestDepends(['logrotate.LogrotateTest.test_1_logrotate_setup'])
     def test_2_logrotate(self):
-        status, output = self.target.run('logrotate -f /etc/logrotate.conf')
+        status, output = self.target.run('echo "create \n include /etc/logrotate.d" > /tmp/logrotate-test.conf')
+        status, output = self.target.run('logrotate -f /tmp/logrotate-test.conf')
+
         msg = ('logrotate service could not be reloaded. Status and output: '
                 '%s and %s' % (status, output))
         self.assertEqual(status, 0, msg = msg)
-- 
2.20.1


