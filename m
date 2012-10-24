Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TR4Bu-0005iE-BO
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Oct 2012 18:52:26 +0200
Received: from mail-ee0-f69.google.com ([74.125.83.69])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 24 Oct 2012 09:38:55 -0700
Received: by mail-ee0-f69.google.com with SMTP id l10so605081eei.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Oct 2012 09:38:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=HZEprsMwM9Sgn2lzQfZV6NsJzZJeJ0wLv4l+YJbJASw=;
	b=jwAVawh0nqRUafdbpN06RCJAKCsF4UfHfgG3ELOpTRCes/IcvW5jLrJmBXnG36FS2s
	4vgiRxIpaGk0bkXfyEEpLKxNWDR2807MUhgRxgwFJqJbwte8PrK9Tj8Lin+ljc9ReYno
	g6+894taXlp+ezML8nk4A95gB7MilZ712kk4PBSzqO4ErAICIHU66RihPm97koZI8aQC
	7/YJ65S6oedDQJbgct1IleqqJyH4R0YecGZOMSK2yC0JeAHFdn/d+A2fYhBozVYqrJt+
	yRs0GVT7wMjBdbpVhw7Q85Jpnx5OkhLV77/7v2235EUZQISs5b296zt0/2OEGMBpEuFx
	zUqg==
Received: by 10.180.99.97 with SMTP id ep1mr3781094wib.9.1351096733032;
	Wed, 24 Oct 2012 09:38:53 -0700 (PDT)
Received: by 10.180.99.97 with SMTP id ep1mr3781046wib.9.1351096732649;
	Wed, 24 Oct 2012 09:38:52 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id fp6sm5146349wib.0.2012.10.24.09.38.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 24 Oct 2012 09:38:51 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Oct 2012 17:37:34 +0100
Message-Id: <1351096656-32438-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1351096656-32438-1-git-send-email-ross.burton@intel.com>
References: <1351096656-32438-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQksw/zwje3dowfITVqRjYbHaWDvmI2Nj1CumUasHlzsD/mJyWJ0mlbnHN2kdHKj3bdrf05epBY/P/ycnwleJB2M92gaFoinaVPYg9dJbdwMdakiNsb+3TNH7TM5Fdyx3cL2hzqYPV4jfPElM2K071rLSXHJSGpxlDszXPgkRl8YkGTLvIuWyISS0oGmZdDcgWFBD0iU
Subject: [PATCH 2/4] pulseaudio: move helper binaries into the relevant module packages
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
X-List-Received-Date: Wed, 24 Oct 2012 16:52:26 -0000

proximity-helper is only used by the bluetooth-proximity module, and
gconf-helper is only used by the gconf module.  Clarify the packaging and clean
up dependencies by shipping the helper binaries with the modules that spawn
them.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc    |   11 +++++++----
 meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb |    2 +-
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index ab70c7e..70b77da 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -65,7 +65,7 @@ USERADD_PARAM_pulseaudio-server = "--system --home /var/run/pulse \
                               --groups audio,pulse --gid pulse pulse"
 
 PACKAGES =+ "libpulsecore libpulsecommon libpulsedsp libpulse libpulse-simple libpulse-browse libpulse-mainloop-glib \
-             pulseaudio-server pulseaudio-misc pulseaudio-gconf-helper"
+             pulseaudio-server pulseaudio-misc"
 
 #upgrade path:
 RREPLACES_pulseaudio-server = "libpulse-bin libpulse-conf"
@@ -86,7 +86,6 @@ FILES_${PN}-dev += "${libdir}/pulse-${PV}/modules/*.la ${datadir}/vala ${libdir}
 FILES_${PN}-conf = "${sysconfdir}"
 FILES_${PN}-bin += "${sysconfdir}/default/volatiles/volatiles.04_pulse"
 FILES_${PN}-server = "${bindir}/pulseaudio ${bindir}/start-* ${sysconfdir} ${bindir}/pactl ${base_libdir}/udev/rules.d/*.rules"
-FILES_${PN}-gconf-helper = "${libexecdir}/pulse/gconf-helper"
 FILES_${PN}-misc = "${bindir}/*"
 
 # Allow the pulseaudio package to be created empty as a placeholder (-dbg and -dev depend on it)
@@ -113,8 +112,8 @@ python populate_packages_prepend() {
     #d.setVar('PKG_pulseaudio', 'pulseaudio')
 
     plugindir = d.expand('${libdir}/pulse-${PV}/modules/')
-    do_split_packages(d, plugindir, '^module-(.*)\.so$', 'pulseaudio-module-%s', 'PulseAudio module for %s', extra_depends='' )
-    do_split_packages(d, plugindir, '^lib(.*)\.so$', 'pulseaudio-lib-%s', 'PulseAudio library for %s', extra_depends='' )
+    do_split_packages(d, plugindir, '^module-(.*)\.so$', 'pulseaudio-module-%s', 'PulseAudio module for %s', extra_depends='', prepend=True)
+    do_split_packages(d, plugindir, '^lib(.*)\.so$', 'pulseaudio-lib-%s', 'PulseAudio library for %s', extra_depends='', prepend=True)
 }
 
 RDEPENDS_pulseaudio-server = " \
@@ -141,5 +140,9 @@ RDEPENDS_pulseaudio-server = " \
     pulseaudio-module-switch-on-port-available"
 
 RDEPENDS_pulseaudio-module-console-kit =+ "consolekit"
+
+FILES_pulseaudio-module-gconf += "${libexecdir}/pulse/gconf-helper"
+FILES_pulseaudio-module-bluetooth-proximity += "${libexecdir}/pulse/proximity-helper"
+
 RDEPENDS_pulseaudio-server += "\
         ${@base_contains('DISTRO_FEATURES', 'x11', 'pulseaudio-module-console-kit', '', d)}"
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
index d25b424..07410a4 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
@@ -1,6 +1,6 @@
 require pulseaudio.inc
 
-PR = "r8"
+PR = "r9"
 
 DEPENDS += "libjson gdbm speex libxml-parser-perl-native"
 
-- 
1.7.10



