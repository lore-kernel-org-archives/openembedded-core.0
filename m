Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6A55279DBB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Nov 2018 03:34:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wA73Y3U8015679
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 Nov 2018 19:34:13 -0800
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Tue, 6 Nov 2018 19:33:52 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 6 Nov 2018 22:33:44 -0500
Message-ID: <71be7345f814e8c6f09650baa7ca0b4536133b81.1541560699.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.19.0.rc2
In-Reply-To: <cover.1541560699.git.kai.kang@windriver.com>
References: <cover.1541560699.git.kai.kang@windriver.com>
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
X-List-Received-Date: Wed, 07 Nov 2018 03:34:22 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

It fails to run task compile_ptest_base of glide on mips:

| vet config not found

The root cause is that go lang lacks '-buildmode=pie' support for mips.
So disable glide ptest on mips for now.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-devtools/glide/glide_0.13.2.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/glide/glide_0.13.2.bb b/meta/recipes-devtools/glide/glide_0.13.2.bb
index 3a32fa1af1..feb653c12e 100644
--- a/meta/recipes-devtools/glide/glide_0.13.2.bb
+++ b/meta/recipes-devtools/glide/glide_0.13.2.bb
@@ -33,3 +33,7 @@ INSANE_SKIP_${PN} += "textrel"
 # ELF binary '/work/aarch64-oe-linux/glide/0.13.1-r0/packages-split/glide-ptest/usr/lib/glide/ptest/github.com/Masterminds/glide/action/action.test' has relocations in .text
 # ELF binary '/work/aarch64-oe-linux/glide/0.13.1-r0/packages-split/glide-ptest/usr/lib/glide/ptest/github.com/Masterminds/glide/cache/cache.test' has relocations in .text [textrel]
 INSANE_SKIP_${PN}-ptest += "textrel"
+
+# fails to run task compile_ptest_base on mips
+PTEST_ENABLED_mips = "0"
+PTEST_ENABLED_mips64 = "0"
-- 
2.19.0.rc2


