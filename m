Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Su0m7-0007RK-WD
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jul 2012 14:33:12 +0200
Received: from mail-we0-f180.google.com ([74.125.82.180])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 25 Jul 2012 05:21:40 -0700
Received: by weyt11 with SMTP id t11so426552wey.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2012 05:21:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=uP6h3CCndlUKMDtM8Z8SF0aswmm+Y32cYVYxGL029C4=;
	b=PrQ5ZOsWeLcJRzWpBVa/qVbei4RHgRHVthqx2Pyf/oRv/FMmoJzwsHYRMNPnXmt6Mj
	e9NovzrntFnsZCCZmZoHFr7WWS7XPnJhucRaYswg4CMgebijtPnS+iAHIuoI4sXhnc5g
	EarYookYpA7iZ3qk5jLW1T6HSBJIrRbhhPJ2YMV+yq79X0q4vglep8dnBZtq6TtLvaA9
	KcjgR88mW2g/K3tevy5/VCV0rCWpVWBPXIAewJiT9C+x8OnoCyNj48P3UNlH1kUi61V7
	Kf+7q9Ko7tDcelmtwNl63Sq3kUqwfJ35sNSzBLHKfzrZ4mlnYah5OxQ5lEdMlWMoOjlz
	3QmA==
Received: by 10.180.105.6 with SMTP id gi6mr4249578wib.4.1343218898973;
	Wed, 25 Jul 2012 05:21:38 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id dc3sm945979wib.7.2012.07.25.05.21.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 25 Jul 2012 05:21:38 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jul 2012 13:21:18 +0100
Message-Id: <1343218878-2088-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQn2/pGlQIU9btTyuT56u6+c3ioNmGipXguvBywNF2KDrJWqCZBc0vyNZg/qINznG5kh0N1+
Subject: [PATCH] telepathy-glib: fix a build race
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 25 Jul 2012 12:33:12 -0000

[YOCTO #2462]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...Fix-a-race-in-_gen-reentrant-methods.list.patch |   42 ++++++++++++++++++++
 .../telepathy/telepathy-glib_0.19.2.bb             |    5 ++-
 2 files changed, 45 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-connectivity/telepathy/telepathy-glib/0001-Fix-a-race-in-_gen-reentrant-methods.list.patch

diff --git a/meta/recipes-connectivity/telepathy/telepathy-glib/0001-Fix-a-race-in-_gen-reentrant-methods.list.patch b/meta/recipes-connectivity/telepathy/telepathy-glib/0001-Fix-a-race-in-_gen-reentrant-methods.list.patch
new file mode 100644
index 0000000..4f8ed2b
--- /dev/null
+++ b/meta/recipes-connectivity/telepathy/telepathy-glib/0001-Fix-a-race-in-_gen-reentrant-methods.list.patch
@@ -0,0 +1,42 @@
+From 8ff62dc34961e997fb0224517aef0f12d455a82b Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Wed, 25 Jul 2012 12:58:16 +0100
+Subject: [PATCH] Fix a race in _gen/reentrant-methods.list
+
+Very occasionally, a parallel build will fail like this:
+
+| Making all in telepathy-glib
+| make[2]: Entering directory `/buildarea1/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/work/i586-poky-linux/telepathy-glib-0.19.2-r0/telepathy-glib-0.19.2/telepathy-glib'
+| /bin/mkdir -p _gen
+| ( cd . && cat versions/0.7.0.abi [...] versions/0.19.2.abi  ) | \
+| 		/bin/grep '^tp_cli_.*_run_.*' > _gen/reentrant-methods.list.tmp
+| /bin/sh: line 1: _gen/reentrant-methods.list.tmp: No such file or directory
+| make[2]: *** [_gen/reentrant-methods.list] Error 1
+
+It's doing the mkdir and the subshell in parallel, when the mkdir should be done
+first.  Add an explicit dependency on spec-stamp to reentrant-methods.list to
+ensure the ordering.
+
+https://bugs.freedesktop.org/show_bug.cgi?id=52480
+
+Upstream-Status: Submitted
+---
+ telepathy-glib/codegen.am |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/telepathy-glib/codegen.am b/telepathy-glib/codegen.am
+index 26caaef..6ad3ec5 100644
+--- a/telepathy-glib/codegen.am
++++ b/telepathy-glib/codegen.am
+@@ -149,7 +149,7 @@ _gen/stable-spec.xml: stable-interfaces.xml _gen/stable-stamp $(tools_dir)/xincl
+ # Grab a list of re-entrant tp_cli_*_run_* methods we are committed to
+ # generating for backwards compatibility.
+ # grep --no-filename is not portable :-(
+-_gen/reentrant-methods.list: $(ABI_LISTS) codegen.am
++_gen/reentrant-methods.list: _gen/spec-stamp $(ABI_LISTS) codegen.am
+ 	$(AM_V_GEN)( cd $(srcdir) && cat $(ABI_LISTS) ) | \
+ 		$(GREP) '^tp_cli_.*_run_.*' > $@.tmp
+ 	@mv $@.tmp $@
+-- 
+1.7.10.4
+
diff --git a/meta/recipes-connectivity/telepathy/telepathy-glib_0.19.2.bb b/meta/recipes-connectivity/telepathy/telepathy-glib_0.19.2.bb
index deba3bb..9dbc5be 100644
--- a/meta/recipes-connectivity/telepathy/telepathy-glib_0.19.2.bb
+++ b/meta/recipes-connectivity/telepathy/telepathy-glib_0.19.2.bb
@@ -3,9 +3,10 @@ DESCRIPTION = "Telepathy Framework: GLib-based helper library for connection man
 HOMEPAGE = "http://telepathy.freedesktop.org/wiki/"
 DEPENDS = "glib-2.0 dbus python-native-runtime dbus-native dbus-glib"
 LICENSE = "LGPLv2.1+"
-PR = "r0"
+PR = "r1"
 
-SRC_URI = "http://telepathy.freedesktop.org/releases/telepathy-glib/${BPN}-${PV}.tar.gz"
+SRC_URI = "http://telepathy.freedesktop.org/releases/telepathy-glib/${BPN}-${PV}.tar.gz \
+           file://0001-Fix-a-race-in-_gen-reentrant-methods.list.patch"
 
 SRC_URI[md5sum] = "af2b33c1215f189e637bd59cc9139255"
 SRC_URI[sha256sum] = "7e3c313ed08e26339deb603a615cec62a370131075514439f79f473f92ab84c3"
-- 
1.7.10



