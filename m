Return-Path: <tanuk@iki.fi>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
	[66.111.4.25])
	by mail.openembedded.org (Postfix) with ESMTP id D6AC06012C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Feb 2016 16:56:30 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id C06D8216DE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Feb 2016 11:56:31 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
	by compute5.internal (MEProxy); Wed, 17 Feb 2016 11:56:31 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=date:from:in-reply-to:in-reply-to
	:message-id:references:references:subject:to:x-sasl-enc
	:x-sasl-enc; s=smtpout; bh=CeI2BXRVSMZ5aJ05aNwCRFn6q5k=; b=VOBio
	k+5PJzv21S9F6ew/ORgHf/G9Dhrrw12y48PIxxSDUNiWLr9H/XzJAhPkJo9QjCvP
	/WOTSw+tizP1YpDeKflAVvVxDiPkN9qK+CPVLcZwc1SL0l+TY2RLsonh9ww+o9u9
	twMUUns62wtHzw7/V3Svdp0nUR8mZfNVrSAVO4=
X-Sasl-enc: lsXRZkjOpZRtgs6teHFnklEAZhk5cyjrpdQIMDJ0fwMW 1455728190
Received: from laptop.tanuk.dy.fi (a88-114-110-232.elisa-laajakaista.fi
	[88.114.110.232])
	by mail.messagingengine.com (Postfix) with ESMTPA id 96E28C00020
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Feb 2016 11:56:30 -0500 (EST)
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Feb 2016 18:56:16 +0200
Message-Id: <f689606ffa995aa6ccd7bdd4436a8456dc353ba6.1455727967.git.tanuk@iki.fi>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1455727967.git.tanuk@iki.fi>
References: <cover.1455727967.git.tanuk@iki.fi>
In-Reply-To: <cover.1455727967.git.tanuk@iki.fi>
References: <cover.1455727967.git.tanuk@iki.fi>
Subject: [PATCH 4/4] pulseaudio: 6.0 -> 8.0
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
X-List-Received-Date: Wed, 17 Feb 2016 16:56:31 -0000

Release notes for 7.0:
https://wiki.freedesktop.org/www/Software/PulseAudio/Notes/7.0/

Release notes for 8.0:
https://wiki.freedesktop.org/www/Software/PulseAudio/Notes/8.0/

7.0 added support for soxr resamplers, but neither oe-core nor meta-oe
have libsoxr packaged. The default resampler is still speexdsp based,
so most people wouldn't be using the soxr resamplers anyway. If
someone cares enough to package soxr, then we can enable the feature.

Bash completions moved in 7.0 from /etc to the standard location under
/usr/share/bash-completion. We now use the bash-completion class to
package the completion files.

The private library libpulsecore moved from /usr/lib to
/usr/lib/pulseaudio.

The new routing features advertised in the 8.0 release notes are
reverted for now, because they caused regressions. I'll remove the
revert once a proper fix is available.

Removed two patches, because they are included in the new release.

Rebased three patches.

Updated Upstream-Status tags to reflect the current situation.

Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |   8 +-
 ...le-switch-on-port-available-Route-to-pref.patch | 268 +++++++++++++++++++++
 .../0001-card-add-pa_card_profile.ports.patch      | 101 +++-----
 ...-client-conf-Add-allow-autospawn-for-root.patch |   7 +-
 ...onf-parser-add-support-for-.d-directories.patch | 196 ---------------
 ...oth-fail-if-user-requested-profile-doesn-.patch |   7 +-
 ...-move-profile-selection-after-pa_card_new.patch | 131 +++++-----
 ...vailability-for-some-unavailable-profiles.patch |  32 ++-
 .../pulseaudio/fix-git-version-gen.patch           |  24 --
 .../{pulseaudio_6.0.bb => pulseaudio_8.0.bb}       |   7 +-
 10 files changed, 413 insertions(+), 368 deletions(-)
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0001-Revert-module-switch-on-port-available-Route-to-pref.patch
 delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0001-conf-parser-add-support-for-.d-directories.patch
 delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/fix-git-version-gen.patch
 rename meta/recipes-multimedia/pulseaudio/{pulseaudio_6.0.bb => pulseaudio_8.0.bb} (72%)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index b278115..0b05ce4 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -12,7 +12,7 @@ DEPENDS = "libatomic-ops libsndfile1 libtool"
 DEPENDS += "udev alsa-lib glib-2.0 gconf"
 DEPENDS += "json-c gdbm speexdsp libxml-parser-perl-native libcap"
 
-inherit autotools pkgconfig useradd gettext perlnative bluetooth systemd
+inherit autotools bash-completion pkgconfig useradd gettext perlnative bluetooth systemd
 
 # *.desktop rules wont be generated during configure and build will fail
 # if using --disable-nls
@@ -32,6 +32,10 @@ EXTRA_OECONF = "\
                 ac_cv_header_valgrind_memcheck_h=no \
 "
 
+# soxr (the SoX Resampler library) doesn't seem to be currently packaged in
+# oe-core nor meta-oe, so let's not add a PACKAGECONFIG entry for it for now.
+EXTRA_OECONF += "--without-soxr"
+
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', '${BLUEZ}', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
@@ -101,7 +105,7 @@ RREPLACES_pulseaudio-server = "libpulse-bin libpulse-conf"
 
 PACKAGES_DYNAMIC += "^pulseaudio-lib-.* ^pulseaudio-module-.*"
 
-FILES_libpulsecore = "${libdir}/libpulsecore*.so"
+FILES_libpulsecore = "${libdir}/pulseaudio/libpulsecore*.so"
 FILES_libpulsecommon = "${libdir}/pulseaudio/libpulsecommon*.so"
 
 # client.conf configures the behaviour of libpulse, so it belongs in the same
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-Revert-module-switch-on-port-available-Route-to-pref.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-Revert-module-switch-on-port-available-Route-to-pref.patch
new file mode 100644
index 0000000..1c1e2fb
--- /dev/null
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-Revert-module-switch-on-port-available-Route-to-pref.patch
@@ -0,0 +1,268 @@
+From b8b9b3da94a0c27090ceba243fdf54fb518c5489 Mon Sep 17 00:00:00 2001
+From: Tanu Kaskinen <tanuk@iki.fi>
+Date: Mon, 1 Feb 2016 15:34:59 +0200
+Subject: [PATCH] Revert "module-switch-on-port-available: Route to preferred
+ profile"
+
+This reverts commit e87100d41ef6d14f8dc7f803582191d9f8d8f183.
+
+The reverted commit had some unwanted consequences:
+https://bugs.freedesktop.org/show_bug.cgi?id=93903
+https://bugs.freedesktop.org/show_bug.cgi?id=93946
+
+The first regression has a fix here:
+https://patchwork.freedesktop.org/patch/72053/
+
+The second regression, however, doesn't have a fix yet. Therefore,
+it's best to revert the offending patch for now.
+
+Upstream-Status: Inappropriate [Upstream plans to fix the issues
+properly.]
+
+Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
+---
+ src/modules/module-switch-on-port-available.c | 172 ++++++++++----------------
+ 1 file changed, 67 insertions(+), 105 deletions(-)
+
+diff --git a/src/modules/module-switch-on-port-available.c b/src/modules/module-switch-on-port-available.c
+index 5dd9786..8de68a3 100644
+--- a/src/modules/module-switch-on-port-available.c
++++ b/src/modules/module-switch-on-port-available.c
+@@ -74,25 +74,22 @@ static bool profile_good_for_input(pa_card_profile *profile) {
+ static int try_to_switch_profile(pa_device_port *port) {
+     pa_card_profile *best_profile = NULL, *profile;
+     void *state;
+-    unsigned best_prio = 0;
+ 
+-    pa_log_debug("Finding best profile for port %s, preferred = %s",
+-                 port->name, pa_strnull(port->preferred_profile));
++    pa_log_debug("Finding best profile");
+ 
+     PA_HASHMAP_FOREACH(profile, port->profiles, state) {
+         bool good = false;
+-        const char *name;
+-        unsigned prio = profile->priority;
++
++        if (best_profile && best_profile->priority >= profile->priority)
++            continue;
+ 
+         /* We make a best effort to keep other direction unchanged */
+         switch (port->direction) {
+             case PA_DIRECTION_OUTPUT:
+-                name = profile->output_name;
+                 good = profile_good_for_output(profile);
+                 break;
+ 
+             case PA_DIRECTION_INPUT:
+-                name = profile->input_name;
+                 good = profile_good_for_input(profile);
+                 break;
+         }
+@@ -100,15 +97,7 @@ static int try_to_switch_profile(pa_device_port *port) {
+         if (!good)
+             continue;
+ 
+-        /* Give a high bonus in case this is the preferred profile */
+-        if (port->preferred_profile && pa_streq(name ? name : profile->name, port->preferred_profile))
+-            prio += 1000000;
+-
+-        if (best_profile && best_prio >= prio)
+-            continue;
+-
+         best_profile = profile;
+-        best_prio = prio;
+     }
+ 
+     if (!best_profile) {
+@@ -124,125 +113,98 @@ static int try_to_switch_profile(pa_device_port *port) {
+     return 0;
+ }
+ 
+-struct port_pointers {
+-    pa_device_port *port;
+-    pa_sink *sink;
+-    pa_source *source;
+-    bool is_possible_profile_active;
+-    bool is_preferred_profile_active;
+-    bool is_port_active;
+-};
+-
+-static const char* profile_name_for_dir(pa_card_profile *cp, pa_direction_t dir) {
+-    if (dir == PA_DIRECTION_OUTPUT && cp->output_name)
+-        return cp->output_name;
+-    if (dir == PA_DIRECTION_INPUT && cp->input_name)
+-        return cp->input_name;
+-    return cp->name;
+-}
+-
+-static struct port_pointers find_port_pointers(pa_device_port *port) {
+-    struct port_pointers pp = { .port = port };
++static void find_sink_and_source(pa_card *card, pa_device_port *port, pa_sink **si, pa_source **so) {
++    pa_sink *sink = NULL;
++    pa_source *source = NULL;
+     uint32_t state;
+-    pa_card *card;
+-
+-    pa_assert(port);
+-    pa_assert_se(card = port->card);
+ 
+     switch (port->direction) {
+         case PA_DIRECTION_OUTPUT:
+-            PA_IDXSET_FOREACH(pp.sink, card->sinks, state)
+-                if (port == pa_hashmap_get(pp.sink->ports, port->name))
++            PA_IDXSET_FOREACH(sink, card->sinks, state)
++                if (port == pa_hashmap_get(sink->ports, port->name))
+                     break;
+             break;
+ 
+         case PA_DIRECTION_INPUT:
+-            PA_IDXSET_FOREACH(pp.source, card->sources, state)
+-                if (port == pa_hashmap_get(pp.source->ports, port->name))
++            PA_IDXSET_FOREACH(source, card->sources, state)
++                if (port == pa_hashmap_get(source->ports, port->name))
+                     break;
+             break;
+     }
+ 
+-    pp.is_possible_profile_active =
+-        card->active_profile == pa_hashmap_get(port->profiles, card->active_profile->name);
+-    pp.is_preferred_profile_active = pp.is_possible_profile_active && (!port->preferred_profile ||
+-        pa_safe_streq(port->preferred_profile, profile_name_for_dir(card->active_profile, port->direction)));
+-    pp.is_port_active = (pp.sink && pp.sink->active_port == port) || (pp.source && pp.source->active_port == port);
+-
+-    return pp;
++    *si = sink;
++    *so = source;
+ }
+ 
+-/* Switches to a port, switching profiles if necessary or preferred */
+-static bool switch_to_port(pa_device_port *port) {
+-    struct port_pointers pp = find_port_pointers(port);
++static pa_hook_result_t port_available_hook_callback(pa_core *c, pa_device_port *port, void* userdata) {
++    pa_card* card;
++    pa_sink *sink;
++    pa_source *source;
++    bool is_active_profile, is_active_port;
+ 
+-    if (pp.is_port_active)
+-        return true; /* Already selected */
++    if (port->available == PA_AVAILABLE_UNKNOWN)
++        return PA_HOOK_OK;
+ 
+-    pa_log_debug("Trying to switch to port %s", port->name);
+-    if (!pp.is_preferred_profile_active) {
+-        if (try_to_switch_profile(port) < 0) {
+-            if (pp.is_possible_profile_active)
+-                return false;
+-        }
+-        else
+-            /* Now that profile has changed, our sink and source pointers must be updated */
+-            pp = find_port_pointers(port);
+-    }
++    card = port->card;
+ 
+-    if (pp.source)
+-        pa_source_set_port(pp.source, port->name, false);
+-    if (pp.sink)
+-        pa_sink_set_port(pp.sink, port->name, false);
+-    return true;
+-}
++    if (!card) {
++        pa_log_warn("Port %s does not have a card", port->name);
++        return PA_HOOK_OK;
++    }
+ 
+-/* Switches away from a port, switching profiles if necessary or preferred */
+-static bool switch_from_port(pa_device_port *port) {
+-    struct port_pointers pp = find_port_pointers(port);
+-    pa_device_port *p, *best_port = NULL;
+-    void *state;
++    if (pa_idxset_size(card->sinks) == 0 && pa_idxset_size(card->sources) == 0)
++        /* This card is not initialized yet. We'll handle it in
++           sink_new / source_new callbacks later. */
++        return PA_HOOK_OK;
+ 
+-    if (!pp.is_port_active)
+-        return true; /* Already deselected */
++    find_sink_and_source(card, port, &sink, &source);
+ 
+-    /* Try to find a good enough port to switch to */
+-    PA_HASHMAP_FOREACH(p, port->card->ports, state)
+-        if (p->direction == port->direction && p != port && p->available != PA_AVAILABLE_NO &&
+-           (!best_port || best_port->priority < p->priority))
+-           best_port = p;
++    is_active_profile = card->active_profile == pa_hashmap_get(port->profiles, card->active_profile->name);
++    is_active_port = (sink && sink->active_port == port) || (source && source->active_port == port);
+ 
+-    pa_log_debug("Trying to switch away from port %s, found %s", port->name, best_port ? best_port->name : "no better option");
++    if (port->available == PA_AVAILABLE_NO && !is_active_port)
++        return PA_HOOK_OK;
+ 
+-    if (best_port)
+-        return switch_to_port(best_port);
++    if (port->available == PA_AVAILABLE_YES) {
++        if (is_active_port)
++            return PA_HOOK_OK;
+ 
+-    return false;
+-}
++        if (!is_active_profile) {
++            if (try_to_switch_profile(port) < 0)
++                return PA_HOOK_OK;
+ 
++            pa_assert(card->active_profile == pa_hashmap_get(port->profiles, card->active_profile->name));
+ 
+-static pa_hook_result_t port_available_hook_callback(pa_core *c, pa_device_port *port, void* userdata) {
+-    pa_assert(port);
++            /* Now that profile has changed, our sink and source pointers must be updated */
++            find_sink_and_source(card, port, &sink, &source);
++        }
+ 
+-    if (!port->card) {
+-        pa_log_warn("Port %s does not have a card", port->name);
+-        return PA_HOOK_OK;
++        if (source)
++            pa_source_set_port(source, port->name, false);
++        if (sink)
++            pa_sink_set_port(sink, port->name, false);
+     }
+ 
+-    if (pa_idxset_size(port->card->sinks) == 0 && pa_idxset_size(port->card->sources) == 0)
+-        /* This card is not initialized yet. We'll handle it in
+-           sink_new / source_new callbacks later. */
+-        return PA_HOOK_OK;
++    if (port->available == PA_AVAILABLE_NO) {
++        if (sink) {
++            pa_device_port *p2 = pa_device_port_find_best(sink->ports);
++
++            if (p2 && p2->available != PA_AVAILABLE_NO)
++                pa_sink_set_port(sink, p2->name, false);
++            else {
++                /* Maybe try to switch to another profile? */
++            }
++        }
+ 
+-    switch (port->available) {
+-    case PA_AVAILABLE_YES:
+-        switch_to_port(port);
+-        break;
+-    case PA_AVAILABLE_NO:
+-        switch_from_port(port);
+-        break;
+-    default:
+-        break;
++        if (source) {
++            pa_device_port *p2 = pa_device_port_find_best(source->ports);
++
++            if (p2 && p2->available != PA_AVAILABLE_NO)
++                pa_source_set_port(source, p2->name, false);
++            else {
++                /* Maybe try to switch to another profile? */
++            }
++        }
+     }
+ 
+     return PA_HOOK_OK;
+-- 
+2.7.0
+
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-card-add-pa_card_profile.ports.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-card-add-pa_card_profile.ports.patch
index 97b2e40..84c9519 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-card-add-pa_card_profile.ports.patch
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-card-add-pa_card_profile.ports.patch
@@ -1,4 +1,4 @@
-From 6f814b40a01d03f93b36184c19339033949de472 Mon Sep 17 00:00:00 2001
+From d1c02971867bea10afcafc82c965414012c4d6bd Mon Sep 17 00:00:00 2001
 From: Tanu Kaskinen <tanuk@iki.fi>
 Date: Fri, 23 Oct 2015 12:23:13 +0300
 Subject: [PATCH 1/4] card: add pa_card_profile.ports
@@ -9,23 +9,30 @@ availability (implemented in a later patch).
 
 http://bugzilla.yoctoproject.org/show_bug.cgi?id=8448
 
-Upstream-Status: Submitted [http://lists.freedesktop.org/archives/pulseaudio-discuss/2015-October/024614.html]
 Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+
+Rebased on 8.0.
+
+Upstream-Status: Denied [The patch set needs some work to be accepted.
+The review thread:
+http://thread.gmane.org/gmane.comp.audio.pulseaudio.general/24301]
+
+Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
 ---
  src/modules/alsa/alsa-mixer.c                |  4 +++-
  src/modules/alsa/alsa-ucm.c                  |  1 +
  src/modules/bluetooth/module-bluez4-device.c |  6 ++++++
  src/modules/bluetooth/module-bluez5-device.c |  6 ++++++
- src/pulsecore/card.c                         | 16 ++++++++++++++++
- src/pulsecore/card.h                         | 18 ++++++++++++------
+ src/pulsecore/card.c                         | 15 +++++++++++++++
+ src/pulsecore/card.h                         |  4 ++++
  src/pulsecore/device-port.c                  |  7 ++++++-
- 7 files changed, 50 insertions(+), 8 deletions(-)
+ 7 files changed, 41 insertions(+), 2 deletions(-)
 
 diff --git a/src/modules/alsa/alsa-mixer.c b/src/modules/alsa/alsa-mixer.c
-index 47cbd14..c5b82b0 100644
+index 1fe2a02..5b76b06 100644
 --- a/src/modules/alsa/alsa-mixer.c
 +++ b/src/modules/alsa/alsa-mixer.c
-@@ -4654,8 +4654,10 @@ static pa_device_port* device_port_alsa_init(pa_hashmap *ports, /* card ports */
+@@ -4783,8 +4783,10 @@ static pa_device_port* device_port_alsa_init(pa_hashmap *ports, /* card ports */
          path->port = p;
      }
  
@@ -38,10 +45,10 @@ index 47cbd14..c5b82b0 100644
      if (extra) {
          pa_hashmap_put(extra, p->name, p);
 diff --git a/src/modules/alsa/alsa-ucm.c b/src/modules/alsa/alsa-ucm.c
-index aa2d601..c8199d6 100644
+index 42f3242..68fcc26 100644
 --- a/src/modules/alsa/alsa-ucm.c
 +++ b/src/modules/alsa/alsa-ucm.c
-@@ -761,6 +761,7 @@ static void ucm_add_port_combination(
+@@ -791,6 +791,7 @@ static void ucm_add_port_combination(
      if (cp) {
          pa_log_debug("Adding profile %s to port %s.", cp->name, port->name);
          pa_hashmap_put(port->profiles, cp->name, cp);
@@ -50,10 +57,10 @@ index aa2d601..c8199d6 100644
  
      if (hash) {
 diff --git a/src/modules/bluetooth/module-bluez4-device.c b/src/modules/bluetooth/module-bluez4-device.c
-index db69d34..b40c6a0 100644
+index 9a921a5..adecb32 100644
 --- a/src/modules/bluetooth/module-bluez4-device.c
 +++ b/src/modules/bluetooth/module-bluez4-device.c
-@@ -2183,6 +2183,7 @@ static pa_card_profile *create_card_profile(struct userdata *u, const char *uuid
+@@ -2180,6 +2180,7 @@ static pa_card_profile *create_card_profile(struct userdata *u, const char *uuid
          p->max_sink_channels = 2;
          p->max_source_channels = 0;
          pa_hashmap_put(output_port->profiles, p->name, p);
@@ -61,7 +68,7 @@ index db69d34..b40c6a0 100644
  
          d = PA_CARD_PROFILE_DATA(p);
          *d = PA_BLUEZ4_PROFILE_A2DP;
-@@ -2194,6 +2195,7 @@ static pa_card_profile *create_card_profile(struct userdata *u, const char *uuid
+@@ -2191,6 +2192,7 @@ static pa_card_profile *create_card_profile(struct userdata *u, const char *uuid
          p->max_sink_channels = 0;
          p->max_source_channels = 2;
          pa_hashmap_put(input_port->profiles, p->name, p);
@@ -69,7 +76,7 @@ index db69d34..b40c6a0 100644
  
          d = PA_CARD_PROFILE_DATA(p);
          *d = PA_BLUEZ4_PROFILE_A2DP_SOURCE;
-@@ -2206,6 +2208,8 @@ static pa_card_profile *create_card_profile(struct userdata *u, const char *uuid
+@@ -2203,6 +2205,8 @@ static pa_card_profile *create_card_profile(struct userdata *u, const char *uuid
          p->max_source_channels = 1;
          pa_hashmap_put(input_port->profiles, p->name, p);
          pa_hashmap_put(output_port->profiles, p->name, p);
@@ -78,7 +85,7 @@ index db69d34..b40c6a0 100644
  
          d = PA_CARD_PROFILE_DATA(p);
          *d = PA_BLUEZ4_PROFILE_HSP;
-@@ -2218,6 +2222,8 @@ static pa_card_profile *create_card_profile(struct userdata *u, const char *uuid
+@@ -2215,6 +2219,8 @@ static pa_card_profile *create_card_profile(struct userdata *u, const char *uuid
          p->max_source_channels = 1;
          pa_hashmap_put(input_port->profiles, p->name, p);
          pa_hashmap_put(output_port->profiles, p->name, p);
@@ -88,7 +95,7 @@ index db69d34..b40c6a0 100644
          d = PA_CARD_PROFILE_DATA(p);
          *d = PA_BLUEZ4_PROFILE_HFGW;
 diff --git a/src/modules/bluetooth/module-bluez5-device.c b/src/modules/bluetooth/module-bluez5-device.c
-index 7238e6f..3321785 100644
+index 84e6d55..b015c67 100644
 --- a/src/modules/bluetooth/module-bluez5-device.c
 +++ b/src/modules/bluetooth/module-bluez5-device.c
 @@ -1790,6 +1790,7 @@ static pa_card_profile *create_card_profile(struct userdata *u, const char *uuid
@@ -126,18 +133,18 @@ index 7238e6f..3321785 100644
          p = PA_CARD_PROFILE_DATA(cp);
          *p = PA_BLUETOOTH_PROFILE_HEADSET_AUDIO_GATEWAY;
 diff --git a/src/pulsecore/card.c b/src/pulsecore/card.c
-index 6f9391e..cc4c784 100644
+index b6cbbf7..f92ac87 100644
 --- a/src/pulsecore/card.c
 +++ b/src/pulsecore/card.c
-@@ -50,6 +50,7 @@ pa_card_profile *pa_card_profile_new(const char *name, const char *description,
-     c->n_sinks = c->n_sources = 0;
-     c->max_sink_channels = c->max_source_channels = 0;
+@@ -45,6 +45,7 @@ pa_card_profile *pa_card_profile_new(const char *name, const char *description,
+     c->name = pa_xstrdup(name);
+     c->description = pa_xstrdup(description);
      c->available = PA_AVAILABLE_UNKNOWN;
 +    c->ports = pa_hashmap_new(pa_idxset_string_hash_func, pa_idxset_string_compare_func);
  
      return c;
  }
-@@ -57,11 +58,25 @@ pa_card_profile *pa_card_profile_new(const char *name, const char *description,
+@@ -52,6 +53,14 @@ pa_card_profile *pa_card_profile_new(const char *name, const char *description,
  void pa_card_profile_free(pa_card_profile *c) {
      pa_assert(c);
  
@@ -149,8 +156,10 @@ index 6f9391e..cc4c784 100644
 +        pa_hashmap_free(c->ports);
 +    }
 +
+     pa_xfree(c->input_name);
+     pa_xfree(c->output_name);
      pa_xfree(c->name);
-     pa_xfree(c->description);
+@@ -59,6 +68,12 @@ void pa_card_profile_free(pa_card_profile *c) {
      pa_xfree(c);
  }
  
@@ -163,47 +172,11 @@ index 6f9391e..cc4c784 100644
  void pa_card_profile_set_available(pa_card_profile *c, pa_available_t available) {
      pa_core *core;
  
-@@ -198,6 +213,7 @@ pa_card *pa_card_new(pa_core *core, pa_card_new_data *data) {
- 
-     c->userdata = NULL;
-     c->set_profile = NULL;
-+    c->active_profile = NULL;
- 
-     pa_device_init_description(c->proplist, c);
-     pa_device_init_icon(c->proplist, true);
 diff --git a/src/pulsecore/card.h b/src/pulsecore/card.h
-index 3e2c004..1c33958 100644
+index 30bfc0e..fff9057 100644
 --- a/src/pulsecore/card.h
 +++ b/src/pulsecore/card.h
-@@ -22,19 +22,21 @@
- 
- typedef struct pa_card pa_card;
- 
--#include <pulse/proplist.h>
--#include <pulsecore/core.h>
--#include <pulsecore/module.h>
--#include <pulsecore/idxset.h>
--
- /* This enum replaces pa_port_available_t (defined in pulse/def.h) for
-- * internal use, so make sure both enum types stay in sync. */
-+ * internal use, so make sure both enum types stay in sync. This is defined
-+ * before the #includes, because device-port.h depends on this enum. */
- typedef enum pa_available {
-     PA_AVAILABLE_UNKNOWN = 0,
-     PA_AVAILABLE_NO = 1,
-     PA_AVAILABLE_YES = 2,
- } pa_available_t;
- 
-+#include <pulse/proplist.h>
-+#include <pulsecore/core.h>
-+#include <pulsecore/device-port.h>
-+#include <pulsecore/module.h>
-+#include <pulsecore/idxset.h>
-+
- typedef struct pa_card_profile {
-     pa_card *card;
-     char *name;
-@@ -43,6 +45,8 @@ typedef struct pa_card_profile {
+@@ -50,6 +50,8 @@ struct pa_card_profile {
      unsigned priority;
      pa_available_t available; /* PA_AVAILABLE_UNKNOWN, PA_AVAILABLE_NO or PA_AVAILABLE_YES */
  
@@ -212,7 +185,7 @@ index 3e2c004..1c33958 100644
      /* We probably want to have different properties later on here */
      unsigned n_sinks;
      unsigned n_sources;
-@@ -100,6 +104,8 @@ typedef struct pa_card_new_data {
+@@ -107,6 +109,8 @@ typedef struct pa_card_new_data {
  pa_card_profile *pa_card_profile_new(const char *name, const char *description, size_t extra);
  void pa_card_profile_free(pa_card_profile *c);
  
@@ -222,10 +195,10 @@ index 3e2c004..1c33958 100644
  void pa_card_profile_set_available(pa_card_profile *c, pa_available_t available);
  
 diff --git a/src/pulsecore/device-port.c b/src/pulsecore/device-port.c
-index cfe2a80..f16ecef 100644
+index 5807d3e..d12dfbc 100644
 --- a/src/pulsecore/device-port.c
 +++ b/src/pulsecore/device-port.c
-@@ -95,8 +95,13 @@ static void device_port_free(pa_object *o) {
+@@ -107,8 +107,13 @@ static void device_port_free(pa_object *o) {
      if (p->proplist)
          pa_proplist_free(p->proplist);
  
@@ -238,8 +211,8 @@ index cfe2a80..f16ecef 100644
          pa_hashmap_free(p->profiles);
 +    }
  
+     pa_xfree(p->preferred_profile);
      pa_xfree(p->name);
-     pa_xfree(p->description);
 -- 
-2.1.4
+2.7.0
 
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-client-conf-Add-allow-autospawn-for-root.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-client-conf-Add-allow-autospawn-for-root.patch
index d19eb7c..bc32775 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-client-conf-Add-allow-autospawn-for-root.patch
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-client-conf-Add-allow-autospawn-for-root.patch
@@ -7,7 +7,12 @@ Usually autospawning for root is a bad idea, since it can easily
 interfere with other users' PulseAudio instances, but in embedded
 environments where only root exists, autospawning is fine.
 
-Upstream-Status: Submitted [http://thread.gmane.org/gmane.comp.audio.pulseaudio.general/23549]
+Upstream-Status: Denied [Upstream hasn't so far been convinced that
+this feature is needed. The view is that running the graphical session
+as root doesn't make sense even on embedded systems, or if it does,
+running PulseAudio in the system mode should be a good solution for
+that use case. If someone can prove otherwise, the patch would
+probably be accepted.]
 
 Signed-off-by: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
 ---
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-conf-parser-add-support-for-.d-directories.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-conf-parser-add-support-for-.d-directories.patch
deleted file mode 100644
index a9f1b2a..0000000
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-conf-parser-add-support-for-.d-directories.patch
+++ /dev/null
@@ -1,196 +0,0 @@
-From 8cb643bbf0a287d67794e680d26f49c503f31053 Mon Sep 17 00:00:00 2001
-From: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
-Date: Thu, 21 May 2015 21:00:59 +0300
-Subject: [PATCH] conf-parser: add support for .d directories
-
-This allows a configuration scheme where prior to loading
-configuration from "somefile", the parser first loads configuration
-from files in directory "somefile.d". This feature is currently
-enabled only for client.conf and daemon.conf.
-
-This makes it easier to create configuration packages in distributions
-when there's need to have different configuration in different setups.
-For example, the graphical Sato environment in OpenEmbedded-core needs
-to set allow-autospawn-for-root=true in client.conf, but the default
-configuration in OpenEmbedded-core should not set that option. With
-this patch, I can create a Sato-specific package that simply installs
-50-sato.conf in /etc/pulse/client.conf.d without conflicting with the
-main client.conf file coming from a different package.
-
-Upstream-Status: Submitted [http://thread.gmane.org/gmane.comp.audio.pulseaudio.general/23592]
-
-Signed-off-by: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
----
- src/daemon/daemon-conf.c                |  2 +-
- src/modules/alsa/alsa-mixer.c           |  4 ++--
- src/modules/module-augment-properties.c |  2 +-
- src/pulse/client-conf.c                 |  2 +-
- src/pulsecore/conf-parser.c             | 42 +++++++++++++++++++++++++++++++--
- src/pulsecore/conf-parser.h             |  8 ++++++-
- 6 files changed, 52 insertions(+), 8 deletions(-)
-
-diff --git a/src/daemon/daemon-conf.c b/src/daemon/daemon-conf.c
-index 21a8edb..1332fc6 100644
---- a/src/daemon/daemon-conf.c
-+++ b/src/daemon/daemon-conf.c
-@@ -617,7 +617,7 @@ int pa_daemon_conf_load(pa_daemon_conf *c, const char *filename) {
-     ci.default_channel_map_set = ci.default_sample_spec_set = false;
-     ci.conf = c;
- 
--    r = f ? pa_config_parse(c->config_file, f, table, NULL, NULL) : 0;
-+    r = f ? pa_config_parse(c->config_file, f, table, NULL, true, NULL) : 0;
- 
-     if (r >= 0) {
- 
-diff --git a/src/modules/alsa/alsa-mixer.c b/src/modules/alsa/alsa-mixer.c
-index 2314612..988b4fe 100644
---- a/src/modules/alsa/alsa-mixer.c
-+++ b/src/modules/alsa/alsa-mixer.c
-@@ -2483,7 +2483,7 @@ pa_alsa_path* pa_alsa_path_new(const char *paths_dir, const char *fname, pa_alsa
- 
-     fn = pa_maybe_prefix_path(fname, paths_dir);
- 
--    r = pa_config_parse(fn, NULL, items, p->proplist, p);
-+    r = pa_config_parse(fn, NULL, items, p->proplist, false, p);
-     pa_xfree(fn);
- 
-     if (r < 0)
-@@ -4288,7 +4288,7 @@ pa_alsa_profile_set* pa_alsa_profile_set_new(const char *fname, const pa_channel
-                               pa_run_from_build_tree() ? PA_SRCDIR "/modules/alsa/mixer/profile-sets/" :
-                               PA_ALSA_PROFILE_SETS_DIR);
- 
--    r = pa_config_parse(fn, NULL, items, NULL, ps);
-+    r = pa_config_parse(fn, NULL, items, NULL, false, ps);
-     pa_xfree(fn);
- 
-     if (r < 0)
-diff --git a/src/modules/module-augment-properties.c b/src/modules/module-augment-properties.c
-index 42b6fd9..541f0e7 100644
---- a/src/modules/module-augment-properties.c
-+++ b/src/modules/module-augment-properties.c
-@@ -204,7 +204,7 @@ static void update_rule(struct rule *r) {
-     table[0].data = &r->application_name;
-     table[1].data = &r->icon_name;
- 
--    if (pa_config_parse(fn, NULL, table, NULL, r) < 0)
-+    if (pa_config_parse(fn, NULL, table, NULL, false, r) < 0)
-         pa_log_warn("Failed to parse .desktop file %s.", fn);
- 
-     pa_xfree(fn);
-diff --git a/src/pulse/client-conf.c b/src/pulse/client-conf.c
-index 83331f8..3c3384d 100644
---- a/src/pulse/client-conf.c
-+++ b/src/pulse/client-conf.c
-@@ -149,7 +149,7 @@ void pa_client_conf_load(pa_client_conf *c, bool load_from_x11, bool load_from_e
- 
-     f = pa_open_config_file(DEFAULT_CLIENT_CONFIG_FILE, DEFAULT_CLIENT_CONFIG_FILE_USER, ENV_CLIENT_CONFIG_FILE, &fn);
-     if (f) {
--        pa_config_parse(fn, f, table, NULL, NULL);
-+        pa_config_parse(fn, f, table, NULL, true, NULL);
-         pa_xfree(fn);
-         fclose(f);
-     }
-diff --git a/src/pulsecore/conf-parser.c b/src/pulsecore/conf-parser.c
-index 2dcd45a..d473232 100644
---- a/src/pulsecore/conf-parser.c
-+++ b/src/pulsecore/conf-parser.c
-@@ -21,6 +21,7 @@
- #include <config.h>
- #endif
- 
-+#include <dirent.h>
- #include <string.h>
- #include <stdio.h>
- #include <errno.h>
-@@ -103,7 +104,7 @@ static int parse_line(pa_config_parser_state *state) {
-             }
-         }
- 
--        r = pa_config_parse(fn, NULL, state->item_table, state->proplist, state->userdata);
-+        r = pa_config_parse(fn, NULL, state->item_table, state->proplist, false, state->userdata);
-         pa_xfree(path);
-         return r;
-     }
-@@ -152,8 +153,13 @@ static int parse_line(pa_config_parser_state *state) {
-         return normal_assignment(state);
- }
- 
-+static int conf_filter(const struct dirent *entry) {
-+    return pa_endswith(entry->d_name, ".conf");
-+}
-+
- /* Go through the file and parse each line */
--int pa_config_parse(const char *filename, FILE *f, const pa_config_item *t, pa_proplist *proplist, void *userdata) {
-+int pa_config_parse(const char *filename, FILE *f, const pa_config_item *t, pa_proplist *proplist, bool use_dot_d,
-+                    void *userdata) {
-     int r = -1;
-     bool do_close = !f;
-     pa_config_parser_state state;
-@@ -163,6 +169,38 @@ int pa_config_parse(const char *filename, FILE *f, const pa_config_item *t, pa_p
- 
-     pa_zero(state);
- 
-+    if (use_dot_d) {
-+        char *dir_name;
-+        int n;
-+        struct dirent **entries = NULL;
-+
-+        dir_name = pa_sprintf_malloc("%s.d", filename);
-+
-+        n = scandir(dir_name, &entries, conf_filter, alphasort);
-+        if (n >= 0) {
-+            int i;
-+
-+            for (i = 0; i < n; i++) {
-+                char *filename2;
-+
-+                filename2 = pa_sprintf_malloc("%s" PA_PATH_SEP "%s", dir_name, entries[i]->d_name);
-+                pa_config_parse(filename2, NULL, t, proplist, false, userdata);
-+                pa_xfree(filename2);
-+
-+                free(entries[i]);
-+            }
-+
-+            free(entries);
-+        } else {
-+            if (errno == ENOENT)
-+                pa_log_debug("scandir(\"%s\") failed: %s", dir_name, pa_cstrerror(errno));
-+            else
-+                pa_log_warn("scandir(\"%s\") failed: %s", dir_name, pa_cstrerror(errno));
-+        }
-+
-+        pa_xfree(dir_name);
-+    }
-+
-     if (!f && !(f = pa_fopen_cloexec(filename, "r"))) {
-         if (errno == ENOENT) {
-             pa_log_debug("Failed to open configuration file '%s': %s", filename, pa_cstrerror(errno));
-diff --git a/src/pulsecore/conf-parser.h b/src/pulsecore/conf-parser.h
-index dbb6f5c..cc20d7d 100644
---- a/src/pulsecore/conf-parser.h
-+++ b/src/pulsecore/conf-parser.h
-@@ -59,6 +59,11 @@ struct pa_config_parser_state {
-  * pa_config_items in *t that is terminated by an item where lvalue is
-  * NULL.
-  *
-+ * If use_dot_d is true, then before parsing the file named by the filename
-+ * argument, the function will parse all files ending with ".conf" in
-+ * alphabetical order from a directory whose name is filename + ".d", if such
-+ * directory exists.
-+ *
-  * Some configuration files may contain a Properties section, which
-  * is a bit special. Normally all accepted lvalues must be predefined
-  * in the pa_config_item table, but in the Properties section the
-@@ -68,7 +73,8 @@ struct pa_config_parser_state {
-  * properties, and those properties will be merged into the given
-  * proplist. If proplist is NULL, then sections named "Properties"
-  * are not allowed at all in the configuration file. */
--int pa_config_parse(const char *filename, FILE *f, const pa_config_item *t, pa_proplist *proplist, void *userdata);
-+int pa_config_parse(const char *filename, FILE *f, const pa_config_item *t, pa_proplist *proplist, bool use_dot_d,
-+                    void *userdata);
- 
- /* Generic parsers for integers, size_t, booleans and strings */
- int pa_config_parse_int(pa_config_parser_state *state);
--- 
-1.9.3
-
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/0002-alsa-bluetooth-fail-if-user-requested-profile-doesn-.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/0002-alsa-bluetooth-fail-if-user-requested-profile-doesn-.patch
index c3f217b..be3655b 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio/0002-alsa-bluetooth-fail-if-user-requested-profile-doesn-.patch
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio/0002-alsa-bluetooth-fail-if-user-requested-profile-doesn-.patch
@@ -10,8 +10,13 @@ didn't succeed.
 
 http://bugzilla.yoctoproject.org/show_bug.cgi?id=8448
 
-Upstream-Status: Submitted [http://lists.freedesktop.org/archives/pulseaudio-discuss/2015-October/024614.html]
 Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+
+Upstream-Status: Denied [The patch set needs some work to be accepted.
+The review thread:
+http://thread.gmane.org/gmane.comp.audio.pulseaudio.general/24301]
+
+Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
 ---
  src/modules/alsa/module-alsa-card.c          | 10 ++++++++--
  src/modules/bluetooth/module-bluez4-device.c |  6 ++++--
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/0003-card-move-profile-selection-after-pa_card_new.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/0003-card-move-profile-selection-after-pa_card_new.patch
index 9585f3d..0e77801 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio/0003-card-move-profile-selection-after-pa_card_new.patch
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio/0003-card-move-profile-selection-after-pa_card_new.patch
@@ -1,4 +1,4 @@
-From cc41c8a3149ef04d4aa2db3d15032605a5504658 Mon Sep 17 00:00:00 2001
+From 13e85dd1763e99d21a60323671b9a5df08bdae75 Mon Sep 17 00:00:00 2001
 From: Tanu Kaskinen <tanuk@iki.fi>
 Date: Fri, 23 Oct 2015 12:59:53 +0300
 Subject: [PATCH 3/4] card: move profile selection after pa_card_new()
@@ -32,23 +32,30 @@ whether someone else has already set the profile.
 
 http://bugzilla.yoctoproject.org/show_bug.cgi?id=8448
 
-Upstream-Status: Submitted [http://lists.freedesktop.org/archives/pulseaudio-discuss/2015-October/024614.html]
 Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+
+Rebased on 8.0.
+
+Upstream-Status: Denied [The patch set needs some work to be accepted.
+The review thread:
+http://thread.gmane.org/gmane.comp.audio.pulseaudio.general/24301]
+
+Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
 ---
- src/modules/alsa/module-alsa-card.c          | 19 +++---
- src/modules/bluetooth/module-bluez4-device.c | 18 +++---
+ src/modules/alsa/module-alsa-card.c          | 19 +++----
+ src/modules/bluetooth/module-bluez4-device.c | 18 +++----
  src/modules/bluetooth/module-bluez5-device.c |  1 +
  src/modules/macosx/module-coreaudio-device.c |  1 +
- src/modules/module-card-restore.c            | 24 ++++----
- src/pulsecore/card.c                         | 86 +++++++++++++++-------------
+ src/modules/module-card-restore.c            | 24 +++++----
+ src/pulsecore/card.c                         | 81 +++++++++++++++-------------
  src/pulsecore/card.h                         |  7 +++
- 7 files changed, 87 insertions(+), 69 deletions(-)
+ 7 files changed, 86 insertions(+), 65 deletions(-)
 
 diff --git a/src/modules/alsa/module-alsa-card.c b/src/modules/alsa/module-alsa-card.c
-index 32f517e..5b39654 100644
+index 9e8cde2..fe240f0 100644
 --- a/src/modules/alsa/module-alsa-card.c
 +++ b/src/modules/alsa/module-alsa-card.c
-@@ -754,15 +754,6 @@ int pa__init(pa_module *m) {
+@@ -770,15 +770,6 @@ int pa__init(pa_module *m) {
          goto fail;
      }
  
@@ -64,7 +71,7 @@ index 32f517e..5b39654 100644
      u->card = pa_card_new(m->core, &data);
      pa_card_new_data_done(&data);
  
-@@ -773,6 +764,16 @@ int pa__init(pa_module *m) {
+@@ -789,6 +780,16 @@ int pa__init(pa_module *m) {
      u->card->set_profile = card_set_profile;
  
      init_jacks(u);
@@ -82,10 +89,10 @@ index 32f517e..5b39654 100644
      init_eld_ctls(u);
  
 diff --git a/src/modules/bluetooth/module-bluez4-device.c b/src/modules/bluetooth/module-bluez4-device.c
-index 94e6988..5efc5dc 100644
+index dd18217..5d0d3db 100644
 --- a/src/modules/bluetooth/module-bluez4-device.c
 +++ b/src/modules/bluetooth/module-bluez4-device.c
-@@ -2307,15 +2307,6 @@ static int add_card(struct userdata *u) {
+@@ -2304,15 +2304,6 @@ static int add_card(struct userdata *u) {
      *d = PA_BLUEZ4_PROFILE_OFF;
      pa_hashmap_put(data.profiles, p->name, p);
  
@@ -101,7 +108,7 @@ index 94e6988..5efc5dc 100644
      u->card = pa_card_new(u->core, &data);
      pa_card_new_data_done(&data);
  
-@@ -2326,6 +2317,15 @@ static int add_card(struct userdata *u) {
+@@ -2323,6 +2314,15 @@ static int add_card(struct userdata *u) {
  
      u->card->userdata = u;
      u->card->set_profile = card_set_profile;
@@ -118,7 +125,7 @@ index 94e6988..5efc5dc 100644
      d = PA_CARD_PROFILE_DATA(u->card->active_profile);
  
 diff --git a/src/modules/bluetooth/module-bluez5-device.c b/src/modules/bluetooth/module-bluez5-device.c
-index 3321785..0081a21 100644
+index b015c67..7b90a31 100644
 --- a/src/modules/bluetooth/module-bluez5-device.c
 +++ b/src/modules/bluetooth/module-bluez5-device.c
 @@ -1959,6 +1959,7 @@ static int add_card(struct userdata *u) {
@@ -130,10 +137,10 @@ index 3321785..0081a21 100644
      p = PA_CARD_PROFILE_DATA(u->card->active_profile);
      u->profile = *p;
 diff --git a/src/modules/macosx/module-coreaudio-device.c b/src/modules/macosx/module-coreaudio-device.c
-index 4bbb5d5..41f151f 100644
+index 0c92d42..7190ee9 100644
 --- a/src/modules/macosx/module-coreaudio-device.c
 +++ b/src/modules/macosx/module-coreaudio-device.c
-@@ -764,6 +764,7 @@ int pa__init(pa_module *m) {
+@@ -807,6 +807,7 @@ int pa__init(pa_module *m) {
      pa_card_new_data_done(&card_new_data);
      u->card->userdata = u;
      u->card->set_profile = card_set_profile;
@@ -142,10 +149,10 @@ index 4bbb5d5..41f151f 100644
      u->rtpoll = pa_rtpoll_new();
      pa_thread_mq_init(&u->thread_mq, m->core->mainloop, u->rtpoll);
 diff --git a/src/modules/module-card-restore.c b/src/modules/module-card-restore.c
-index baa2f4f..0501ac8 100644
+index f906843..dce6674 100644
 --- a/src/modules/module-card-restore.c
 +++ b/src/modules/module-card-restore.c
-@@ -485,34 +485,38 @@ static pa_hook_result_t port_offset_change_callback(pa_core *c, pa_device_port *
+@@ -515,34 +515,38 @@ static pa_hook_result_t port_offset_change_callback(pa_core *c, pa_device_port *
      return PA_HOOK_OK;
  }
  
@@ -189,24 +196,24 @@ index baa2f4f..0501ac8 100644
 +    pa_log_info("Restoring port latency offsets for card %s.", card->name);
  
      PA_HASHMAP_FOREACH(p_info, e->ports, state)
--        if ((p = pa_hashmap_get(new_data->ports, p_info->name)))
-+        if ((p = pa_hashmap_get(card->ports, p_info->name)))
+-        if ((p = pa_hashmap_get(new_data->ports, p_info->name))) {
++        if ((p = pa_hashmap_get(card->ports, p_info->name))) {
              p->latency_offset = p_info->offset;
- 
-     entry_free(e);
+             if (!p->preferred_profile && p_info->profile)
+                 pa_device_port_set_preferred_profile(p, p_info->profile);
 diff --git a/src/pulsecore/card.c b/src/pulsecore/card.c
-index cc4c784..1b7f71b 100644
+index f92ac87..1a6e705 100644
 --- a/src/pulsecore/card.c
 +++ b/src/pulsecore/card.c
-@@ -151,6 +151,7 @@ pa_card *pa_card_new(pa_core *core, pa_card_new_data *data) {
+@@ -148,6 +148,7 @@ pa_card *pa_card_new(pa_core *core, pa_card_new_data *data) {
      pa_assert(!pa_hashmap_isempty(data->profiles));
  
-     c = pa_xnew(pa_card, 1);
+     c = pa_xnew0(pa_card, 1);
 +    c->state = PA_CARD_STATE_INIT;
  
      if (!(name = pa_namereg_register(core, data->name, PA_NAMEREG_CARD, c, data->namereg_fail))) {
          pa_xfree(c);
-@@ -159,12 +160,6 @@ pa_card *pa_card_new(pa_core *core, pa_card_new_data *data) {
+@@ -156,12 +157,6 @@ pa_card *pa_card_new(pa_core *core, pa_card_new_data *data) {
  
      pa_card_new_data_set_name(data, name);
  
@@ -219,22 +226,24 @@ index cc4c784..1b7f71b 100644
      c->core = core;
      c->name = pa_xstrdup(data->name);
      c->proplist = pa_proplist_copy(data->proplist);
-@@ -187,30 +182,6 @@ pa_card *pa_card_new(pa_core *core, pa_card_new_data *data) {
+@@ -184,38 +179,43 @@ pa_card *pa_card_new(pa_core *core, pa_card_new_data *data) {
      PA_HASHMAP_FOREACH(port, c->ports, state)
          port->card = c;
  
--    c->active_profile = NULL;
--    c->save_profile = false;
--
 -    if (data->active_profile)
 -        if ((c->active_profile = pa_hashmap_get(c->profiles, data->active_profile)))
 -            c->save_profile = data->save_profile;
--
++    pa_device_init_description(c->proplist, c);
++    pa_device_init_icon(c->proplist, true);
++    pa_device_init_intended_roles(c->proplist);
+ 
 -    if (!c->active_profile) {
 -        PA_HASHMAP_FOREACH(profile, c->profiles, state) {
 -            if (profile->available == PA_AVAILABLE_NO)
 -                continue;
--
++    return c;
++}
+ 
 -            if (!c->active_profile || profile->priority > c->active_profile->priority)
 -                c->active_profile = profile;
 -        }
@@ -245,27 +254,10 @@ index cc4c784..1b7f71b 100644
 -                    c->active_profile = profile;
 -        }
 -        pa_assert(c->active_profile);
--    }
--
-     c->userdata = NULL;
-     c->set_profile = NULL;
-     c->active_profile = NULL;
-@@ -219,13 +190,39 @@ pa_card *pa_card_new(pa_core *core, pa_card_new_data *data) {
-     pa_device_init_icon(c->proplist, true);
-     pa_device_init_intended_roles(c->proplist);
- 
--    pa_assert_se(pa_idxset_put(core->cards, c, &c->index) >= 0);
-+    return c;
-+}
- 
--    pa_log_info("Created %u \"%s\"", c->index, c->name);
--    pa_subscription_post(core, PA_SUBSCRIPTION_EVENT_CARD|PA_SUBSCRIPTION_EVENT_NEW, c->index);
 +void pa_card_put(pa_card *card) {
 +    pa_card_profile *profile;
 +    void *state;
- 
--    pa_hook_fire(&core->hooks[PA_CORE_HOOK_CARD_PUT], c);
--    return c;
++
 +    pa_assert(card);
 +
 +    PA_HASHMAP_FOREACH(profile, card->profiles, state) {
@@ -274,8 +266,11 @@ index cc4c784..1b7f71b 100644
 +
 +        if (!card->active_profile || profile->priority > card->active_profile->priority)
 +            card->active_profile = profile;
-+    }
-+
+     }
+ 
+-    pa_device_init_description(c->proplist, c);
+-    pa_device_init_icon(c->proplist, true);
+-    pa_device_init_intended_roles(c->proplist);
 +    /* If all profiles are unavailable, then we still need to pick one */
 +    if (!card->active_profile) {
 +        PA_HASHMAP_FOREACH(profile, card->profiles, state)
@@ -283,19 +278,24 @@ index cc4c784..1b7f71b 100644
 +                card->active_profile = profile;
 +    }
 +    pa_assert(card->active_profile);
-+
+ 
+-    pa_assert_se(pa_idxset_put(core->cards, c, &c->index) >= 0);
 +    pa_hook_fire(&card->core->hooks[PA_CORE_HOOK_CARD_NEW], card);
-+
+ 
+-    pa_log_info("Created %u \"%s\"", c->index, c->name);
+-    pa_subscription_post(core, PA_SUBSCRIPTION_EVENT_CARD|PA_SUBSCRIPTION_EVENT_NEW, c->index);
 +    pa_assert_se(pa_idxset_put(card->core->cards, card, &card->index) >= 0);
 +    card->state = PA_CARD_STATE_LINKED;
-+
+ 
+-    pa_hook_fire(&core->hooks[PA_CORE_HOOK_CARD_PUT], c);
+-    return c;
 +    pa_log_info("Created %u \"%s\"", card->index, card->name);
 +    pa_hook_fire(&card->core->hooks[PA_CORE_HOOK_CARD_PUT], card);
 +    pa_subscription_post(card->core, PA_SUBSCRIPTION_EVENT_CARD|PA_SUBSCRIPTION_EVENT_NEW, card->index);
  }
  
  void pa_card_free(pa_card *c) {
-@@ -292,17 +289,24 @@ int pa_card_set_profile(pa_card *c, pa_card_profile *profile, bool save) {
+@@ -306,20 +306,27 @@ int pa_card_set_profile(pa_card *c, pa_card_profile *profile, bool save) {
          return 0;
      }
  
@@ -317,6 +317,9 @@ index cc4c784..1b7f71b 100644
      c->active_profile = profile;
      c->save_profile = save;
  
+     if (save)
+         update_port_preferred_profile(c);
+ 
 -    pa_hook_fire(&c->core->hooks[PA_CORE_HOOK_CARD_PROFILE_CHANGED], c);
 +    if (c->state != PA_CARD_STATE_INIT) {
 +        pa_log_info("Changed profile of card %u \"%s\" to %s", c->index, c->name, profile->name);
@@ -327,22 +330,22 @@ index cc4c784..1b7f71b 100644
      return 0;
  }
 diff --git a/src/pulsecore/card.h b/src/pulsecore/card.h
-index 1c33958..dbbc1c2 100644
+index fff9057..a944301 100644
 --- a/src/pulsecore/card.h
 +++ b/src/pulsecore/card.h
-@@ -37,6 +37,11 @@ typedef enum pa_available {
- #include <pulsecore/module.h>
- #include <pulsecore/idxset.h>
+@@ -34,6 +34,11 @@ typedef enum pa_available {
+     PA_AVAILABLE_YES = 2,
+ } pa_available_t;
  
 +typedef enum pa_card_state {
 +    PA_CARD_STATE_INIT,
 +    PA_CARD_STATE_LINKED,
 +} pa_card_state_t;
 +
- typedef struct pa_card_profile {
+ struct pa_card_profile {
      pa_card *card;
      char *name;
-@@ -61,6 +66,7 @@ typedef struct pa_card_profile {
+@@ -66,6 +71,7 @@ struct pa_card_profile {
  
  struct pa_card {
      uint32_t index;
@@ -350,7 +353,7 @@ index 1c33958..dbbc1c2 100644
      pa_core *core;
  
      char *name;
-@@ -115,6 +121,7 @@ void pa_card_new_data_set_profile(pa_card_new_data *data, const char *profile);
+@@ -120,6 +126,7 @@ void pa_card_new_data_set_profile(pa_card_new_data *data, const char *profile);
  void pa_card_new_data_done(pa_card_new_data *data);
  
  pa_card *pa_card_new(pa_core *c, pa_card_new_data *data);
@@ -359,5 +362,5 @@ index 1c33958..dbbc1c2 100644
  
  void pa_card_add_profile(pa_card *c, pa_card_profile *profile);
 -- 
-2.1.4
+2.7.0
 
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/0004-alsa-set-availability-for-some-unavailable-profiles.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/0004-alsa-set-availability-for-some-unavailable-profiles.patch
index bb318aa..e0efa70 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio/0004-alsa-set-availability-for-some-unavailable-profiles.patch
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio/0004-alsa-set-availability-for-some-unavailable-profiles.patch
@@ -1,4 +1,4 @@
-From 0136b73158f60d5dc630ae348b18df3b59a2a5c2 Mon Sep 17 00:00:00 2001
+From 690d567e298f6687b61c82660b051df5b25482ee Mon Sep 17 00:00:00 2001
 From: Tanu Kaskinen <tanuk@iki.fi>
 Date: Fri, 23 Oct 2015 13:37:11 +0300
 Subject: [PATCH 4/4] alsa: set availability for (some) unavailable profiles
@@ -22,28 +22,36 @@ pa_card_profile, however.
 
 BugLink: https://bugzilla.yoctoproject.org/show_bug.cgi?id=8448
 
-Upstream-Status: Submitted [http://lists.freedesktop.org/archives/pulseaudio-discuss/2015-October/024614.html]
 Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+
+Rebased on 8.0.
+
+Upstream-Status: Denied [The patch set needs some work to be accepted.
+The review thread:
+http://thread.gmane.org/gmane.comp.audio.pulseaudio.general/24301]
+
+Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
 ---
- src/modules/alsa/module-alsa-card.c | 24 ++++++++++++++++++++++++
- 1 file changed, 24 insertions(+)
+ src/modules/alsa/module-alsa-card.c | 25 +++++++++++++++++++++++++
+ 1 file changed, 25 insertions(+)
 
 diff --git a/src/modules/alsa/module-alsa-card.c b/src/modules/alsa/module-alsa-card.c
-index 5b39654..73a846c 100644
+index fe240f0..bdbdc12 100644
 --- a/src/modules/alsa/module-alsa-card.c
 +++ b/src/modules/alsa/module-alsa-card.c
-@@ -366,6 +366,7 @@ static int report_jack_state(snd_mixer_elem_t *melem, unsigned int mask) {
+@@ -366,6 +366,8 @@ static int report_jack_state(snd_mixer_elem_t *melem, unsigned int mask) {
      void *state;
      pa_alsa_jack *jack;
-     pa_device_port *port;
+     struct temp_port_avail *tp, *tports;
++    pa_device_port *port;
 +    pa_card_profile *profile;
  
      pa_assert(u);
  
-@@ -396,6 +397,29 @@ static int report_jack_state(snd_mixer_elem_t *melem, unsigned int mask) {
-             }
-             report_port_state(port, u);
-         }
+@@ -412,6 +414,29 @@ static int report_jack_state(snd_mixer_elem_t *melem, unsigned int mask) {
+            pa_device_port_set_available(tp->port, tp->avail);
+ 
+     pa_xfree(tports);
 +
 +    /* Update profile availabilities. The logic could be improved; for now we
 +     * only set obviously unavailable profiles (those that contain only
@@ -71,5 +79,5 @@ index 5b39654..73a846c 100644
  }
  
 -- 
-2.1.4
+2.7.0
 
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/fix-git-version-gen.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/fix-git-version-gen.patch
deleted file mode 100644
index ed94250..0000000
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio/fix-git-version-gen.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-git-version-gen gets confused if a tarball is being built inside a git directory
-(ie your build directory is a subdirectory of a poky clone), and ends up calling
-the release 6.0-dirty.  Add a shortcut exit so if a tarball is detected it
-doesn't attempt to look at the git status.
-
-Upstream-Status: Submitted (https://bugs.freedesktop.org/show_bug.cgi?id=90936)
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-diff --git a/git-version-gen b/git-version-gen
-index 7546884..079b93e 100755
---- a/git-version-gen
-+++ b/git-version-gen
-@@ -84,7 +84,10 @@ then
-     v=`cat $tarball_version_file` || exit 1
-     case $v in
- 	*$nl*) v= ;; # reject multi-line output
--	[0-9]*) ;;
-+	[0-9]*)
-+		echo "$v" | tr -d '\012'
-+		exit 0
-+		;;
- 	*) v= ;;
-     esac
-     test -z "$v" \
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_6.0.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_8.0.bb
similarity index 72%
rename from meta/recipes-multimedia/pulseaudio/pulseaudio_6.0.bb
rename to meta/recipes-multimedia/pulseaudio/pulseaudio_8.0.bb
index ec629aa..b01ba8f 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_6.0.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_8.0.bb
@@ -3,16 +3,15 @@ require pulseaudio.inc
 SRC_URI = "http://freedesktop.org/software/pulseaudio/releases/${BP}.tar.xz \
            file://0001-padsp-Make-it-compile-on-musl.patch \
            file://0001-client-conf-Add-allow-autospawn-for-root.patch \
-           file://0001-conf-parser-add-support-for-.d-directories.patch \
-           file://fix-git-version-gen.patch \
            file://volatiles.04_pulse \
            file://0001-card-add-pa_card_profile.ports.patch \
            file://0002-alsa-bluetooth-fail-if-user-requested-profile-doesn-.patch \
            file://0003-card-move-profile-selection-after-pa_card_new.patch \
            file://0004-alsa-set-availability-for-some-unavailable-profiles.patch \
+           file://0001-Revert-module-switch-on-port-available-Route-to-pref.patch \
 "
-SRC_URI[md5sum] = "b691e83b7434c678dffacfa3a027750e"
-SRC_URI[sha256sum] = "b50640e0b80b1607600accfad2e45aabb79d379bf6354c9671efa2065477f6f6"
+SRC_URI[md5sum] = "8678442ba0bb4b4c33ac6f62542962df"
+SRC_URI[sha256sum] = "690eefe28633466cfd1ab9d85ebfa9376f6b622deec6bfee5091ac9737cd1989"
 
 do_compile_prepend() {
     mkdir -p ${S}/libltdl
-- 
2.7.0


