Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3266079D90
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Nov 2018 09:13:35 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wA79DaHJ018533
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 7 Nov 2018 01:13:36 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Wed, 7 Nov 2018 01:13:35 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 7 Nov 2018 16:30:46 +0800
Message-ID: <f05c6b5560e488afe468e347de4796bdc885190e.1541579326.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1541579326.git.kai.kang@windriver.com>
References: <cover.1541579326.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] glide: disable ptest on mips
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
X-List-Received-Date: Wed, 07 Nov 2018 09:13:35 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

It fails to run task compile_ptest_base of glide on mips:

| vet config not found

The root cause is that go lang lacks '-buildmode=pie' support for mips.
So disable glide ptest on mips for now.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-devtools/glide/glide_0.13.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/glide/glide_0.13.2.bb b/meta/recipes-devtools/glide/glide_0.13.2.bb
index 3a32fa1af1..7faaf4a388 100644
--- a/meta/recipes-devtools/glide/glide_0.13.2.bb
+++ b/meta/recipes-devtools/glide/glide_0.13.2.bb
@@ -33,3 +33,6 @@ INSANE_SKIP_${PN} += "textrel"
 # ELF binary '/work/aarch64-oe-linux/glide/0.13.1-r0/packages-split/glide-ptest/usr/lib/glide/ptest/github.com/Masterminds/glide/action/action.test' has relocations in .text
 # ELF binary '/work/aarch64-oe-linux/glide/0.13.1-r0/packages-split/glide-ptest/usr/lib/glide/ptest/github.com/Masterminds/glide/cache/cache.test' has relocations in .text [textrel]
 INSANE_SKIP_${PN}-ptest += "textrel"
+
+# fails to run task compile_ptest_base on mips
+PTEST_ENABLED_mipsarch = "0"
-- 
2.18.0


