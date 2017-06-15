Return-Path: <anibal.limon@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 7F9FC78411
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 22:09:54 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP; 15 Jun 2017 15:09:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,345,1493708400"; d="scan'208";a="1141724386"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.128.121])
	by orsmga001.jf.intel.com with ESMTP; 15 Jun 2017 15:09:53 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Jun 2017 17:09:50 -0500
Message-Id: <1497564590-18707-3-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1497564590-18707-1-git-send-email-anibal.limon@linux.intel.com>
References: <1497564590-18707-1-git-send-email-anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] oeqa/selftest/context: Reload testlayer_path when meta-selftest isn't added
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
X-List-Received-Date: Thu, 15 Jun 2017 22:09:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When add meta-selftest by the script the testlayer_path needs to be
reloaded to avoid None value.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/selftest/context.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index 8c8439b..ca87398 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -131,6 +131,7 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
                     runCmd("bitbake-layers add-layer %s" %meta_selftestdir)
                     # reload data is needed because a meta-selftest layer was add
                     self.tc.td = get_bb_vars()
+                    self.tc.testlayer_path = get_test_layer()
                 else:
                     self.tc.logger.error("could not locate meta-selftest in:\n%s" % meta_selftestdir)
                     raise OEQAPreRun
-- 
2.1.4


