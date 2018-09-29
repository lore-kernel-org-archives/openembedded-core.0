Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 838797999F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Sep 2018 09:33:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w8T9XuOC020259
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Sep 2018 02:33:56 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.408.0; Sat, 29 Sep 2018 02:33:55 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 29 Sep 2018 17:44:46 +0800
Message-ID: <5262fed3fddeaa7b919a85237c2d76e9c8116260.1538214256.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1538214256.git.liezhi.yang@windriver.com>
References: <cover.1538214256.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] go.bbclass: Add -buildmode=pie for non mips arch
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
X-List-Received-Date: Sat, 29 Sep 2018 09:33:55 -0000
Content-Type: text/plain

Fixed QA issue like:
WARNING: runc-docker do_package_qa: QA Issue: ELF binary '/path/to/runc-docker/usr/bin/runc' has relocations in .text [textrel]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/go.bbclass | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index d33d83e..167d02e 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -179,3 +179,13 @@ FILES_${PN}-staticdev = "${libdir}/go/pkg"
 
 INSANE_SKIP_${PN} += "ldflags"
 INSANE_SKIP_${PN}-ptest += "ldflags"
+
+# Add -buildmode=pie to GOBUILDFLAGS to satisfy "textrel" QA checking, but mips
+# doesn't support -buildmode=pie, so skip the QA checking for mips and its
+# variants.
+python() {
+    if 'mips' in d.getVar('TARGET_ARCH'):
+        d.appendVar('INSANE_SKIP_%s' % d.getVar('PN'), " textrel")
+    else:
+        d.appendVar('GOBUILDFLAGS', ' -buildmode=pie')
+}
-- 
2.7.4


