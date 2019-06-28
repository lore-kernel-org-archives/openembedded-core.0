Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 538017E555
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2019 07:57:46 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5S7vBOE016972
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 28 Jun 2019 00:57:27 -0700
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Fri, 28 Jun 2019 00:57:01 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <matt@madison.systems>
Date: Fri, 28 Jun 2019 00:57:01 -0700
Message-ID: <20190628075701.78128-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] go-dep: disable PTEST_ENABLED
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
X-List-Received-Date: Fri, 28 Jun 2019 07:57:46 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

The run-ptest logic for go-dep actually runs the
/usr/lib64/go-dep/ptest/github.com/golang/dep/cmd/dep/dep.test whose
source file is https://github.com/golang/dep/blob/master/cmd/dep/dep_test.go.

That dep_test.go starts by rebuilding the dep program
from source, then runs the tests using that copy of the
program, so it's assuming that we're still in a development
environment where we can run a full go build.

Considering it not being designed for a cross-build setup,
so disable PTEST_ENABLED.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-devtools/go/go-dep_0.5.0.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/go/go-dep_0.5.0.bb b/meta/recipes-devtools/go/go-dep_0.5.0.bb
index a4d631f8ea..e9fc12fa5a 100644
--- a/meta/recipes-devtools/go/go-dep_0.5.0.bb
+++ b/meta/recipes-devtools/go/go-dep_0.5.0.bb
@@ -21,5 +21,6 @@ BBCLASSEXTEND = "native nativesdk"
 
 # For compiling ptest on mips and mips64, the current go-dep version fails with the go 1.11 toolchain.
 # error message: vet config not found
-PTEST_ENABLED_mips = "0"
-PTEST_ENABLED_mips64 = "0"
+# disable PTEST_ENABLED as the run-ptest script for go-dep actually runs the /usr/lib64/go-dep/ptest/github.com/golang/dep/cmd/dep/dep.test whose source file is https://github.com/golang/dep/blob/master/cmd/dep/dep_test.go not being designed for a cross-build setup.
+PTEST_ENABLED = "0"
+PTEST_ENABLED = "0"
-- 
2.21.0


