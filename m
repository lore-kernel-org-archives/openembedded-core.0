Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A6F4E7BD25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2019 06:39:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x0O6dIJ6000794
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2019 22:39:28 -0800
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.408.0; Wed, 23 Jan 2019 22:39:07 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 24 Jan 2019 14:57:28 +0800
Message-ID: <8e2e09ed285f3de458b09f165718f48060694e9d.1548312985.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1548312985.git.liezhi.yang@windriver.com>
References: <cover.1548312985.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/5] cmake-native: Add --enable-ccache to configure options
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
X-List-Received-Date: Thu, 24 Jan 2019 06:39:37 -0000
Content-Type: text/plain

cmake-native requires --enable-ccache to enable ccache, target recipe doesn't
need this since it is already handled by cmake.bbclass.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/cmake/cmake-native_3.12.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.12.2.bb b/meta/recipes-devtools/cmake/cmake-native_3.12.2.bb
index 2f4ecc4..fedcf3d 100644
--- a/meta/recipes-devtools/cmake/cmake-native_3.12.2.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_3.12.2.bb
@@ -29,6 +29,7 @@ CMAKE_EXTRACONF = "\
 do_configure () {
 	${S}/configure --verbose --prefix=${prefix} \
 		${@oe.utils.parallel_make_argument(d, '--parallel=%d')} \
+		${@bb.utils.contains('CCACHE', 'ccache ', '--enable-ccache', '', d)} \
 		-- ${CMAKE_EXTRACONF}
 }
 
-- 
2.7.4


