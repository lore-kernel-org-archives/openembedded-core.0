Return-Path: <lans.zhang2008@gmail.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 58BB777FED
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jul 2017 06:03:47 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v6R63mYB017459
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 26 Jul 2017 23:03:48 -0700 (PDT)
Received: from pek-jzhang0-d2.wrs.com (128.224.162.208) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Wed, 26 Jul 2017 23:03:47 -0700
From: Jia Zhang <lans.zhang2008@gmail.com>
To: <liezhi.yang@windriver.com>
Date: Thu, 27 Jul 2017 14:03:42 +0800
Message-ID: <1501135422-19088-1-git-send-email-lans.zhang2008@gmail.com>
X-Mailer: git-send-email 2.7.5
MIME-Version: 1.0
Cc: Lans Zhang <jia.zhang@windriver.com>,
	openembedded-core@lists.openembedded.org
Subject: [PATCH] rpm: allow to enable RPM file signing
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
X-List-Received-Date: Thu, 27 Jul 2017 06:03:48 -0000
Content-Type: text/plain

From: Lans Zhang <jia.zhang@windriver.com>

RPM file signing is enabled with --with-imaevm during configuration.
If enabled, the RPM signing tool rpmsign will call libimaevm.so provided
by the recipe ima-evm-utils.

Signed-off-by: Lans Zhang <jia.zhang@windriver.com>
Signed-off-by: Jia Zhang <lans.zhang2008@gmail.com>
---
 meta/recipes-devtools/rpm/rpm_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/rpm/rpm_git.bb b/meta/recipes-devtools/rpm/rpm_git.bb
index 2a0dcaf..d9ff2c7 100644
--- a/meta/recipes-devtools/rpm/rpm_git.bb
+++ b/meta/recipes-devtools/rpm/rpm_git.bb
@@ -71,6 +71,9 @@ EXTRA_OECONF_append_class-native = " --sysconfdir=/etc --localstatedir=/var --di
 
 BBCLASSEXTEND = "native nativesdk"
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[imaevm] = "--with-imaevm,,ima-evm-utils"
+
 # Direct rpm-native to read configuration from our sysroot, not the one it was compiled in
 # libmagic also has sysroot path contamination, so override it
 do_install_append_class-native() {
-- 
2.7.5


