Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5430B719CC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Nov 2016 19:04:20 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uALJ4Ljn005222
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Nov 2016 11:04:21 -0800 (PST)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Mon, 21 Nov 2016 11:04:20 -0800
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 21 Nov 2016 11:04:20 -0800
Message-ID: <1479755060-17417-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [PATCH 1/1] libxml-parser-perl: add expat/Makefile dependency
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
X-List-Received-Date: Mon, 21 Nov 2016 19:04:22 -0000
Content-Type: text/plain

The file Expat.bs (which is empty!) is created by BOOTSTRAP,
but is deleted by INST_DYNAMIC.  Make sure we are not creating
and deleting it at the same time.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 .../perl/libxml-parser-perl_2.44.bb                |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/perl/libxml-parser-perl_2.44.bb b/meta/recipes-devtools/perl/libxml-parser-perl_2.44.bb
index 3acd826..ab9e5fa 100644
--- a/meta/recipes-devtools/perl/libxml-parser-perl_2.44.bb
+++ b/meta/recipes-devtools/perl/libxml-parser-perl_2.44.bb
@@ -20,6 +20,8 @@ inherit cpan
 do_configure_append() {
 	sed 's:--sysroot=.*\(\s\|$\):--sysroot=${STAGING_DIR_TARGET} :g' -i Makefile Expat/Makefile
 	sed 's:^FULL_AR = .*:FULL_AR = ${AR}:g' -i Expat/Makefile
+	# make sure these two do not build in parallel
+	sed 's!^$(INST_DYNAMIC):!$(INST_DYNAMIC): $(BOOTSTRAP)!' -i Expat/Makefile
 }
 
 do_compile() {
-- 
1.7.9.5


