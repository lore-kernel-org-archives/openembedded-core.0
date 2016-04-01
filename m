Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1DFDA7326D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Apr 2016 09:14:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u319EnFa000510
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Apr 2016 02:14:49 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 1 Apr 2016 02:14:48 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 1 Apr 2016 02:14:45 -0700
Message-ID: <c549fc5e526ef36ff52a79b9b0801f879ea96ec5.1459502011.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1459502011.git.liezhi.yang@windriver.com>
References: <cover.1459502011.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] init-install-efi.sh: remove all root=foo from grub.cfg
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
X-List-Received-Date: Fri, 01 Apr 2016 09:14:49 -0000
Content-Type: text/plain

There might be more than one root=/dev/foo in the config file which
would cause unepected errros on the installed target, so remove all of
them.

[YOCTO #9354]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/initrdscripts/files/init-install-efi.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi.sh b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
index 3531158..d58826a 100644
--- a/meta/recipes-core/initrdscripts/files/init-install-efi.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
@@ -217,7 +217,7 @@ if [ -f /run/media/$1/EFI/BOOT/grub.cfg ]; then
     # Delete any LABEL= strings
     sed -i "s/ LABEL=[^ ]*/ /" $GRUBCFG
     # Delete any root= strings
-    sed -i "s/ root=[^ ]*/ /" $GRUBCFG
+    sed -i "s/ root=[^ ]*/ /g" $GRUBCFG
     # Add the root= and other standard boot options
     sed -i "s@linux /vmlinuz *@linux /vmlinuz root=PARTUUID=$root_part_uuid rw $rootwait quiet @" $GRUBCFG
 fi
-- 
2.8.0


