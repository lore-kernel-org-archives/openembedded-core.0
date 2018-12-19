Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id EFC0C6C479
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Dec 2018 06:34:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wBJ6XYNS017462
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 22:34:00 -0800
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.408.0; Tue, 18 Dec 2018 22:33:45 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 19 Dec 2018 14:51:10 +0800
Message-ID: <f8c21c17d3ad2ca31c4b26b23b74ab0bdefd2c77.1545202218.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1545202218.git.liezhi.yang@windriver.com>
References: <cover.1545202218.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] cmake-native: Set --parallel for configure
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
X-List-Received-Date: Wed, 19 Dec 2018 06:34:09 -0000
Content-Type: text/plain

This can save do_configure's time from 330s to 60s on my host.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/cmake/cmake-native_3.12.2.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.12.2.bb b/meta/recipes-devtools/cmake/cmake-native_3.12.2.bb
index 9a1390f..71b3326 100644
--- a/meta/recipes-devtools/cmake/cmake-native_3.12.2.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_3.12.2.bb
@@ -27,7 +27,9 @@ CMAKE_EXTRACONF = "\
 "
 
 do_configure () {
-	${S}/configure --verbose --prefix=${prefix} -- ${CMAKE_EXTRACONF}
+	${S}/configure --verbose --prefix=${prefix} \
+		--parallel=${@d.getVar('PARALLEL_MAKE').replace('-j ', '')} \
+		-- ${CMAKE_EXTRACONF}
 }
 
 do_compile() {
-- 
2.7.4


