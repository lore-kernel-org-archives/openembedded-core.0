Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TDaJg-0003JN-Pe
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Sep 2012 14:20:45 +0200
Received: by mail-wg0-f43.google.com with SMTP id dq11so2288311wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2012 05:08:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=ANS5Mx6oCHLdri7iU7CxQQdAuz3+kS9yF2idoXUlpuQ=;
	b=ht2cTRSQQR/3my3n7MDkHK8hdDECuqKJQT1h00sGEb11gdIKNsV7ytEaMevRaHc0uC
	2kdYJbyoAyFB4JR+9QVK1Lm1COdPkqkIJunty1+U1YzZhhEsx1hnG+3C/ezbIYah2G4h
	vjWP0+XjDpkncx0rH4uyyVOOGfkmJcp2cAZ4Fs80XHa3Tqn3WTWZTNJxVYv6IV/XvAHH
	d0j/aeQIAdSsThZVxW/YhsIFwzNN4dFxrxRimZgktUZfafO4wWUO3ownPQtYxw055YO4
	0zNBqkMMBm3ZQHCd60QtIH9N6t4ZqSNl/3qeROzCP6bts2AbMSpfhCF6SWYgVI445AnK
	avDA==
Received: by 10.216.181.67 with SMTP id k45mr5613281wem.17.1347883688453;
	Mon, 17 Sep 2012 05:08:08 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id k20sm17570403wiv.11.2012.09.17.05.08.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Sep 2012 05:08:07 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Sep 2012 14:07:35 +0200
Message-Id: <1347883657-17529-8-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1347883657-17529-1-git-send-email-koen@dominion.thruhere.net>
References: <1347883657-17529-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQnSBYwjCdIXNmaCllACDbmCwVthuFErxTreEJMOYpH3SxLJEmUsOE9iZKLAydTB7O/x0d73
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: [for-denzil][pulseaudio-updates 08/10] pulseaudio: Always enable NLS
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
X-List-Received-Date: Mon, 17 Sep 2012 12:20:45 -0000

From: Khem Raj <raj.khem@gmail.com>

When NLS is disabled e.g. on uclibc the build fails
The actual problem is that pulseaudio build system
should cater for it but it does not

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |    4 ++++
 .../pulseaudio/pulseaudio_2.1.bb                   |    2 +-
 2 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index b952d68..de653fe 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -19,6 +19,10 @@ SRC_URI = "http://0pointer.de/lennart/projects/pulseaudio/pulseaudio-${PV}.tar.g
 
 inherit autotools pkgconfig useradd
 
+# *.desktop rules wont be generated during configure and build will fail
+# if using --disable-nls
+USE_NLS = "yes"
+
 EXTRA_OECONF = "\
 		--disable-lynx \
 		${@base_contains('DISTRO_FEATURES', 'bluetooth', '--enable-bluez', '--disable-bluez', d)} \
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
index a61e983..5359146 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
@@ -1,6 +1,6 @@
 require pulseaudio.inc
 
-PR = "r0"
+PR = "r1"
 
 DEPENDS += "libjson gdbm speex libxml-parser-perl-native"
 
-- 
1.7.7.6



