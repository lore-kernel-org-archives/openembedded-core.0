Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 64D3A6011C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Nov 2015 13:41:27 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 24 Nov 2015 05:41:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,338,1444719600"; d="scan'208";a="858701060"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga002.fm.intel.com with ESMTP; 24 Nov 2015 05:41:27 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org, tanuk@iki.fi, saul.wold@intel.com
Date: Tue, 24 Nov 2015 15:44:46 +0200
Message-Id: <1448372686-19105-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] pulseaudio: Fix HDMI profile selection
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
X-List-Received-Date: Tue, 24 Nov 2015 13:41:33 -0000

On systems with two cards, the correct output profile does not get
selected automatically even in the simple case where there is one
available profile. This scenario is typical at least with HDMI audio
(which is on a separate card).

Fixes [YOCTO #8448]

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---

also available at:
  git://git.yoctoproject.org/poky-contrib jku/pa-hdmi



 .../0001-card-add-pa_card_profile.ports.patch      | 245 ++++++++++++++
 ...oth-fail-if-user-requested-profile-doesn-.patch |  60 ++++
 ...-move-profile-selection-after-pa_card_new.patch | 363 +++++++++++++++++++++
 ...vailability-for-some-unavailable-profiles.patch |  75 +++++
 .../pulseaudio/pulseaudio_6.0.bb                   |   4 +
 5 files changed, 747 insertions(+)
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0001-card-add-pa_card_profile.ports.patch
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0002-alsa-bluetooth-fail-if-user-requested-profile-doesn-.patch
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0003-card-move-profile-selection-after-pa_card_new.patch
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0004-alsa-set-availability-for-some-unavailable-profiles.patch

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-card-add-pa_card_profile.ports.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-card-add-pa_card_profile.ports.patch
new file mode 100644
index 0000000..97b2e40
--- /dev/null
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-card-add-pa_card_profile.ports.patch
@@ -0,0 +1,245 @@
+From 6f814b40a01d03f93b36184c19339033949de472 Mon Sep 17 00:00:00 2001
+From: Tanu Kaskinen <tanuk@iki.fi>
+Date: Fri, 23 Oct 2015 12:23:13 +0300
+Subject: [PATCH 1/4] card: add pa_card_profile.ports
+
+Having ports accessible from pa_card_profile allows checking whether all ports
+of a profile are unavailable, and therefore helps with managing the profile
+availability (implemented in a later patch).
+
+http://bugzilla.yoctoproject.org/show_bug.cgi?id=8448
+
+Upstream-Status: Submitted [http://lists.freedesktop.org/archives/pulseaudio-discuss/2015-October/024614.html]
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+---
+ src/modules/alsa/alsa-mixer.c                |  4 +++-
+ src/modules/alsa/alsa-ucm.c                  |  1 +
+ src/modules/bluetooth/module-bluez4-device.c |  6 ++++++
+ src/modules/bluetooth/module-bluez5-device.c |  6 ++++++
+ src/pulsecore/card.c                         | 16 ++++++++++++++++
+ src/pulsecore/card.h                         | 18 ++++++++++++------
+ src/pulsecore/device-port.c                  |  7 ++++++-
+ 7 files changed, 50 insertions(+), 8 deletions(-)
+
+diff --git a/src/modules/alsa/alsa-mixer.c b/src/modules/alsa/alsa-mixer.c
+index 47cbd14..c5b82b0 100644
+--- a/src/modules/alsa/alsa-mixer.c
++++ b/src/modules/alsa/alsa-mixer.c
+@@ -4654,8 +4654,10 @@ static pa_device_port* device_port_alsa_init(pa_hashmap *ports, /* card ports */
+         path->port = p;
+     }
+ 
+-    if (cp)
++    if (cp) {
+         pa_hashmap_put(p->profiles, cp->name, cp);
++        pa_card_profile_add_port(cp, p);
++    }
+ 
+     if (extra) {
+         pa_hashmap_put(extra, p->name, p);
+diff --git a/src/modules/alsa/alsa-ucm.c b/src/modules/alsa/alsa-ucm.c
+index aa2d601..c8199d6 100644
+--- a/src/modules/alsa/alsa-ucm.c
++++ b/src/modules/alsa/alsa-ucm.c
+@@ -761,6 +761,7 @@ static void ucm_add_port_combination(
+     if (cp) {
+         pa_log_debug("Adding profile %s to port %s.", cp->name, port->name);
+         pa_hashmap_put(port->profiles, cp->name, cp);
++        pa_card_profile_add_port(cp, port);
+     }
+ 
+     if (hash) {
+diff --git a/src/modules/bluetooth/module-bluez4-device.c b/src/modules/bluetooth/module-bluez4-device.c
+index db69d34..b40c6a0 100644
+--- a/src/modules/bluetooth/module-bluez4-device.c
++++ b/src/modules/bluetooth/module-bluez4-device.c
+@@ -2183,6 +2183,7 @@ static pa_card_profile *create_card_profile(struct userdata *u, const char *uuid
+         p->max_sink_channels = 2;
+         p->max_source_channels = 0;
+         pa_hashmap_put(output_port->profiles, p->name, p);
++        pa_card_profile_add_port(p, output_port);
+ 
+         d = PA_CARD_PROFILE_DATA(p);
+         *d = PA_BLUEZ4_PROFILE_A2DP;
+@@ -2194,6 +2195,7 @@ static pa_card_profile *create_card_profile(struct userdata *u, const char *uuid
+         p->max_sink_channels = 0;
+         p->max_source_channels = 2;
+         pa_hashmap_put(input_port->profiles, p->name, p);
++        pa_card_profile_add_port(p, input_port);
+ 
+         d = PA_CARD_PROFILE_DATA(p);
+         *d = PA_BLUEZ4_PROFILE_A2DP_SOURCE;
+@@ -2206,6 +2208,8 @@ static pa_card_profile *create_card_profile(struct userdata *u, const char *uuid
+         p->max_source_channels = 1;
+         pa_hashmap_put(input_port->profiles, p->name, p);
+         pa_hashmap_put(output_port->profiles, p->name, p);
++        pa_card_profile_add_port(p, input_port);
++        pa_card_profile_add_port(p, output_port);
+ 
+         d = PA_CARD_PROFILE_DATA(p);
+         *d = PA_BLUEZ4_PROFILE_HSP;
+@@ -2218,6 +2222,8 @@ static pa_card_profile *create_card_profile(struct userdata *u, const char *uuid
+         p->max_source_channels = 1;
+         pa_hashmap_put(input_port->profiles, p->name, p);
+         pa_hashmap_put(output_port->profiles, p->name, p);
++        pa_card_profile_add_port(p, input_port);
++        pa_card_profile_add_port(p, output_port);
+ 
+         d = PA_CARD_PROFILE_DATA(p);
+         *d = PA_BLUEZ4_PROFILE_HFGW;
+diff --git a/src/modules/bluetooth/module-bluez5-device.c b/src/modules/bluetooth/module-bluez5-device.c
+index 7238e6f..3321785 100644
+--- a/src/modules/bluetooth/module-bluez5-device.c
++++ b/src/modules/bluetooth/module-bluez5-device.c
+@@ -1790,6 +1790,7 @@ static pa_card_profile *create_card_profile(struct userdata *u, const char *uuid
+         cp->max_sink_channels = 2;
+         cp->max_source_channels = 0;
+         pa_hashmap_put(output_port->profiles, cp->name, cp);
++        pa_card_profile_add_port(cp, output_port);
+ 
+         p = PA_CARD_PROFILE_DATA(cp);
+         *p = PA_BLUETOOTH_PROFILE_A2DP_SINK;
+@@ -1801,6 +1802,7 @@ static pa_card_profile *create_card_profile(struct userdata *u, const char *uuid
+         cp->max_sink_channels = 0;
+         cp->max_source_channels = 2;
+         pa_hashmap_put(input_port->profiles, cp->name, cp);
++        pa_card_profile_add_port(cp, input_port);
+ 
+         p = PA_CARD_PROFILE_DATA(cp);
+         *p = PA_BLUETOOTH_PROFILE_A2DP_SOURCE;
+@@ -1813,6 +1815,8 @@ static pa_card_profile *create_card_profile(struct userdata *u, const char *uuid
+         cp->max_source_channels = 1;
+         pa_hashmap_put(input_port->profiles, cp->name, cp);
+         pa_hashmap_put(output_port->profiles, cp->name, cp);
++        pa_card_profile_add_port(cp, input_port);
++        pa_card_profile_add_port(cp, output_port);
+ 
+         p = PA_CARD_PROFILE_DATA(cp);
+         *p = PA_BLUETOOTH_PROFILE_HEADSET_HEAD_UNIT;
+@@ -1825,6 +1829,8 @@ static pa_card_profile *create_card_profile(struct userdata *u, const char *uuid
+         cp->max_source_channels = 1;
+         pa_hashmap_put(input_port->profiles, cp->name, cp);
+         pa_hashmap_put(output_port->profiles, cp->name, cp);
++        pa_card_profile_add_port(cp, input_port);
++        pa_card_profile_add_port(cp, output_port);
+ 
+         p = PA_CARD_PROFILE_DATA(cp);
+         *p = PA_BLUETOOTH_PROFILE_HEADSET_AUDIO_GATEWAY;
+diff --git a/src/pulsecore/card.c b/src/pulsecore/card.c
+index 6f9391e..cc4c784 100644
+--- a/src/pulsecore/card.c
++++ b/src/pulsecore/card.c
+@@ -50,6 +50,7 @@ pa_card_profile *pa_card_profile_new(const char *name, const char *description,
+     c->n_sinks = c->n_sources = 0;
+     c->max_sink_channels = c->max_source_channels = 0;
+     c->available = PA_AVAILABLE_UNKNOWN;
++    c->ports = pa_hashmap_new(pa_idxset_string_hash_func, pa_idxset_string_compare_func);
+ 
+     return c;
+ }
+@@ -57,11 +58,25 @@ pa_card_profile *pa_card_profile_new(const char *name, const char *description,
+ void pa_card_profile_free(pa_card_profile *c) {
+     pa_assert(c);
+ 
++    if (c->ports) {
++        pa_device_port *port;
++        void *state;
++        PA_HASHMAP_FOREACH(port, c->ports, state)
++            pa_hashmap_remove (port->profiles, c->name);
++        pa_hashmap_free(c->ports);
++    }
++
+     pa_xfree(c->name);
+     pa_xfree(c->description);
+     pa_xfree(c);
+ }
+ 
++void pa_card_profile_add_port(pa_card_profile *profile, pa_device_port *port) {
++    pa_assert(profile);
++
++    pa_hashmap_put(profile->ports, port->name, port);
++}
++
+ void pa_card_profile_set_available(pa_card_profile *c, pa_available_t available) {
+     pa_core *core;
+ 
+@@ -198,6 +213,7 @@ pa_card *pa_card_new(pa_core *core, pa_card_new_data *data) {
+ 
+     c->userdata = NULL;
+     c->set_profile = NULL;
++    c->active_profile = NULL;
+ 
+     pa_device_init_description(c->proplist, c);
+     pa_device_init_icon(c->proplist, true);
+diff --git a/src/pulsecore/card.h b/src/pulsecore/card.h
+index 3e2c004..1c33958 100644
+--- a/src/pulsecore/card.h
++++ b/src/pulsecore/card.h
+@@ -22,19 +22,21 @@
+ 
+ typedef struct pa_card pa_card;
+ 
+-#include <pulse/proplist.h>
+-#include <pulsecore/core.h>
+-#include <pulsecore/module.h>
+-#include <pulsecore/idxset.h>
+-
+ /* This enum replaces pa_port_available_t (defined in pulse/def.h) for
+- * internal use, so make sure both enum types stay in sync. */
++ * internal use, so make sure both enum types stay in sync. This is defined
++ * before the #includes, because device-port.h depends on this enum. */
+ typedef enum pa_available {
+     PA_AVAILABLE_UNKNOWN = 0,
+     PA_AVAILABLE_NO = 1,
+     PA_AVAILABLE_YES = 2,
+ } pa_available_t;
+ 
++#include <pulse/proplist.h>
++#include <pulsecore/core.h>
++#include <pulsecore/device-port.h>
++#include <pulsecore/module.h>
++#include <pulsecore/idxset.h>
++
+ typedef struct pa_card_profile {
+     pa_card *card;
+     char *name;
+@@ -43,6 +45,8 @@ typedef struct pa_card_profile {
+     unsigned priority;
+     pa_available_t available; /* PA_AVAILABLE_UNKNOWN, PA_AVAILABLE_NO or PA_AVAILABLE_YES */
+ 
++    pa_hashmap *ports; /* port name -> pa_device_port */
++
+     /* We probably want to have different properties later on here */
+     unsigned n_sinks;
+     unsigned n_sources;
+@@ -100,6 +104,8 @@ typedef struct pa_card_new_data {
+ pa_card_profile *pa_card_profile_new(const char *name, const char *description, size_t extra);
+ void pa_card_profile_free(pa_card_profile *c);
+ 
++void pa_card_profile_add_port(pa_card_profile *profile, pa_device_port *port);
++
+ /* The profile's available status has changed */
+ void pa_card_profile_set_available(pa_card_profile *c, pa_available_t available);
+ 
+diff --git a/src/pulsecore/device-port.c b/src/pulsecore/device-port.c
+index cfe2a80..f16ecef 100644
+--- a/src/pulsecore/device-port.c
++++ b/src/pulsecore/device-port.c
+@@ -95,8 +95,13 @@ static void device_port_free(pa_object *o) {
+     if (p->proplist)
+         pa_proplist_free(p->proplist);
+ 
+-    if (p->profiles)
++    if (p->profiles) {
++        pa_card_profile *profile;
++        void *state;
++        PA_HASHMAP_FOREACH(profile, p->profiles, state)
++            pa_hashmap_remove (profile->ports, p->name);
+         pa_hashmap_free(p->profiles);
++    }
+ 
+     pa_xfree(p->name);
+     pa_xfree(p->description);
+-- 
+2.1.4
+
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/0002-alsa-bluetooth-fail-if-user-requested-profile-doesn-.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/0002-alsa-bluetooth-fail-if-user-requested-profile-doesn-.patch
new file mode 100644
index 0000000..c3f217b
--- /dev/null
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio/0002-alsa-bluetooth-fail-if-user-requested-profile-doesn-.patch
@@ -0,0 +1,60 @@
+From 339eb179baa7810113f6456accc05b3a32c1cdba Mon Sep 17 00:00:00 2001
+From: Tanu Kaskinen <tanuk@iki.fi>
+Date: Fri, 23 Oct 2015 12:36:34 +0300
+Subject: [PATCH 2/4] alsa, bluetooth: fail if user-requested profile doesn't
+ exist
+
+If we can't fulfill the user request fully, I think we shouldn't
+fulfill it at all, to make it clear that the requested operation
+didn't succeed.
+
+http://bugzilla.yoctoproject.org/show_bug.cgi?id=8448
+
+Upstream-Status: Submitted [http://lists.freedesktop.org/archives/pulseaudio-discuss/2015-October/024614.html]
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+---
+ src/modules/alsa/module-alsa-card.c          | 10 ++++++++--
+ src/modules/bluetooth/module-bluez4-device.c |  6 ++++--
+ 2 files changed, 12 insertions(+), 4 deletions(-)
+
+diff --git a/src/modules/alsa/module-alsa-card.c b/src/modules/alsa/module-alsa-card.c
+index a7fec04..32f517e 100644
+--- a/src/modules/alsa/module-alsa-card.c
++++ b/src/modules/alsa/module-alsa-card.c
+@@ -754,8 +754,14 @@ int pa__init(pa_module *m) {
+         goto fail;
+     }
+ 
+-    if ((profile = pa_modargs_get_value(u->modargs, "profile", NULL)))
+-        pa_card_new_data_set_profile(&data, profile);
++    if ((profile = pa_modargs_get_value(u->modargs, "profile", NULL))) {
++        if (pa_hashmap_get(data.profiles, profile))
++            pa_card_new_data_set_profile(&data, profile);
++        else {
++            pa_log("No such profile: %s", profile);
++            goto fail;
++        }
++    }
+ 
+     u->card = pa_card_new(m->core, &data);
+     pa_card_new_data_done(&data);
+diff --git a/src/modules/bluetooth/module-bluez4-device.c b/src/modules/bluetooth/module-bluez4-device.c
+index b40c6a0..94e6988 100644
+--- a/src/modules/bluetooth/module-bluez4-device.c
++++ b/src/modules/bluetooth/module-bluez4-device.c
+@@ -2310,8 +2310,10 @@ static int add_card(struct userdata *u) {
+     if ((default_profile = pa_modargs_get_value(u->modargs, "profile", NULL))) {
+         if (pa_hashmap_get(data.profiles, default_profile))
+             pa_card_new_data_set_profile(&data, default_profile);
+-        else
+-            pa_log_warn("Profile '%s' not valid or not supported by device.", default_profile);
++        else {
++            pa_log("Profile '%s' not valid or not supported by device.", default_profile);
++            return -1;
++        }
+     }
+ 
+     u->card = pa_card_new(u->core, &data);
+-- 
+2.1.4
+
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/0003-card-move-profile-selection-after-pa_card_new.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/0003-card-move-profile-selection-after-pa_card_new.patch
new file mode 100644
index 0000000..9585f3d
--- /dev/null
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio/0003-card-move-profile-selection-after-pa_card_new.patch
@@ -0,0 +1,363 @@
+From cc41c8a3149ef04d4aa2db3d15032605a5504658 Mon Sep 17 00:00:00 2001
+From: Tanu Kaskinen <tanuk@iki.fi>
+Date: Fri, 23 Oct 2015 12:59:53 +0300
+Subject: [PATCH 3/4] card: move profile selection after pa_card_new()
+
+I want module-alsa-card to set the availability of unavailable
+profiles before the initial card profile gets selected, so that the
+selection logic can use correct availability information.
+module-alsa-card initializes the jack state after calling
+pa_card_new(), however, and the profile selection happens in
+pa_card_new(). This patch solves that by introducing pa_card_put() and
+moving the profile selection code there.
+
+An alternative solution would have been to move the jack
+initialization to happen before pa_card_new() and use pa_card_new_data
+instead of pa_card in the jack initialization code, but I disliked
+that idea (I want to get rid of the "new data" pattern eventually).
+
+The CARD_NEW hook is used when applying the initial profile policy, so
+that was moved to pa_card_put(). That required changing the hook data
+from pa_card_new_data to pa_card. module-card-restore now uses
+pa_card_set_profile() instead of pa_card_new_data_set_profile(). That
+required adding a state variable to pa_card, because
+pa_card_set_profile() needs to distinguish between setting the initial
+profile and setting the profile in other situations.
+
+The order in which the initial profile policy is applied is reversed
+in this patch. Previously the first one to set it won, now the last
+one to set it wins. I think this is better, because if you have N
+parties that want to set the profile, we avoid checking N times
+whether someone else has already set the profile.
+
+http://bugzilla.yoctoproject.org/show_bug.cgi?id=8448
+
+Upstream-Status: Submitted [http://lists.freedesktop.org/archives/pulseaudio-discuss/2015-October/024614.html]
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+---
+ src/modules/alsa/module-alsa-card.c          | 19 +++---
+ src/modules/bluetooth/module-bluez4-device.c | 18 +++---
+ src/modules/bluetooth/module-bluez5-device.c |  1 +
+ src/modules/macosx/module-coreaudio-device.c |  1 +
+ src/modules/module-card-restore.c            | 24 ++++----
+ src/pulsecore/card.c                         | 86 +++++++++++++++-------------
+ src/pulsecore/card.h                         |  7 +++
+ 7 files changed, 87 insertions(+), 69 deletions(-)
+
+diff --git a/src/modules/alsa/module-alsa-card.c b/src/modules/alsa/module-alsa-card.c
+index 32f517e..5b39654 100644
+--- a/src/modules/alsa/module-alsa-card.c
++++ b/src/modules/alsa/module-alsa-card.c
+@@ -754,15 +754,6 @@ int pa__init(pa_module *m) {
+         goto fail;
+     }
+ 
+-    if ((profile = pa_modargs_get_value(u->modargs, "profile", NULL))) {
+-        if (pa_hashmap_get(data.profiles, profile))
+-            pa_card_new_data_set_profile(&data, profile);
+-        else {
+-            pa_log("No such profile: %s", profile);
+-            goto fail;
+-        }
+-    }
+-
+     u->card = pa_card_new(m->core, &data);
+     pa_card_new_data_done(&data);
+ 
+@@ -773,6 +764,16 @@ int pa__init(pa_module *m) {
+     u->card->set_profile = card_set_profile;
+ 
+     init_jacks(u);
++    pa_card_put(u->card);
++
++    if ((profile = pa_modargs_get_value(u->modargs, "profile", NULL))) {
++        u->card->active_profile = pa_hashmap_get(u->card->profiles, profile);
++        if (!u->card->active_profile) {
++            pa_log("No such profile: %s", profile);
++            goto fail;
++        }
++    }
++
+     init_profile(u);
+     init_eld_ctls(u);
+ 
+diff --git a/src/modules/bluetooth/module-bluez4-device.c b/src/modules/bluetooth/module-bluez4-device.c
+index 94e6988..5efc5dc 100644
+--- a/src/modules/bluetooth/module-bluez4-device.c
++++ b/src/modules/bluetooth/module-bluez4-device.c
+@@ -2307,15 +2307,6 @@ static int add_card(struct userdata *u) {
+     *d = PA_BLUEZ4_PROFILE_OFF;
+     pa_hashmap_put(data.profiles, p->name, p);
+ 
+-    if ((default_profile = pa_modargs_get_value(u->modargs, "profile", NULL))) {
+-        if (pa_hashmap_get(data.profiles, default_profile))
+-            pa_card_new_data_set_profile(&data, default_profile);
+-        else {
+-            pa_log("Profile '%s' not valid or not supported by device.", default_profile);
+-            return -1;
+-        }
+-    }
+-
+     u->card = pa_card_new(u->core, &data);
+     pa_card_new_data_done(&data);
+ 
+@@ -2326,6 +2317,15 @@ static int add_card(struct userdata *u) {
+ 
+     u->card->userdata = u;
+     u->card->set_profile = card_set_profile;
++    pa_card_put(u->card);
++
++    if ((default_profile = pa_modargs_get_value(u->modargs, "profile", NULL))) {
++        u->card->active_profile = pa_hashmap_get(u->card->profiles, default_profile);
++        if (!u->card->active_profile) {
++            pa_log("Profile '%s' not valid or not supported by device.", default_profile);
++            return -1;
++        }
++    }
+ 
+     d = PA_CARD_PROFILE_DATA(u->card->active_profile);
+ 
+diff --git a/src/modules/bluetooth/module-bluez5-device.c b/src/modules/bluetooth/module-bluez5-device.c
+index 3321785..0081a21 100644
+--- a/src/modules/bluetooth/module-bluez5-device.c
++++ b/src/modules/bluetooth/module-bluez5-device.c
+@@ -1959,6 +1959,7 @@ static int add_card(struct userdata *u) {
+ 
+     u->card->userdata = u;
+     u->card->set_profile = set_profile_cb;
++    pa_card_put(u->card);
+ 
+     p = PA_CARD_PROFILE_DATA(u->card->active_profile);
+     u->profile = *p;
+diff --git a/src/modules/macosx/module-coreaudio-device.c b/src/modules/macosx/module-coreaudio-device.c
+index 4bbb5d5..41f151f 100644
+--- a/src/modules/macosx/module-coreaudio-device.c
++++ b/src/modules/macosx/module-coreaudio-device.c
+@@ -764,6 +764,7 @@ int pa__init(pa_module *m) {
+     pa_card_new_data_done(&card_new_data);
+     u->card->userdata = u;
+     u->card->set_profile = card_set_profile;
++    pa_card_put(u->card);
+ 
+     u->rtpoll = pa_rtpoll_new();
+     pa_thread_mq_init(&u->thread_mq, m->core->mainloop, u->rtpoll);
+diff --git a/src/modules/module-card-restore.c b/src/modules/module-card-restore.c
+index baa2f4f..0501ac8 100644
+--- a/src/modules/module-card-restore.c
++++ b/src/modules/module-card-restore.c
+@@ -485,34 +485,38 @@ static pa_hook_result_t port_offset_change_callback(pa_core *c, pa_device_port *
+     return PA_HOOK_OK;
+ }
+ 
+-static pa_hook_result_t card_new_hook_callback(pa_core *c, pa_card_new_data *new_data, struct userdata *u) {
++static pa_hook_result_t card_new_hook_callback(pa_core *c, pa_card *card, struct userdata *u) {
+     struct entry *e;
+     void *state;
+     pa_device_port *p;
+     struct port_info *p_info;
+ 
+-    pa_assert(new_data);
++    pa_assert(c);
++    pa_assert(card);
++    pa_assert(u);
+ 
+-    if (!(e = entry_read(u, new_data->name)))
++    if (!(e = entry_read(u, card->name)))
+         return PA_HOOK_OK;
+ 
+     if (e->profile[0]) {
+-        if (!new_data->active_profile) {
+-            pa_card_new_data_set_profile(new_data, e->profile);
+-            pa_log_info("Restored profile '%s' for card %s.", new_data->active_profile, new_data->name);
+-            new_data->save_profile = true;
++        pa_card_profile *profile;
+ 
++        profile = pa_hashmap_get(card->profiles, e->profile);
++        if (profile) {
++            pa_card_set_profile(card, profile, true);
++            pa_log_info("Restored profile '%s' for card %s.", card->active_profile->name, card->name);
+         } else
+-            pa_log_debug("Not restoring profile for card %s, because already set.", new_data->name);
++            pa_log_debug("Tried to restore profile %s for card %s, but the card doesn't have such profile.",
++                         e->profile, card->name);
+     }
+ 
+     /* Always restore the latency offsets because their
+      * initial value is always 0 */
+ 
+-    pa_log_info("Restoring port latency offsets for card %s.", new_data->name);
++    pa_log_info("Restoring port latency offsets for card %s.", card->name);
+ 
+     PA_HASHMAP_FOREACH(p_info, e->ports, state)
+-        if ((p = pa_hashmap_get(new_data->ports, p_info->name)))
++        if ((p = pa_hashmap_get(card->ports, p_info->name)))
+             p->latency_offset = p_info->offset;
+ 
+     entry_free(e);
+diff --git a/src/pulsecore/card.c b/src/pulsecore/card.c
+index cc4c784..1b7f71b 100644
+--- a/src/pulsecore/card.c
++++ b/src/pulsecore/card.c
+@@ -151,6 +151,7 @@ pa_card *pa_card_new(pa_core *core, pa_card_new_data *data) {
+     pa_assert(!pa_hashmap_isempty(data->profiles));
+ 
+     c = pa_xnew(pa_card, 1);
++    c->state = PA_CARD_STATE_INIT;
+ 
+     if (!(name = pa_namereg_register(core, data->name, PA_NAMEREG_CARD, c, data->namereg_fail))) {
+         pa_xfree(c);
+@@ -159,12 +160,6 @@ pa_card *pa_card_new(pa_core *core, pa_card_new_data *data) {
+ 
+     pa_card_new_data_set_name(data, name);
+ 
+-    if (pa_hook_fire(&core->hooks[PA_CORE_HOOK_CARD_NEW], data) < 0) {
+-        pa_xfree(c);
+-        pa_namereg_unregister(core, name);
+-        return NULL;
+-    }
+-
+     c->core = core;
+     c->name = pa_xstrdup(data->name);
+     c->proplist = pa_proplist_copy(data->proplist);
+@@ -187,30 +182,6 @@ pa_card *pa_card_new(pa_core *core, pa_card_new_data *data) {
+     PA_HASHMAP_FOREACH(port, c->ports, state)
+         port->card = c;
+ 
+-    c->active_profile = NULL;
+-    c->save_profile = false;
+-
+-    if (data->active_profile)
+-        if ((c->active_profile = pa_hashmap_get(c->profiles, data->active_profile)))
+-            c->save_profile = data->save_profile;
+-
+-    if (!c->active_profile) {
+-        PA_HASHMAP_FOREACH(profile, c->profiles, state) {
+-            if (profile->available == PA_AVAILABLE_NO)
+-                continue;
+-
+-            if (!c->active_profile || profile->priority > c->active_profile->priority)
+-                c->active_profile = profile;
+-        }
+-        /* If all profiles are not available, then we still need to pick one */
+-        if (!c->active_profile) {
+-            PA_HASHMAP_FOREACH(profile, c->profiles, state)
+-                if (!c->active_profile || profile->priority > c->active_profile->priority)
+-                    c->active_profile = profile;
+-        }
+-        pa_assert(c->active_profile);
+-    }
+-
+     c->userdata = NULL;
+     c->set_profile = NULL;
+     c->active_profile = NULL;
+@@ -219,13 +190,39 @@ pa_card *pa_card_new(pa_core *core, pa_card_new_data *data) {
+     pa_device_init_icon(c->proplist, true);
+     pa_device_init_intended_roles(c->proplist);
+ 
+-    pa_assert_se(pa_idxset_put(core->cards, c, &c->index) >= 0);
++    return c;
++}
+ 
+-    pa_log_info("Created %u \"%s\"", c->index, c->name);
+-    pa_subscription_post(core, PA_SUBSCRIPTION_EVENT_CARD|PA_SUBSCRIPTION_EVENT_NEW, c->index);
++void pa_card_put(pa_card *card) {
++    pa_card_profile *profile;
++    void *state;
+ 
+-    pa_hook_fire(&core->hooks[PA_CORE_HOOK_CARD_PUT], c);
+-    return c;
++    pa_assert(card);
++
++    PA_HASHMAP_FOREACH(profile, card->profiles, state) {
++        if (profile->available == PA_AVAILABLE_NO)
++            continue;
++
++        if (!card->active_profile || profile->priority > card->active_profile->priority)
++            card->active_profile = profile;
++    }
++
++    /* If all profiles are unavailable, then we still need to pick one */
++    if (!card->active_profile) {
++        PA_HASHMAP_FOREACH(profile, card->profiles, state)
++            if (!card->active_profile || profile->priority > card->active_profile->priority)
++                card->active_profile = profile;
++    }
++    pa_assert(card->active_profile);
++
++    pa_hook_fire(&card->core->hooks[PA_CORE_HOOK_CARD_NEW], card);
++
++    pa_assert_se(pa_idxset_put(card->core->cards, card, &card->index) >= 0);
++    card->state = PA_CARD_STATE_LINKED;
++
++    pa_log_info("Created %u \"%s\"", card->index, card->name);
++    pa_hook_fire(&card->core->hooks[PA_CORE_HOOK_CARD_PUT], card);
++    pa_subscription_post(card->core, PA_SUBSCRIPTION_EVENT_CARD|PA_SUBSCRIPTION_EVENT_NEW, card->index);
+ }
+ 
+ void pa_card_free(pa_card *c) {
+@@ -292,17 +289,24 @@ int pa_card_set_profile(pa_card *c, pa_card_profile *profile, bool save) {
+         return 0;
+     }
+ 
+-    if ((r = c->set_profile(c, profile)) < 0)
++    /* If we're setting the initial profile, we shouldn't call set_profile(),
++     * because the implementations don't expect that (for historical reasons).
++     * We should just set c->active_profile, and the implementations will
++     * properly set up that profile after pa_card_put() has returned. It would
++     * be probably good to change this so that also the initial profile can be
++     * set up in set_profile(), but if set_profile() fails, that would need
++     * some better handling than what we do here currently. */
++    if (c->state != PA_CARD_STATE_INIT && (r = c->set_profile(c, profile)) < 0)
+         return r;
+ 
+-    pa_subscription_post(c->core, PA_SUBSCRIPTION_EVENT_CARD|PA_SUBSCRIPTION_EVENT_CHANGE, c->index);
+-
+-    pa_log_info("Changed profile of card %u \"%s\" to %s", c->index, c->name, profile->name);
+-
+     c->active_profile = profile;
+     c->save_profile = save;
+ 
+-    pa_hook_fire(&c->core->hooks[PA_CORE_HOOK_CARD_PROFILE_CHANGED], c);
++    if (c->state != PA_CARD_STATE_INIT) {
++        pa_log_info("Changed profile of card %u \"%s\" to %s", c->index, c->name, profile->name);
++        pa_hook_fire(&c->core->hooks[PA_CORE_HOOK_CARD_PROFILE_CHANGED], c);
++        pa_subscription_post(c->core, PA_SUBSCRIPTION_EVENT_CARD|PA_SUBSCRIPTION_EVENT_CHANGE, c->index);
++    }
+ 
+     return 0;
+ }
+diff --git a/src/pulsecore/card.h b/src/pulsecore/card.h
+index 1c33958..dbbc1c2 100644
+--- a/src/pulsecore/card.h
++++ b/src/pulsecore/card.h
+@@ -37,6 +37,11 @@ typedef enum pa_available {
+ #include <pulsecore/module.h>
+ #include <pulsecore/idxset.h>
+ 
++typedef enum pa_card_state {
++    PA_CARD_STATE_INIT,
++    PA_CARD_STATE_LINKED,
++} pa_card_state_t;
++
+ typedef struct pa_card_profile {
+     pa_card *card;
+     char *name;
+@@ -61,6 +66,7 @@ typedef struct pa_card_profile {
+ 
+ struct pa_card {
+     uint32_t index;
++    pa_card_state_t state;
+     pa_core *core;
+ 
+     char *name;
+@@ -115,6 +121,7 @@ void pa_card_new_data_set_profile(pa_card_new_data *data, const char *profile);
+ void pa_card_new_data_done(pa_card_new_data *data);
+ 
+ pa_card *pa_card_new(pa_core *c, pa_card_new_data *data);
++void pa_card_put(pa_card *c);
+ void pa_card_free(pa_card *c);
+ 
+ void pa_card_add_profile(pa_card *c, pa_card_profile *profile);
+-- 
+2.1.4
+
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/0004-alsa-set-availability-for-some-unavailable-profiles.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/0004-alsa-set-availability-for-some-unavailable-profiles.patch
new file mode 100644
index 0000000..bb318aa
--- /dev/null
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio/0004-alsa-set-availability-for-some-unavailable-profiles.patch
@@ -0,0 +1,75 @@
+From 0136b73158f60d5dc630ae348b18df3b59a2a5c2 Mon Sep 17 00:00:00 2001
+From: Tanu Kaskinen <tanuk@iki.fi>
+Date: Fri, 23 Oct 2015 13:37:11 +0300
+Subject: [PATCH 4/4] alsa: set availability for (some) unavailable profiles
+
+The alsa card hasn't so far set any availability for profiles. That
+caused an issue with some HDMI hardware: the sound card has two HDMI
+outputs, but only the second of them is actually usable. The
+unavailable port is marked as unavailable and the available port is
+marked as available, but this information isn't propagated to the
+profile availability. Without profile availability information, the
+initial profile policy picks the unavailable one, since it has a
+higher priority value.
+
+This patch adds simple logic for marking some profiles unavailable:
+if the profile only contains unavailable ports, the profile is
+unavailable too. This can be improved in the future so that if a
+profile contains sinks or sources that only contain unavailable ports,
+the profile should be marked as unavailable. Implementing that
+requires adding more information about the sinks and sources to
+pa_card_profile, however.
+
+BugLink: https://bugzilla.yoctoproject.org/show_bug.cgi?id=8448
+
+Upstream-Status: Submitted [http://lists.freedesktop.org/archives/pulseaudio-discuss/2015-October/024614.html]
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+---
+ src/modules/alsa/module-alsa-card.c | 24 ++++++++++++++++++++++++
+ 1 file changed, 24 insertions(+)
+
+diff --git a/src/modules/alsa/module-alsa-card.c b/src/modules/alsa/module-alsa-card.c
+index 5b39654..73a846c 100644
+--- a/src/modules/alsa/module-alsa-card.c
++++ b/src/modules/alsa/module-alsa-card.c
+@@ -366,6 +366,7 @@ static int report_jack_state(snd_mixer_elem_t *melem, unsigned int mask) {
+     void *state;
+     pa_alsa_jack *jack;
+     pa_device_port *port;
++    pa_card_profile *profile;
+ 
+     pa_assert(u);
+ 
+@@ -396,6 +397,29 @@ static int report_jack_state(snd_mixer_elem_t *melem, unsigned int mask) {
+             }
+             report_port_state(port, u);
+         }
++
++    /* Update profile availabilities. The logic could be improved; for now we
++     * only set obviously unavailable profiles (those that contain only
++     * unavailable ports) to PA_AVAILABLE_NO and all others to
++     * PA_AVAILABLE_UNKNOWN. */
++    PA_HASHMAP_FOREACH(profile, u->card->profiles, state) {
++        void *state2;
++        pa_available_t available = PA_AVAILABLE_NO;
++
++        /* Don't touch the "off" profile. */
++        if (pa_hashmap_size(profile->ports) == 0)
++            continue;
++
++        PA_HASHMAP_FOREACH(port, profile->ports, state2) {
++            if (port->available != PA_AVAILABLE_NO) {
++                available = PA_AVAILABLE_UNKNOWN;
++                break;
++            }
++        }
++
++        pa_card_profile_set_available(profile, available);
++    }
++
+     return 0;
+ }
+ 
+-- 
+2.1.4
+
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_6.0.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_6.0.bb
index 31e9096..ec629aa 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_6.0.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_6.0.bb
@@ -6,6 +6,10 @@ SRC_URI = "http://freedesktop.org/software/pulseaudio/releases/${BP}.tar.xz \
            file://0001-conf-parser-add-support-for-.d-directories.patch \
            file://fix-git-version-gen.patch \
            file://volatiles.04_pulse \
+           file://0001-card-add-pa_card_profile.ports.patch \
+           file://0002-alsa-bluetooth-fail-if-user-requested-profile-doesn-.patch \
+           file://0003-card-move-profile-selection-after-pa_card_new.patch \
+           file://0004-alsa-set-availability-for-some-unavailable-profiles.patch \
 "
 SRC_URI[md5sum] = "b691e83b7434c678dffacfa3a027750e"
 SRC_URI[sha256sum] = "b50640e0b80b1607600accfad2e45aabb79d379bf6354c9671efa2065477f6f6"
-- 
2.1.4


