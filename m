Return-Path: <tanuk@iki.fi>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
	[66.111.4.25])
	by mail.openembedded.org (Postfix) with ESMTP id 58A66719DE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Feb 2017 07:06:57 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 3470520BED
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Feb 2017 02:06:56 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
	by compute5.internal (MEProxy); Fri, 03 Feb 2017 02:06:56 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=date:from:message-id:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=vS
	ylm6ikkOIfBN6Lh5B40D9w6rs=; b=FjZOEO0Ee+VGJSh6EM0Zzqt7/2tQw0JK2j
	SaLFTHhW9fEeduwpxnqQGjI1/3df/dz10aMN/4z9OQKdeBno/iAe6GN4p0nM2ifb
	fPRD9r3sw41evCxm+CzP5S1G8Cp2B0cRXcsIVSAGoZAapilMx9CKCVAjiYMiJWZ8
	ozR5R8S1g=
X-ME-Sender: <xms:ECyUWJ12AglkEiOVZkRXiElb4ujoMspVnuqKtbR-kk1RnoaltyQWVA>
X-Sasl-enc: KArMzgOTy4bcU49c1UnHlavrAifSNF2DHdtTyvnTXyaq 1486105615
Received: from localhost.localdomain (unknown [192.40.95.3])
	by mail.messagingengine.com (Postfix) with ESMTPA id 2A0BD7E1B5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Feb 2017 02:06:54 -0500 (EST)
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Feb 2017 09:06:35 +0200
Message-Id: <20170203070635.30804-1-tanuk@iki.fi>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] pulseaudio: 9.0 -> 10.0
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
X-List-Received-Date: Fri, 03 Feb 2017 07:06:58 -0000

Relase notes:
https://www.freedesktop.org/wiki/Software/PulseAudio/Notes/10.0/

The checksum of the LICENSE file changed due to some clarifications.
There were no changes to the actual licensing terms.

The LICENSE variable was not accurate, so I made changes to it.
Specifically:
 * there's no GPL code in PulseAudio so I dropped GPL from the list
 * the LGPL code allows using later versions of the license rather than
   limiting to just 2.1
 * there are some MIT and BSD licensed bits

I added more files to LIC_FILES_CHKSUM to have better coverage of all
the differently licensed code.

Dropped json-c and gdbm from DEPENDS. The new release doesn't use json-c
any more. gdbm isn't used when --with-database=simple is passed to
configure, so it should have been removed from DEPENDS a long time ago.

The new release dropped the Xen module, so the --without-xen configure
option isn't needed any more.

Added a comment for why --without-fftw is used.

Disabled the adrian echo canceller, because it has an unusual license,
and disabling the code was simpler than adding a new license to OE-Core.

Dropped upstreamed patches.
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |  80 +++-
 ...oth-fail-if-user-requested-profile-doesn-.patch |  61 ---
 ...ard-don-t-allow-the-CARD_NEW-hook-to-fail.patch |  37 --
 ...-move-profile-selection-after-pa_card_new.patch | 429 ---------------------
 ...rd-remove-pa_card_new_data.active_profile.patch |  72 ----
 ...vailability-for-some-unavailable-profiles.patch |  79 ----
 .../pulseaudio/pulseaudio_10.0.bb                  |  14 +
 .../pulseaudio/pulseaudio_9.0.bb                   |  19 -
 8 files changed, 88 insertions(+), 703 deletions(-)
 delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0001-alsa-bluetooth-fail-if-user-requested-profile-doesn-.patch
 delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0002-card-don-t-allow-the-CARD_NEW-hook-to-fail.patch
 delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0003-card-move-profile-selection-after-pa_card_new.patch
 delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0004-card-remove-pa_card_new_data.active_profile.patch
 delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0005-alsa-set-availability-for-some-unavailable-profiles.patch
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio_10.0.bb
 delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio_9.0.bb

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index f5c5ed29c9..818ff560cc 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -2,16 +2,69 @@ SUMMARY = "Sound server for Linux and Unix-like operating systems"
 HOMEPAGE = "http://www.pulseaudio.org"
 AUTHOR = "Lennart Poettering"
 SECTION = "libs/multimedia"
-LICENSE = "GPLv2+ & LGPLv2.1"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d9ae089c8dc5339f8ac9d8563038a29f \
+
+# Most of PulseAudio code is under LGPLv2.1+. There are a few exceptions:
+#
+# The "adrian" echo canceller variant has code under a non-standard permissive
+# license. See src/modules/echo-cancel/adrian-license.txt for details. This
+# recipe disables the adrian echo canceller to avoid hassle with the unusual
+# license.
+#
+# The src/modules/reserve* and src/pulsecore/rtkit* files are under the MIT
+# license.
+#
+# The src/pulsecore/filter/ directory contains code under the 3-clause BSD
+# license.
+#
+# src/utils/qpaeq is licensed under AGPL. qpaeq is not installed by this
+# recipe, however, which is why AGPL is not mentioned in LICENSE.
+#
+# People who distribute PulseAudio binaries need to also consider that there
+# are some dependencies to GPL libraries. LGPL code that depends on GPL
+# libraries probably becomes effectively GPL-licensed (at compile-time? or at
+# at link-time?). I'm not a lawyer, though, so I'm not sure of the exact
+# implications. The GPL dependencies only affect the server, not the client
+# library, with the exception of libdbus that affects both. These are the GPL
+# library dependencies:
+#
+# One of the resampler implementations uses libsamplerate. This recipe doesn't
+# enable that resampler, however.
+#
+# One of the database implementations uses gdbm. This recipe doesn't enable
+# that database implementation, however.
+#
+# module-lirc (enabled by PACKAGECONFIG[lirc]) uses LIRC.
+#
+# module-equalizer-sink uses FFTW. This recipe disables that, however.
+#
+# The dependency with the most complicated licensing considerations is libdbus.
+# When PACKAGECONFIG[dbus] is enabled (like it is by default), libdbus will be
+# used by both the server and the client library (libpulse). Does this affect
+# applications that use libpulse? It should be also noted that libdbus is
+# dual-licensed: either GPLv2+ or AFL-2 terms apply. Whose decision is it which
+# of the licenses apply? What a mess. Some people hold the view that libdbus is
+# a system library that is covered by the "special exception" in GPLv2's
+# section 3, and therefore libdbus's GPL license doesn't affect PulseAudio.
+LICENSE = "LGPLv2.1+ & MIT & BSD-3-Clause"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a848e8d03f04976778eab2348b59ed2b \
                     file://GPL;md5=4325afd396febcb659c36b49533135d4 \
                     file://LGPL;md5=2d5025d4aa3495befef8f17206a5b0a1 \
-                    file://src/pulsecore/resampler.h;beginline=4;endline=21;md5=09794012ae16912c0270f3280cc8ff84"
+                    file://AGPL;md5=73f1eb20517c55bf9493b7dd6e480788 \
+                    file://src/modules/echo-cancel/adrian-license.txt;md5=abbab006a561fbffccedf1c3531f34ab \
+                    file://src/pulsecore/filter/LICENSE.WEBKIT;md5=49defbaffddf8c51faf606ff7fc3b1f7 \
+                    file://src/pulsecore/resampler.h;beginline=4;endline=21;md5=09794012ae16912c0270f3280cc8ff84 \
+                    file://src/modules/reserve.h;beginline=6;endline=28;md5=0e23094760367d51b6609750e9b31fbb \
+                    file://src/pulsecore/rtkit.h;beginline=6;endline=29;md5=3f00ff966716ae0817c31576d1473528 \
+                    file://src/utils/qpaeq;beginline=2;endline=16;md5=7f62515a4762f0c3fc3d4201858bb964 \
+                    file://src/modules/echo-cancel/adrian-aec.h;beginline=3;endline=12;md5=d3ed4fad1c073f8b06f37495dc5d1026 \
+                    file://src/pulsecore/filter/biquad.h;beginline=1;endline=4;md5=6d46d1365206528a20137355924233c1 \
+"
 
 DEPENDS = "libatomic-ops libsndfile1 libtool intltool-native"
 # optional
 DEPENDS += "udev alsa-lib glib-2.0 gconf"
-DEPENDS += "json-c gdbm speexdsp libxml-parser-perl-native libcap"
+DEPENDS += "speexdsp libxml-parser-perl-native libcap"
 
 inherit autotools bash-completion pkgconfig useradd gettext perlnative bluetooth systemd manpages
 
@@ -25,9 +78,7 @@ EXTRA_OECONF = "\
 		--enable-tcpwrap=no \
 		--with-access-group=audio \
 		--disable-openssl \
-		--disable-xen \
 		--with-database=simple \
-		--without-fftw \
 		--without-zsh-completion-dir \
 		--with-udev-rules-dir=`pkg-config --variable=udevdir udev`/rules.d \
                 ac_cv_header_valgrind_memcheck_h=no \
@@ -38,6 +89,23 @@ EXTRA_OECONF = "\
 # oe-core nor meta-oe, so let's not add a PACKAGECONFIG entry for it for now.
 EXTRA_OECONF += "--without-soxr"
 
+# The FFTW dependency (for module-equalizer-sink) was removed in commit
+# ddbd713293 without explaining why it was not made a PACKAGECONFIG item
+# instead. Oh well, let's keep it disabled until someone expresses some
+# interest in having it enabled.
+#
+# One nice thing about disabling this is that it also prevents qpaeq from
+# being installed, so we avoid adding AGPL to the list of licenses (nothing
+# else in PulseAudio is licensed under AGPL).
+EXTRA_OECONF += "--without-fftw"
+
+# The "adrian" echo canceller implementation has a non-standard license
+# (src/modules/echo-cancel/adrian-license.txt). It's a permissive license, so
+# the licensing terms are probably not problematic, but it would be an extra
+# hassle to add the license to OE-Core's set of licenses. The canceller isn't
+# very good anyway, better alternatives exist (such as the webrtc canceller).
+EXTRA_OECONF += "--disable-adrian-aec"
+
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', '${BLUEZ}', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-alsa-bluetooth-fail-if-user-requested-profile-doesn-.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-alsa-bluetooth-fail-if-user-requested-profile-doesn-.patch
deleted file mode 100644
index 2f72ceb33b..0000000000
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-alsa-bluetooth-fail-if-user-requested-profile-doesn-.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 9c3cdfcd198ef9727ea542f284ac6d8c1bcd7a3a Mon Sep 17 00:00:00 2001
-From: Tanu Kaskinen <tanuk@iki.fi>
-Date: Fri, 23 Oct 2015 12:36:34 +0300
-Subject: [PATCH 1/5] alsa, bluetooth: fail if user-requested profile doesn't
- exist
-
-If we can't fulfill the user request fully, I think we shouldn't
-fulfill it at all, to make it clear that the requested operation
-didn't succeed.
-
-Upstream-Status: Accepted [expected in 10.0]
-
-Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
----
- src/modules/alsa/module-alsa-card.c          | 11 +++++++++--
- src/modules/bluetooth/module-bluez4-device.c |  7 +++++--
- 2 files changed, 14 insertions(+), 4 deletions(-)
-
-diff --git a/src/modules/alsa/module-alsa-card.c b/src/modules/alsa/module-alsa-card.c
-index e5cc4ae..d761683 100644
---- a/src/modules/alsa/module-alsa-card.c
-+++ b/src/modules/alsa/module-alsa-card.c
-@@ -799,8 +799,15 @@ int pa__init(pa_module *m) {
-         goto fail;
-     }
- 
--    if ((profile = pa_modargs_get_value(u->modargs, "profile", NULL)))
--        pa_card_new_data_set_profile(&data, profile);
-+    if ((profile = pa_modargs_get_value(u->modargs, "profile", NULL))) {
-+        if (pa_hashmap_get(data.profiles, profile))
-+            pa_card_new_data_set_profile(&data, profile);
-+        else {
-+            pa_log("No such profile: %s", profile);
-+            pa_card_new_data_done(&data);
-+            goto fail;
-+        }
-+    }
- 
-     u->card = pa_card_new(m->core, &data);
-     pa_card_new_data_done(&data);
-diff --git a/src/modules/bluetooth/module-bluez4-device.c b/src/modules/bluetooth/module-bluez4-device.c
-index 9a921a5..a2de525 100644
---- a/src/modules/bluetooth/module-bluez4-device.c
-+++ b/src/modules/bluetooth/module-bluez4-device.c
-@@ -2301,8 +2301,11 @@ static int add_card(struct userdata *u) {
-     if ((default_profile = pa_modargs_get_value(u->modargs, "profile", NULL))) {
-         if (pa_hashmap_get(data.profiles, default_profile))
-             pa_card_new_data_set_profile(&data, default_profile);
--        else
--            pa_log_warn("Profile '%s' not valid or not supported by device.", default_profile);
-+        else {
-+            pa_log("Profile '%s' not valid or not supported by device.", default_profile);
-+            pa_card_new_data_done(&data);
-+            return -1;
-+        }
-     }
- 
-     u->card = pa_card_new(u->core, &data);
--- 
-2.8.1
-
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/0002-card-don-t-allow-the-CARD_NEW-hook-to-fail.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/0002-card-don-t-allow-the-CARD_NEW-hook-to-fail.patch
deleted file mode 100644
index 80c291f821..0000000000
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio/0002-card-don-t-allow-the-CARD_NEW-hook-to-fail.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From d4e6d07fef28d1bd8bfbceab4cc196ef54c23dd8 Mon Sep 17 00:00:00 2001
-From: Tanu Kaskinen <tanuk@iki.fi>
-Date: Tue, 7 Jun 2016 16:51:00 +0300
-Subject: [PATCH 2/5] card: don't allow the CARD_NEW hook to fail
-
-There is currently no use for allowing modules to cancel card creation,
-and I don't see need for that in the future either. Let's simplify
-things by removing the failure handling code.
-
-Upstream-Status: Accepted [expected in 10.0]
-
-Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
----
- src/pulsecore/card.c | 7 +------
- 1 file changed, 1 insertion(+), 6 deletions(-)
-
-diff --git a/src/pulsecore/card.c b/src/pulsecore/card.c
-index 410746b..0ac70b9 100644
---- a/src/pulsecore/card.c
-+++ b/src/pulsecore/card.c
-@@ -149,12 +149,7 @@ pa_card *pa_card_new(pa_core *core, pa_card_new_data *data) {
-     }
- 
-     pa_card_new_data_set_name(data, name);
--
--    if (pa_hook_fire(&core->hooks[PA_CORE_HOOK_CARD_NEW], data) < 0) {
--        pa_xfree(c);
--        pa_namereg_unregister(core, name);
--        return NULL;
--    }
-+    pa_hook_fire(&core->hooks[PA_CORE_HOOK_CARD_NEW], data);
- 
-     c->core = core;
-     c->name = pa_xstrdup(data->name);
--- 
-2.8.1
-
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/0003-card-move-profile-selection-after-pa_card_new.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/0003-card-move-profile-selection-after-pa_card_new.patch
deleted file mode 100644
index e0f424bbcc..0000000000
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio/0003-card-move-profile-selection-after-pa_card_new.patch
+++ /dev/null
@@ -1,429 +0,0 @@
-From 0b98309fdbcd36fa92ab53e33c51b485b905e294 Mon Sep 17 00:00:00 2001
-From: Tanu Kaskinen <tanuk@iki.fi>
-Date: Fri, 23 Oct 2015 12:59:53 +0300
-Subject: [PATCH 3/5] card: move profile selection after pa_card_new()
-
-I want module-alsa-card to set the availability of unavailable
-profiles before the initial card profile gets selected, so that the
-selection logic can use correct availability information.
-module-alsa-card initializes the jack state after calling
-pa_card_new(), however, and the profile selection happens in
-pa_card_new(). This patch solves that by moving parts of pa_card_new()
-to pa_card_choose_initial_profile() and pa_card_put().
-
-pa_card_choose_initial_profile() applies the profile selection policy,
-so module-alsa-card can first call pa_card_new(), then initialize the
-jack state, and then call pa_card_choose_initial_profile(). After that
-module-alsa-card can still override the profile selection policy, in
-case module-alsa-card was loaded with the "profile" argument. Finally,
-pa_card_put() finalizes the card creation.
-
-An alternative solution would have been to move the jack
-initialization to happen before pa_card_new() and use pa_card_new_data
-instead of pa_card in the jack initialization code, but I disliked
-that idea (I want to get rid of the "new data" pattern eventually).
-
-The order in which the initial profile policy is applied is reversed
-in this patch. Previously the first one to set it won, now the last
-one to set it wins. I think this is better, because if you have N
-parties that want to set the profile, we avoid checking N times
-whether someone else has already set the profile.
-
-Upstream-Status: Accepted [expected in 10.0]
-
-Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
----
- src/modules/alsa/module-alsa-card.c          | 32 +++++----
- src/modules/bluetooth/module-bluez4-device.c | 31 +++++----
- src/modules/bluetooth/module-bluez5-device.c |  2 +
- src/modules/macosx/module-coreaudio-device.c |  2 +
- src/modules/module-card-restore.c            | 36 +++++++---
- src/pulsecore/card.c                         | 99 +++++++++++++++++-----------
- src/pulsecore/card.h                         |  9 +++
- src/pulsecore/core.h                         |  1 +
- 8 files changed, 143 insertions(+), 69 deletions(-)
-
-diff --git a/src/modules/alsa/module-alsa-card.c b/src/modules/alsa/module-alsa-card.c
-index d761683..1976230 100644
---- a/src/modules/alsa/module-alsa-card.c
-+++ b/src/modules/alsa/module-alsa-card.c
-@@ -671,7 +671,7 @@ int pa__init(pa_module *m) {
-     struct userdata *u;
-     pa_reserve_wrapper *reserve = NULL;
-     const char *description;
--    const char *profile = NULL;
-+    const char *profile_str = NULL;
-     char *fn = NULL;
-     bool namereg_fail = false;
- 
-@@ -799,16 +799,6 @@ int pa__init(pa_module *m) {
-         goto fail;
-     }
- 
--    if ((profile = pa_modargs_get_value(u->modargs, "profile", NULL))) {
--        if (pa_hashmap_get(data.profiles, profile))
--            pa_card_new_data_set_profile(&data, profile);
--        else {
--            pa_log("No such profile: %s", profile);
--            pa_card_new_data_done(&data);
--            goto fail;
--        }
--    }
--
-     u->card = pa_card_new(m->core, &data);
-     pa_card_new_data_done(&data);
- 
-@@ -822,6 +812,26 @@ int pa__init(pa_module *m) {
-             (pa_hook_cb_t) card_suspend_changed, u);
- 
-     init_jacks(u);
-+
-+    pa_card_choose_initial_profile(u->card);
-+
-+    /* If the "profile" modarg is given, we have to override whatever the usual
-+     * policy chose in pa_card_choose_initial_profile(). */
-+    profile_str = pa_modargs_get_value(u->modargs, "profile", NULL);
-+    if (profile_str) {
-+        pa_card_profile *profile;
-+
-+        profile = pa_hashmap_get(u->card->profiles, profile_str);
-+        if (!profile) {
-+            pa_log("No such profile: %s", profile_str);
-+            goto fail;
-+        }
-+
-+        pa_card_set_profile(u->card, profile, false);
-+    }
-+
-+    pa_card_put(u->card);
-+
-     init_profile(u);
-     init_eld_ctls(u);
- 
-diff --git a/src/modules/bluetooth/module-bluez4-device.c b/src/modules/bluetooth/module-bluez4-device.c
-index a2de525..13fb7ab 100644
---- a/src/modules/bluetooth/module-bluez4-device.c
-+++ b/src/modules/bluetooth/module-bluez4-device.c
-@@ -2238,7 +2238,7 @@ static int add_card(struct userdata *u) {
-     pa_bluez4_profile_t *d;
-     pa_bluez4_form_factor_t ff;
-     char *n;
--    const char *default_profile;
-+    const char *profile_str;
-     const pa_bluez4_device *device;
-     const pa_bluez4_uuid *uuid;
- 
-@@ -2298,16 +2298,6 @@ static int add_card(struct userdata *u) {
-     *d = PA_BLUEZ4_PROFILE_OFF;
-     pa_hashmap_put(data.profiles, p->name, p);
- 
--    if ((default_profile = pa_modargs_get_value(u->modargs, "profile", NULL))) {
--        if (pa_hashmap_get(data.profiles, default_profile))
--            pa_card_new_data_set_profile(&data, default_profile);
--        else {
--            pa_log("Profile '%s' not valid or not supported by device.", default_profile);
--            pa_card_new_data_done(&data);
--            return -1;
--        }
--    }
--
-     u->card = pa_card_new(u->core, &data);
-     pa_card_new_data_done(&data);
- 
-@@ -2319,6 +2309,25 @@ static int add_card(struct userdata *u) {
-     u->card->userdata = u;
-     u->card->set_profile = card_set_profile;
- 
-+    pa_card_choose_initial_profile(u->card);
-+
-+    /* If the "profile" modarg is given, we have to override whatever the usual
-+     * policy chose in pa_card_choose_initial_profile(). */
-+    profile_str = pa_modargs_get_value(u->modargs, "profile", NULL);
-+    if (profile_str) {
-+        pa_card_profile *profile;
-+
-+        profile = pa_hashmap_get(u->card->profiles, profile_str);
-+        if (!profile) {
-+            pa_log("No such profile: %s", profile_str);
-+            return -1;
-+        }
-+
-+        pa_card_set_profile(u->card, profile, false);
-+    }
-+
-+    pa_card_put(u->card);
-+
-     d = PA_CARD_PROFILE_DATA(u->card->active_profile);
- 
-     if (*d != PA_BLUEZ4_PROFILE_OFF && (!device->transports[*d] ||
-diff --git a/src/modules/bluetooth/module-bluez5-device.c b/src/modules/bluetooth/module-bluez5-device.c
-index 84e6d55..498d0e1 100644
---- a/src/modules/bluetooth/module-bluez5-device.c
-+++ b/src/modules/bluetooth/module-bluez5-device.c
-@@ -1953,6 +1953,8 @@ static int add_card(struct userdata *u) {
- 
-     u->card->userdata = u;
-     u->card->set_profile = set_profile_cb;
-+    pa_card_choose_initial_profile(u->card);
-+    pa_card_put(u->card);
- 
-     p = PA_CARD_PROFILE_DATA(u->card->active_profile);
-     u->profile = *p;
-diff --git a/src/modules/macosx/module-coreaudio-device.c b/src/modules/macosx/module-coreaudio-device.c
-index 6c9e55d..d91c656 100644
---- a/src/modules/macosx/module-coreaudio-device.c
-+++ b/src/modules/macosx/module-coreaudio-device.c
-@@ -821,6 +821,8 @@ int pa__init(pa_module *m) {
-     pa_card_new_data_done(&card_new_data);
-     u->card->userdata = u;
-     u->card->set_profile = card_set_profile;
-+    pa_card_choose_initial_profile(u->card);
-+    pa_card_put(u->card);
- 
-     u->rtpoll = pa_rtpoll_new();
-     pa_thread_mq_init(&u->thread_mq, m->core->mainloop, u->rtpoll);
-diff --git a/src/modules/module-card-restore.c b/src/modules/module-card-restore.c
-index 7545aa5..718a0dd 100644
---- a/src/modules/module-card-restore.c
-+++ b/src/modules/module-card-restore.c
-@@ -551,16 +551,6 @@ static pa_hook_result_t card_new_hook_callback(pa_core *c, pa_card_new_data *new
-     if (!(e = entry_read(u, new_data->name)))
-         return PA_HOOK_OK;
- 
--    if (e->profile[0]) {
--        if (!new_data->active_profile) {
--            pa_card_new_data_set_profile(new_data, e->profile);
--            pa_log_info("Restored profile '%s' for card %s.", new_data->active_profile, new_data->name);
--            new_data->save_profile = true;
--
--        } else
--            pa_log_debug("Not restoring profile for card %s, because already set.", new_data->name);
--    }
--
-     /* Always restore the latency offsets because their
-      * initial value is always 0 */
- 
-@@ -590,6 +580,30 @@ static pa_hook_result_t card_new_hook_callback(pa_core *c, pa_card_new_data *new
-     return PA_HOOK_OK;
- }
- 
-+static pa_hook_result_t card_choose_initial_profile_callback(pa_core *core, pa_card *card, struct userdata *u) {
-+    struct entry *e;
-+
-+    if (!(e = entry_read(u, card->name)))
-+        return PA_HOOK_OK;
-+
-+    if (e->profile[0]) {
-+        pa_card_profile *profile;
-+
-+        profile = pa_hashmap_get(card->profiles, e->profile);
-+        if (profile) {
-+            pa_log_info("Restoring profile '%s' for card %s.", card->active_profile->name, card->name);
-+            pa_card_set_profile(card, profile, true);
-+        } else {
-+            pa_log_debug("Tried to restore profile %s for card %s, but the card doesn't have such profile.",
-+                         e->profile, card->name);
-+        }
-+    }
-+
-+    entry_free(e);
-+
-+    return PA_HOOK_OK;
-+}
-+
- static pa_hook_result_t card_preferred_port_changed_callback(pa_core *core, pa_card_preferred_port_changed_hook_data *data,
-                                                              struct userdata *u) {
-     struct entry *e;
-@@ -634,6 +648,8 @@ int pa__init(pa_module*m) {
-     u->module = m;
- 
-     pa_module_hook_connect(m, &m->core->hooks[PA_CORE_HOOK_CARD_NEW], PA_HOOK_EARLY, (pa_hook_cb_t) card_new_hook_callback, u);
-+    pa_module_hook_connect(m, &m->core->hooks[PA_CORE_HOOK_CARD_CHOOSE_INITIAL_PROFILE], PA_HOOK_NORMAL,
-+                           (pa_hook_cb_t) card_choose_initial_profile_callback, u);
-     pa_module_hook_connect(m, &m->core->hooks[PA_CORE_HOOK_CARD_PUT], PA_HOOK_NORMAL, (pa_hook_cb_t) card_put_hook_callback, u);
-     pa_module_hook_connect(m, &m->core->hooks[PA_CORE_HOOK_CARD_PREFERRED_PORT_CHANGED], PA_HOOK_NORMAL, (pa_hook_cb_t) card_preferred_port_changed_callback, u);
-     pa_module_hook_connect(m, &m->core->hooks[PA_CORE_HOOK_CARD_PROFILE_CHANGED], PA_HOOK_NORMAL, (pa_hook_cb_t) card_profile_changed_callback, u);
-diff --git a/src/pulsecore/card.c b/src/pulsecore/card.c
-index 0ac70b9..a0c3d93 100644
---- a/src/pulsecore/card.c
-+++ b/src/pulsecore/card.c
-@@ -176,38 +176,56 @@ pa_card *pa_card_new(pa_core *core, pa_card_new_data *data) {
-     c->preferred_input_port = data->preferred_input_port;
-     c->preferred_output_port = data->preferred_output_port;
- 
--    if (data->active_profile)
--        if ((c->active_profile = pa_hashmap_get(c->profiles, data->active_profile)))
--            c->save_profile = data->save_profile;
-+    pa_device_init_description(c->proplist, c);
-+    pa_device_init_icon(c->proplist, true);
-+    pa_device_init_intended_roles(c->proplist);
- 
--    if (!c->active_profile) {
--        PA_HASHMAP_FOREACH(profile, c->profiles, state) {
--            if (profile->available == PA_AVAILABLE_NO)
--                continue;
-+    return c;
-+}
- 
--            if (!c->active_profile || profile->priority > c->active_profile->priority)
--                c->active_profile = profile;
--        }
--        /* If all profiles are not available, then we still need to pick one */
--        if (!c->active_profile) {
--            PA_HASHMAP_FOREACH(profile, c->profiles, state)
--                if (!c->active_profile || profile->priority > c->active_profile->priority)
--                    c->active_profile = profile;
-+void pa_card_choose_initial_profile(pa_card *card) {
-+    pa_card_profile *profile;
-+    void *state;
-+    pa_card_profile *best = NULL;
-+
-+    pa_assert(card);
-+
-+    /* By default, pick the highest priority profile that is not unavailable,
-+     * or if all profiles are unavailable, pick the profile with the highest
-+     * priority regardless of its availability. */
-+
-+    PA_HASHMAP_FOREACH(profile, card->profiles, state) {
-+        if (profile->available == PA_AVAILABLE_NO)
-+            continue;
-+
-+        if (!best || profile->priority > best->priority)
-+            best = profile;
-+    }
-+
-+    if (!best) {
-+        PA_HASHMAP_FOREACH(profile, card->profiles, state) {
-+            if (!best || profile->priority > best->priority)
-+                best = profile;
-         }
--        pa_assert(c->active_profile);
-     }
-+    pa_assert(best);
- 
--    pa_device_init_description(c->proplist, c);
--    pa_device_init_icon(c->proplist, true);
--    pa_device_init_intended_roles(c->proplist);
-+    card->active_profile = best;
-+    card->save_profile = false;
- 
--    pa_assert_se(pa_idxset_put(core->cards, c, &c->index) >= 0);
-+    /* Let policy modules override the default. */
-+    pa_hook_fire(&card->core->hooks[PA_CORE_HOOK_CARD_CHOOSE_INITIAL_PROFILE], card);
-+}
- 
--    pa_log_info("Created %u \"%s\"", c->index, c->name);
--    pa_subscription_post(core, PA_SUBSCRIPTION_EVENT_CARD|PA_SUBSCRIPTION_EVENT_NEW, c->index);
-+void pa_card_put(pa_card *card) {
-+    pa_assert(card);
- 
--    pa_hook_fire(&core->hooks[PA_CORE_HOOK_CARD_PUT], c);
--    return c;
-+    pa_assert_se(pa_idxset_put(card->core->cards, card, &card->index) >= 0);
-+    card->linked = true;
-+
-+    pa_log_info("Created %u \"%s\"", card->index, card->name);
-+    pa_hook_fire(&card->core->hooks[PA_CORE_HOOK_CARD_PUT], card);
-+    pa_subscription_post(card->core, PA_SUBSCRIPTION_EVENT_CARD|PA_SUBSCRIPTION_EVENT_NEW, card->index);
- }
- 
- void pa_card_free(pa_card *c) {
-@@ -218,15 +236,15 @@ void pa_card_free(pa_card *c) {
- 
-     core = c->core;
- 
--    pa_hook_fire(&core->hooks[PA_CORE_HOOK_CARD_UNLINK], c);
--
--    pa_namereg_unregister(core, c->name);
--
--    pa_idxset_remove_by_data(c->core->cards, c, NULL);
-+    if (c->linked) {
-+        pa_hook_fire(&core->hooks[PA_CORE_HOOK_CARD_UNLINK], c);
- 
--    pa_log_info("Freed %u \"%s\"", c->index, c->name);
-+        pa_idxset_remove_by_data(c->core->cards, c, NULL);
-+        pa_log_info("Freed %u \"%s\"", c->index, c->name);
-+        pa_subscription_post(c->core, PA_SUBSCRIPTION_EVENT_CARD|PA_SUBSCRIPTION_EVENT_REMOVE, c->index);
-+    }
- 
--    pa_subscription_post(c->core, PA_SUBSCRIPTION_EVENT_CARD|PA_SUBSCRIPTION_EVENT_REMOVE, c->index);
-+    pa_namereg_unregister(core, c->name);
- 
-     pa_assert(pa_idxset_isempty(c->sinks));
-     pa_idxset_free(c->sinks, NULL);
-@@ -298,20 +316,27 @@ int pa_card_set_profile(pa_card *c, pa_card_profile *profile, bool save) {
-         return 0;
-     }
- 
--    if ((r = c->set_profile(c, profile)) < 0)
-+    /* If we're setting the initial profile, we shouldn't call set_profile(),
-+     * because the implementations don't expect that (for historical reasons).
-+     * We should just set c->active_profile, and the implementations will
-+     * properly set up that profile after pa_card_put() has returned. It would
-+     * be probably good to change this so that also the initial profile can be
-+     * set up in set_profile(), but if set_profile() fails, that would need
-+     * some better handling than what we do here currently. */
-+    if (c->linked && (r = c->set_profile(c, profile)) < 0)
-         return r;
- 
--    pa_subscription_post(c->core, PA_SUBSCRIPTION_EVENT_CARD|PA_SUBSCRIPTION_EVENT_CHANGE, c->index);
--
--    pa_log_info("Changed profile of card %u \"%s\" to %s", c->index, c->name, profile->name);
--
-     c->active_profile = profile;
-     c->save_profile = save;
- 
-     if (save)
-         update_port_preferred_profile(c);
- 
--    pa_hook_fire(&c->core->hooks[PA_CORE_HOOK_CARD_PROFILE_CHANGED], c);
-+    if (c->linked) {
-+        pa_log_info("Changed profile of card %u \"%s\" to %s", c->index, c->name, profile->name);
-+        pa_hook_fire(&c->core->hooks[PA_CORE_HOOK_CARD_PROFILE_CHANGED], c);
-+        pa_subscription_post(c->core, PA_SUBSCRIPTION_EVENT_CARD|PA_SUBSCRIPTION_EVENT_CHANGE, c->index);
-+    }
- 
-     return 0;
- }
-diff --git a/src/pulsecore/card.h b/src/pulsecore/card.h
-index d4970e3..fd1fe0a 100644
---- a/src/pulsecore/card.h
-+++ b/src/pulsecore/card.h
-@@ -86,6 +86,8 @@ struct pa_card {
- 
-     pa_suspend_cause_t suspend_cause;
- 
-+    bool linked;
-+
-     void *userdata;
- 
-     int (*set_profile)(pa_card *c, pa_card_profile *profile);
-@@ -128,6 +130,13 @@ void pa_card_new_data_set_preferred_port(pa_card_new_data *data, pa_direction_t
- void pa_card_new_data_done(pa_card_new_data *data);
- 
- pa_card *pa_card_new(pa_core *c, pa_card_new_data *data);
-+
-+/* Select the initial card profile according to the configured policies. This
-+ * must be called between pa_card_new() and pa_card_put(), after the port and
-+ * profile availablities have been initialized. */
-+void pa_card_choose_initial_profile(pa_card *card);
-+
-+void pa_card_put(pa_card *c);
- void pa_card_free(pa_card *c);
- 
- void pa_card_add_profile(pa_card *c, pa_card_profile *profile);
-diff --git a/src/pulsecore/core.h b/src/pulsecore/core.h
-index 00d7f2f..802111b 100644
---- a/src/pulsecore/core.h
-+++ b/src/pulsecore/core.h
-@@ -118,6 +118,7 @@ typedef enum pa_core_hook {
-     PA_CORE_HOOK_CLIENT_PROPLIST_CHANGED,
-     PA_CORE_HOOK_CLIENT_SEND_EVENT,
-     PA_CORE_HOOK_CARD_NEW,
-+    PA_CORE_HOOK_CARD_CHOOSE_INITIAL_PROFILE,
-     PA_CORE_HOOK_CARD_PUT,
-     PA_CORE_HOOK_CARD_UNLINK,
-     PA_CORE_HOOK_CARD_PREFERRED_PORT_CHANGED,
--- 
-2.8.1
-
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/0004-card-remove-pa_card_new_data.active_profile.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/0004-card-remove-pa_card_new_data.active_profile.patch
deleted file mode 100644
index 480f2cea41..0000000000
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio/0004-card-remove-pa_card_new_data.active_profile.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From 375bc56fd3d66f40a9650224e5bfea4002494ade Mon Sep 17 00:00:00 2001
-From: Tanu Kaskinen <tanuk@iki.fi>
-Date: Fri, 23 Oct 2015 13:50:35 +0300
-Subject: [PATCH 4/5] card: remove pa_card_new_data.active_profile
-
-It's not being used any more.
-
-Upstream-Status: Accepted [expected in 10.0]
-
-Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
----
- src/pulsecore/card.c | 8 --------
- src/pulsecore/card.h | 5 -----
- 2 files changed, 13 deletions(-)
-
-diff --git a/src/pulsecore/card.c b/src/pulsecore/card.c
-index a0c3d93..bc5b75b 100644
---- a/src/pulsecore/card.c
-+++ b/src/pulsecore/card.c
-@@ -96,13 +96,6 @@ void pa_card_new_data_set_name(pa_card_new_data *data, const char *name) {
-     data->name = pa_xstrdup(name);
- }
- 
--void pa_card_new_data_set_profile(pa_card_new_data *data, const char *profile) {
--    pa_assert(data);
--
--    pa_xfree(data->active_profile);
--    data->active_profile = pa_xstrdup(profile);
--}
--
- void pa_card_new_data_set_preferred_port(pa_card_new_data *data, pa_direction_t direction, pa_device_port *port) {
-     pa_assert(data);
- 
-@@ -125,7 +118,6 @@ void pa_card_new_data_done(pa_card_new_data *data) {
-         pa_hashmap_free(data->ports);
- 
-     pa_xfree(data->name);
--    pa_xfree(data->active_profile);
- }
- 
- pa_card *pa_card_new(pa_core *core, pa_card_new_data *data) {
-diff --git a/src/pulsecore/card.h b/src/pulsecore/card.h
-index fd1fe0a..5699475 100644
---- a/src/pulsecore/card.h
-+++ b/src/pulsecore/card.h
-@@ -101,15 +101,11 @@ typedef struct pa_card_new_data {
-     pa_module *module;
- 
-     pa_hashmap *profiles;
--    char *active_profile;
--
-     pa_hashmap *ports;
-     pa_device_port *preferred_input_port;
-     pa_device_port *preferred_output_port;
- 
-     bool namereg_fail:1;
--
--    bool save_profile:1;
- } pa_card_new_data;
- 
- typedef struct {
-@@ -125,7 +121,6 @@ void pa_card_profile_set_available(pa_card_profile *c, pa_available_t available)
- 
- pa_card_new_data *pa_card_new_data_init(pa_card_new_data *data);
- void pa_card_new_data_set_name(pa_card_new_data *data, const char *name);
--void pa_card_new_data_set_profile(pa_card_new_data *data, const char *profile);
- void pa_card_new_data_set_preferred_port(pa_card_new_data *data, pa_direction_t direction, pa_device_port *port);
- void pa_card_new_data_done(pa_card_new_data *data);
- 
--- 
-2.8.1
-
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/0005-alsa-set-availability-for-some-unavailable-profiles.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/0005-alsa-set-availability-for-some-unavailable-profiles.patch
deleted file mode 100644
index 5563d2c352..0000000000
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio/0005-alsa-set-availability-for-some-unavailable-profiles.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From ae6a01ba204b480bda6a5b4431be3d22e53a7006 Mon Sep 17 00:00:00 2001
-From: Tanu Kaskinen <tanuk@iki.fi>
-Date: Fri, 23 Oct 2015 13:37:11 +0300
-Subject: [PATCH 5/5] alsa: set availability for (some) unavailable profiles
-
-The alsa card hasn't so far set any availability for profiles. That
-caused an issue with some HDMI hardware: the sound card has two HDMI
-outputs, but only the second of them is actually usable. The
-unavailable port is marked as unavailable and the available port is
-marked as available, but this information isn't propagated to the
-profile availability. Without profile availability information, the
-initial profile policy picks the unavailable one, since it has a
-higher priority value.
-
-This patch adds simple logic for marking some profiles unavailable:
-if the profile only contains unavailable ports, the profile is
-unavailable too. This can be improved in the future so that if a
-profile contains sinks or sources that only contain unavailable ports,
-the profile should be marked as unavailable. Implementing that
-requires adding more information about the sinks and sources to
-pa_card_profile, however.
-
-BugLink: https://bugzilla.yoctoproject.org/show_bug.cgi?id=8448
-
-Upstream-Status: Accepted [expected in 10.0]
-
-Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
----
- src/modules/alsa/module-alsa-card.c | 27 +++++++++++++++++++++++++++
- 1 file changed, 27 insertions(+)
-
-diff --git a/src/modules/alsa/module-alsa-card.c b/src/modules/alsa/module-alsa-card.c
-index 1976230..323e08a 100644
---- a/src/modules/alsa/module-alsa-card.c
-+++ b/src/modules/alsa/module-alsa-card.c
-@@ -366,6 +366,7 @@ static int report_jack_state(snd_mixer_elem_t *melem, unsigned int mask) {
-     void *state;
-     pa_alsa_jack *jack;
-     struct temp_port_avail *tp, *tports;
-+    pa_card_profile *profile;
- 
-     pa_assert(u);
- 
-@@ -426,6 +427,32 @@ static int report_jack_state(snd_mixer_elem_t *melem, unsigned int mask) {
-         if (tp->avail == PA_AVAILABLE_NO)
-            pa_device_port_set_available(tp->port, tp->avail);
- 
-+    /* Update profile availabilities. The logic could be improved; for now we
-+     * only set obviously unavailable profiles (those that contain only
-+     * unavailable ports) to PA_AVAILABLE_NO and all others to
-+     * PA_AVAILABLE_UNKNOWN. */
-+    PA_HASHMAP_FOREACH(profile, u->card->profiles, state) {
-+        pa_device_port *port;
-+        void *state2;
-+        pa_available_t available = PA_AVAILABLE_NO;
-+
-+        /* Don't touch the "off" profile. */
-+        if (profile->n_sources == 0 && profile->n_sinks == 0)
-+            continue;
-+
-+        PA_HASHMAP_FOREACH(port, u->card->ports, state2) {
-+            if (!pa_hashmap_get(port->profiles, profile->name))
-+                continue;
-+
-+            if (port->available != PA_AVAILABLE_NO) {
-+                available = PA_AVAILABLE_UNKNOWN;
-+                break;
-+            }
-+        }
-+
-+        pa_card_profile_set_available(profile, available);
-+    }
-+
-     pa_xfree(tports);
-     return 0;
- }
--- 
-2.8.1
-
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_10.0.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_10.0.bb
new file mode 100644
index 0000000000..f3a85737fc
--- /dev/null
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_10.0.bb
@@ -0,0 +1,14 @@
+require pulseaudio.inc
+
+SRC_URI = "http://freedesktop.org/software/pulseaudio/releases/${BP}.tar.xz \
+           file://0001-padsp-Make-it-compile-on-musl.patch \
+           file://0001-client-conf-Add-allow-autospawn-for-root.patch \
+           file://volatiles.04_pulse \
+"
+SRC_URI[md5sum] = "4950d2799bf55ab91f6b7f990b7f0971"
+SRC_URI[sha256sum] = "a3186824de9f0d2095ded5d0d0db0405dc73133983c2fbb37291547e37462f57"
+
+do_compile_prepend() {
+    mkdir -p ${S}/libltdl
+    cp ${STAGING_LIBDIR}/libltdl* ${S}/libltdl
+}
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_9.0.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_9.0.bb
deleted file mode 100644
index 00f5442b85..0000000000
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_9.0.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-require pulseaudio.inc
-
-SRC_URI = "http://freedesktop.org/software/pulseaudio/releases/${BP}.tar.xz \
-           file://0001-padsp-Make-it-compile-on-musl.patch \
-           file://0001-client-conf-Add-allow-autospawn-for-root.patch \
-           file://0001-alsa-bluetooth-fail-if-user-requested-profile-doesn-.patch \
-           file://0002-card-don-t-allow-the-CARD_NEW-hook-to-fail.patch \
-           file://0003-card-move-profile-selection-after-pa_card_new.patch \
-           file://0004-card-remove-pa_card_new_data.active_profile.patch \
-           file://0005-alsa-set-availability-for-some-unavailable-profiles.patch \
-           file://volatiles.04_pulse \
-"
-SRC_URI[md5sum] = "da7162541b3a9bc20576dbd0d7d1489a"
-SRC_URI[sha256sum] = "c3d3d66b827f18fbe903fe3df647013f09fc1e2191c035be1ee2d82a9e404686"
-
-do_compile_prepend() {
-    mkdir -p ${S}/libltdl
-    cp ${STAGING_LIBDIR}/libltdl* ${S}/libltdl
-}
-- 
2.11.0


