Return-Path: <jose.alarcon@ge.com>
Received: from mx0a-00176a03.pphosted.com (mx0b-00176a03.pphosted.com
	[67.231.157.48])
	by mail.openembedded.org (Postfix) with ESMTP id 7245077FC9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Aug 2017 05:38:08 +0000 (UTC)
Received: from pps.filterd (m0048206.ppops.net [127.0.0.1])
	by m0048206.ppops.net-00176a03. (8.16.0.21/8.16.0.21) with SMTP id
	v7O5XDf2005001 for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Aug 2017 01:38:09 -0400
From: Jose Alarcon <jose.alarcon@ge.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Aug 2017 08:37:53 +0300
Message-Id: <20170824053753.36121-1-jose.alarcon@ge.com>
X-Mailer: git-send-email 2.10.1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-08-24_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	priorityscore=1501 malwarescore=0
	suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
	lowpriorityscore=0 impostorscore=0 adultscore=0 classifier=spam
	adjust=0
	reason=mlx scancount=1 engine=8.0.1-1707230000
	definitions=main-1708240089
Subject: [PATCH] libinput: remove obsolete touchpad patch
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
X-List-Received-Date: Thu, 24 Aug 2017 05:38:09 -0000

This patch was a temporal workaround needed with 4.1 kernels.
Remove it.

Signed-off-by: Jose Alarcon <jose.alarcon@ge.com>
---
 ...ics-need-to-fake-new-touches-on-TRIPLETAP.patch | 72 ----------------------
 meta/recipes-graphics/wayland/libinput_1.8.1.bb    |  1 -
 2 files changed, 73 deletions(-)
 delete mode 100644 meta/recipes-graphics/wayland/libinput/touchpad-serial-synaptics-need-to-fake-new-touches-on-TRIPLETAP.patch

diff --git a/meta/recipes-graphics/wayland/libinput/touchpad-serial-synaptics-need-to-fake-new-touches-on-TRIPLETAP.patch b/meta/recipes-graphics/wayland/libinput/touchpad-serial-synaptics-need-to-fake-new-touches-on-TRIPLETAP.patch
deleted file mode 100644
index b52b496..0000000
--- a/meta/recipes-graphics/wayland/libinput/touchpad-serial-synaptics-need-to-fake-new-touches-on-TRIPLETAP.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-This is a workaround upstream suggests for use with kernel 4.1.
-
-Upstream-Status: Inappropriate [temporary work-around]
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-
-
-
-From: Peter Hutterer <peter.hutterer@who-t.net>
-Date: Mon Aug 3 18:23:12 PDT 2015
-Subject: [PATCH v3 libinput] touchpad: serial synaptics need to fake new touches on TRIPLETAP
-
-On the 4.1 kernels synaptics pretends to have 3 slots (the serial fw only does
-2). This was added to avoid cursor jumps but has since been reverted for 4.2
-(kernel commit dbf3c37086, 4.1.3 is still buggy). In some cases a TRIPLETAP
-may be triggered without slot 2 ever activating.
-
-While there are still those kernels out there, work around this bug by opening
-a new touch point where none exists if the fake finger count exceeds the slot
-count.
-
-Reported-by: Jan Alexander Steffens <jan.steffens at gmail.com>
-Signed-off-by: Peter Hutterer <peter.hutterer at who-t.net>
-Tested-by: Jan Alexander Steffens <jan.steffens at gmail.com>
-Reviewed-by: Hans de Goede <hdegoede at redhat.com>
----
-Changes to v2:
-- split out the handling instead of having a tmp state variable, see Hans'
-  comments from v2
-
-Mainly sending this to the list again so I have a link to point people to.
-If you're on 4.1.x add this patch to your distribution package.
-
- src/evdev-mt-touchpad.c | 22 ++++++++++++++++------
- 1 file changed, 16 insertions(+), 6 deletions(-)
-
-diff --git a/src/evdev-mt-touchpad.c b/src/evdev-mt-touchpad.c
-index a683d9a..5ef03d5 100644
---- a/src/evdev-mt-touchpad.c
-+++ b/src/evdev-mt-touchpad.c
-@@ -369,13 +369,23 @@ tp_restore_synaptics_touches(struct tp_dispatch *tp,
- 	for (i = 0; i < tp->num_slots; i++) {
- 		struct tp_touch *t = tp_get_touch(tp, i);
- 
--		if (t->state != TOUCH_END)
-+		switch(t->state) {
-+		case TOUCH_HOVERING:
-+		case TOUCH_BEGIN:
-+		case TOUCH_UPDATE:
- 			continue;
--
--		/* new touch, move it through begin to update immediately */
--		tp_new_touch(tp, t, time);
--		tp_begin_touch(tp, t, time);
--		t->state = TOUCH_UPDATE;
-+		case TOUCH_NONE:
-+			/* new touch, move it through to begin immediately */
-+			tp_new_touch(tp, t, time);
-+			tp_begin_touch(tp, t, time);
-+			break;
-+		case TOUCH_END:
-+			/* touch just ended ,we need need to restore it to update */
-+			tp_new_touch(tp, t, time);
-+			tp_begin_touch(tp, t, time);
-+			t->state = TOUCH_UPDATE;
-+			break;
-+		}
- 	}
- }
- 
--- 
-2.4.3
-
diff --git a/meta/recipes-graphics/wayland/libinput_1.8.1.bb b/meta/recipes-graphics/wayland/libinput_1.8.1.bb
index f75298b..a21babe 100644
--- a/meta/recipes-graphics/wayland/libinput_1.8.1.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.8.1.bb
@@ -8,7 +8,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2184aef38ff137ed33ce9a63b9d1eb8f"
 DEPENDS = "libevdev udev mtdev"
 
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz \
-           file://touchpad-serial-synaptics-need-to-fake-new-touches-on-TRIPLETAP.patch \
            file://0001-tools-Fix-race-in-autotools-install.patch \
 "
 
-- 
2.10.1


