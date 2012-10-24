Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TR4Bt-0005iD-6Y
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Oct 2012 18:52:26 +0200
Received: from mail-we0-f197.google.com ([74.125.82.197])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 24 Oct 2012 09:38:28 -0700
Received: by mail-we0-f197.google.com with SMTP id x43so557452wey.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Oct 2012 09:38:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=zEo4Zg/+AjGdABuJT/MfZd4y/Vb1qeiSD+9/nJX2p24=;
	b=TDAzOHaqLA1zRaydZUDh7dwr/VQWYg0YGPTa/QvlVe70N3OYaUvIrVGl8Rtt+Uz/Kk
	/LGiWOPcTQ9TciY+leAIB2qb9hGZZEmMtBaKLVtcRrHvfOnU9IMUUO7G6noG/AlKhw7a
	54QDW671gion3wDBWYugBgI8Sp1oQt2CDmPBPc2wtpH4tTZtRxYHH82FD1P6Ly4PBpHo
	oasJtdHIjRHpzOUHwG1fBKuCoCbST+fCQTMjRrLt9LQt4b3LpBwzGB/Ra+IGmxgqXTQc
	XLd8yj3JHw7EqSKsbsaBvAcnlYi5upORWueGk1R6tfgM6dZe0VNEkILrz00VoZl09q/o
	Skmg==
Received: by 10.180.91.71 with SMTP id cc7mr7217418wib.2.1351096734200;
	Wed, 24 Oct 2012 09:38:54 -0700 (PDT)
Received: by 10.180.91.71 with SMTP id cc7mr7217412wib.2.1351096734146;
	Wed, 24 Oct 2012 09:38:54 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id fp6sm5146349wib.0.2012.10.24.09.38.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 24 Oct 2012 09:38:53 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Oct 2012 17:37:35 +0100
Message-Id: <1351096656-32438-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1351096656-32438-1-git-send-email-ross.burton@intel.com>
References: <1351096656-32438-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQlDEAASgz9YDtiaePg9QhzKb6mJUX8EwAtaYt5sjEGAWskuZCwlRxbv5lk+jfls2wm2seX8DjsYpJQiV3J2DfEmnB7lcIQdUQICvTl3no/DGuoYGA+Usq9uVCOI4knTsrZEAzz/7b5XiH75z+4j7yuRnSRQJdrFos/HfjJb3kwBf1Bksn6Cli9Ak67Y2RlD42kSY1Ei
Subject: [PATCH 3/4] pulseaudio: fix library packaging
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

libpulsecommon has moved into libdir/pulse.

libpulsedsp is an internal library for padsp so put that into pulseaudio-misc
along with padsp.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc    |    7 +++----
 meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb |    2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 70b77da..8c19c22 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -64,7 +64,7 @@ USERADD_PARAM_pulseaudio-server = "--system --home /var/run/pulse \
                               --no-create-home --shell /bin/false \
                               --groups audio,pulse --gid pulse pulse"
 
-PACKAGES =+ "libpulsecore libpulsecommon libpulsedsp libpulse libpulse-simple libpulse-browse libpulse-mainloop-glib \
+PACKAGES =+ "libpulsecore libpulsecommon libpulse libpulse-simple libpulse-browse libpulse-mainloop-glib \
              pulseaudio-server pulseaudio-misc"
 
 #upgrade path:
@@ -73,8 +73,7 @@ RREPLACES_pulseaudio-server = "libpulse-bin libpulse-conf"
 PACKAGES_DYNAMIC += "^pulseaudio-lib.* ^pulseaudio-module.* ^libpulse-lib.* ^libpulse-module.* "
 
 FILES_libpulsecore = "${libdir}/libpulsecore*.so"
-FILES_libpulsecommon = "${libdir}/libpulsecommon*.so"
-FILES_libpulsedsp = "${libdir}/libpulsedsp*.so"
+FILES_libpulsecommon = "${libdir}/pulseaudio/libpulsecommon*.so"
 FILES_libpulse = "${libdir}/libpulse.so.*"
 FILES_libpulse-simple = "${libdir}/libpulse-simple.so.*"
 FILES_libpulse-browse = "${libdir}/libpulse-browse.so.*"
@@ -86,7 +85,7 @@ FILES_${PN}-dev += "${libdir}/pulse-${PV}/modules/*.la ${datadir}/vala ${libdir}
 FILES_${PN}-conf = "${sysconfdir}"
 FILES_${PN}-bin += "${sysconfdir}/default/volatiles/volatiles.04_pulse"
 FILES_${PN}-server = "${bindir}/pulseaudio ${bindir}/start-* ${sysconfdir} ${bindir}/pactl ${base_libdir}/udev/rules.d/*.rules"
-FILES_${PN}-misc = "${bindir}/*"
+FILES_${PN}-misc = "${bindir}/* ${libdir}/pulseaudio/libpulsedsp.so"
 
 # Allow the pulseaudio package to be created empty as a placeholder (-dbg and -dev depend on it)
 ALLOW_EMPTY_${PN} = "1"
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
index 07410a4..6d5eb5f 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
@@ -1,6 +1,6 @@
 require pulseaudio.inc
 
-PR = "r9"
+PR = "r10"
 
 DEPENDS += "libjson gdbm speex libxml-parser-perl-native"
 
-- 
1.7.10



