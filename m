Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 24761606D1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jan 2016 07:45:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u077jQKo005704
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Jan 2016 23:45:26 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 6 Jan 2016 23:45:26 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 6 Jan 2016 23:45:24 -0800
Message-ID: <228ce5dac7d96467f7165add45a39cfcd12c7bfc.1452152689.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1452152689.git.liezhi.yang@windriver.com>
References: <cover.1452152689.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] liberation-fonts: can't be allarch
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
X-List-Received-Date: Thu, 07 Jan 2016 07:45:26 -0000
Content-Type: text/plain

liberation-fonts inherit fontcache which would depend on fontconfig, and
fontconfig is not allarch, so that liberation-fonts can't be allarch.

It caused a problem:
$ bitbake lib32-core-image-sato

Both lib32-fontconfig and fontconfig would be built, but fontconfig
shouldn't, this patch can fix the problem.

[YOCTO #8882]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../ttf-fonts/liberation-fonts_1.04.bb             |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.04.bb b/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.04.bb
index bda82e7..f64748c 100644
--- a/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.04.bb
+++ b/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.04.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 PR = "r4"
 PE = "1"
 
-inherit allarch fontcache
+inherit fontcache
 
 FONT_PACKAGES = "${PN}"
 
-- 
1.7.9.5


