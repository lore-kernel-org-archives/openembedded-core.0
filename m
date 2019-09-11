Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B0A357F2EA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2019 10:05:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x8BA5f3k006065
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2019 03:05:41 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Wed, 11 Sep 2019 03:05:40 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 11 Sep 2019 18:31:43 +0800
Message-ID: <ce1fb4b6f62ec6f94baf3a86043aa9da8796955c.1568197869.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1568197869.git.liezhi.yang@windriver.com>
References: <cover.1568197869.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] conf/multilib.conf: Add ovmf to NON_MULTILIB_RECIPES
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
X-List-Received-Date: Wed, 11 Sep 2019 10:05:39 -0000
Content-Type: text/plain

Fixed:
MACHINE = "qemux86-64"
require conf/multilib.conf
MULTILIBS = "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 = "x86"

$ bitbake ovmf lib32-ovmf
[snip]
ERROR: ovmf-edk2-stable201905-r0 do_deploy_setscene: The recipe ovmf is trying to install files into a shared area when those files already exist.
 Those files and their manifest location are:
  /buildarea1/lyang1/rebase-work/test_cc/tmp-glibc/deploy/images/qemux86-64/OvmfPkKek1.key
    (matched in manifest-qemux86_64-lib32-ovmf.deploy)
[snip]

Add it NON_MULTILIB_RECIPES to fix the problem since it is a firmware, build
multilib for it doens't make much sense.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/conf/multilib.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index 65a28dd..cfed3fb 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -29,4 +29,4 @@ PKG_CONFIG_PATH[vardepvalueexclude] = ":${WORKDIR}/recipe-sysroot/${datadir}/pkg
 
 # These recipes don't need multilib variants, the ${BPN} PROVDES/RPROVDES
 # ${MLPREFIX}${BPN}
-NON_MULTILIB_RECIPES = "grub grub-efi make-mod-scripts"
+NON_MULTILIB_RECIPES = "grub grub-efi make-mod-scripts ovmf"
-- 
2.7.4


