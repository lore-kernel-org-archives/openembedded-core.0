Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 385617503B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Sep 2018 06:25:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w846PouK007048
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 3 Sep 2018 23:25:50 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.408.0; Mon, 3 Sep 2018 23:25:49 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 4 Sep 2018 14:36:39 +0800
Message-ID: <ea8e96b3f2b09db17ecf9a28765b709433febe9b.1536042978.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1536042978.git.liezhi.yang@windriver.com>
References: <cover.1536042978.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] bitbake.conf: Make BUILD_OPTIMIZATION respect to DEBUG_BUILD
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
X-List-Received-Date: Tue, 04 Sep 2018 06:25:49 -0000
Content-Type: text/plain

We may also need debug native tools, so make BUILD_OPTIMIZATION respect to
DEBUG_BUILD, otherwise, we need set CFLAGS in the recipe which isn't
convenient.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 1941633..df62445 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -612,7 +612,7 @@ FULL_OPTIMIZATION = "-O2 -pipe ${DEBUG_FLAGS}"
 DEBUG_OPTIMIZATION = "-O -fno-omit-frame-pointer ${DEBUG_FLAGS} -pipe"
 SELECTED_OPTIMIZATION = "${@d.getVar(['FULL_OPTIMIZATION', 'DEBUG_OPTIMIZATION'][d.getVar('DEBUG_BUILD') == '1'])}"
 SELECTED_OPTIMIZATION[vardeps] += "FULL_OPTIMIZATION DEBUG_OPTIMIZATION"
-BUILD_OPTIMIZATION = "-O2 -pipe"
+BUILD_OPTIMIZATION = "${@['-O2', '-O -g -feliminate-unused-debug-types -fno-omit-frame-pointer'][d.getVar('DEBUG_BUILD') == '1']} -pipe"
 
 ##################################################################
 # Settings used by bitbake-layers.
-- 
2.7.4


