Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 09CD97F1CC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2019 09:23:57 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x6Q9NwYU010820
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 26 Jul 2019 02:23:58 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Fri, 26 Jul 2019 02:23:45 -0700
From: <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 26 Jul 2019 05:23:42 -0400
Message-ID: <20190726092342.37231-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] core-image-sato-sdk: test image with 512M memory
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
X-List-Received-Date: Fri, 26 Jul 2019 09:23:58 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

When run do_testimage for core-image-sato-sdk, it fails to pass test
case:

| RESULTS - systemd.SystemdBasicTests.test_systemd_failed: FAILED (0.43s)

It is OOM issue and daemon rpc.statd is killed:

|  [  531.306146] Out of memory: Kill process 193 (rpc.statd) score 200 or sacrifice child

Increase the memory of qemu to 512M to avoid such OOM issue.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-sato/images/core-image-sato-sdk.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-sato/images/core-image-sato-sdk.bb b/meta/recipes-sato/images/core-image-sato-sdk.bb
index d7cc52b52b..f7963d018e 100644
--- a/meta/recipes-sato/images/core-image-sato-sdk.bb
+++ b/meta/recipes-sato/images/core-image-sato-sdk.bb
@@ -9,3 +9,4 @@ IMAGE_FEATURES += "dev-pkgs tools-sdk \
 
 IMAGE_INSTALL += "kernel-devsrc"
 
+TEST_QEMUPARAMS = "-m 512"
-- 
2.20.0


