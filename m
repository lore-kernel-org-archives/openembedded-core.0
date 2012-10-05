Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@bigsur.com>) id 1TKI02-0008Ub-BB
	for openembedded-core@lists.openembedded.org;
	Sat, 06 Oct 2012 02:12:10 +0200
Received: by mail-pb0-f47.google.com with SMTP id ro12so2259342pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Oct 2012 16:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bigsur.com; s=bigsur.com;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=WzIaRMG+VqqvCm/RcWVDK8mBcJj/Z1bXGLj8vqi3YAE=;
	b=Onw16qpnS0SBvnTVdoz44xx5WWkVnymy8/ojycFhJylEokxC54pKKq1zoR8730rnA6
	QDfGVuei7iOABu9ux+hPfQ+m/0NOqkySJ5c8RP43DDPHBwQdI2EMPEaNLYfsJsd7Roa1
	DiXtKr4k6uRVFn3ISzYhr6azDfngzeTZpQ1h4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=WzIaRMG+VqqvCm/RcWVDK8mBcJj/Z1bXGLj8vqi3YAE=;
	b=FUZkoxQ+6Q5ZK5QduYiVE6/zp6PkV2dNLey0WEbTeN/2Gxhujft5Hj0WFKYZW2Zwal
	J6w48fFxub+J8+yUaXXIfJioksDBNbrDw80SJwzXvvoPs5dTEd2gdzX6xSnpYTtYPz9r
	PoZ1dY11JgGkHbd7/hv+9QRnCzfeLvVZHzK564MngwURYQhghtU5Q5sertHtZVbjFLmm
	t9OluQtryRzRC1yJnzvBikqa3/Fe10tDXgdn3ydzYsK64mVHwN0+LBIzxD89CcvSMNUV
	dnQeTqhQhd5eIsOlB+Qnbct1HmloWI05DMZ+euryZWl2Oegky/yO8rQNdQQu+IzXSTN/
	nHYw==
Received: by 10.68.195.195 with SMTP id ig3mr35192640pbc.108.1349481546755;
	Fri, 05 Oct 2012 16:59:06 -0700 (PDT)
Received: from localhost (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id vf8sm6761382pbc.27.2012.10.05.16.59.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 05 Oct 2012 16:59:05 -0700 (PDT)
Sender: Saul Wold <sgw@bigsur.com>
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Oct 2012 16:59:03 -0700
Message-Id: <1349481543-11185-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQnJ7uD0C4ayjABKGkubrzdZB19DVwrxL4n4idtRalLnJbZXfAcxhrvSj4ARARnLxnCiyV5t
Subject: [PATCH] pulseaudio: ensure X11 and consolekit are disabled
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
X-List-Received-Date: Sat, 06 Oct 2012 00:12:10 -0000

When DISTRO_FEATURES does not include X11 ensure that both x11
and gtk are diabled correctly.  ConsoleKit also has x11, so ensure
that any RDEPENDS is also excluded.

The flags for x11 changed at somepoint to use enable/disable, but
this recipe was not updated.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |    7 ++++---
 .../pulseaudio/pulseaudio_2.1.bb                   |    2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 753b013..3003eaa 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -27,7 +27,7 @@ EXTRA_OECONF = "\
 		--disable-lynx \
 		${@base_contains('DISTRO_FEATURES', 'bluetooth', '--enable-bluez', '--disable-bluez', d)} \
 		--disable-polkit \
-		${@base_contains('DISTRO_FEATURES', 'x11', '--with-x', '--without-x', d)} \
+		${@base_contains('DISTRO_FEATURES', 'x11', '--enable-x11', '--disable-x11 --disable-gtk2', d)} \
 		--without-jack \
 		--with-glib \
 		--with-alsa \
@@ -117,7 +117,6 @@ python populate_packages_prepend() {
     do_split_packages(d, plugindir, '^lib(.*)\.so$', 'pulseaudio-lib-%s', 'PulseAudio library for %s', extra_depends='' )
 }
 
-RDEPENDS_pulseaudio-module-console-kit =+ "consolekit"
 RDEPENDS_pulseaudio-server = " \
     pulseaudio-module-filter-apply \
     pulseaudio-module-filter-heuristics \
@@ -137,7 +136,9 @@ RDEPENDS_pulseaudio-server = " \
     pulseaudio-module-rescue-streams \
     pulseaudio-module-always-sink \
     pulseaudio-module-suspend-on-idle \
-    pulseaudio-module-console-kit \
     pulseaudio-module-position-event-sounds \
     pulseaudio-module-role-cork "
 
+RDEPENDS_pulseaudio-module-console-kit =+ "consolekit"
+RDEPENDS_pulseaudio-server += "\
+        ${@base_contains('DISTRO_FEATURES', 'x11', 'pulseaudio-module-console-kit', '', d)}"
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
index 947aa6d..1c2c9f7 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
@@ -1,6 +1,6 @@
 require pulseaudio.inc
 
-PR = "r5"
+PR = "r6"
 
 DEPENDS += "libjson gdbm speex libxml-parser-perl-native"
 
-- 
1.7.9.5



