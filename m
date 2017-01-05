Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EBBC5601A4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jan 2017 05:03:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v0553TBv014062
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Jan 2017 21:03:29 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.184) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 4 Jan 2017 21:03:28 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 5 Jan 2017 13:03:28 +0800
Message-ID: <a235cbaf529750d9a35e0ff36523d8e7f56e29c1.1483592527.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1483592527.git.Qi.Chen@windriver.com>
References: <cover.1483592527.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] selftest/eSDK.py: fix sstate dir not found error
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
X-List-Received-Date: Thu, 05 Jan 2017 05:03:30 -0000
Content-Type: text/plain

Fix the error below when SSTATE_DIR is not "${BUILDDIR}/sstate-cache".

  FileNotFoundError: [Errno 2] No such file or directory: '/xxx/../sstate-cache'

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oeqa/selftest/eSDK.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/eSDK.py b/meta/lib/oeqa/selftest/eSDK.py
index 9d5c680..b43a452 100644
--- a/meta/lib/oeqa/selftest/eSDK.py
+++ b/meta/lib/oeqa/selftest/eSDK.py
@@ -55,7 +55,7 @@ class oeSDKExtSelfTest(oeSelfTest):
     @classmethod
     def setUpClass(cls):
         # Start to serve sstate dir
-        sstate_dir = os.path.join(os.environ['BUILDDIR'], 'sstate-cache')
+        sstate_dir = get_bb_var('SSTATE_DIR')
         cls.http_service = HTTPService(sstate_dir)
         cls.http_service.start()
 
-- 
1.9.1


