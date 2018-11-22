Return-Path: <douglas.royds@taitradio.com>
Received: from smtp0.taitradio.net (unknown [202.37.96.22])
	by mail.openembedded.org (Postfix) with SMTP id C63276C55B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 05:39:50 +0000 (UTC)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp0.taitradio.net (Postfix) with ESMTP id 8E74E220166;
	Thu, 22 Nov 2018 18:39:50 +1300 (NZDT)
From: Douglas Royds <douglas.royds@taitradio.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Nov 2018 18:39:42 +1300
Message-Id: <20181122053942.8099-1-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] ptest: Reproducibility: Take control of umask
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
X-List-Received-Date: Thu, 22 Nov 2018 05:39:51 -0000

The build host umask was leaking into the thing-ptest packages
at do_install_ptest() time.

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
 meta/classes/ptest.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/ptest.bbclass b/meta/classes/ptest.bbclass
index c19f65b9bb..9d8a79854a 100644
--- a/meta/classes/ptest.bbclass
+++ b/meta/classes/ptest.bbclass
@@ -59,6 +59,7 @@ addtask install_ptest_base   after do_install   before do_package do_populate_sy
 python () {
     if not bb.data.inherits_class('native', d) and not bb.data.inherits_class('cross', d):
         d.setVarFlag('do_install_ptest_base', 'fakeroot', '1')
+        d.setVarFlag('do_install_ptest_base', 'umask', '022')
 
     # Remove all '*ptest_base' tasks when ptest is not enabled
     if not(d.getVar('PTEST_ENABLED') == "1"):
-- 
2.17.1


