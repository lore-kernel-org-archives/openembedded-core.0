Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 15D136B3A3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2013 12:09:15 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6QC9FfU004774
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2013 05:09:16 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Fri, 26 Jul 2013 05:09:15 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 26 Jul 2013 20:09:09 +0800
Message-ID: <859355a223ca996acfed7a729546ffb76bfecb10.1374835913.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1374835913.git.hongxu.jia@windriver.com>
References: <cover.1374835913.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] shadow: use u-a for su
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
X-List-Received-Date: Fri, 26 Jul 2013 12:09:15 -0000
Content-Type: text/plain

Use alternatives mechanism to prevent confliction of attempted
installing su binary among busybox, shadow and util-linux.

[YOCTO #4926]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-extended/shadow/shadow_4.1.4.3.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/shadow/shadow_4.1.4.3.bb b/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
index caf24c0..173da3b 100644
--- a/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
+++ b/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
@@ -119,11 +119,12 @@ inherit update-alternatives
 
 ALTERNATIVE_PRIORITY = "200"
 
-ALTERNATIVE_${PN} = "passwd chfn newgrp chsh groups chpasswd login vipw vigr"
+ALTERNATIVE_${PN} = "passwd chfn newgrp chsh groups chpasswd login vipw vigr su"
 ALTERNATIVE_LINK_NAME[chpasswd] = "${sbindir}/chpasswd"
 ALTERNATIVE_LINK_NAME[login] = "${base_bindir}/login"
 ALTERNATIVE_LINK_NAME[vipw] = "${base_sbindir}/vipw"
 ALTERNATIVE_LINK_NAME[vigr] = "${base_sbindir}/vigr"
+ALTERNATIVE_LINK_NAME[su] = "${bindir}/su"
 
 pkg_postinst_${PN} () {
 	if [ "x$D" != "x" ]; then
-- 
1.8.1.2


