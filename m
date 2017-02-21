Return-Path: <Alexandru.Moise@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1E19972F2A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 14:28:21 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v1LESK3H013972
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 21 Feb 2017 06:28:21 -0800
Received: from otp-amoise-l1.corp.ad.wrs.com (128.224.125.171) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Tue, 21 Feb 2017 06:28:20 -0800
From: Alexandru Moise <alexandru.moise@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 21 Feb 2017 16:28:17 +0200
Message-ID: <1487687297-15455-1-git-send-email-alexandru.moise@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-selinux] [PATCH v2] refpolicy-mls: user native bzip2 instead of host
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
X-List-Received-Date: Tue, 21 Feb 2017 14:28:23 -0000
Content-Type: text/plain

The behavior of b{zip,unzip}2 an vary from host to host with
regards to a number of things such as return value or permissions.

We should always use the native bzip2 package to keep the behavior
deterministic. This change prevents a warning at do_package_qa
task of refpolicy-mls package.

Signed-off-by: Alexandru Moise <alexandru.moise@windriver.com>
---
Changes since v1:
	Use Ross Burton's suggestion of using appending the bzip2-native
	path to EXTRANATIVEPATH variable instead of using the absolute path.

 recipes-security/refpolicy/refpolicy_common.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-security/refpolicy/refpolicy_common.inc b/recipes-security/refpolicy/refpolicy_common.inc
index 58152a8..8c0a3fd 100644
--- a/recipes-security/refpolicy/refpolicy_common.inc
+++ b/recipes-security/refpolicy/refpolicy_common.inc
@@ -27,6 +27,8 @@ FILES_${PN}-dev =+ " \
         ${sysconfdir}/selinux/sepolgen.conf \
 "
 
+EXTRANATIVEPATH += "bzip2-native"
+
 DEPENDS += "checkpolicy-native policycoreutils-native m4-native"
 
 RDEPENDS-${PN}-dev =+ " \
-- 
2.10.2


