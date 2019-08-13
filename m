Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 24DEE7EB14
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2019 08:36:23 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x7D8aOhs010986
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2019 01:36:24 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Tue, 13 Aug 2019 01:36:23 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 13 Aug 2019 16:36:22 +0800
Message-ID: <1565685382-289462-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] go-runtime: remove conflict files from -dev packages
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
X-List-Received-Date: Tue, 13 Aug 2019 08:36:23 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

fix below error:
file /usr/lib64/go/src/cmd/cgo/zdefaultcc.go conflicts between attempted installs of go-dev-1.12.6-r0.core2_64 and go-runtime-dev-1.12.6-r0.core2_64
file /usr/lib64/go/src/cmd/go/internal/cfg/zdefaultcc.go conflicts between attempted installs of go-dev-1.12.6-r0.core2_64 and go-runtime-dev-1.12.6-r0.core2_64

these 2 files existed in both go-dev and go-runtime-dev
remove it from go-runtime-dev to fix the problem

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-devtools/go/go-runtime.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/go/go-runtime.inc b/meta/recipes-devtools/go/go-runtime.inc
index e282195..9731e16 100644
--- a/meta/recipes-devtools/go/go-runtime.inc
+++ b/meta/recipes-devtools/go/go-runtime.inc
@@ -59,6 +59,9 @@ do_install() {
 	done
 	find ${D}${libdir}/go/src -depth -type d -name testdata -exec rm -rf {} \;
 	rm -f ${D}${libdir}/go/src/cmd/dist/dist
+        rm -f ${D}${libdir}/go/src/cmd/cgo/zdefaultcc.go
+        rm -f ${D}${libdir}/go/src/cmd/go/internal/cfg/zdefaultcc.go
+
 }
 
 ALLOW_EMPTY_${PN} = "1"
-- 
2.7.4


