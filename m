Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0791D7C1E0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 02:47:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x0U2lZA0021060
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2019 18:47:35 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.435.0; Tue, 29 Jan 2019 18:47:35 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Jan 2019 10:56:24 +0800
Message-ID: <42dfa2708805ba62df0152a13fb70524a3de4711.1548816925.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1548816925.git.Qi.Chen@windriver.com>
References: <cover.1548816925.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] pkgdata.py: avoid target-sdk-dummy-provides to mess things up
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
X-List-Received-Date: Wed, 30 Jan 2019 02:47:35 -0000
Content-Type: text/plain

Sometimes we meet the following failure for the test_lookup_recipe
test case.

  AssertionError: 'zlib\nbusybox is in the RPROVIDES of target-sdk-provid[32 chars]ummy' != 'zlib\nbusybox'
    zlib
  + busybox- busybox is in the RPROVIDES of target-sdk-provides-dummy:
  - target-sdk-provides-dummy

This is because target-sdk-provides-dummy rprovides busybox.

So clean things up to avoid failure.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oeqa/selftest/cases/pkgdata.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/selftest/cases/pkgdata.py b/meta/lib/oeqa/selftest/cases/pkgdata.py
index 0b4caf1..9911765 100644
--- a/meta/lib/oeqa/selftest/cases/pkgdata.py
+++ b/meta/lib/oeqa/selftest/cases/pkgdata.py
@@ -13,6 +13,7 @@ class OePkgdataUtilTests(OESelftestTestCase):
         super(OePkgdataUtilTests, cls).setUpClass()
         # Ensure we have the right data in pkgdata
         cls.logger.info('Running bitbake to generate pkgdata')
+        bitbake('target-sdk-provides-dummy -c clean')
         bitbake('busybox zlib m4')
 
     @OETestID(1203)
-- 
1.9.1


