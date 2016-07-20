Return-Path: <tanuk@iki.fi>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
	[66.111.4.29])
	by mail.openembedded.org (Postfix) with ESMTP id C30A36212F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2016 00:29:25 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id E6262205A8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2016 20:20:34 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
	by compute7.internal (MEProxy); Tue, 19 Jul 2016 20:20:34 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=date:from:in-reply-to:in-reply-to
	:message-id:references:references:subject:to:x-sasl-enc
	:x-sasl-enc; s=smtpout; bh=HDTrbjahe0VJ2zmAFkupf7l5cXk=; b=a/9hb
	6xLEDqBYhmlE1xp/6xnY2M3m98yUIznQhbop9t1zeXXwtFzgNyYkep5MQ3jdRvcc
	fGoUb6E+3hwR8xlhfIoRZvBx9TbIRDFnBoFxxjbnc9EPQHkf0zqHBoy5qqH14/h9
	PksSYSVn0pL+SCO36T9jBElxVAEyFKcpvSDoOE=
X-Sasl-enc: p7ReoxrnMaPGaM9xguP32WlUxkEVz/Q2eB6J762kb7Ad 1468974034
Received: from laptop.tanuk.dy.fi (a88-113-211-72.elisa-laajakaista.fi
	[88.113.211.72])
	by mail.messagingengine.com (Postfix) with ESMTPA id 06F79CCDB7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2016 20:20:33 -0400 (EDT)
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jul 2016 03:20:22 +0300
Message-Id: <7abbb0d0b1f5c0eabf0696fc20cd9d3815291cb4.1468973641.git.tanuk@iki.fi>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1468973641.git.tanuk@iki.fi>
References: <cover.1468973641.git.tanuk@iki.fi>
In-Reply-To: <cover.1468973641.git.tanuk@iki.fi>
References: <cover.1468973641.git.tanuk@iki.fi>
Subject: [PATCH 2/3] pulseaudio: 8.0 -> 9.0
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
X-List-Received-Date: Wed, 20 Jul 2016 00:29:28 -0000

Release notes:
https://www.freedesktop.org/wiki/Software/PulseAudio/Notes/9.0/

Rebased 0001-client-conf-Add-allow-autospawn-for-root.patch.

Removed 0001-Revert-module-switch-on-port-available-Route-to-pref.patch,
because the issues that were caused by the reverted commit have been
fixed.

The patch set that fixes the initial selection of HDMI profiles
(YOCTO#8448) is replaced with updated patches cherry-picked from
upstream.

Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
---
 ...le-switch-on-port-available-Route-to-pref.patch | 268 ---------------
 ...th-fail-if-user-requested-profile-doesn-.patch} |  30 +-
 .../0001-card-add-pa_card_profile.ports.patch      | 218 ------------
 ...-client-conf-Add-allow-autospawn-for-root.patch |  18 +-
 ...ard-don-t-allow-the-CARD_NEW-hook-to-fail.patch |  37 ++
 ...-move-profile-selection-after-pa_card_new.patch | 373 ++++++++++++---------
 ...rd-remove-pa_card_new_data.active_profile.patch |  72 ++++
 ...ailability-for-some-unavailable-profiles.patch} |  38 +--
 .../{pulseaudio_8.0.bb => pulseaudio_9.0.bb}       |  14 +-
 9 files changed, 373 insertions(+), 695 deletions(-)
 delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0001-Revert-module-switch-on-port-available-Route-to-pref.patch
 rename meta/recipes-multimedia/pulseaudio/pulseaudio/{0002-alsa-bluetooth-fail-if-user-requested-profile-doesn-.patch => 0001-alsa-bluetooth-fail-if-user-requested-profile-doesn-.patch} (69%)
 delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0001-card-add-pa_card_profile.ports.patch
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0002-card-don-t-allow-the-CARD_NEW-hook-to-fail.patch
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0004-card-remove-pa_card_new_data.active_profile.patch
 rename meta/recipes-multimedia/pulseaudio/pulseaudio/{0004-alsa-set-availability-for-some-unavailable-profiles.patch => 0005-alsa-set-availability-for-some-unavailable-profiles.patch} (74%)
 rename meta/recipes-multimedia/pulseaudio/{pulseaudio_8.0.bb => pulseaudio_9.0.bb} (54%)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-Revert-module-switch-on-port-available-Route-to-pref.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-Revert-module-switch-on-port-available-Route-to-pref.patch
deleted file mode 100644
index 1c1e2fb..0000000
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-Revert-module-switch-on-port-available-Route-to-pref.patch
+++ /dev/null
@@ -1,268 +0,0 @@
-From b8b9b3da94a0c27090ceba243fdf54fb518c5489 Mon Sep 17 00:00:00 2001
-From: Tanu Kaskinen <tanuk@iki.fi>
-Date: Mon, 1 Feb 2016 15:34:59 +0200
-Subject: [PATCH] Revert "module-switch-on-port-available: Route to preferred
- profile"
-
-This reverts commit e87100d41ef6d14f8dc7f803582191d9f8d8f183.
-
-The reverted commit had some unwanted consequences:
-https://bugs.freedesktop.org/show_bug.cgi?id=93903
-https://bugs.freedesktop.org/show_bug.cgi?id=93946
-
-The first regression has a fix here:
-https://patchwork.freedesktop.org/patch/72053/
-
-The second regression, however, doesn't have a fix yet. Therefore,
-it's best to revert the offending patch for now.
-
-Upstream-Status: Inappropriate [Upstream plans to fix the issues
-properly.]
-
-Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
----
- src/modules/module-switch-on-port-available.c | 172 ++++++++++----------------
- 1 file changed, 67 insertions(+), 105 deletions(-)
-
-diff --git a/src/modules/module-switch-on-port-available.c b/src/modules/module-switch-on-port-available.c
-index 5dd9786..8de68a3 100644
---- a/src/modules/module-switch-on-port-available.c
-+++ b/src/modules/module-switch-on-port-available.c
-@@ -74,25 +74,22 @@ static bool profile_good_for_input(pa_card_profile *profile) {
- static int try_to_switch_profile(pa_device_port *port) {
-     pa_card_profile *best_profile = NULL, *profile;
-     void *state;
--    unsigned best_prio = 0;
- 
--    pa_log_debug("Finding best profile for port %s, preferred = %s",
--                 port->name, pa_strnull(port->preferred_profile));
-+    pa_log_debug("Finding best profile");
- 
-     PA_HASHMAP_FOREACH(profile, port->profiles, state) {
-         bool good = false;
--        const char *name;
--        unsigned prio = profile->priority;
-+
-+        if (best_profile && best_profile->priority >= profile->priority)
-+            continue;
- 
-         /* We make a best effort to keep other direction unchanged */
-         switch (port->direction) {
-             case PA_DIRECTION_OUTPUT:
--                name = profile->output_name;
-                 good = profile_good_for_output(profile);
-                 break;
- 
-             case PA_DIRECTION_INPUT:
--                name = profile->input_name;
-                 good = profile_good_for_input(profile);
-                 break;
-         }
-@@ -100,15 +97,7 @@ static int try_to_switch_profile(pa_device_port *port) {
-         if (!good)
-             continue;
- 
--        /* Give a high bonus in case this is the preferred profile */
--        if (port->preferred_profile && pa_streq(name ? name : profile->name, port->preferred_profile))
--            prio += 1000000;
--
--        if (best_profile && best_prio >= prio)
--            continue;
--
-         best_profile = profile;
--        best_prio = prio;
-     }
- 
-     if (!best_profile) {
-@@ -124,125 +113,98 @@ static int try_to_switch_profile(pa_device_port *port) {
-     return 0;
- }
- 
--struct port_pointers {
--    pa_device_port *port;
--    pa_sink *sink;
--    pa_source *source;
--    bool is_possible_profile_active;
--    bool is_preferred_profile_active;
--    bool is_port_active;
--};
--
--static const char* profile_name_for_dir(pa_card_profile *cp, pa_direction_t dir) {
--    if (dir == PA_DIRECTION_OUTPUT && cp->output_name)
--        return cp->output_name;
--    if (dir == PA_DIRECTION_INPUT && cp->input_name)
--        return cp->input_name;
--    return cp->name;
--}
--
--static struct port_pointers find_port_pointers(pa_device_port *port) {
--    struct port_pointers pp = { .port = port };
-+static void find_sink_and_source(pa_card *card, pa_device_port *port, pa_sink **si, pa_source **so) {
-+    pa_sink *sink = NULL;
-+    pa_source *source = NULL;
-     uint32_t state;
--    pa_card *card;
--
--    pa_assert(port);
--    pa_assert_se(card = port->card);
- 
-     switch (port->direction) {
-         case PA_DIRECTION_OUTPUT:
--            PA_IDXSET_FOREACH(pp.sink, card->sinks, state)
--                if (port == pa_hashmap_get(pp.sink->ports, port->name))
-+            PA_IDXSET_FOREACH(sink, card->sinks, state)
-+                if (port == pa_hashmap_get(sink->ports, port->name))
-                     break;
-             break;
- 
-         case PA_DIRECTION_INPUT:
--            PA_IDXSET_FOREACH(pp.source, card->sources, state)
--                if (port == pa_hashmap_get(pp.source->ports, port->name))
-+            PA_IDXSET_FOREACH(source, card->sources, state)
-+                if (port == pa_hashmap_get(source->ports, port->name))
-                     break;
-             break;
-     }
- 
--    pp.is_possible_profile_active =
--        card->active_profile == pa_hashmap_get(port->profiles, card->active_profile->name);
--    pp.is_preferred_profile_active = pp.is_possible_profile_active && (!port->preferred_profile ||
--        pa_safe_streq(port->preferred_profile, profile_name_for_dir(card->active_profile, port->direction)));
--    pp.is_port_active = (pp.sink && pp.sink->active_port == port) || (pp.source && pp.source->active_port == port);
--
--    return pp;
-+    *si = sink;
-+    *so = source;
- }
- 
--/* Switches to a port, switching profiles if necessary or preferred */
--static bool switch_to_port(pa_device_port *port) {
--    struct port_pointers pp = find_port_pointers(port);
-+static pa_hook_result_t port_available_hook_callback(pa_core *c, pa_device_port *port, void* userdata) {
-+    pa_card* card;
-+    pa_sink *sink;
-+    pa_source *source;
-+    bool is_active_profile, is_active_port;
- 
--    if (pp.is_port_active)
--        return true; /* Already selected */
-+    if (port->available == PA_AVAILABLE_UNKNOWN)
-+        return PA_HOOK_OK;
- 
--    pa_log_debug("Trying to switch to port %s", port->name);
--    if (!pp.is_preferred_profile_active) {
--        if (try_to_switch_profile(port) < 0) {
--            if (pp.is_possible_profile_active)
--                return false;
--        }
--        else
--            /* Now that profile has changed, our sink and source pointers must be updated */
--            pp = find_port_pointers(port);
--    }
-+    card = port->card;
- 
--    if (pp.source)
--        pa_source_set_port(pp.source, port->name, false);
--    if (pp.sink)
--        pa_sink_set_port(pp.sink, port->name, false);
--    return true;
--}
-+    if (!card) {
-+        pa_log_warn("Port %s does not have a card", port->name);
-+        return PA_HOOK_OK;
-+    }
- 
--/* Switches away from a port, switching profiles if necessary or preferred */
--static bool switch_from_port(pa_device_port *port) {
--    struct port_pointers pp = find_port_pointers(port);
--    pa_device_port *p, *best_port = NULL;
--    void *state;
-+    if (pa_idxset_size(card->sinks) == 0 && pa_idxset_size(card->sources) == 0)
-+        /* This card is not initialized yet. We'll handle it in
-+           sink_new / source_new callbacks later. */
-+        return PA_HOOK_OK;
- 
--    if (!pp.is_port_active)
--        return true; /* Already deselected */
-+    find_sink_and_source(card, port, &sink, &source);
- 
--    /* Try to find a good enough port to switch to */
--    PA_HASHMAP_FOREACH(p, port->card->ports, state)
--        if (p->direction == port->direction && p != port && p->available != PA_AVAILABLE_NO &&
--           (!best_port || best_port->priority < p->priority))
--           best_port = p;
-+    is_active_profile = card->active_profile == pa_hashmap_get(port->profiles, card->active_profile->name);
-+    is_active_port = (sink && sink->active_port == port) || (source && source->active_port == port);
- 
--    pa_log_debug("Trying to switch away from port %s, found %s", port->name, best_port ? best_port->name : "no better option");
-+    if (port->available == PA_AVAILABLE_NO && !is_active_port)
-+        return PA_HOOK_OK;
- 
--    if (best_port)
--        return switch_to_port(best_port);
-+    if (port->available == PA_AVAILABLE_YES) {
-+        if (is_active_port)
-+            return PA_HOOK_OK;
- 
--    return false;
--}
-+        if (!is_active_profile) {
-+            if (try_to_switch_profile(port) < 0)
-+                return PA_HOOK_OK;
- 
-+            pa_assert(card->active_profile == pa_hashmap_get(port->profiles, card->active_profile->name));
- 
--static pa_hook_result_t port_available_hook_callback(pa_core *c, pa_device_port *port, void* userdata) {
--    pa_assert(port);
-+            /* Now that profile has changed, our sink and source pointers must be updated */
-+            find_sink_and_source(card, port, &sink, &source);
-+        }
- 
--    if (!port->card) {
--        pa_log_warn("Port %s does not have a card", port->name);
--        return PA_HOOK_OK;
-+        if (source)
-+            pa_source_set_port(source, port->name, false);
-+        if (sink)
-+            pa_sink_set_port(sink, port->name, false);
-     }
- 
--    if (pa_idxset_size(port->card->sinks) == 0 && pa_idxset_size(port->card->sources) == 0)
--        /* This card is not initialized yet. We'll handle it in
--           sink_new / source_new callbacks later. */
--        return PA_HOOK_OK;
-+    if (port->available == PA_AVAILABLE_NO) {
-+        if (sink) {
-+            pa_device_port *p2 = pa_device_port_find_best(sink->ports);
-+
-+            if (p2 && p2->available != PA_AVAILABLE_NO)
-+                pa_sink_set_port(sink, p2->name, false);
-+            else {
-+                /* Maybe try to switch to another profile? */
-+            }
-+        }
- 
--    switch (port->available) {
--    case PA_AVAILABLE_YES:
--        switch_to_port(port);
--        break;
--    case PA_AVAILABLE_NO:
--        switch_from_port(port);
--        break;
--    default:
--        break;
-+        if (source) {
-+            pa_device_port *p2 = pa_device_port_find_best(source->ports);
-+
-+            if (p2 && p2->available != PA_AVAILABLE_NO)
-+                pa_source_set_port(source, p2->name, false);
-+            else {
-+                /* Maybe try to switch to another profile? */
-+            }
-+        }
-     }
- 
-     return PA_HOOK_OK;
--- 
-2.7.0
-
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/0002-alsa-bluetooth-fail-if-user-requested-profile-doesn-.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-alsa-bluetooth-fail-if-user-requested-profile-doesn-.patch
similarity index 69%
rename from meta/recipes-multimedia/pulseaudio/pulseaudio/0002-alsa-bluetooth-fail-if-user-requested-profile-doesn-.patch
rename to meta/recipes-multimedia/pulseaudio/pulseaudio/0001-alsa-bluetooth-fail-if-user-requested-profile-doesn-.patch
index be3655b..2f72ceb 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio/0002-alsa-bluetooth-fail-if-user-requested-profile-doesn-.patch
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-alsa-bluetooth-fail-if-user-requested-profile-doesn-.patch
@@ -1,32 +1,26 @@
-From 339eb179baa7810113f6456accc05b3a32c1cdba Mon Sep 17 00:00:00 2001
+From 9c3cdfcd198ef9727ea542f284ac6d8c1bcd7a3a Mon Sep 17 00:00:00 2001
 From: Tanu Kaskinen <tanuk@iki.fi>
 Date: Fri, 23 Oct 2015 12:36:34 +0300
-Subject: [PATCH 2/4] alsa, bluetooth: fail if user-requested profile doesn't
+Subject: [PATCH 1/5] alsa, bluetooth: fail if user-requested profile doesn't
  exist
 
 If we can't fulfill the user request fully, I think we shouldn't
 fulfill it at all, to make it clear that the requested operation
 didn't succeed.
 
-http://bugzilla.yoctoproject.org/show_bug.cgi?id=8448
-
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-
-Upstream-Status: Denied [The patch set needs some work to be accepted.
-The review thread:
-http://thread.gmane.org/gmane.comp.audio.pulseaudio.general/24301]
+Upstream-Status: Accepted [expected in 10.0]
 
 Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
 ---
- src/modules/alsa/module-alsa-card.c          | 10 ++++++++--
- src/modules/bluetooth/module-bluez4-device.c |  6 ++++--
- 2 files changed, 12 insertions(+), 4 deletions(-)
+ src/modules/alsa/module-alsa-card.c          | 11 +++++++++--
+ src/modules/bluetooth/module-bluez4-device.c |  7 +++++--
+ 2 files changed, 14 insertions(+), 4 deletions(-)
 
 diff --git a/src/modules/alsa/module-alsa-card.c b/src/modules/alsa/module-alsa-card.c
-index a7fec04..32f517e 100644
+index e5cc4ae..d761683 100644
 --- a/src/modules/alsa/module-alsa-card.c
 +++ b/src/modules/alsa/module-alsa-card.c
-@@ -754,8 +754,14 @@ int pa__init(pa_module *m) {
+@@ -799,8 +799,15 @@ int pa__init(pa_module *m) {
          goto fail;
      }
  
@@ -37,6 +31,7 @@ index a7fec04..32f517e 100644
 +            pa_card_new_data_set_profile(&data, profile);
 +        else {
 +            pa_log("No such profile: %s", profile);
++            pa_card_new_data_done(&data);
 +            goto fail;
 +        }
 +    }
@@ -44,10 +39,10 @@ index a7fec04..32f517e 100644
      u->card = pa_card_new(m->core, &data);
      pa_card_new_data_done(&data);
 diff --git a/src/modules/bluetooth/module-bluez4-device.c b/src/modules/bluetooth/module-bluez4-device.c
-index b40c6a0..94e6988 100644
+index 9a921a5..a2de525 100644
 --- a/src/modules/bluetooth/module-bluez4-device.c
 +++ b/src/modules/bluetooth/module-bluez4-device.c
-@@ -2310,8 +2310,10 @@ static int add_card(struct userdata *u) {
+@@ -2301,8 +2301,11 @@ static int add_card(struct userdata *u) {
      if ((default_profile = pa_modargs_get_value(u->modargs, "profile", NULL))) {
          if (pa_hashmap_get(data.profiles, default_profile))
              pa_card_new_data_set_profile(&data, default_profile);
@@ -55,11 +50,12 @@ index b40c6a0..94e6988 100644
 -            pa_log_warn("Profile '%s' not valid or not supported by device.", default_profile);
 +        else {
 +            pa_log("Profile '%s' not valid or not supported by device.", default_profile);
++            pa_card_new_data_done(&data);
 +            return -1;
 +        }
      }
  
      u->card = pa_card_new(u->core, &data);
 -- 
-2.1.4
+2.8.1
 
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-card-add-pa_card_profile.ports.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-card-add-pa_card_profile.ports.patch
deleted file mode 100644
index 84c9519..0000000
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-card-add-pa_card_profile.ports.patch
+++ /dev/null
@@ -1,218 +0,0 @@
-From d1c02971867bea10afcafc82c965414012c4d6bd Mon Sep 17 00:00:00 2001
-From: Tanu Kaskinen <tanuk@iki.fi>
-Date: Fri, 23 Oct 2015 12:23:13 +0300
-Subject: [PATCH 1/4] card: add pa_card_profile.ports
-
-Having ports accessible from pa_card_profile allows checking whether all ports
-of a profile are unavailable, and therefore helps with managing the profile
-availability (implemented in a later patch).
-
-http://bugzilla.yoctoproject.org/show_bug.cgi?id=8448
-
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-
-Rebased on 8.0.
-
-Upstream-Status: Denied [The patch set needs some work to be accepted.
-The review thread:
-http://thread.gmane.org/gmane.comp.audio.pulseaudio.general/24301]
-
-Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
----
- src/modules/alsa/alsa-mixer.c                |  4 +++-
- src/modules/alsa/alsa-ucm.c                  |  1 +
- src/modules/bluetooth/module-bluez4-device.c |  6 ++++++
- src/modules/bluetooth/module-bluez5-device.c |  6 ++++++
- src/pulsecore/card.c                         | 15 +++++++++++++++
- src/pulsecore/card.h                         |  4 ++++
- src/pulsecore/device-port.c                  |  7 ++++++-
- 7 files changed, 41 insertions(+), 2 deletions(-)
-
-diff --git a/src/modules/alsa/alsa-mixer.c b/src/modules/alsa/alsa-mixer.c
-index 1fe2a02..5b76b06 100644
---- a/src/modules/alsa/alsa-mixer.c
-+++ b/src/modules/alsa/alsa-mixer.c
-@@ -4783,8 +4783,10 @@ static pa_device_port* device_port_alsa_init(pa_hashmap *ports, /* card ports */
-         path->port = p;
-     }
- 
--    if (cp)
-+    if (cp) {
-         pa_hashmap_put(p->profiles, cp->name, cp);
-+        pa_card_profile_add_port(cp, p);
-+    }
- 
-     if (extra) {
-         pa_hashmap_put(extra, p->name, p);
-diff --git a/src/modules/alsa/alsa-ucm.c b/src/modules/alsa/alsa-ucm.c
-index 42f3242..68fcc26 100644
---- a/src/modules/alsa/alsa-ucm.c
-+++ b/src/modules/alsa/alsa-ucm.c
-@@ -791,6 +791,7 @@ static void ucm_add_port_combination(
-     if (cp) {
-         pa_log_debug("Adding profile %s to port %s.", cp->name, port->name);
-         pa_hashmap_put(port->profiles, cp->name, cp);
-+        pa_card_profile_add_port(cp, port);
-     }
- 
-     if (hash) {
-diff --git a/src/modules/bluetooth/module-bluez4-device.c b/src/modules/bluetooth/module-bluez4-device.c
-index 9a921a5..adecb32 100644
---- a/src/modules/bluetooth/module-bluez4-device.c
-+++ b/src/modules/bluetooth/module-bluez4-device.c
-@@ -2180,6 +2180,7 @@ static pa_card_profile *create_card_profile(struct userdata *u, const char *uuid
-         p->max_sink_channels = 2;
-         p->max_source_channels = 0;
-         pa_hashmap_put(output_port->profiles, p->name, p);
-+        pa_card_profile_add_port(p, output_port);
- 
-         d = PA_CARD_PROFILE_DATA(p);
-         *d = PA_BLUEZ4_PROFILE_A2DP;
-@@ -2191,6 +2192,7 @@ static pa_card_profile *create_card_profile(struct userdata *u, const char *uuid
-         p->max_sink_channels = 0;
-         p->max_source_channels = 2;
-         pa_hashmap_put(input_port->profiles, p->name, p);
-+        pa_card_profile_add_port(p, input_port);
- 
-         d = PA_CARD_PROFILE_DATA(p);
-         *d = PA_BLUEZ4_PROFILE_A2DP_SOURCE;
-@@ -2203,6 +2205,8 @@ static pa_card_profile *create_card_profile(struct userdata *u, const char *uuid
-         p->max_source_channels = 1;
-         pa_hashmap_put(input_port->profiles, p->name, p);
-         pa_hashmap_put(output_port->profiles, p->name, p);
-+        pa_card_profile_add_port(p, input_port);
-+        pa_card_profile_add_port(p, output_port);
- 
-         d = PA_CARD_PROFILE_DATA(p);
-         *d = PA_BLUEZ4_PROFILE_HSP;
-@@ -2215,6 +2219,8 @@ static pa_card_profile *create_card_profile(struct userdata *u, const char *uuid
-         p->max_source_channels = 1;
-         pa_hashmap_put(input_port->profiles, p->name, p);
-         pa_hashmap_put(output_port->profiles, p->name, p);
-+        pa_card_profile_add_port(p, input_port);
-+        pa_card_profile_add_port(p, output_port);
- 
-         d = PA_CARD_PROFILE_DATA(p);
-         *d = PA_BLUEZ4_PROFILE_HFGW;
-diff --git a/src/modules/bluetooth/module-bluez5-device.c b/src/modules/bluetooth/module-bluez5-device.c
-index 84e6d55..b015c67 100644
---- a/src/modules/bluetooth/module-bluez5-device.c
-+++ b/src/modules/bluetooth/module-bluez5-device.c
-@@ -1790,6 +1790,7 @@ static pa_card_profile *create_card_profile(struct userdata *u, const char *uuid
-         cp->max_sink_channels = 2;
-         cp->max_source_channels = 0;
-         pa_hashmap_put(output_port->profiles, cp->name, cp);
-+        pa_card_profile_add_port(cp, output_port);
- 
-         p = PA_CARD_PROFILE_DATA(cp);
-         *p = PA_BLUETOOTH_PROFILE_A2DP_SINK;
-@@ -1801,6 +1802,7 @@ static pa_card_profile *create_card_profile(struct userdata *u, const char *uuid
-         cp->max_sink_channels = 0;
-         cp->max_source_channels = 2;
-         pa_hashmap_put(input_port->profiles, cp->name, cp);
-+        pa_card_profile_add_port(cp, input_port);
- 
-         p = PA_CARD_PROFILE_DATA(cp);
-         *p = PA_BLUETOOTH_PROFILE_A2DP_SOURCE;
-@@ -1813,6 +1815,8 @@ static pa_card_profile *create_card_profile(struct userdata *u, const char *uuid
-         cp->max_source_channels = 1;
-         pa_hashmap_put(input_port->profiles, cp->name, cp);
-         pa_hashmap_put(output_port->profiles, cp->name, cp);
-+        pa_card_profile_add_port(cp, input_port);
-+        pa_card_profile_add_port(cp, output_port);
- 
-         p = PA_CARD_PROFILE_DATA(cp);
-         *p = PA_BLUETOOTH_PROFILE_HEADSET_HEAD_UNIT;
-@@ -1825,6 +1829,8 @@ static pa_card_profile *create_card_profile(struct userdata *u, const char *uuid
-         cp->max_source_channels = 1;
-         pa_hashmap_put(input_port->profiles, cp->name, cp);
-         pa_hashmap_put(output_port->profiles, cp->name, cp);
-+        pa_card_profile_add_port(cp, input_port);
-+        pa_card_profile_add_port(cp, output_port);
- 
-         p = PA_CARD_PROFILE_DATA(cp);
-         *p = PA_BLUETOOTH_PROFILE_HEADSET_AUDIO_GATEWAY;
-diff --git a/src/pulsecore/card.c b/src/pulsecore/card.c
-index b6cbbf7..f92ac87 100644
---- a/src/pulsecore/card.c
-+++ b/src/pulsecore/card.c
-@@ -45,6 +45,7 @@ pa_card_profile *pa_card_profile_new(const char *name, const char *description,
-     c->name = pa_xstrdup(name);
-     c->description = pa_xstrdup(description);
-     c->available = PA_AVAILABLE_UNKNOWN;
-+    c->ports = pa_hashmap_new(pa_idxset_string_hash_func, pa_idxset_string_compare_func);
- 
-     return c;
- }
-@@ -52,6 +53,14 @@ pa_card_profile *pa_card_profile_new(const char *name, const char *description,
- void pa_card_profile_free(pa_card_profile *c) {
-     pa_assert(c);
- 
-+    if (c->ports) {
-+        pa_device_port *port;
-+        void *state;
-+        PA_HASHMAP_FOREACH(port, c->ports, state)
-+            pa_hashmap_remove (port->profiles, c->name);
-+        pa_hashmap_free(c->ports);
-+    }
-+
-     pa_xfree(c->input_name);
-     pa_xfree(c->output_name);
-     pa_xfree(c->name);
-@@ -59,6 +68,12 @@ void pa_card_profile_free(pa_card_profile *c) {
-     pa_xfree(c);
- }
- 
-+void pa_card_profile_add_port(pa_card_profile *profile, pa_device_port *port) {
-+    pa_assert(profile);
-+
-+    pa_hashmap_put(profile->ports, port->name, port);
-+}
-+
- void pa_card_profile_set_available(pa_card_profile *c, pa_available_t available) {
-     pa_core *core;
- 
-diff --git a/src/pulsecore/card.h b/src/pulsecore/card.h
-index 30bfc0e..fff9057 100644
---- a/src/pulsecore/card.h
-+++ b/src/pulsecore/card.h
-@@ -50,6 +50,8 @@ struct pa_card_profile {
-     unsigned priority;
-     pa_available_t available; /* PA_AVAILABLE_UNKNOWN, PA_AVAILABLE_NO or PA_AVAILABLE_YES */
- 
-+    pa_hashmap *ports; /* port name -> pa_device_port */
-+
-     /* We probably want to have different properties later on here */
-     unsigned n_sinks;
-     unsigned n_sources;
-@@ -107,6 +109,8 @@ typedef struct pa_card_new_data {
- pa_card_profile *pa_card_profile_new(const char *name, const char *description, size_t extra);
- void pa_card_profile_free(pa_card_profile *c);
- 
-+void pa_card_profile_add_port(pa_card_profile *profile, pa_device_port *port);
-+
- /* The profile's available status has changed */
- void pa_card_profile_set_available(pa_card_profile *c, pa_available_t available);
- 
-diff --git a/src/pulsecore/device-port.c b/src/pulsecore/device-port.c
-index 5807d3e..d12dfbc 100644
---- a/src/pulsecore/device-port.c
-+++ b/src/pulsecore/device-port.c
-@@ -107,8 +107,13 @@ static void device_port_free(pa_object *o) {
-     if (p->proplist)
-         pa_proplist_free(p->proplist);
- 
--    if (p->profiles)
-+    if (p->profiles) {
-+        pa_card_profile *profile;
-+        void *state;
-+        PA_HASHMAP_FOREACH(profile, p->profiles, state)
-+            pa_hashmap_remove (profile->ports, p->name);
-         pa_hashmap_free(p->profiles);
-+    }
- 
-     pa_xfree(p->preferred_profile);
-     pa_xfree(p->name);
--- 
-2.7.0
-
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-client-conf-Add-allow-autospawn-for-root.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-client-conf-Add-allow-autospawn-for-root.patch
index bc32775..33f7709 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-client-conf-Add-allow-autospawn-for-root.patch
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-client-conf-Add-allow-autospawn-for-root.patch
@@ -1,4 +1,4 @@
-From 1cb5647f76dc8cd7bacbce2a64fac9e6c2dc3b16 Mon Sep 17 00:00:00 2001
+From babec3a50dd710d26b72f6c6d43bd79b04e954a6 Mon Sep 17 00:00:00 2001
 From: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
 Date: Tue, 28 Apr 2015 14:32:43 +0300
 Subject: [PATCH] client-conf: Add allow-autospawn-for-root
@@ -24,10 +24,10 @@ Signed-off-by: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
  5 files changed, 13 insertions(+), 1 deletion(-)
 
 diff --git a/man/pulse-client.conf.5.xml.in b/man/pulse-client.conf.5.xml.in
-index 1002dbe..0058490 100644
+index b88898c..e737c96 100644
 --- a/man/pulse-client.conf.5.xml.in
 +++ b/man/pulse-client.conf.5.xml.in
-@@ -71,6 +71,15 @@ License along with PulseAudio; if not, see <http://www.gnu.org/licenses/>.
+@@ -82,6 +82,15 @@ License along with PulseAudio; if not, see <http://www.gnu.org/licenses/>.
      </option>
  
      <option>
@@ -44,7 +44,7 @@ index 1002dbe..0058490 100644
        run when autospawning. Defaults to a path configured at compile
        time.</p>
 diff --git a/src/pulse/client-conf.c b/src/pulse/client-conf.c
-index 83331f8..0474583 100644
+index a3c9486..9f68ee5 100644
 --- a/src/pulse/client-conf.c
 +++ b/src/pulse/client-conf.c
 @@ -138,6 +138,7 @@ void pa_client_conf_load(pa_client_conf *c, bool load_from_x11, bool load_from_e
@@ -56,13 +56,13 @@ index 83331f8..0474583 100644
          { "disable-shm",            pa_config_parse_bool,     &c->disable_shm, NULL },
          { "enable-shm",             pa_config_parse_not_bool, &c->disable_shm, NULL },
 diff --git a/src/pulse/client-conf.h b/src/pulse/client-conf.h
-index eac705a..131393a 100644
+index 7691ec7..19db7ed 100644
 --- a/src/pulse/client-conf.h
 +++ b/src/pulse/client-conf.h
 @@ -38,6 +38,7 @@ typedef struct pa_client_conf {
      char *cookie_file_from_application;
      char *cookie_file_from_client_conf;
-     bool autospawn, disable_shm, auto_connect_localhost, auto_connect_display;
+     bool autospawn, disable_shm, disable_memfd, auto_connect_localhost, auto_connect_display;
 +    bool allow_autospawn_for_root;
      size_t shm_size;
  } pa_client_conf;
@@ -80,10 +80,10 @@ index 26b7790..69830ef 100644
  ; extra-arguments = --log-target=syslog
  
 diff --git a/src/pulse/context.c b/src/pulse/context.c
-index 4bc445f..d6c3f6d 100644
+index 69be5f4..d6e13e8 100644
 --- a/src/pulse/context.c
 +++ b/src/pulse/context.c
-@@ -976,7 +976,7 @@ int pa_context_connect(
+@@ -1027,7 +1027,7 @@ int pa_context_connect(
      if (!(flags & PA_CONTEXT_NOAUTOSPAWN) && c->conf->autospawn) {
  
  #ifdef HAVE_GETUID
@@ -93,5 +93,5 @@ index 4bc445f..d6c3f6d 100644
          else {
              c->do_autospawn = true;
 -- 
-1.9.3
+2.8.1
 
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/0002-card-don-t-allow-the-CARD_NEW-hook-to-fail.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/0002-card-don-t-allow-the-CARD_NEW-hook-to-fail.patch
new file mode 100644
index 0000000..80c291f
--- /dev/null
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio/0002-card-don-t-allow-the-CARD_NEW-hook-to-fail.patch
@@ -0,0 +1,37 @@
+From d4e6d07fef28d1bd8bfbceab4cc196ef54c23dd8 Mon Sep 17 00:00:00 2001
+From: Tanu Kaskinen <tanuk@iki.fi>
+Date: Tue, 7 Jun 2016 16:51:00 +0300
+Subject: [PATCH 2/5] card: don't allow the CARD_NEW hook to fail
+
+There is currently no use for allowing modules to cancel card creation,
+and I don't see need for that in the future either. Let's simplify
+things by removing the failure handling code.
+
+Upstream-Status: Accepted [expected in 10.0]
+
+Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
+---
+ src/pulsecore/card.c | 7 +------
+ 1 file changed, 1 insertion(+), 6 deletions(-)
+
+diff --git a/src/pulsecore/card.c b/src/pulsecore/card.c
+index 410746b..0ac70b9 100644
+--- a/src/pulsecore/card.c
++++ b/src/pulsecore/card.c
+@@ -149,12 +149,7 @@ pa_card *pa_card_new(pa_core *core, pa_card_new_data *data) {
+     }
+ 
+     pa_card_new_data_set_name(data, name);
+-
+-    if (pa_hook_fire(&core->hooks[PA_CORE_HOOK_CARD_NEW], data) < 0) {
+-        pa_xfree(c);
+-        pa_namereg_unregister(core, name);
+-        return NULL;
+-    }
++    pa_hook_fire(&core->hooks[PA_CORE_HOOK_CARD_NEW], data);
+ 
+     c->core = core;
+     c->name = pa_xstrdup(data->name);
+-- 
+2.8.1
+
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/0003-card-move-profile-selection-after-pa_card_new.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/0003-card-move-profile-selection-after-pa_card_new.patch
index 0e77801..e0f424b 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio/0003-card-move-profile-selection-after-pa_card_new.patch
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio/0003-card-move-profile-selection-after-pa_card_new.patch
@@ -1,61 +1,62 @@
-From 13e85dd1763e99d21a60323671b9a5df08bdae75 Mon Sep 17 00:00:00 2001
+From 0b98309fdbcd36fa92ab53e33c51b485b905e294 Mon Sep 17 00:00:00 2001
 From: Tanu Kaskinen <tanuk@iki.fi>
 Date: Fri, 23 Oct 2015 12:59:53 +0300
-Subject: [PATCH 3/4] card: move profile selection after pa_card_new()
+Subject: [PATCH 3/5] card: move profile selection after pa_card_new()
 
 I want module-alsa-card to set the availability of unavailable
 profiles before the initial card profile gets selected, so that the
 selection logic can use correct availability information.
 module-alsa-card initializes the jack state after calling
 pa_card_new(), however, and the profile selection happens in
-pa_card_new(). This patch solves that by introducing pa_card_put() and
-moving the profile selection code there.
+pa_card_new(). This patch solves that by moving parts of pa_card_new()
+to pa_card_choose_initial_profile() and pa_card_put().
+
+pa_card_choose_initial_profile() applies the profile selection policy,
+so module-alsa-card can first call pa_card_new(), then initialize the
+jack state, and then call pa_card_choose_initial_profile(). After that
+module-alsa-card can still override the profile selection policy, in
+case module-alsa-card was loaded with the "profile" argument. Finally,
+pa_card_put() finalizes the card creation.
 
 An alternative solution would have been to move the jack
 initialization to happen before pa_card_new() and use pa_card_new_data
 instead of pa_card in the jack initialization code, but I disliked
 that idea (I want to get rid of the "new data" pattern eventually).
 
-The CARD_NEW hook is used when applying the initial profile policy, so
-that was moved to pa_card_put(). That required changing the hook data
-from pa_card_new_data to pa_card. module-card-restore now uses
-pa_card_set_profile() instead of pa_card_new_data_set_profile(). That
-required adding a state variable to pa_card, because
-pa_card_set_profile() needs to distinguish between setting the initial
-profile and setting the profile in other situations.
-
 The order in which the initial profile policy is applied is reversed
 in this patch. Previously the first one to set it won, now the last
 one to set it wins. I think this is better, because if you have N
 parties that want to set the profile, we avoid checking N times
 whether someone else has already set the profile.
 
-http://bugzilla.yoctoproject.org/show_bug.cgi?id=8448
-
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-
-Rebased on 8.0.
-
-Upstream-Status: Denied [The patch set needs some work to be accepted.
-The review thread:
-http://thread.gmane.org/gmane.comp.audio.pulseaudio.general/24301]
+Upstream-Status: Accepted [expected in 10.0]
 
 Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
 ---
- src/modules/alsa/module-alsa-card.c          | 19 +++----
- src/modules/bluetooth/module-bluez4-device.c | 18 +++----
- src/modules/bluetooth/module-bluez5-device.c |  1 +
- src/modules/macosx/module-coreaudio-device.c |  1 +
- src/modules/module-card-restore.c            | 24 +++++----
- src/pulsecore/card.c                         | 81 +++++++++++++++-------------
- src/pulsecore/card.h                         |  7 +++
- 7 files changed, 86 insertions(+), 65 deletions(-)
+ src/modules/alsa/module-alsa-card.c          | 32 +++++----
+ src/modules/bluetooth/module-bluez4-device.c | 31 +++++----
+ src/modules/bluetooth/module-bluez5-device.c |  2 +
+ src/modules/macosx/module-coreaudio-device.c |  2 +
+ src/modules/module-card-restore.c            | 36 +++++++---
+ src/pulsecore/card.c                         | 99 +++++++++++++++++-----------
+ src/pulsecore/card.h                         |  9 +++
+ src/pulsecore/core.h                         |  1 +
+ 8 files changed, 143 insertions(+), 69 deletions(-)
 
 diff --git a/src/modules/alsa/module-alsa-card.c b/src/modules/alsa/module-alsa-card.c
-index 9e8cde2..fe240f0 100644
+index d761683..1976230 100644
 --- a/src/modules/alsa/module-alsa-card.c
 +++ b/src/modules/alsa/module-alsa-card.c
-@@ -770,15 +770,6 @@ int pa__init(pa_module *m) {
+@@ -671,7 +671,7 @@ int pa__init(pa_module *m) {
+     struct userdata *u;
+     pa_reserve_wrapper *reserve = NULL;
+     const char *description;
+-    const char *profile = NULL;
++    const char *profile_str = NULL;
+     char *fn = NULL;
+     bool namereg_fail = false;
+ 
+@@ -799,16 +799,6 @@ int pa__init(pa_module *m) {
          goto fail;
      }
  
@@ -64,6 +65,7 @@ index 9e8cde2..fe240f0 100644
 -            pa_card_new_data_set_profile(&data, profile);
 -        else {
 -            pa_log("No such profile: %s", profile);
+-            pa_card_new_data_done(&data);
 -            goto fail;
 -        }
 -    }
@@ -71,28 +73,47 @@ index 9e8cde2..fe240f0 100644
      u->card = pa_card_new(m->core, &data);
      pa_card_new_data_done(&data);
  
-@@ -789,6 +780,16 @@ int pa__init(pa_module *m) {
-     u->card->set_profile = card_set_profile;
+@@ -822,6 +812,26 @@ int pa__init(pa_module *m) {
+             (pa_hook_cb_t) card_suspend_changed, u);
  
      init_jacks(u);
-+    pa_card_put(u->card);
 +
-+    if ((profile = pa_modargs_get_value(u->modargs, "profile", NULL))) {
-+        u->card->active_profile = pa_hashmap_get(u->card->profiles, profile);
-+        if (!u->card->active_profile) {
-+            pa_log("No such profile: %s", profile);
++    pa_card_choose_initial_profile(u->card);
++
++    /* If the "profile" modarg is given, we have to override whatever the usual
++     * policy chose in pa_card_choose_initial_profile(). */
++    profile_str = pa_modargs_get_value(u->modargs, "profile", NULL);
++    if (profile_str) {
++        pa_card_profile *profile;
++
++        profile = pa_hashmap_get(u->card->profiles, profile_str);
++        if (!profile) {
++            pa_log("No such profile: %s", profile_str);
 +            goto fail;
 +        }
++
++        pa_card_set_profile(u->card, profile, false);
 +    }
 +
++    pa_card_put(u->card);
++
      init_profile(u);
      init_eld_ctls(u);
  
 diff --git a/src/modules/bluetooth/module-bluez4-device.c b/src/modules/bluetooth/module-bluez4-device.c
-index dd18217..5d0d3db 100644
+index a2de525..13fb7ab 100644
 --- a/src/modules/bluetooth/module-bluez4-device.c
 +++ b/src/modules/bluetooth/module-bluez4-device.c
-@@ -2304,15 +2304,6 @@ static int add_card(struct userdata *u) {
+@@ -2238,7 +2238,7 @@ static int add_card(struct userdata *u) {
+     pa_bluez4_profile_t *d;
+     pa_bluez4_form_factor_t ff;
+     char *n;
+-    const char *default_profile;
++    const char *profile_str;
+     const pa_bluez4_device *device;
+     const pa_bluez4_uuid *uuid;
+ 
+@@ -2298,16 +2298,6 @@ static int add_card(struct userdata *u) {
      *d = PA_BLUEZ4_PROFILE_OFF;
      pa_hashmap_put(data.profiles, p->name, p);
  
@@ -101,6 +122,7 @@ index dd18217..5d0d3db 100644
 -            pa_card_new_data_set_profile(&data, default_profile);
 -        else {
 -            pa_log("Profile '%s' not valid or not supported by device.", default_profile);
+-            pa_card_new_data_done(&data);
 -            return -1;
 -        }
 -    }
@@ -108,127 +130,126 @@ index dd18217..5d0d3db 100644
      u->card = pa_card_new(u->core, &data);
      pa_card_new_data_done(&data);
  
-@@ -2323,6 +2314,15 @@ static int add_card(struct userdata *u) {
- 
+@@ -2319,6 +2309,25 @@ static int add_card(struct userdata *u) {
      u->card->userdata = u;
      u->card->set_profile = card_set_profile;
-+    pa_card_put(u->card);
+ 
++    pa_card_choose_initial_profile(u->card);
++
++    /* If the "profile" modarg is given, we have to override whatever the usual
++     * policy chose in pa_card_choose_initial_profile(). */
++    profile_str = pa_modargs_get_value(u->modargs, "profile", NULL);
++    if (profile_str) {
++        pa_card_profile *profile;
 +
-+    if ((default_profile = pa_modargs_get_value(u->modargs, "profile", NULL))) {
-+        u->card->active_profile = pa_hashmap_get(u->card->profiles, default_profile);
-+        if (!u->card->active_profile) {
-+            pa_log("Profile '%s' not valid or not supported by device.", default_profile);
++        profile = pa_hashmap_get(u->card->profiles, profile_str);
++        if (!profile) {
++            pa_log("No such profile: %s", profile_str);
 +            return -1;
 +        }
++
++        pa_card_set_profile(u->card, profile, false);
 +    }
- 
++
++    pa_card_put(u->card);
++
      d = PA_CARD_PROFILE_DATA(u->card->active_profile);
  
+     if (*d != PA_BLUEZ4_PROFILE_OFF && (!device->transports[*d] ||
 diff --git a/src/modules/bluetooth/module-bluez5-device.c b/src/modules/bluetooth/module-bluez5-device.c
-index b015c67..7b90a31 100644
+index 84e6d55..498d0e1 100644
 --- a/src/modules/bluetooth/module-bluez5-device.c
 +++ b/src/modules/bluetooth/module-bluez5-device.c
-@@ -1959,6 +1959,7 @@ static int add_card(struct userdata *u) {
+@@ -1953,6 +1953,8 @@ static int add_card(struct userdata *u) {
  
      u->card->userdata = u;
      u->card->set_profile = set_profile_cb;
++    pa_card_choose_initial_profile(u->card);
 +    pa_card_put(u->card);
  
      p = PA_CARD_PROFILE_DATA(u->card->active_profile);
      u->profile = *p;
 diff --git a/src/modules/macosx/module-coreaudio-device.c b/src/modules/macosx/module-coreaudio-device.c
-index 0c92d42..7190ee9 100644
+index 6c9e55d..d91c656 100644
 --- a/src/modules/macosx/module-coreaudio-device.c
 +++ b/src/modules/macosx/module-coreaudio-device.c
-@@ -807,6 +807,7 @@ int pa__init(pa_module *m) {
+@@ -821,6 +821,8 @@ int pa__init(pa_module *m) {
      pa_card_new_data_done(&card_new_data);
      u->card->userdata = u;
      u->card->set_profile = card_set_profile;
++    pa_card_choose_initial_profile(u->card);
 +    pa_card_put(u->card);
  
      u->rtpoll = pa_rtpoll_new();
      pa_thread_mq_init(&u->thread_mq, m->core->mainloop, u->rtpoll);
 diff --git a/src/modules/module-card-restore.c b/src/modules/module-card-restore.c
-index f906843..dce6674 100644
+index 7545aa5..718a0dd 100644
 --- a/src/modules/module-card-restore.c
 +++ b/src/modules/module-card-restore.c
-@@ -515,34 +515,38 @@ static pa_hook_result_t port_offset_change_callback(pa_core *c, pa_device_port *
-     return PA_HOOK_OK;
- }
- 
--static pa_hook_result_t card_new_hook_callback(pa_core *c, pa_card_new_data *new_data, struct userdata *u) {
-+static pa_hook_result_t card_new_hook_callback(pa_core *c, pa_card *card, struct userdata *u) {
-     struct entry *e;
-     void *state;
-     pa_device_port *p;
-     struct port_info *p_info;
- 
--    pa_assert(new_data);
-+    pa_assert(c);
-+    pa_assert(card);
-+    pa_assert(u);
- 
--    if (!(e = entry_read(u, new_data->name)))
-+    if (!(e = entry_read(u, card->name)))
+@@ -551,16 +551,6 @@ static pa_hook_result_t card_new_hook_callback(pa_core *c, pa_card_new_data *new
+     if (!(e = entry_read(u, new_data->name)))
          return PA_HOOK_OK;
  
-     if (e->profile[0]) {
+-    if (e->profile[0]) {
 -        if (!new_data->active_profile) {
 -            pa_card_new_data_set_profile(new_data, e->profile);
 -            pa_log_info("Restored profile '%s' for card %s.", new_data->active_profile, new_data->name);
 -            new_data->save_profile = true;
-+        pa_card_profile *profile;
+-
+-        } else
+-            pa_log_debug("Not restoring profile for card %s, because already set.", new_data->name);
+-    }
+-
+     /* Always restore the latency offsets because their
+      * initial value is always 0 */
+ 
+@@ -590,6 +580,30 @@ static pa_hook_result_t card_new_hook_callback(pa_core *c, pa_card_new_data *new
+     return PA_HOOK_OK;
+ }
  
++static pa_hook_result_t card_choose_initial_profile_callback(pa_core *core, pa_card *card, struct userdata *u) {
++    struct entry *e;
++
++    if (!(e = entry_read(u, card->name)))
++        return PA_HOOK_OK;
++
++    if (e->profile[0]) {
++        pa_card_profile *profile;
++
 +        profile = pa_hashmap_get(card->profiles, e->profile);
 +        if (profile) {
++            pa_log_info("Restoring profile '%s' for card %s.", card->active_profile->name, card->name);
 +            pa_card_set_profile(card, profile, true);
-+            pa_log_info("Restored profile '%s' for card %s.", card->active_profile->name, card->name);
-         } else
--            pa_log_debug("Not restoring profile for card %s, because already set.", new_data->name);
++        } else {
 +            pa_log_debug("Tried to restore profile %s for card %s, but the card doesn't have such profile.",
 +                         e->profile, card->name);
-     }
- 
-     /* Always restore the latency offsets because their
-      * initial value is always 0 */
- 
--    pa_log_info("Restoring port latency offsets for card %s.", new_data->name);
-+    pa_log_info("Restoring port latency offsets for card %s.", card->name);
- 
-     PA_HASHMAP_FOREACH(p_info, e->ports, state)
--        if ((p = pa_hashmap_get(new_data->ports, p_info->name))) {
-+        if ((p = pa_hashmap_get(card->ports, p_info->name))) {
-             p->latency_offset = p_info->offset;
-             if (!p->preferred_profile && p_info->profile)
-                 pa_device_port_set_preferred_profile(p, p_info->profile);
++        }
++    }
++
++    entry_free(e);
++
++    return PA_HOOK_OK;
++}
++
+ static pa_hook_result_t card_preferred_port_changed_callback(pa_core *core, pa_card_preferred_port_changed_hook_data *data,
+                                                              struct userdata *u) {
+     struct entry *e;
+@@ -634,6 +648,8 @@ int pa__init(pa_module*m) {
+     u->module = m;
+ 
+     pa_module_hook_connect(m, &m->core->hooks[PA_CORE_HOOK_CARD_NEW], PA_HOOK_EARLY, (pa_hook_cb_t) card_new_hook_callback, u);
++    pa_module_hook_connect(m, &m->core->hooks[PA_CORE_HOOK_CARD_CHOOSE_INITIAL_PROFILE], PA_HOOK_NORMAL,
++                           (pa_hook_cb_t) card_choose_initial_profile_callback, u);
+     pa_module_hook_connect(m, &m->core->hooks[PA_CORE_HOOK_CARD_PUT], PA_HOOK_NORMAL, (pa_hook_cb_t) card_put_hook_callback, u);
+     pa_module_hook_connect(m, &m->core->hooks[PA_CORE_HOOK_CARD_PREFERRED_PORT_CHANGED], PA_HOOK_NORMAL, (pa_hook_cb_t) card_preferred_port_changed_callback, u);
+     pa_module_hook_connect(m, &m->core->hooks[PA_CORE_HOOK_CARD_PROFILE_CHANGED], PA_HOOK_NORMAL, (pa_hook_cb_t) card_profile_changed_callback, u);
 diff --git a/src/pulsecore/card.c b/src/pulsecore/card.c
-index f92ac87..1a6e705 100644
+index 0ac70b9..a0c3d93 100644
 --- a/src/pulsecore/card.c
 +++ b/src/pulsecore/card.c
-@@ -148,6 +148,7 @@ pa_card *pa_card_new(pa_core *core, pa_card_new_data *data) {
-     pa_assert(!pa_hashmap_isempty(data->profiles));
- 
-     c = pa_xnew0(pa_card, 1);
-+    c->state = PA_CARD_STATE_INIT;
- 
-     if (!(name = pa_namereg_register(core, data->name, PA_NAMEREG_CARD, c, data->namereg_fail))) {
-         pa_xfree(c);
-@@ -156,12 +157,6 @@ pa_card *pa_card_new(pa_core *core, pa_card_new_data *data) {
- 
-     pa_card_new_data_set_name(data, name);
- 
--    if (pa_hook_fire(&core->hooks[PA_CORE_HOOK_CARD_NEW], data) < 0) {
--        pa_xfree(c);
--        pa_namereg_unregister(core, name);
--        return NULL;
--    }
--
-     c->core = core;
-     c->name = pa_xstrdup(data->name);
-     c->proplist = pa_proplist_copy(data->proplist);
-@@ -184,38 +179,43 @@ pa_card *pa_card_new(pa_core *core, pa_card_new_data *data) {
-     PA_HASHMAP_FOREACH(port, c->ports, state)
-         port->card = c;
+@@ -176,38 +176,56 @@ pa_card *pa_card_new(pa_core *core, pa_card_new_data *data) {
+     c->preferred_input_port = data->preferred_input_port;
+     c->preferred_output_port = data->preferred_output_port;
  
 -    if (data->active_profile)
 -        if ((c->active_profile = pa_hashmap_get(c->profiles, data->active_profile)))
@@ -252,50 +273,85 @@ index f92ac87..1a6e705 100644
 -            PA_HASHMAP_FOREACH(profile, c->profiles, state)
 -                if (!c->active_profile || profile->priority > c->active_profile->priority)
 -                    c->active_profile = profile;
--        }
--        pa_assert(c->active_profile);
-+void pa_card_put(pa_card *card) {
++void pa_card_choose_initial_profile(pa_card *card) {
 +    pa_card_profile *profile;
 +    void *state;
++    pa_card_profile *best = NULL;
 +
 +    pa_assert(card);
 +
++    /* By default, pick the highest priority profile that is not unavailable,
++     * or if all profiles are unavailable, pick the profile with the highest
++     * priority regardless of its availability. */
++
 +    PA_HASHMAP_FOREACH(profile, card->profiles, state) {
 +        if (profile->available == PA_AVAILABLE_NO)
 +            continue;
 +
-+        if (!card->active_profile || profile->priority > card->active_profile->priority)
-+            card->active_profile = profile;
++        if (!best || profile->priority > best->priority)
++            best = profile;
++    }
++
++    if (!best) {
++        PA_HASHMAP_FOREACH(profile, card->profiles, state) {
++            if (!best || profile->priority > best->priority)
++                best = profile;
+         }
+-        pa_assert(c->active_profile);
      }
++    pa_assert(best);
  
 -    pa_device_init_description(c->proplist, c);
 -    pa_device_init_icon(c->proplist, true);
 -    pa_device_init_intended_roles(c->proplist);
-+    /* If all profiles are unavailable, then we still need to pick one */
-+    if (!card->active_profile) {
-+        PA_HASHMAP_FOREACH(profile, card->profiles, state)
-+            if (!card->active_profile || profile->priority > card->active_profile->priority)
-+                card->active_profile = profile;
-+    }
-+    pa_assert(card->active_profile);
++    card->active_profile = best;
++    card->save_profile = false;
  
 -    pa_assert_se(pa_idxset_put(core->cards, c, &c->index) >= 0);
-+    pa_hook_fire(&card->core->hooks[PA_CORE_HOOK_CARD_NEW], card);
++    /* Let policy modules override the default. */
++    pa_hook_fire(&card->core->hooks[PA_CORE_HOOK_CARD_CHOOSE_INITIAL_PROFILE], card);
++}
  
 -    pa_log_info("Created %u \"%s\"", c->index, c->name);
 -    pa_subscription_post(core, PA_SUBSCRIPTION_EVENT_CARD|PA_SUBSCRIPTION_EVENT_NEW, c->index);
-+    pa_assert_se(pa_idxset_put(card->core->cards, card, &card->index) >= 0);
-+    card->state = PA_CARD_STATE_LINKED;
++void pa_card_put(pa_card *card) {
++    pa_assert(card);
  
 -    pa_hook_fire(&core->hooks[PA_CORE_HOOK_CARD_PUT], c);
 -    return c;
++    pa_assert_se(pa_idxset_put(card->core->cards, card, &card->index) >= 0);
++    card->linked = true;
++
 +    pa_log_info("Created %u \"%s\"", card->index, card->name);
 +    pa_hook_fire(&card->core->hooks[PA_CORE_HOOK_CARD_PUT], card);
 +    pa_subscription_post(card->core, PA_SUBSCRIPTION_EVENT_CARD|PA_SUBSCRIPTION_EVENT_NEW, card->index);
  }
  
  void pa_card_free(pa_card *c) {
-@@ -306,20 +306,27 @@ int pa_card_set_profile(pa_card *c, pa_card_profile *profile, bool save) {
+@@ -218,15 +236,15 @@ void pa_card_free(pa_card *c) {
+ 
+     core = c->core;
+ 
+-    pa_hook_fire(&core->hooks[PA_CORE_HOOK_CARD_UNLINK], c);
+-
+-    pa_namereg_unregister(core, c->name);
+-
+-    pa_idxset_remove_by_data(c->core->cards, c, NULL);
++    if (c->linked) {
++        pa_hook_fire(&core->hooks[PA_CORE_HOOK_CARD_UNLINK], c);
+ 
+-    pa_log_info("Freed %u \"%s\"", c->index, c->name);
++        pa_idxset_remove_by_data(c->core->cards, c, NULL);
++        pa_log_info("Freed %u \"%s\"", c->index, c->name);
++        pa_subscription_post(c->core, PA_SUBSCRIPTION_EVENT_CARD|PA_SUBSCRIPTION_EVENT_REMOVE, c->index);
++    }
+ 
+-    pa_subscription_post(c->core, PA_SUBSCRIPTION_EVENT_CARD|PA_SUBSCRIPTION_EVENT_REMOVE, c->index);
++    pa_namereg_unregister(core, c->name);
+ 
+     pa_assert(pa_idxset_isempty(c->sinks));
+     pa_idxset_free(c->sinks, NULL);
+@@ -298,20 +316,27 @@ int pa_card_set_profile(pa_card *c, pa_card_profile *profile, bool save) {
          return 0;
      }
  
@@ -307,7 +363,7 @@ index f92ac87..1a6e705 100644
 +     * be probably good to change this so that also the initial profile can be
 +     * set up in set_profile(), but if set_profile() fails, that would need
 +     * some better handling than what we do here currently. */
-+    if (c->state != PA_CARD_STATE_INIT && (r = c->set_profile(c, profile)) < 0)
++    if (c->linked && (r = c->set_profile(c, profile)) < 0)
          return r;
  
 -    pa_subscription_post(c->core, PA_SUBSCRIPTION_EVENT_CARD|PA_SUBSCRIPTION_EVENT_CHANGE, c->index);
@@ -321,7 +377,7 @@ index f92ac87..1a6e705 100644
          update_port_preferred_profile(c);
  
 -    pa_hook_fire(&c->core->hooks[PA_CORE_HOOK_CARD_PROFILE_CHANGED], c);
-+    if (c->state != PA_CARD_STATE_INIT) {
++    if (c->linked) {
 +        pa_log_info("Changed profile of card %u \"%s\" to %s", c->index, c->name, profile->name);
 +        pa_hook_fire(&c->core->hooks[PA_CORE_HOOK_CARD_PROFILE_CHANGED], c);
 +        pa_subscription_post(c->core, PA_SUBSCRIPTION_EVENT_CARD|PA_SUBSCRIPTION_EVENT_CHANGE, c->index);
@@ -330,37 +386,44 @@ index f92ac87..1a6e705 100644
      return 0;
  }
 diff --git a/src/pulsecore/card.h b/src/pulsecore/card.h
-index fff9057..a944301 100644
+index d4970e3..fd1fe0a 100644
 --- a/src/pulsecore/card.h
 +++ b/src/pulsecore/card.h
-@@ -34,6 +34,11 @@ typedef enum pa_available {
-     PA_AVAILABLE_YES = 2,
- } pa_available_t;
- 
-+typedef enum pa_card_state {
-+    PA_CARD_STATE_INIT,
-+    PA_CARD_STATE_LINKED,
-+} pa_card_state_t;
+@@ -86,6 +86,8 @@ struct pa_card {
+ 
+     pa_suspend_cause_t suspend_cause;
+ 
++    bool linked;
 +
- struct pa_card_profile {
-     pa_card *card;
-     char *name;
-@@ -66,6 +71,7 @@ struct pa_card_profile {
- 
- struct pa_card {
-     uint32_t index;
-+    pa_card_state_t state;
-     pa_core *core;
- 
-     char *name;
-@@ -120,6 +126,7 @@ void pa_card_new_data_set_profile(pa_card_new_data *data, const char *profile);
+     void *userdata;
+ 
+     int (*set_profile)(pa_card *c, pa_card_profile *profile);
+@@ -128,6 +130,13 @@ void pa_card_new_data_set_preferred_port(pa_card_new_data *data, pa_direction_t
  void pa_card_new_data_done(pa_card_new_data *data);
  
  pa_card *pa_card_new(pa_core *c, pa_card_new_data *data);
++
++/* Select the initial card profile according to the configured policies. This
++ * must be called between pa_card_new() and pa_card_put(), after the port and
++ * profile availablities have been initialized. */
++void pa_card_choose_initial_profile(pa_card *card);
++
 +void pa_card_put(pa_card *c);
  void pa_card_free(pa_card *c);
  
  void pa_card_add_profile(pa_card *c, pa_card_profile *profile);
+diff --git a/src/pulsecore/core.h b/src/pulsecore/core.h
+index 00d7f2f..802111b 100644
+--- a/src/pulsecore/core.h
++++ b/src/pulsecore/core.h
+@@ -118,6 +118,7 @@ typedef enum pa_core_hook {
+     PA_CORE_HOOK_CLIENT_PROPLIST_CHANGED,
+     PA_CORE_HOOK_CLIENT_SEND_EVENT,
+     PA_CORE_HOOK_CARD_NEW,
++    PA_CORE_HOOK_CARD_CHOOSE_INITIAL_PROFILE,
+     PA_CORE_HOOK_CARD_PUT,
+     PA_CORE_HOOK_CARD_UNLINK,
+     PA_CORE_HOOK_CARD_PREFERRED_PORT_CHANGED,
 -- 
-2.7.0
+2.8.1
 
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/0004-card-remove-pa_card_new_data.active_profile.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/0004-card-remove-pa_card_new_data.active_profile.patch
new file mode 100644
index 0000000..480f2ce
--- /dev/null
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio/0004-card-remove-pa_card_new_data.active_profile.patch
@@ -0,0 +1,72 @@
+From 375bc56fd3d66f40a9650224e5bfea4002494ade Mon Sep 17 00:00:00 2001
+From: Tanu Kaskinen <tanuk@iki.fi>
+Date: Fri, 23 Oct 2015 13:50:35 +0300
+Subject: [PATCH 4/5] card: remove pa_card_new_data.active_profile
+
+It's not being used any more.
+
+Upstream-Status: Accepted [expected in 10.0]
+
+Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
+---
+ src/pulsecore/card.c | 8 --------
+ src/pulsecore/card.h | 5 -----
+ 2 files changed, 13 deletions(-)
+
+diff --git a/src/pulsecore/card.c b/src/pulsecore/card.c
+index a0c3d93..bc5b75b 100644
+--- a/src/pulsecore/card.c
++++ b/src/pulsecore/card.c
+@@ -96,13 +96,6 @@ void pa_card_new_data_set_name(pa_card_new_data *data, const char *name) {
+     data->name = pa_xstrdup(name);
+ }
+ 
+-void pa_card_new_data_set_profile(pa_card_new_data *data, const char *profile) {
+-    pa_assert(data);
+-
+-    pa_xfree(data->active_profile);
+-    data->active_profile = pa_xstrdup(profile);
+-}
+-
+ void pa_card_new_data_set_preferred_port(pa_card_new_data *data, pa_direction_t direction, pa_device_port *port) {
+     pa_assert(data);
+ 
+@@ -125,7 +118,6 @@ void pa_card_new_data_done(pa_card_new_data *data) {
+         pa_hashmap_free(data->ports);
+ 
+     pa_xfree(data->name);
+-    pa_xfree(data->active_profile);
+ }
+ 
+ pa_card *pa_card_new(pa_core *core, pa_card_new_data *data) {
+diff --git a/src/pulsecore/card.h b/src/pulsecore/card.h
+index fd1fe0a..5699475 100644
+--- a/src/pulsecore/card.h
++++ b/src/pulsecore/card.h
+@@ -101,15 +101,11 @@ typedef struct pa_card_new_data {
+     pa_module *module;
+ 
+     pa_hashmap *profiles;
+-    char *active_profile;
+-
+     pa_hashmap *ports;
+     pa_device_port *preferred_input_port;
+     pa_device_port *preferred_output_port;
+ 
+     bool namereg_fail:1;
+-
+-    bool save_profile:1;
+ } pa_card_new_data;
+ 
+ typedef struct {
+@@ -125,7 +121,6 @@ void pa_card_profile_set_available(pa_card_profile *c, pa_available_t available)
+ 
+ pa_card_new_data *pa_card_new_data_init(pa_card_new_data *data);
+ void pa_card_new_data_set_name(pa_card_new_data *data, const char *name);
+-void pa_card_new_data_set_profile(pa_card_new_data *data, const char *profile);
+ void pa_card_new_data_set_preferred_port(pa_card_new_data *data, pa_direction_t direction, pa_device_port *port);
+ void pa_card_new_data_done(pa_card_new_data *data);
+ 
+-- 
+2.8.1
+
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/0004-alsa-set-availability-for-some-unavailable-profiles.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/0005-alsa-set-availability-for-some-unavailable-profiles.patch
similarity index 74%
rename from meta/recipes-multimedia/pulseaudio/pulseaudio/0004-alsa-set-availability-for-some-unavailable-profiles.patch
rename to meta/recipes-multimedia/pulseaudio/pulseaudio/0005-alsa-set-availability-for-some-unavailable-profiles.patch
index e0efa70..5563d2c 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio/0004-alsa-set-availability-for-some-unavailable-profiles.patch
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio/0005-alsa-set-availability-for-some-unavailable-profiles.patch
@@ -1,7 +1,7 @@
-From 690d567e298f6687b61c82660b051df5b25482ee Mon Sep 17 00:00:00 2001
+From ae6a01ba204b480bda6a5b4431be3d22e53a7006 Mon Sep 17 00:00:00 2001
 From: Tanu Kaskinen <tanuk@iki.fi>
 Date: Fri, 23 Oct 2015 13:37:11 +0300
-Subject: [PATCH 4/4] alsa: set availability for (some) unavailable profiles
+Subject: [PATCH 5/5] alsa: set availability for (some) unavailable profiles
 
 The alsa card hasn't so far set any availability for profiles. That
 caused an issue with some HDMI hardware: the sound card has two HDMI
@@ -22,50 +22,46 @@ pa_card_profile, however.
 
 BugLink: https://bugzilla.yoctoproject.org/show_bug.cgi?id=8448
 
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-
-Rebased on 8.0.
-
-Upstream-Status: Denied [The patch set needs some work to be accepted.
-The review thread:
-http://thread.gmane.org/gmane.comp.audio.pulseaudio.general/24301]
+Upstream-Status: Accepted [expected in 10.0]
 
 Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
 ---
- src/modules/alsa/module-alsa-card.c | 25 +++++++++++++++++++++++++
- 1 file changed, 25 insertions(+)
+ src/modules/alsa/module-alsa-card.c | 27 +++++++++++++++++++++++++++
+ 1 file changed, 27 insertions(+)
 
 diff --git a/src/modules/alsa/module-alsa-card.c b/src/modules/alsa/module-alsa-card.c
-index fe240f0..bdbdc12 100644
+index 1976230..323e08a 100644
 --- a/src/modules/alsa/module-alsa-card.c
 +++ b/src/modules/alsa/module-alsa-card.c
-@@ -366,6 +366,8 @@ static int report_jack_state(snd_mixer_elem_t *melem, unsigned int mask) {
+@@ -366,6 +366,7 @@ static int report_jack_state(snd_mixer_elem_t *melem, unsigned int mask) {
      void *state;
      pa_alsa_jack *jack;
      struct temp_port_avail *tp, *tports;
-+    pa_device_port *port;
 +    pa_card_profile *profile;
  
      pa_assert(u);
  
-@@ -412,6 +414,29 @@ static int report_jack_state(snd_mixer_elem_t *melem, unsigned int mask) {
+@@ -426,6 +427,32 @@ static int report_jack_state(snd_mixer_elem_t *melem, unsigned int mask) {
+         if (tp->avail == PA_AVAILABLE_NO)
             pa_device_port_set_available(tp->port, tp->avail);
  
-     pa_xfree(tports);
-+
 +    /* Update profile availabilities. The logic could be improved; for now we
 +     * only set obviously unavailable profiles (those that contain only
 +     * unavailable ports) to PA_AVAILABLE_NO and all others to
 +     * PA_AVAILABLE_UNKNOWN. */
 +    PA_HASHMAP_FOREACH(profile, u->card->profiles, state) {
++        pa_device_port *port;
 +        void *state2;
 +        pa_available_t available = PA_AVAILABLE_NO;
 +
 +        /* Don't touch the "off" profile. */
-+        if (pa_hashmap_size(profile->ports) == 0)
++        if (profile->n_sources == 0 && profile->n_sinks == 0)
 +            continue;
 +
-+        PA_HASHMAP_FOREACH(port, profile->ports, state2) {
++        PA_HASHMAP_FOREACH(port, u->card->ports, state2) {
++            if (!pa_hashmap_get(port->profiles, profile->name))
++                continue;
++
 +            if (port->available != PA_AVAILABLE_NO) {
 +                available = PA_AVAILABLE_UNKNOWN;
 +                break;
@@ -75,9 +71,9 @@ index fe240f0..bdbdc12 100644
 +        pa_card_profile_set_available(profile, available);
 +    }
 +
+     pa_xfree(tports);
      return 0;
  }
- 
 -- 
-2.7.0
+2.8.1
 
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_8.0.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_9.0.bb
similarity index 54%
rename from meta/recipes-multimedia/pulseaudio/pulseaudio_8.0.bb
rename to meta/recipes-multimedia/pulseaudio/pulseaudio_9.0.bb
index b01ba8f..00f5442 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_8.0.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_9.0.bb
@@ -3,15 +3,15 @@ require pulseaudio.inc
 SRC_URI = "http://freedesktop.org/software/pulseaudio/releases/${BP}.tar.xz \
            file://0001-padsp-Make-it-compile-on-musl.patch \
            file://0001-client-conf-Add-allow-autospawn-for-root.patch \
-           file://volatiles.04_pulse \
-           file://0001-card-add-pa_card_profile.ports.patch \
-           file://0002-alsa-bluetooth-fail-if-user-requested-profile-doesn-.patch \
+           file://0001-alsa-bluetooth-fail-if-user-requested-profile-doesn-.patch \
+           file://0002-card-don-t-allow-the-CARD_NEW-hook-to-fail.patch \
            file://0003-card-move-profile-selection-after-pa_card_new.patch \
-           file://0004-alsa-set-availability-for-some-unavailable-profiles.patch \
-           file://0001-Revert-module-switch-on-port-available-Route-to-pref.patch \
+           file://0004-card-remove-pa_card_new_data.active_profile.patch \
+           file://0005-alsa-set-availability-for-some-unavailable-profiles.patch \
+           file://volatiles.04_pulse \
 "
-SRC_URI[md5sum] = "8678442ba0bb4b4c33ac6f62542962df"
-SRC_URI[sha256sum] = "690eefe28633466cfd1ab9d85ebfa9376f6b622deec6bfee5091ac9737cd1989"
+SRC_URI[md5sum] = "da7162541b3a9bc20576dbd0d7d1489a"
+SRC_URI[sha256sum] = "c3d3d66b827f18fbe903fe3df647013f09fc1e2191c035be1ee2d82a9e404686"
 
 do_compile_prepend() {
     mkdir -p ${S}/libltdl
-- 
2.8.1


