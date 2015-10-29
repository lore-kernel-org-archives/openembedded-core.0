Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (unknown [64.129.254.146])
	by mail.openembedded.org (Postfix) with ESMTP id 83FED755F4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Oct 2015 09:22:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id t9T9Mjtc026086
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Oct 2015 02:22:45 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.211) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Thu, 29 Oct 2015 02:22:45 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 29 Oct 2015 17:22:42 +0800
Message-ID: <1c4176c93576353e3c08715453fcf583f8c75851.1446110519.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1446110519.git.Qi.Chen@windriver.com>
References: <cover.1446110519.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] mktemp: raise the priority to avoid conflicting with coreutils
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
X-List-Received-Date: Thu, 29 Oct 2015 09:22:46 -0000
Content-Type: text/plain

If mktemp and coreutils have the same priority for the 'mktemp' command,
/bin/mktemp might point to different destinations depending on which package
is installed first.

Raise the priority to 200 in mktemp recipe to avoid such problem.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/mktemp/mktemp_1.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/mktemp/mktemp_1.7.bb b/meta/recipes-extended/mktemp/mktemp_1.7.bb
index fe238ee..d22668c 100644
--- a/meta/recipes-extended/mktemp/mktemp_1.7.bb
+++ b/meta/recipes-extended/mktemp/mktemp_1.7.bb
@@ -27,7 +27,7 @@ do_install_append () {
 
 ALTERNATIVE_${PN} = "mktemp"
 ALTERNATIVE_LINK_NAME[mktemp] = "${base_bindir}/mktemp"
-ALTERNATIVE_PRIORITY = "100"
+ALTERNATIVE_PRIORITY = "200"
 
 ALTERNATIVE_${PN}-doc = "mktemp.1"
 ALTERNATIVE_PRIORITY_${PN}-doc = "300"
-- 
1.9.1


