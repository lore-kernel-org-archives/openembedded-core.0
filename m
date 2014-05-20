Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (unknown [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CE83F65F1F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 May 2014 02:49:49 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s4K2nooO012002
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 May 2014 19:49:50 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.149) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Mon, 19 May 2014 19:49:49 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 20 May 2014 10:49:47 +0800
Message-ID: <1400554188-19458-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 1/2] initramfs-live-install: avoid using grub.d/40_custom
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
X-List-Received-Date: Tue, 20 May 2014 02:49:53 -0000
Content-Type: text/plain

From: Robert Yang <liezhi.yang@windriver.com>

We have this in recipes-bsp/grub/grub/40_custom:

[snip]
menuentry "Linux" {
    set root=(hd0,1)
    linux /vmlinuz root=__ROOTFS__ rw __CONSOLE__ __VIDEO_MODE__ __VGA_MODE__ quiet
}
[snip]

These lines are only for initrdscripts/files/init-install.sh, the side
effect is that it would make the target's grub-mkconfig doesn't work
well since the 40_custom will be installed to /etc/grub.d/40_custom, the
grub-mkconfig will run the 40_custom, and there will always be a
'menuentry "Linux"' menu in grub.cfg no matter it is valid or not, we
can do this in init-install.sh rather than grub to fix the problem,
which is also much simpler.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/initrdscripts/files/init-install.sh |   15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-install.sh b/meta/recipes-core/initrdscripts/files/init-install.sh
index 8e433d5..0ede928 100644
--- a/meta/recipes-core/initrdscripts/files/init-install.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install.sh
@@ -168,17 +168,16 @@ umount /src_root
 # Handling of the target boot partition
 mount $bootfs /boot
 echo "Preparing boot partition..."
-if [ -f /etc/grub.d/40_custom ] ; then
+if [ -f /etc/grub.d/00_header ] ; then
     echo "Preparing custom grub2 menu..."
     GRUBCFG="/boot/grub/grub.cfg"
     mkdir -p $(dirname $GRUBCFG)
-    cp /etc/grub.d/40_custom $GRUBCFG
-    sed -i "s@__ROOTFS__@$rootfs $rootwait@g" $GRUBCFG
-    sed -i "s/__VIDEO_MODE__/$3/g" $GRUBCFG
-    sed -i "s/__VGA_MODE__/$4/g" $GRUBCFG
-    sed -i "s/__CONSOLE__/$5/g" $GRUBCFG
-    sed -i "/#/d" $GRUBCFG
-    sed -i "/exec tail/d" $GRUBCFG
+    cat >$GRUBCFG <<_EOF
+menuentry "Linux" {
+    set root=(hd0,1)
+    linux /vmlinuz root=$rootfs $rootwait rw $5 $3 $4 quiet
+}
+_EOF
     chmod 0444 $GRUBCFG
 fi
 grub-install /dev/${device}
-- 
1.7.10.4


