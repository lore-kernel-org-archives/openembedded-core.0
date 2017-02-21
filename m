Return-Path: <Alexandru.Moise@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1C89F71E30
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 14:46:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v1LEkswa006737
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 21 Feb 2017 06:46:54 -0800 (PST)
Received: from otp-amoise-l1.corp.ad.wrs.com (128.224.125.171) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 21 Feb 2017 06:46:53 -0800
From: Alexandru Moise <alexandru.moise@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 21 Feb 2017 16:46:51 +0200
Message-ID: <1487688411-16078-1-git-send-email-alexandru.moise@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-selinux] [PATCH v3] refpolicy-mls: user native bzip2 instead of host
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
X-List-Received-Date: Tue, 21 Feb 2017 14:46:55 -0000
Content-Type: text/plain

The behavior of b{zip,unzip}2 an vary from host to host with
regards to a number of things such as return value or permissions.

We should always use the native bzip2 package to keep the behavior
deterministic. This change prevents a warning at do_package_qa
task of refpolicy-mls package.

Signed-off-by: Alexandru Moise <alexandru.moise@windriver.com>
---
Changes in v2:
	Use Ross Burton's suggestion of using appending the bzip2-native
	path to EXTRANATIVEPATH variable instead of using the absolute path.
Changes in v3:
	Add "bzip2-replacement-native" as dependency to ensure that the
	bzip2-native package exists in the STAGING_BINDIR_NATIVE path.

 recipes-security/refpolicy/refpolicy_common.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/recipes-security/refpolicy/refpolicy_common.inc b/recipes-security/refpolicy/refpolicy_common.inc
index 58152a8..6a45e79 100644
--- a/recipes-security/refpolicy/refpolicy_common.inc
+++ b/recipes-security/refpolicy/refpolicy_common.inc
@@ -27,7 +27,9 @@ FILES_${PN}-dev =+ " \
         ${sysconfdir}/selinux/sepolgen.conf \
 "
 
-DEPENDS += "checkpolicy-native policycoreutils-native m4-native"
+EXTRANATIVEPATH += "bzip2-native"
+
+DEPENDS += "bzip2-replacement-native checkpolicy-native policycoreutils-native m4-native"
 
 RDEPENDS-${PN}-dev =+ " \
         python \
-- 
2.10.2


