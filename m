Return-Path: <Ovidiu.Panait@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D990B781DC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Oct 2017 09:23:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v9V9N67A029067
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Oct 2017 02:23:06 -0700
Received: from otp-linux01.wrs.com (128.224.126.17) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 31 Oct 2017 02:23:05 -0700
From: Ovidiu Panait <ovidiu.panait@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 31 Oct 2017 11:23:04 +0200
Message-ID: <20171031092304.278114-1-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
Subject: [PATCH] init-install: add timeout for legacy grub
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
X-List-Received-Date: Tue, 31 Oct 2017 09:23:06 -0000
Content-Type: text/plain

After installing an image from an iso, booting the system using
the legacy boots makes the grub prompt wait for an enter.

This is not desirable since many of these devices are embedded
devices that should start by themselves without user entry.

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 meta/recipes-core/initrdscripts/files/init-install.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/initrdscripts/files/init-install.sh b/meta/recipes-core/initrdscripts/files/init-install.sh
index 572613e..c9d86de 100644
--- a/meta/recipes-core/initrdscripts/files/init-install.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install.sh
@@ -259,6 +259,8 @@ if [ -f /etc/grub.d/00_header -a $grub_version -ne 0 ] ; then
     GRUBCFG="/boot/grub/grub.cfg"
     mkdir -p $(dirname $GRUBCFG)
     cat >$GRUBCFG <<_EOF
+timeout=5
+default=0
 menuentry "Linux" {
     search --no-floppy --fs-uuid $boot_uuid --set root
     linux /vmlinuz root=PARTUUID=$root_part_uuid $rootwait rw $5 $3 $4 quiet
-- 
2.10.2


