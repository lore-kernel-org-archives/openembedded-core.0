Received: from mail-ea0-f174.google.com ([209.85.215.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UDxBw-0006H8-Ps
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Mar 2013 14:18:33 +0100
Received: by mail-ea0-f174.google.com with SMTP id q10so170353eaj.19
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Mar 2013 05:01:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=EpXgzDTqI/Om+CsDDkLTiCGYP11DVbeanolrphNkCW4=;
	b=VIdrPB6BpOPi/0NCMp9IKpYspZ5FYfRL1bSLhuMxHxZBGG/poroJJ0Z18R8KvI7kEz
	k5FB/5m3cTmolTxay+MqI1LXdyJjHB4GK+CsevjTQpQASUli8m+ZuThiHr1RTeyc0UyF
	wYZMrxW7KC18nno7+0PIvbWhc+NrowTjoCT0TCslma2LntuY578ir64EJb97PDuXFA4B
	ODfPhB8ImvnnIrlOApqYinb7856IvK+UylNy1jgKBzbPKVQhH8RaUihXfxlgfbe0PtcN
	23VndyImdOgNyA3R5clODWInKM6AG6wXigDB4TXddlH+X+wNsxK/4ESZ0vB2glXOnzFs
	g1Ww==
X-Received: by 10.14.175.129 with SMTP id z1mr5436343eel.7.1362747719250;
	Fri, 08 Mar 2013 05:01:59 -0800 (PST)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id d47sm7650277eem.9.2013.03.08.05.01.57
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 08 Mar 2013 05:01:57 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Mar 2013 14:01:45 +0100
Message-Id: <1362747705-19277-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1.4
X-Gm-Message-State: ALoCoQkIdH4wMTJPzzxzG7HvTC3o6NhoW5TwI5E1O1Hwaovy96ofhJ1iVCuYQvUE0tiqNrNa2SX/
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] mkefidisk.sh: Cope with translations and modelnames with 'Disk' in it.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Mar 2013 13:18:36 -0000

The script greps for 'Disk', which doesn't work when your crazy Dutch distro has parted call it 'Schijf', so force LANG=C.

The second problem is that 'Disk' might be a substring in the Model entry:

[root@Angstrom-F16-vm-rpm contrib] # parted /dev/sdc  unit mb print
Model: SanDisk SDDR-113 (scsi)
Disk /dev/sdc: 3905MB

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 scripts/contrib/mkefidisk.sh | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/contrib/mkefidisk.sh b/scripts/contrib/mkefidisk.sh
index 38e2217..44ac130 100755
--- a/scripts/contrib/mkefidisk.sh
+++ b/scripts/contrib/mkefidisk.sh
@@ -18,6 +18,8 @@
 # Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 #
 
+LANG=C
+
 #
 # Defaults
 #
@@ -123,7 +125,7 @@ fi
 #
 # Partition $DEVICE
 #
-DEVICE_SIZE=$(parted $DEVICE unit mb print | grep Disk | cut -d" " -f 3 | sed -e "s/MB//")
+DEVICE_SIZE=$(parted $DEVICE unit mb print | grep ^Disk | cut -d" " -f 3 | sed -e "s/MB//")
 SWAP_SIZE=$((DEVICE_SIZE*SWAP_RATIO/100))
 ROOTFS_SIZE=$((DEVICE_SIZE-BOOT_SIZE-SWAP_SIZE))
 ROOTFS_START=$((BOOT_SIZE))
-- 
1.8.1.4



