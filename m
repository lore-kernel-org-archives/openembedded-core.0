Return-Path: <Qi.Chen@windriver.com>
X-Greylist: delayed 2351 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 05 May 2014 08:11:15 UTC
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8352A65F23
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 May 2014 08:11:15 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s458BGuk026852
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 5 May 2014 01:11:16 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Mon, 5 May 2014 01:11:15 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 5 May 2014 16:11:24 +0800
Message-ID: <70f2774fe13948f7f044c202325762d48cd1369e.1399275082.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1399275082.git.Qi.Chen@windriver.com>
References: <cover.1399275082.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] populate_sdk_base: modify the recrdeptask of do_populate_sdk
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
X-List-Received-Date: Mon, 05 May 2014 08:11:15 -0000
Content-Type: text/plain

If 'rm_work' is enabled, `bitbake core-image-xxx -c populate_sdk'
doesn't clean things up for the nativesdk packages.

This patch modifies the 'recrdeptask' for do_populate_sdk to fix this
problem.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/populate_sdk_base.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 10d04ed..278d1b7 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -333,5 +333,5 @@ populate_sdk_log_check() {
 do_populate_sdk[dirs] = "${TOPDIR}"
 do_populate_sdk[depends] += "${@' '.join([x + ':do_populate_sysroot' for x in d.getVar('SDK_DEPENDS', True).split()])}"
 do_populate_sdk[rdepends] = "${@' '.join([x + ':do_populate_sysroot' for x in d.getVar('SDK_RDEPENDS', True).split()])}"
-do_populate_sdk[recrdeptask] += "do_packagedata do_package_write_rpm do_package_write_ipk do_package_write_deb"
+do_populate_sdk[recrdeptask] += "do_packagedata do_${BB_DEFAULT_TASK}"
 addtask populate_sdk
-- 
1.7.9.5


