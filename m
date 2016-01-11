Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6CBB46FF84
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 05:55:39 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u0B5te1U012605
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jan 2016 21:55:40 -0800 (PST)
Received: from pek-jhuang0-d1.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Sun, 10 Jan 2016 21:55:39 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Jan 2016 13:55:38 +0800
Message-ID: <1452491738-4422-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] license.bbclass: fix license manifest
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
X-List-Received-Date: Mon, 11 Jan 2016 05:55:40 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The license manifest is wrong when there is no spaces before and after separates |&()
and we can get warning like:
WARNING: The license listed Artistic-1.0GPLv1+ was not in the licenses collected for recipe

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/classes/license.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 8ad4614..af78944 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -61,7 +61,7 @@ python license_create_manifest() {
                 except oe.license.LicenseError as exc:
                     bb.fatal('%s: %s' % (d.getVar('P', True), exc))
             else:
-                pkg_dic[pkg]["LICENSES"] = re.sub('[|&()*]', '', pkg_dic[pkg]["LICENSE"])
+                pkg_dic[pkg]["LICENSES"] = re.sub('[|&()*]', ' ', pkg_dic[pkg]["LICENSE"])
                 pkg_dic[pkg]["LICENSES"] = re.sub('  *', ' ', pkg_dic[pkg]["LICENSES"])
                 pkg_dic[pkg]["LICENSES"] = pkg_dic[pkg]["LICENSES"].split()
 
-- 
1.9.1


