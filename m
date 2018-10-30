Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BFC3F79C7F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Oct 2018 06:26:44 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w9U6QjYZ002851
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Oct 2018 23:26:45 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Mon, 29 Oct 2018 23:26:45 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 30 Oct 2018 14:32:42 +0800
Message-ID: <65b80649f86bc9b49ee5ef2d174ab9559ab1c80d.1540881114.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1540881114.git.Qi.Chen@windriver.com>
References: <cover.1540881114.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] go-dep: disable PTEST_ENABLED for mips and mips64
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
X-List-Received-Date: Tue, 30 Oct 2018 06:26:44 -0000
Content-Type: text/plain

The current go-dep does not compile ptest successfully on mips
and mips64. So as a workaround, disable PTEST_ENABLED explicitly
to avoid error like below.

  | vet config not found

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-devtools/go/go-dep_0.5.0.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/go/go-dep_0.5.0.bb b/meta/recipes-devtools/go/go-dep_0.5.0.bb
index f0ce60a..cfc2186 100644
--- a/meta/recipes-devtools/go/go-dep_0.5.0.bb
+++ b/meta/recipes-devtools/go/go-dep_0.5.0.bb
@@ -28,3 +28,8 @@ INSANE_SKIP_${PN} += "textrel"
 # http://errors.yoctoproject.org/Errors/Details/185632/
 # ERROR: QA Issue: ELF binary '/work/aarch64-oe-linux/go-dep/0.4.1-r0/packages-split/go-dep-ptest/usr/lib/go-dep/ptest/github.com/golang/dep/cmd/dep/dep.test' has relocations in .text [textrel]  
 INSANE_SKIP_${PN}-ptest += "textrel"
+
+# For compiling ptest on mips and mips64, the current go-dep version fails with the go 1.11 toolchain.
+# error message: vet config not found
+PTEST_ENABLED_mips = "0"
+PTEST_ENABLED_mips64 = "0"
-- 
1.9.1


