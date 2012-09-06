Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T9eQz-0004pA-Q0
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Sep 2012 17:56:02 +0200
Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 06 Sep 2012 08:43:35 -0700
Received: by wibhn17 with SMTP id hn17so1400642wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2012 08:43:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=me1Gw7S9c607ndAX37jDf8/v/wBlvmVMst60810Sy2U=;
	b=hKyRl9Jv4JEp20BIcYUBblV28wiilR/+JUMDRpY9+1ff8M08hb1SN9kDm5TZxun6fl
	6nKr36aocz+oHRAHM0yFt/0cmOPpmWx2FdbhiNVt5P2D1FlTlCHaq+nonwrMPcPZ97g1
	eNMBuu/vqRm7latcq8zezlhuXUvR6bgli+5K6ZIFMCGeSiJGExaGPMQPqCFBavBkpnaL
	Iav2tQt1eZVcjFI4KnmS7NscSyTUcYTbsaJ9D41FDet6grfOA7bOlMTNjoJVSi7/YV0g
	odVCz+2CyGFnppaxYHOPr/wS48dZlNrjH2MKz7xg8HWq5/J3CBK6LcmA0QyuXXqZsEJ+
	Qcjw==
Received: by 10.216.121.16 with SMTP id q16mr1325484weh.193.1346946213921;
	Thu, 06 Sep 2012 08:43:33 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id cl8sm4643412wib.10.2012.09.06.08.43.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Sep 2012 08:43:32 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Sep 2012 16:42:48 +0100
Message-Id: <1346946168-7482-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQnC+NolxIxW30qya97ki4NEPUMp6NbLXFPCO8StTogerTISO+SW3Jy5u/08N6HJ6ibfMtlq
Subject: [PATCH] pulseaudio: remove ConsoleKit dependency
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
X-List-Received-Date: Thu, 06 Sep 2012 15:56:02 -0000

ConsoleKit is a runtime dependency for the ConsoleKit module, but there isn't a
build-time dependency.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc    |    2 +-
 meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 315d4dc..14e90a2 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://GPL;md5=4325afd396febcb659c36b49533135d4 \
 DEPENDS = "libatomics-ops liboil avahi libsamplerate0 libsndfile1 libtool \
            ${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxtst libice libsm libxcb gtk+', '', d)}"
 # optional
-DEPENDS += "udev alsa-lib glib-2.0 dbus consolekit \
+DEPENDS += "udev alsa-lib glib-2.0 dbus \
            ${@base_contains('DISTRO_FEATURES', 'bluetooth', 'bluez4', '', d)}"
 
 SRC_URI = "http://0pointer.de/lennart/projects/pulseaudio/pulseaudio-${PV}.tar.gz \
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
index 97bd4d3..e39b69e 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
@@ -1,6 +1,6 @@
 require pulseaudio.inc
 
-PR = "r2"
+PR = "r3"
 
 DEPENDS += "libjson gdbm speex libxml-parser-perl-native"
 
-- 
1.7.10



