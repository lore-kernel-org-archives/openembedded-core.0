Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 48E3C6074F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2016 03:20:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u8Q3KVsI005339
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Sep 2016 20:20:32 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.181) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Sun, 25 Sep 2016 20:20:30 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 26 Sep 2016 11:20:28 +0800
Message-ID: <0bf4b474fa83d4485afa8aaaff4166ebf88c628d.1474859926.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1474859926.git.Qi.Chen@windriver.com>
References: <cover.1474859926.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] meta-environment: ensure corret TOOLCHAIN_CONFIGSITE_NOCACHE value
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
X-List-Received-Date: Mon, 26 Sep 2016 03:20:31 -0000
Content-Type: text/plain

Expand TOOLCHAIN_CONFIGSITE_NOCACHE value immediately before inheriting
cross-canadian to avoid HOST_ARCH being changed from TARGET_ARCH to SDK_ARCH,
thus ensuring its correct value.

[YOCTO #10255]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/meta/meta-environment.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/meta/meta-environment.bb b/meta/recipes-core/meta/meta-environment.bb
index 49d45f6..d9e045f 100644
--- a/meta/recipes-core/meta/meta-environment.bb
+++ b/meta/recipes-core/meta/meta-environment.bb
@@ -12,6 +12,8 @@ REAL_MULTIMACH_TARGET_SYS = "${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS}"
 
 inherit toolchain-scripts
 TOOLCHAIN_NEED_CONFIGSITE_CACHE_append = " zlib"
+# Need to expand here before cross-candian changes HOST_ARCH -> SDK_ARCH
+TOOLCHAIN_CONFIGSITE_NOCACHE := "${TOOLCHAIN_CONFIGSITE_NOCACHE}"
 
 SDK_DIR = "${WORKDIR}/sdk"
 SDK_OUTPUT = "${SDK_DIR}/image"
-- 
1.9.1


