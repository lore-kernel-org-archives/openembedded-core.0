Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A9E3F6C18C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2018 01:56:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wAF1udSu022394
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2018 17:56:39 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Wed, 14 Nov 2018 17:56:38 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 15 Nov 2018 10:02:32 +0800
Message-ID: <a1241a077e683841a31022b951a6edf6b2365809.1542247292.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1542247292.git.Qi.Chen@windriver.com>
References: <cover.1542247292.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 6/8] busybox: remove three hostname test cases
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
X-List-Received-Date: Thu, 15 Nov 2018 01:56:37 -0000
Content-Type: text/plain

These three test case are removed because of two reasons.
1) net-tools' hostname have different behaviour regarding some options
   So when net-tools is installed, test cases may fail.
   e.g.
   test x$(hostname -i) = x$(busybox hostname -i)

2) hostname may set to some value, e.g. qemux86-64, which is not an entry in /etc/hosts
   This results in lookup failure when using `hostname -f' as there's no entry in /etc/hosts.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/busybox/busybox.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 228d41a..20c8b9d 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -352,6 +352,12 @@ do_install_ptest () {
 	cp -r ${B}/testsuite ${D}${PTEST_PATH}/
 	cp ${B}/.config      ${D}${PTEST_PATH}/
 	ln -s /bin/busybox   ${D}${PTEST_PATH}/busybox
+	# Remove some hostname test cases as they may fail because of two reasons
+	# 1) net-tools' hostname have different behaviour regarding some options
+	# 2) hostname may set to some value, e.g. qemux86-64, which is not an entry in /etc/hosts
+	rm ${D}${PTEST_PATH}/testsuite/hostname/hostname-i-works
+	rm ${D}${PTEST_PATH}/testsuite/hostname/hostname-d-works
+	rm ${D}${PTEST_PATH}/testsuite/hostname/hostname-s-works
 }
 
 inherit update-alternatives
-- 
1.9.1


