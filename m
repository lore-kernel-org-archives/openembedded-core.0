Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2BFED6FECF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jun 2014 10:45:24 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s5GAjQOf013089
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jun 2014 03:45:26 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 16 Jun 2014 03:45:25 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 16 Jun 2014 18:46:26 +0800
Message-ID: <eee3628e158ce86c73022c5860a2510f32fd1392.1402915083.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1402915083.git.Qi.Chen@windriver.com>
References: <cover.1402915083.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/9] initramfs-framework: fix an error in finish module
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

It's possible that the /dev directory doesn't exist under $ROOTFS_DIR.
This should not suggest any invalidity. So instead of erroring out when
$ROOTFS_DIR/dev doesn't exist, we create it.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../initrdscripts/initramfs-framework/finish       |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/finish b/meta/recipes-core/initrdscripts/initramfs-framework/finish
index 325f47b..1ff0e3e 100755
--- a/meta/recipes-core/initrdscripts/initramfs-framework/finish
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/finish
@@ -28,9 +28,7 @@ finish_run() {
 			fi
 		fi
 
-		if [ ! -d $ROOTFS_DIR/dev ]; then
-			fatal "ERROR: There's no '/dev' on rootfs."
-		fi
+		mkdir -p $ROOTFS_DIR/dev
 
 		info "Switching root to '$ROOTFS_DIR'..."
 
-- 
1.7.9.5


