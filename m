Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2ED127CF88
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 12:03:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x2SC3NON018309
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 05:03:33 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.190) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Thu, 28 Mar 2019 05:03:13 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 28 Mar 2019 20:13:35 +0800
Message-ID: <a1544536fd186e7326faec46f7e35c6a1d33e45e.1553775186.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1553775186.git.Qi.Chen@windriver.com>
References: <cover.1553775186.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] binutils: fix PV to respect upstream tag and also cve database
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
X-List-Received-Date: Thu, 28 Mar 2019 12:03:44 -0000
Content-Type: text/plain

Setting PV to "2.32.0" results in cve checking tools failing to
report the actual unfixed CVEs. We need to change it to "2.32".
After the change, when `bitbake -c cve_check binutils-native', we have:

  binutils-native-2.32-r0 do_cve_check: Found unpatched CVE (CVE-2018-1000876 CVE-2019-9070 CVE-2019-9071 CVE-2019-9072 CVE-2019-9073 CVE-2019-9074 CVE-2019-9075 CVE-2019-9076 CVE-2019-9077)

Checking the upstream repo, it has tags like:
binutils-2_29
binutils-2_29_1
binutils-2_29_1.1
binutils-2_30
binutils-2_31
binutils-2_31_1
binutils-2_32

So we'd better respect both upstream tags and cve database and use '2.32'.
If binutils 2.32.1 is released some day, we then change the PV to '2.32.1'.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-devtools/binutils/binutils-2.32.inc | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.32.inc b/meta/recipes-devtools/binutils/binutils-2.32.inc
index 7423986..b728c4e 100644
--- a/meta/recipes-devtools/binutils/binutils-2.32.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.32.inc
@@ -10,13 +10,7 @@ LIC_FILES_CHKSUM="\
     file://bfd/COPYING;md5=d32239bcb673463ab874e80d47fae504\
     "
 
-def binutils_branch_version(d):
-    pvsplit = d.getVar('PV').split('.')
-    return pvsplit[0] + "_" + pvsplit[1]
-
-PV = "2.32.0"
-BINUPV = "${@binutils_branch_version(d)}"
-#BRANCH = "binutils-${BINUPV}-branch"
+PV = "2.32"
 BRANCH ?= "binutils-2_32-branch"
 
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
-- 
1.9.1


