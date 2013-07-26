Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2E6666B2FC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2013 12:09:14 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6QC9Fh6000662
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2013 05:09:15 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Fri, 26 Jul 2013 05:09:14 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 26 Jul 2013 20:09:08 +0800
Message-ID: <097de85404b6e1a841e94a030254d449d9aafa96.1374835913.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1374835913.git.hongxu.jia@windriver.com>
References: <cover.1374835913.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] util-linux: use u-a for su
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
X-List-Received-Date: Fri, 26 Jul 2013 12:09:14 -0000
Content-Type: text/plain

Use alternatives mechanism to prevent confliction of attempted
installing su binary among busybox, shadow and util-linux.

[YOCTO #4926]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index d373cec..89bc4a8 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -218,3 +218,10 @@ ALTERNATIVE_LINK_NAME[reset] = "${bindir}/reset"
 ALTERNATIVE_TARGET[reset] = "${base_bindir}/reset"
 
 BBCLASSEXTEND = "native nativesdk"
+
+python do_package_prepend () {
+    if '--enable-su' in d.getVar('EXTRA_OECONF', True).split():
+        alt_name = "su"
+        d.setVarFlag('ALTERNATIVE_LINK_NAME', alt_name, '%s/%s' % (d.getVar('bindir', True), alt_name))
+        d.appendVar('ALTERNATIVE_%s' % (d.getVar('PN', True)), ' ' + alt_name)
+}
-- 
1.8.1.2


