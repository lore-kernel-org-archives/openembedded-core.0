Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 60A026FC3D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jun 2014 10:45:26 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s5GAjRCU003051
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jun 2014 03:45:27 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 16 Jun 2014 03:45:26 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 16 Jun 2014 18:46:27 +0800
Message-ID: <2510b3cf5064a0ac283e4138aef31f63a4555f5a.1402915083.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1402915083.git.Qi.Chen@windriver.com>
References: <cover.1402915083.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/9] kernel.bbclass: also install the bundled kernel to STAGING_KERNEL_DIR
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
X-List-Received-Date: Mon, 16 Jun 2014 10:45:28 -0000
Content-Type: text/plain

Storing the bundled kernel in ${D} would have the risk of getting
deleted by rm_work. It also makes the bundled kernel unavailable to
others until the kernel is deployed. So it's better to also install
the bundled kernel into ${STAGING_KERNEL_DIR} so that others could
use it once do_bundle_initramfs is finished.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/kernel.bbclass |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 6ed1cb7..743b9fb 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -138,6 +138,7 @@ do_bundle_initramfs () {
 		# Update install area
 		echo "There is kernel image bundled with initramfs: ${B}/${KERNEL_OUTPUT}.initramfs"
 		install -m 0644 ${B}/${KERNEL_OUTPUT}.initramfs ${D}/boot/${KERNEL_IMAGETYPE}-initramfs-${MACHINE}.bin
+		install -m 0644 ${B}/${KERNEL_OUTPUT}.initramfs ${STAGING_KERNEL_DIR}/${KERNEL_IMAGETYPE}-initramfs-${MACHINE}.bin
 		echo "${B}/${KERNEL_OUTPUT}.initramfs"
 	fi
 }
-- 
1.7.9.5


