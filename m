Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9943971BEE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 14:21:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v2GEL9Xk006154
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 07:21:09 -0700 (PDT)
Received: from yow-cube1.wrs.com (128.224.56.98) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 16 Mar 2017 07:21:08 -0700
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 16 Mar 2017 10:20:53 -0400
Message-ID: <1489674056-21470-3-git-send-email-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1489674056-21470-1-git-send-email-paul.gortmaker@windriver.com>
References: <1489674056-21470-1-git-send-email-paul.gortmaker@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/5] which: fix it so the manpage will respect alternatives
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
X-List-Received-Date: Thu, 16 Mar 2017 14:21:08 -0000
Content-Type: text/plain

To fix:

  file /usr/share/man/man1/which.1 conflicts between attempted installs
  of debianutils-doc-4.8.1-r0.core2_64 and which-doc-2.21-r3.core2_64

Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 meta/recipes-extended/which/which_2.21.bb             | 3 +++
 meta/recipes-support/debianutils/debianutils_4.8.1.bb | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/meta/recipes-extended/which/which_2.21.bb b/meta/recipes-extended/which/which_2.21.bb
index a7687f6fe43c..fac0fd3944b6 100644
--- a/meta/recipes-extended/which/which_2.21.bb
+++ b/meta/recipes-extended/which/which_2.21.bb
@@ -30,3 +30,6 @@ do_configure_prepend() {
 
 ALTERNATIVE_${PN} = "which"
 ALTERNATIVE_PRIORITY = "100"
+
+ALTERNATIVE_${PN}-doc = "which.1"
+ALTERNATIVE_LINK_NAME[which.1] = "${mandir}/man1/which.1"
diff --git a/meta/recipes-support/debianutils/debianutils_4.8.1.bb b/meta/recipes-support/debianutils/debianutils_4.8.1.bb
index 54c74e097c03..54c345ea25f6 100644
--- a/meta/recipes-support/debianutils/debianutils_4.8.1.bb
+++ b/meta/recipes-support/debianutils/debianutils_4.8.1.bb
@@ -40,6 +40,9 @@ ALTERNATIVE_PRIORITY="30"
 ALTERNATIVE_${PN} = "add-shell installkernel remove-shell savelog tempfile which"
 ALTERNATIVE_${PN}-run-parts = "run-parts"
 
+ALTERNATIVE_${PN}-doc = "which.1"
+ALTERNATIVE_LINK_NAME[which.1] = "${mandir}/man1/which.1"
+
 ALTERNATIVE_LINK_NAME[add-shell]="${sbindir}/add-shell"
 ALTERNATIVE_LINK_NAME[installkernel]="${sbindir}/installkernel"
 ALTERNATIVE_LINK_NAME[remove-shell]="${sbindir}/remove-shell"
-- 
2.7.4


