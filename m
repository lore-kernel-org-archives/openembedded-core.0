Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TR4Bv-0005iE-BG
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Oct 2012 18:52:28 +0200
Received: from mail-ea0-f197.google.com ([209.85.215.197])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 24 Oct 2012 09:38:56 -0700
Received: by mail-ea0-f197.google.com with SMTP id i1so546985eaa.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Oct 2012 09:38:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=7EmjDau3tX0pmj4ZAWscSnhxc2UfiFMoZWOouIvPVyo=;
	b=MHDgyC4kBIf0Hzke1zi3d3X5gOq0aQSZMjAIxepON2f9DxpHjva4qLlrVgnC//egx8
	pXwZkEY/9Fk26m9gDdIl/2RrCQszwP0/+wVYeYm7fNKqlnBN5zmc4vc9Kf59VOXKg0sR
	5sanHgZW7/3XDolmZPHB7hqLXZtHmeBttxEQHpNwOj5XOMdcw9Ui8BDjJgyjKKIk6+o+
	EbBhHMbsrYCQhTEi92/4/wCqeq6DrIAwL77iTF4cdYhgW+fgQdmXhVA0tdSpSxzcKQsn
	79uqdtUoZ03MniV2y5piPTejBvAyd8knzWn5C5utyT8BrWj3KWevwt/Kf6AsbJ71sk0r
	6PeQ==
Received: by 10.216.54.149 with SMTP id i21mr9693244wec.162.1351096731375;
	Wed, 24 Oct 2012 09:38:51 -0700 (PDT)
Received: by 10.216.54.149 with SMTP id i21mr9693241wec.162.1351096731228;
	Wed, 24 Oct 2012 09:38:51 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id fp6sm5146349wib.0.2012.10.24.09.38.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 24 Oct 2012 09:38:49 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Oct 2012 17:37:33 +0100
Message-Id: <1351096656-32438-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQnOykPmt3rftmkqhAtFyvTcNn6E8O3xLcb/Qim0jVuW/kougX5XyHD9jqR9pbqvTl4jEiJHNiCO/wid1K+4whslb4P04qc/kSVA/NvJL1y/PGIrY1YmA6+3IgiR8PPqN/2wQSj+Ji0PGVyJjtu2XPpuezAaiyYJpw7Pbd7MblIqNRO2ZyXkhRCM3wjiWQ6hblYURYcT
Subject: [PATCH 1/4] pulseaudio: add GConf dependency
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
X-List-Received-Date: Wed, 24 Oct 2012 16:52:28 -0000

Add explicit build-dependency on GConf as currently it's an implicit dependency
and so vunerable to races at build time.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc    |    2 +-
 meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 463777d..ab70c7e 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://GPL;md5=4325afd396febcb659c36b49533135d4 \
 DEPENDS = "libatomics-ops liboil avahi libsamplerate0 libsndfile1 libtool \
            ${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxtst libice libsm libxcb gtk+', '', d)}"
 # optional
-DEPENDS += "udev alsa-lib glib-2.0 dbus \
+DEPENDS += "udev alsa-lib glib-2.0 dbus gconf \
            ${@base_contains('DISTRO_FEATURES', 'bluetooth', 'bluez4', '', d)}"
 
 SRC_URI = "http://0pointer.de/lennart/projects/pulseaudio/pulseaudio-${PV}.tar.gz \
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
index a10b953..d25b424 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
@@ -1,6 +1,6 @@
 require pulseaudio.inc
 
-PR = "r7"
+PR = "r8"
 
 DEPENDS += "libjson gdbm speex libxml-parser-perl-native"
 
-- 
1.7.10



