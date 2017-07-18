Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 11A3377EAC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jul 2017 03:21:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v6I3LbCi014401
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jul 2017 20:21:38 -0700
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 17 Jul 2017 20:21:37 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 17 Jul 2017 20:21:32 -0700
Message-ID: <67f3889bea40d24997f560117e5c3d3a7e9efa45.1500348040.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1500348040.git.liezhi.yang@windriver.com>
References: <cover.1500348040.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/5] runqemu: check qbconfload before running bitbake
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
X-List-Received-Date: Tue, 18 Jul 2017 03:21:37 -0000
Content-Type: text/plain

If qbconfload (.qemuboot.conf is found) is present, we can get
DEPLOY_DIR_IMAGE from it rather than "bitbake -e".

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/runqemu | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 7188bd78830..781814ae651 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -466,7 +466,7 @@ class BaseConfig(object):
 
             self.check_arg_machine(unknown_arg)
 
-        if not self.get('DEPLOY_DIR_IMAGE'):
+        if not (self.get('DEPLOY_DIR_IMAGE') or self.qbconfload):
             self.load_bitbake_env()
             s = re.search('^DEPLOY_DIR_IMAGE="(.*)"', self.bitbake_e, re.M)
             if s:
-- 
2.11.0


