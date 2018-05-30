Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2BE7D74ED2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2018 08:56:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w4U8umor004989
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2018 01:56:48 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Wed, 30 May 2018 01:56:47 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 30 May 2018 17:04:00 +0800
Message-ID: <f526834c7c1b9069f62c29c3708893099de495e4.1527670923.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1527670923.git.liezhi.yang@windriver.com>
References: <cover.1527670923.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 13/16] init-install: add timeout for legacy grub
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
X-List-Received-Date: Wed, 30 May 2018 08:56:47 -0000
Content-Type: text/plain

From: Catalin Enache <catalin.enache@windriver.com>

After installing an image from an iso, booting the system using
the legacy boots makes the grub prompt wait for an enter.

This is not desirable since many of this devices are embedded
devices that should start by them self without user entry.

Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
---
 meta/recipes-core/initrdscripts/files/init-install.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/initrdscripts/files/init-install.sh b/meta/recipes-core/initrdscripts/files/init-install.sh
index 28e8f09..e715796 100644
--- a/meta/recipes-core/initrdscripts/files/init-install.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install.sh
@@ -302,6 +302,8 @@ if [ -f /etc/grub.d/00_header -a $grub_version -ne 0 ] ; then
     GRUBCFG="/boot/grub/grub.cfg"
     mkdir -p $(dirname $GRUBCFG)
     cat >$GRUBCFG <<_EOF
+timeout=5
+default=0
 menuentry "Linux" {
     search --no-floppy --fs-uuid $boot_uuid --set root
     linux /$kernel root=PARTUUID=$root_part_uuid $rootwait rw $5 $3 $4 quiet
-- 
2.7.4


