Return-Path: <jussi.kukkonen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 11BF476A6F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Aug 2015 14:05:11 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 19 Aug 2015 07:05:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,710,1432623600"; d="scan'208";a="771757367"
Received: from theory.fi.intel.com ([10.237.72.51])
	by fmsmga001.fm.intel.com with ESMTP; 19 Aug 2015 07:05:09 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Aug 2015 17:06:48 +0300
Message-Id: <1439993208-4427-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] libinput: Upgrade 0.18.0 -> 0.21.0
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
X-List-Received-Date: Wed, 19 Aug 2015 14:05:14 -0000

Include a workaround patch suggested by upstream when using
kernel 4.1.x.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---

Resending this after rebase with the assumption that it was rejected
because of merge problems (it was part of a patch set that was
otherwise merged already).

Cheers,
  Jussi


 ...ics-need-to-fake-new-touches-on-TRIPLETAP.patch | 72 ++++++++++++++++++++++
 .../{libinput_0.18.0.bb => libinput_0.21.0.bb}     |  5 +-
 2 files changed, 75 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/wayland/libinput/touchpad-serial-synaptics-need-to-fake-new-touches-on-TRIPLETAP.patch
 rename meta/recipes-graphics/wayland/{libinput_0.18.0.bb => libinput_0.21.0.bb} (72%)

diff --git a/meta/recipes-graphics/wayland/libinput/touchpad-serial-synaptics-need-to-fake-new-touches-on-TRIPLETAP.patch b/meta/recipes-graphics/wayland/libinput/touchpad-serial-synaptics-need-to-fake-new-touches-on-TRIPLETAP.patch
new file mode 100644
index 0000000..97c63bd
--- /dev/null
+++ b/meta/recipes-graphics/wayland/libinput/touchpad-serial-synaptics-need-to-fake-new-touches-on-TRIPLETAP.patch
@@ -0,0 +1,72 @@
+This is a workaround upstream suggests for use with kernel 4.1.
+
+Upstream-Status: Inappropriate [temporary work-around]
+Signed-Off-By: Jussi Kukkonen <jussi.kukkonen@intel.com>
+
+
+
+From: Peter Hutterer <peter.hutterer@who-t.net>
+Date: Mon Aug 3 18:23:12 PDT 2015
+Subject: [PATCH v3 libinput] touchpad: serial synaptics need to fake new touches on TRIPLETAP
+
+On the 4.1 kernels synaptics pretends to have 3 slots (the serial fw only does
+2). This was added to avoid cursor jumps but has since been reverted for 4.2
+(kernel commit dbf3c37086, 4.1.3 is still buggy). In some cases a TRIPLETAP
+may be triggered without slot 2 ever activating.
+
+While there are still those kernels out there, work around this bug by opening
+a new touch point where none exists if the fake finger count exceeds the slot
+count.
+
+Reported-by: Jan Alexander Steffens <jan.steffens at gmail.com>
+Signed-off-by: Peter Hutterer <peter.hutterer at who-t.net>
+Tested-by: Jan Alexander Steffens <jan.steffens at gmail.com>
+Reviewed-by: Hans de Goede <hdegoede at redhat.com>
+---
+Changes to v2:
+- split out the handling instead of having a tmp state variable, see Hans'
+  comments from v2
+
+Mainly sending this to the list again so I have a link to point people to.
+If you're on 4.1.x add this patch to your distribution package.
+
+ src/evdev-mt-touchpad.c | 22 ++++++++++++++++------
+ 1 file changed, 16 insertions(+), 6 deletions(-)
+
+diff --git a/src/evdev-mt-touchpad.c b/src/evdev-mt-touchpad.c
+index a683d9a..5ef03d5 100644
+--- a/src/evdev-mt-touchpad.c
++++ b/src/evdev-mt-touchpad.c
+@@ -369,13 +369,23 @@ tp_restore_synaptics_touches(struct tp_dispatch *tp,
+ 	for (i = 0; i < tp->num_slots; i++) {
+ 		struct tp_touch *t = tp_get_touch(tp, i);
+ 
+-		if (t->state != TOUCH_END)
++		switch(t->state) {
++		case TOUCH_HOVERING:
++		case TOUCH_BEGIN:
++		case TOUCH_UPDATE:
+ 			continue;
+-
+-		/* new touch, move it through begin to update immediately */
+-		tp_new_touch(tp, t, time);
+-		tp_begin_touch(tp, t, time);
+-		t->state = TOUCH_UPDATE;
++		case TOUCH_NONE:
++			/* new touch, move it through to begin immediately */
++			tp_new_touch(tp, t, time);
++			tp_begin_touch(tp, t, time);
++			break;
++		case TOUCH_END:
++			/* touch just ended ,we need need to restore it to update */
++			tp_new_touch(tp, t, time);
++			tp_begin_touch(tp, t, time);
++			t->state = TOUCH_UPDATE;
++			break;
++		}
+ 	}
+ }
+ 
+-- 
+2.4.3
+
diff --git a/meta/recipes-graphics/wayland/libinput_0.18.0.bb b/meta/recipes-graphics/wayland/libinput_0.21.0.bb
similarity index 72%
rename from meta/recipes-graphics/wayland/libinput_0.18.0.bb
rename to meta/recipes-graphics/wayland/libinput_0.21.0.bb
index 8e8e6a7..d51fb37 100644
--- a/meta/recipes-graphics/wayland/libinput_0.18.0.bb
+++ b/meta/recipes-graphics/wayland/libinput_0.21.0.bb
@@ -9,9 +9,10 @@ DEPENDS = "libevdev udev mtdev"
 
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz \
            file://libinput-configure.ac-add-arg-with-libunwind.patch \
+           file://touchpad-serial-synaptics-need-to-fake-new-touches-on-TRIPLETAP.patch \
 "
-SRC_URI[md5sum] = "0ddbb0d53d58dec0a86de6791560011a"
-SRC_URI[sha256sum] = "64a70f96bab17a22eaf2fd7af17cf83def3388374096c7623be9448f62808cda"
+SRC_URI[md5sum] = "f91d8f4ced986f1ae16d52ea02bc7837"
+SRC_URI[sha256sum] = "7cce7a9e510dfe5c4a19ad00e9350808d4f59f8611fd2b5e87213c507283f550"
 
 inherit autotools pkgconfig
 
-- 
2.1.4


