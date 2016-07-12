Return-Path: <anibal.limon@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 332096FFCD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 21:29:31 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 12 Jul 2016 14:29:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,353,1464678000"; d="scan'208";a="138057043"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.159])
	by fmsmga004.fm.intel.com with ESMTP; 12 Jul 2016 14:29:31 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jul 2016 16:29:50 -0500
Message-Id: <1468358990-14377-3-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1468358990-14377-1-git-send-email-anibal.limon@linux.intel.com>
References: <1468358990-14377-1-git-send-email-anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] classes/testimage: When image is systemd enable debug log level
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
X-List-Received-Date: Tue, 12 Jul 2016 21:29:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In order to get more information about systemd boot process to
be able to debug random failures due to high I/O.

[YOCTO #9299]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/classes/testimage.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 7fd0f62..f1b54d7 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -147,7 +147,10 @@ def testimage_main(d):
     tc.extract_packages()
     target.deploy()
     try:
-        target.start()
+        bootparams = None
+        if d.getVar('VIRTUAL-RUNTIME_init_manager', '') == 'systemd':
+            bootparams = 'systemd.log_level=debug systemd.log_target=console'
+        target.start(extra_bootparams=bootparams)
         starttime = time.time()
         result = tc.runTests()
         stoptime = time.time()
-- 
2.1.4


