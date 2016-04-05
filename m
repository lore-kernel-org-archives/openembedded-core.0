Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A503173216
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Apr 2016 03:09:33 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u3539Xjx009505
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Apr 2016 20:09:34 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.210) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Mon, 4 Apr 2016 20:09:32 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 5 Apr 2016 11:10:13 +0800
Message-ID: <2d362ec67807bce526f2ceb11f5275aa05fc829b.1459825756.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1459825756.git.Qi.Chen@windriver.com>
References: <cover.1459825756.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] grub_git: remove armv7a from COMPATIBLE_HOST
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
X-List-Received-Date: Tue, 05 Apr 2016 03:09:33 -0000
Content-Type: text/plain

grub_git recipe supports arm architectures. However, when building against
armv7a arch, we would meet the following error.

| build-grub-module-verifier: error: unsupported relocation 0x2b.
| make[3]: *** [disk.mod] Error 1
| make[3]: *** Waiting for unfinished jobs....
| build-grub-module-verifier: error: unsupported relocation 0x2b.
| make[3]: *** [cat.mod] Error 1
| build-grub-module-verifier: error: unsupported relocation 0x2b.
| make[3]: *** [cmp.mod] Error 1

This address, along with 0x2c, is not supported yet, according to grub
upstream.

So remove armv7a from COMPATIBLE_HOST for now.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-bsp/grub/grub_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-bsp/grub/grub_git.bb b/meta/recipes-bsp/grub/grub_git.bb
index 3ebab7f..2b435b7 100644
--- a/meta/recipes-bsp/grub/grub_git.bb
+++ b/meta/recipes-bsp/grub/grub_git.bb
@@ -18,6 +18,7 @@ SRC_URI = "git://git.savannah.gnu.org/grub.git \
 S = "${WORKDIR}/git"
 
 COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|aarch64.*)-(linux.*|freebsd.*)'
+COMPATIBLE_HOST_armv7a = 'null'
 
 inherit autotools gettext texinfo
 
-- 
1.9.1


