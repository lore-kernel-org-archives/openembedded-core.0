Return-Path: <Zhe.He@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 37F357691F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 08:22:54 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t7B8Mtdx005320
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 01:22:55 -0700 (PDT)
Received: from PEK-ZHE-D1.corp.ad.wrs.com (128.224.162.235) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.235.1; Tue, 11 Aug 2015 01:22:54 -0700
From: <zhe.he@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 11 Aug 2015 16:22:23 +0800
Message-ID: <925eb33167a5510d9d2ec76b0d3e1c2f3f109008.1439279286.git.zhe.he@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1439279286.git.zhe.he@windriver.com>
References: <cover.1439279286.git.zhe.he@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] kernel: Correct mishandling of linux.bin for building uImage
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
X-List-Received-Date: Tue, 11 Aug 2015 08:22:57 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

Building uImage fails when KEEPUIMAGE is not "yes".
Remove wrong removal of linux.bin before compressing it.

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 meta/classes/kernel-uboot.bbclass | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/classes/kernel-uboot.bbclass b/meta/classes/kernel-uboot.bbclass
index 8ab30b8..345e7f5 100644
--- a/meta/classes/kernel-uboot.bbclass
+++ b/meta/classes/kernel-uboot.bbclass
@@ -12,7 +12,6 @@ uboot_prep_kimage() {
 	${OBJCOPY} -O binary -R .note -R .comment -S "${vmlinux_path}" linux.bin
 
 	if [ "${linux_comp}" != "none" ] ; then
-		rm -f linux.bin
 		gzip -9 linux.bin
 		mv -f "linux.bin${linux_suffix}" linux.bin
 	fi
-- 
1.9.1


