Return-Path: <Yuanjie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 96B6565C5B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 08:02:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u9B82hnu025732
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 01:02:44 -0700 (PDT)
Received: from pek-yhuang1-d1.wrs.com (128.224.162.159) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.294.0; Tue, 11 Oct 2016 01:02:42 -0700
From: Yuanjie Huang <Yuanjie.Huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 11 Oct 2016 16:02:41 +0800
Message-ID: <20161011080241.24267-1-Yuanjie.Huang@windriver.com>
X-Mailer: git-send-email 2.10.0
MIME-Version: 1.0
Subject: [PATCH] glibc: Fix timestamp of plural.c after unpack
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
X-List-Received-Date: Tue, 11 Oct 2016 08:02:46 -0000
Content-Type: text/plain

From: Yuanjie Huang <yuanjie.huang@windriver.com>

Source file plural.c might be updated with bison from plural.y, touch it
before applying patches so that this file is consistent across builds.

Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
---
 meta/recipes-core/glibc/glibc.inc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
index e85c704..5225dfc 100644
--- a/meta/recipes-core/glibc/glibc.inc
+++ b/meta/recipes-core/glibc/glibc.inc
@@ -78,3 +78,10 @@ do_configure_prepend() {
 }
 
 GLIBC_ADDONS ?= "nptl,libidn"
+
+# Ensure that plural.c is newer than its Bison source plural.y,
+# unless the latter is patched.
+do_unpack_workaround() {
+	touch ${S}/intl/plural.c
+}
+addtask unpack_workaround after do_unpack before do_patch
-- 
1.9.1


