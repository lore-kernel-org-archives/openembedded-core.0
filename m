Return-Path: <tanu.kaskinen@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 17C586B0CB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 18:52:12 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 22 May 2015 11:52:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,477,1427785200"; d="scan'208";a="497168887"
Received: from tkkaskin-mobl3.ger.corp.intel.com (HELO
	tkkaskin-mobl3.ger.corp.intel.com.ger.corp.intel.com) ([10.252.3.49])
	by FMSMGA003.fm.intel.com with ESMTP; 22 May 2015 11:52:09 -0700
From: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 May 2015 21:51:53 +0300
Message-Id: <c0e3487377441e639c2c374823fa9813c0b46f34.1432320274.git.tanu.kaskinen@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1432320274.git.tanu.kaskinen@linux.intel.com>
References: <cover.1432320274.git.tanu.kaskinen@linux.intel.com>
In-Reply-To: <cover.1432320274.git.tanu.kaskinen@linux.intel.com>
References: <cover.1432320274.git.tanu.kaskinen@linux.intel.com>
Subject: [PATCH v3 2/5] pulseaudio: client-conf: Add allow-autospawn-for-root
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
X-List-Received-Date: Fri, 22 May 2015 18:52:12 -0000

This is related to enabling PulseAudio in Sato images. Sato doesn't
have regular users; the graphical session is run as root. PulseAudio
disables autospawning for root, but in Sato that's not the desired
behaviour. This patch allows autospawning to be enabled for root in
systems where that makes sense.

Signed-off-by: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
---
 ...-client-conf-Add-allow-autospawn-for-root.patch | 92 ++++++++++++++++++++++
 .../pulseaudio/pulseaudio_6.0.bb                   |  1 +
 2 files changed, 93 insertions(+)
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0001-client-conf-Add-allow-autospawn-for-root.patch

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-client-conf-Add-allow-autospawn-for-root.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-client-conf-Add-allow-autospawn-for-root.patch
new file mode 100644
index 0000000..d19eb7c
--- /dev/null
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-client-conf-Add-allow-autospawn-for-root.patch
@@ -0,0 +1,92 @@
+From 1cb5647f76dc8cd7bacbce2a64fac9e6c2dc3b16 Mon Sep 17 00:00:00 2001
+From: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
+Date: Tue, 28 Apr 2015 14:32:43 +0300
+Subject: [PATCH] client-conf: Add allow-autospawn-for-root
+
+Usually autospawning for root is a bad idea, since it can easily
+interfere with other users' PulseAudio instances, but in embedded
+environments where only root exists, autospawning is fine.
+
+Upstream-Status: Submitted [http://thread.gmane.org/gmane.comp.audio.pulseaudio.general/23549]
+
+Signed-off-by: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
+---
+ man/pulse-client.conf.5.xml.in | 9 +++++++++
+ src/pulse/client-conf.c        | 1 +
+ src/pulse/client-conf.h        | 1 +
+ src/pulse/client.conf.in       | 1 +
+ src/pulse/context.c            | 2 +-
+ 5 files changed, 13 insertions(+), 1 deletion(-)
+
+diff --git a/man/pulse-client.conf.5.xml.in b/man/pulse-client.conf.5.xml.in
+index 1002dbe..0058490 100644
+--- a/man/pulse-client.conf.5.xml.in
++++ b/man/pulse-client.conf.5.xml.in
+@@ -71,6 +71,15 @@ License along with PulseAudio; if not, see <http://www.gnu.org/licenses/>.
+     </option>
+ 
+     <option>
++      <p><opt>allow-autospawn-for-root=</opt> Allow autospawning also for root.
++      Takes a boolean value, defaults to <opt>no</opt>. If the <opt>autospawn
++      </opt> option is disabled, this option has no effect. Autospawning for
++      root is disabled by default, because running PulseAudio as root will
++      interfere with regular users' PulseAudio instances. This option should be
++      enabled only in environments where there are no regular users at all.</p>
++    </option>
++
++    <option>
+       <p><opt>daemon-binary=</opt> Path to the PulseAudio daemon to
+       run when autospawning. Defaults to a path configured at compile
+       time.</p>
+diff --git a/src/pulse/client-conf.c b/src/pulse/client-conf.c
+index 83331f8..0474583 100644
+--- a/src/pulse/client-conf.c
++++ b/src/pulse/client-conf.c
+@@ -138,6 +138,7 @@ void pa_client_conf_load(pa_client_conf *c, bool load_from_x11, bool load_from_e
+         { "default-server",         pa_config_parse_string,   &c->default_server, NULL },
+         { "default-dbus-server",    pa_config_parse_string,   &c->default_dbus_server, NULL },
+         { "autospawn",              pa_config_parse_bool,     &c->autospawn, NULL },
++        { "allow-autospawn-for-root", pa_config_parse_bool,   &c->allow_autospawn_for_root, NULL },
+         { "cookie-file",            pa_config_parse_string,   &c->cookie_file_from_client_conf, NULL },
+         { "disable-shm",            pa_config_parse_bool,     &c->disable_shm, NULL },
+         { "enable-shm",             pa_config_parse_not_bool, &c->disable_shm, NULL },
+diff --git a/src/pulse/client-conf.h b/src/pulse/client-conf.h
+index eac705a..131393a 100644
+--- a/src/pulse/client-conf.h
++++ b/src/pulse/client-conf.h
+@@ -38,6 +38,7 @@ typedef struct pa_client_conf {
+     char *cookie_file_from_application;
+     char *cookie_file_from_client_conf;
+     bool autospawn, disable_shm, auto_connect_localhost, auto_connect_display;
++    bool allow_autospawn_for_root;
+     size_t shm_size;
+ } pa_client_conf;
+ 
+diff --git a/src/pulse/client.conf.in b/src/pulse/client.conf.in
+index 26b7790..69830ef 100644
+--- a/src/pulse/client.conf.in
++++ b/src/pulse/client.conf.in
+@@ -23,6 +23,7 @@
+ ; default-dbus-server =
+ 
+ ; autospawn = yes
++; allow-autospawn-for-root = no
+ ; daemon-binary = @PA_BINARY@
+ ; extra-arguments = --log-target=syslog
+ 
+diff --git a/src/pulse/context.c b/src/pulse/context.c
+index 4bc445f..d6c3f6d 100644
+--- a/src/pulse/context.c
++++ b/src/pulse/context.c
+@@ -976,7 +976,7 @@ int pa_context_connect(
+     if (!(flags & PA_CONTEXT_NOAUTOSPAWN) && c->conf->autospawn) {
+ 
+ #ifdef HAVE_GETUID
+-        if (getuid() == 0)
++        if (!c->conf->allow_autospawn_for_root && getuid() == 0)
+             pa_log_debug("Not doing autospawn since we are root.");
+         else {
+             c->do_autospawn = true;
+-- 
+1.9.3
+
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_6.0.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_6.0.bb
index fb33c7c..465b224 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_6.0.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_6.0.bb
@@ -2,6 +2,7 @@ require pulseaudio.inc
 
 SRC_URI = "http://freedesktop.org/software/pulseaudio/releases/${BP}.tar.xz \
            file://0001-padsp-Make-it-compile-on-musl.patch \
+           file://0001-client-conf-Add-allow-autospawn-for-root.patch \
            file://volatiles.04_pulse \
 "
 SRC_URI[md5sum] = "b691e83b7434c678dffacfa3a027750e"
-- 
1.9.3


