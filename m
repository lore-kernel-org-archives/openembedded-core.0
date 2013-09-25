Return-Path: <eric@eukrea.com>
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	by mail.openembedded.org (Postfix) with ESMTP id 23FA260FE1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2013 16:52:04 +0000 (UTC)
Received: from buildor.local.eukrea.com (unknown [88.170.243.169])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 5AB51A63A6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2013 18:52:01 +0200 (CEST)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Sep 2013 18:52:13 +0200
Message-Id: <1380127933-18916-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.8.4.rc3
MIME-Version: 1.0
Subject: [PATCH] busybox: update mdev.conf
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
X-List-Received-Date: Wed, 25 Sep 2013 16:52:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

busybox 1.21.1 's mdev has changed the way the device's name is
reported so now we get input/event0 instead of event0.
I think this commit is responsible of this new behaviour :
http://git.busybox.net/busybox/commit/util-linux/mdev.c?id=c3cf1e30a3022453311a7e9fe11d94c7a381640e

Update mdev.conf according to this behaviour so that sound
and input devices are correctly populated (and now
/etc/mdev/find-touchscreen.sh is executed).

Tested on an arm board.

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 meta/recipes-core/busybox/files/mdev.conf | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/busybox/files/mdev.conf b/meta/recipes-core/busybox/files/mdev.conf
index 0e1d6bc..e688911 100644
--- a/meta/recipes-core/busybox/files/mdev.conf
+++ b/meta/recipes-core/busybox/files/mdev.conf
@@ -24,12 +24,14 @@ usbdev.* 0:0 0660 */etc/mdev/usb.sh
 vcs.* 0:5 0660 
 zero 0:0 0666 
  
-pcm.* 0:0 0660 =snd/ 
-control.* 0:0 0660 =snd/ 
-timer 0:0 0660 =snd/ 
+snd/pcm.* 0:0 0660
+snd/control.* 0:0 0660
+snd/timer 0:0 0660
+snd/seq 0:0 0660
+snd/mini.* 0:00 0660
 
-event.* 0:0 0660 =input/ @/etc/mdev/find-touchscreen.sh
-mice 0:0 0660 =input/ 
-mouse.* 0:0 0660 =input/
+input/event.* 0:0 0660 @/etc/mdev/find-touchscreen.sh
+input/mice 0:0 0660
+input/mouse.* 0:0 0660
 
 tun[0-9]* 0:0 0660 =net/
-- 
1.8.4.rc3


