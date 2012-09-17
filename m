Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TDaJf-0003JV-8Z
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Sep 2012 14:20:43 +0200
Received: by mail-wg0-f43.google.com with SMTP id dq11so2288325wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2012 05:08:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=RqoxWuDTsKSBbbv4B6mdyNAFq+MvQCYFL1UjrSufH78=;
	b=DcIyHgmw8XX2JpQF9EWNg1J61/W15WOuPj8+obBOWwNu9kr9QBUjRbgdnMJuMJAYJZ
	N0sBbm+kmi5Ca6v5mu0Byt5kLT/l1iQIcr9Q8BhS626IIEGmW3MvOXsjDrq3G3UUwQTR
	FMs2oEoAQHsFAsoFC8NZJW3ZgKz66cDaTx5EovSkKVzFtMpzpEZ6MJ5IoS7v2bhOG+ZQ
	iKqRTTieKaXSTgUGDADxy8W9E+4xfA9HGDlmHZHPPAzVgzDSm0S9+O+g9WTbxI0i0SnU
	ntP40o7K//T5jAK+GCUG8xxIpIcarBfXZGqG1VAIf1p4a4NZsB8mwQs3uUrGhm9h8rri
	Ug5w==
Received: by 10.180.93.68 with SMTP id cs4mr15727549wib.14.1347883686983;
	Mon, 17 Sep 2012 05:08:06 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id k20sm17570403wiv.11.2012.09.17.05.08.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Sep 2012 05:08:06 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Sep 2012 14:07:34 +0200
Message-Id: <1347883657-17529-7-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1347883657-17529-1-git-send-email-koen@dominion.thruhere.net>
References: <1347883657-17529-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQkxmxsqdq1Jw+YBGI8LOfCxlgHljIOcHLWqg+18TSuSFOkYl8kQYc+2LH0PqNqReilf/DnS
Cc: Constantin Musca <constantinx.musca@intel.com>,
	Scott Garman <scott.a.garman@intel.com>
Subject: [for-denzil][pulseaudio-updates 07/10] pulseaudio: upgrade to 2.1
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
X-List-Received-Date: Mon, 17 Sep 2012 12:20:44 -0000

From: Constantin Musca <constantinx.musca@intel.com>

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../pulseaudio/pulseaudio_2.0.bb                   |   21 --------------------
 .../pulseaudio/pulseaudio_2.1.bb                   |   21 ++++++++++++++++++++
 2 files changed, 21 insertions(+), 21 deletions(-)
 delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio_2.0.bb
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_2.0.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_2.0.bb
deleted file mode 100644
index 7e57e5e..0000000
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_2.0.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-require pulseaudio.inc
-
-PR = "r0"
-
-DEPENDS += "libjson gdbm speex libxml-parser-perl-native"
-
-inherit gettext perlnative
-
-SRC_URI = "http://freedesktop.org/software/pulseaudio/releases/pulseaudio-${PV}.tar.xz \
-  file://volatiles.04_pulse \
-"
-
-SRC_URI[md5sum] = "9bbde657c353fe675c3b693054175a8e"
-SRC_URI[sha256sum] = "28b42edd42f4879a6884af5f0ec11801ac001eb7582881215b36649aa37e2061"
-
-do_compile_prepend() {
-    cd ${S}
-    mkdir -p ${S}/libltdl
-    cp ${STAGING_LIBDIR}/libltdl* ${S}/libltdl
-}
-
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
new file mode 100644
index 0000000..a61e983
--- /dev/null
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
@@ -0,0 +1,21 @@
+require pulseaudio.inc
+
+PR = "r0"
+
+DEPENDS += "libjson gdbm speex libxml-parser-perl-native"
+
+inherit gettext perlnative
+
+SRC_URI = "http://freedesktop.org/software/pulseaudio/releases/pulseaudio-${PV}.tar.xz \
+  file://volatiles.04_pulse \
+"
+
+SRC_URI[md5sum] = "33e85023259d530f0a763d5204e8bad9"
+SRC_URI[sha256sum] = "ef6b347bf47abfb98080795f1583018ac959b4aeb4df916b879f9e1eaba0ca7f"
+
+do_compile_prepend() {
+    cd ${S}
+    mkdir -p ${S}/libltdl
+    cp ${STAGING_LIBDIR}/libltdl* ${S}/libltdl
+}
+
-- 
1.7.7.6



