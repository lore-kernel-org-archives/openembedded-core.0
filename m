Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A2D4378E67
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2018 06:27:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7H6RCH0027369
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 23:27:13 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Thu, 16 Aug 2018 23:27:11 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 17 Aug 2018 14:27:09 +0800
Message-ID: <1534487230-438571-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 1/2] mdadm: fix usrmerge install path
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
X-List-Received-Date: Fri, 17 Aug 2018 06:27:12 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

Update /lib to $nonarch_base_libdir to fix
the below error when usrmerge enabled in
DISTRO_FEATURES.

ERROR: mdadm-4.0-r0 do_package_qa: QA Issue: mdadm package is not obeying usrmerge distro feature. /lib should be relocated to /usr. [usrmerge]

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta/recipes-extended/mdadm/mdadm_4.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/mdadm/mdadm_4.0.bb b/meta/recipes-extended/mdadm/mdadm_4.0.bb
index 226b974..2c4d88a 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.0.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.0.bb
@@ -42,7 +42,7 @@ CFLAGS_append_mipsarchn32 = ' -D__SANE_USERSPACE_TYPES__'
 
 do_compile() {
 	# Point to right sbindir
-	sed -i -e "s;BINDIR  = /sbin;BINDIR = $base_sbindir;" ${S}/Makefile
+	sed -i -e "s;BINDIR  = /sbin;BINDIR = $base_sbindir;" -e "s;UDEVDIR = /lib;UDEVDIR = $nonarch_base_libdir;" ${S}/Makefile
 	oe_runmake SYSROOT="${STAGING_DIR_TARGET}"
 }
 
-- 
2.7.4


