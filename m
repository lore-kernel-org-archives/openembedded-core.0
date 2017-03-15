Return-Path: <Zhixiong.Chi@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2ADF771AB3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 03:06:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v2F363q8023439
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 20:06:04 -0700
Received: from pek-zchi-d1.corp.ad.wrs.com (128.224.162.239) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.294.0; Tue, 14 Mar 2017 20:06:02 -0700
From: Zhixiong Chi <zhixiong.chi@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 15 Mar 2017 11:06:01 +0800
Message-ID: <1489547161-17971-1-git-send-email-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] build-compare: ensure rpm command be available
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
X-List-Received-Date: Wed, 15 Mar 2017 03:06:06 -0000
Content-Type: text/plain

If rpm command could not be found in the building server env, when the
pkg-diff.sh calls the function from functions.sh, it will occurs the error
"command not found" in mbp project, so that we get the wrong result for
comparing packages.
To ensure rpm command be avarilable, we use the rpm command frpm rpm-native
instead.

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
---
 meta/recipes-devtools/build-compare/build-compare_git.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/build-compare/build-compare_git.bb b/meta/recipes-devtools/build-compare/build-compare_git.bb
index eb12e40..b7f8c7a 100644
--- a/meta/recipes-devtools/build-compare/build-compare_git.bb
+++ b/meta/recipes-devtools/build-compare/build-compare_git.bb
@@ -32,4 +32,9 @@ do_install() {
     install -m 755 srpm-check.sh ${D}/${bindir}
 }
 
+do_install_append_class-native() {
+    sed -i -e 's:RPM="rpm:RPM="${bindir}/rpm:g' ${D}/${bindir}/functions.sh
+    sed -i -e 's:rpm2cpio:${bindir}/rpm2cpio:g' ${D}/${bindir}/functions.sh
+}
+
 RDEPENDS_${PN} += "bash"
-- 
1.9.1


