Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id DCB097ED17
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2019 06:55:36 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x766tHfe001361
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 5 Aug 2019 23:55:27 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Mon, 5 Aug 2019 23:55:00 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 6 Aug 2019 14:54:59 +0800
Message-ID: <1565074499-317606-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] go/go-runtime: use update-alternative for zdefaultcc.go
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
X-List-Received-Date: Tue, 06 Aug 2019 06:55:37 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

fix below error:
file /usr/lib64/go/src/cmd/cgo/zdefaultcc.go conflicts between attempted installs of go-dev-1.12.6-r0.core2_64 and go-runtime-dev-1.12.6-r0.core2_64
file /usr/lib64/go/src/cmd/go/internal/cfg/zdefaultcc.go conflicts between attempted installs of go-dev-1.12.6-r0.core2_64 and go-runtime-dev-1.12.6-r0.core2_64

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-devtools/go/go-runtime_1.12.bb | 6 ++++++
 meta/recipes-devtools/go/go_1.12.bb         | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/meta/recipes-devtools/go/go-runtime_1.12.bb b/meta/recipes-devtools/go/go-runtime_1.12.bb
index 43b68b4..a509824 100644
--- a/meta/recipes-devtools/go/go-runtime_1.12.bb
+++ b/meta/recipes-devtools/go/go-runtime_1.12.bb
@@ -1,2 +1,8 @@
 require go-${PV}.inc
 require go-runtime.inc
+
+inherit update-alternatives
+
+ALTERNATIVE_${PN}-dev = "zdefaultcc.go.1 zdefaultcc.go.2"
+ALTERNATIVE_LINK_NAME[zdefaultcc.go.1] = "${libdir}/go/src/cmd/cgo/zdefaultcc.go"
+ALTERNATIVE_LINK_NAME[zdefaultcc.go.2] = "${libdir}/go/src/cmd/go/internal/cfg/zdefaultcc.go
diff --git a/meta/recipes-devtools/go/go_1.12.bb b/meta/recipes-devtools/go/go_1.12.bb
index 42cdb04..6103832 100644
--- a/meta/recipes-devtools/go/go_1.12.bb
+++ b/meta/recipes-devtools/go/go_1.12.bb
@@ -12,3 +12,10 @@ python() {
     else:
         d.setVar('GOBUILDMODE', 'pie')
 }
+
+inherit update-alternatives
+
+ALTERNATIVE_PRIORITY_${PN}-dev = '20'
+ALTERNATIVE_${PN}-dev = "zdefaultcc.go.1 zdefaultcc.go.2"
+ALTERNATIVE_LINK_NAME[zdefaultcc.go.1] = "${libdir}/go/src/cmd/cgo/zdefaultcc.go"
+ALTERNATIVE_LINK_NAME[zdefaultcc.go.2] = "${libdir}/go/src/cmd/go/internal/cfg/zdefaultcc.go"
-- 
2.7.4


