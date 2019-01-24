Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B16C579E69
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2019 06:39:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x0O6dZbS026240
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2019 22:39:35 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.408.0; Wed, 23 Jan 2019 22:39:34 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 24 Jan 2019 14:57:30 +0800
Message-ID: <86fa8d401929e7641976ac57b34ee4a872ee74c6.1548312985.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1548312985.git.liezhi.yang@windriver.com>
References: <cover.1548312985.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/5] ccache.bbclass: Only let native recipes depend on ccache-native
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
X-List-Received-Date: Thu, 24 Jan 2019 06:39:33 -0000
Content-Type: text/plain

Make native recipes depend on ccache-native should be enough since native
recipes are on target/nativesdk recipes' dependency chain, this can reduce the
size of DEPENDS.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/ccache.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/ccache.bbclass b/meta/classes/ccache.bbclass
index b545735..6caaca7 100644
--- a/meta/classes/ccache.bbclass
+++ b/meta/classes/ccache.bbclass
@@ -47,8 +47,11 @@ python() {
     # quilt-native doesn't need ccache since no c files
     if not (pn in ('ccache-native', 'quilt-native') or
             bb.utils.to_boolean(d.getVar('CCACHE_DISABLE'))):
-        d.appendVar('DEPENDS', ' ccache-native')
         d.setVar('CCACHE', 'ccache ')
+        # Make native recipes depend on ccache-native should be enough since
+        # native recipes are on target recipes' dependency chain.
+        if bb.data.inherits_class('native', d):
+            d.appendVar('DEPENDS', ' ccache-native')
 }
 
 addtask cleanccache after do_clean
-- 
2.7.4


