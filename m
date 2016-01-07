Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C23C8600B3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jan 2016 07:45:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u077jQxY024570
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Jan 2016 23:45:26 -0800
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 6 Jan 2016 23:45:25 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 6 Jan 2016 23:45:23 -0800
Message-ID: <40d0365cec15c63a1f77e9aa43fb4022f62e0f66.1452152689.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1452152689.git.liezhi.yang@windriver.com>
References: <cover.1452152689.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] run-postinsts: can't be allarch
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
X-List-Received-Date: Thu, 07 Jan 2016 07:45:25 -0000
Content-Type: text/plain

The dependencies chain:
run-postinsts -> update-rc.d.bbclass -> initscripts -> update-alternatives.

The update-alternatives is provided by opkg-utils which is not allarch.

This caused a problem:
$ bitbake lib32-core-image-minimal

Both lib32-opkg-utils and opkg-utils would be built, but opkg-utils
shouldn't, this patch can fix the problem.

[YOCTO #8879]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../run-postinsts/run-postinsts_1.0.bb             |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb b/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb
index 11c94e5..6b4290c 100644
--- a/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb
+++ b/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb
@@ -11,7 +11,7 @@ SRC_URI = "file://run-postinsts \
 
 S = "${WORKDIR}"
 
-inherit allarch systemd update-rc.d
+inherit systemd update-rc.d
 
 INITSCRIPT_NAME = "run-postinsts"
 INITSCRIPT_PARAMS = "start 99 S ."
-- 
1.7.9.5


