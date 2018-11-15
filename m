Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 71D0D6C17C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2018 01:57:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wAF1upNo010418
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2018 17:57:01 -0800
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Wed, 14 Nov 2018 17:56:40 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 15 Nov 2018 10:02:34 +0800
Message-ID: <579d70f86c017ddc17bc9dfd071361a53e4b0f26.1542247292.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1542247292.git.Qi.Chen@windriver.com>
References: <cover.1542247292.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 8/8] busybox: add coreutils to RDEPENDS of busybox-ptest
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
X-List-Received-Date: Thu, 15 Nov 2018 01:57:10 -0000
Content-Type: text/plain

busybox's echo test cases needs 'od' command to have '-t' option
support. However, our busybox disable it by default by not setting
CONFIG_DESKTOP. CONFIG_DESKTOP affects many busybox utilities. So
add coreutils to RDEPENDS of busybox-ptest.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/busybox/busybox.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 20c8b9d..48732ba 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -55,6 +55,9 @@ inherit cml1 systemd update-rc.d ptest
 
 # busybox's unzip test case needs zip command, which busybox itself does not provide
 RDEPENDS_${PN}-ptest = "zip"
+# busybox's echo test cases need '-t' option support for the 'od' command, so add coreutils
+# as we do not want to enable CONFIG_DESKTOP by default for busybox
+RDEPENDS_${PN}-ptest += "coreutils"
 
 # internal helper
 def busybox_cfg(feature, tokens, cnf, rem):
-- 
1.9.1


