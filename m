Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Ptcxu-0007DK-It
	for openembedded-core@lists.openembedded.org;
	Sun, 27 Feb 2011 10:30:58 +0100
Received: by mail-ww0-f43.google.com with SMTP id 15so3168700wwe.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Feb 2011 01:29:37 -0800 (PST)
Received: by 10.227.29.36 with SMTP id o36mr3819835wbc.193.1298798973811;
	Sun, 27 Feb 2011 01:29:33 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id f27sm2272962wbf.1.2011.02.27.01.29.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 27 Feb 2011 01:29:33 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Sun, 27 Feb 2011 10:29:07 +0100
Message-Id: <610276b5960280c29842788445ace576b2e381e1.1298798633.git.koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <cover.1298798633.git.koen@dominion.thruhere.net>
References: <cover.1298798633.git.koen@dominion.thruhere.net>
Subject: [PATCH 03/50] xf86-video-intel: add config option to support rootless X
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
X-List-Received-Date: Sun, 27 Feb 2011 09:30:58 -0000

From: Yu Ke <ke.yu@intel.com>

- add global config option ROOTLESS_X to control if enable
  rootless X for the machine. ROOTLESS_X requires graphics
  driver supporting KMS (kernel mode setting), so far, only
  atom_pc support this. so enable ROOTLESS_X for atom_pc machine

- add config options for xf86-video-intel to support rootless X

Signed-off-by: Yu Ke <ke.yu@intel.com>
---
 meta/conf/machine/atom-pc.conf                     |    2 ++
 .../xorg-driver/xf86-video-intel_2.14.0.bb         |    5 +++++
 2 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/meta/conf/machine/atom-pc.conf b/meta/conf/machine/atom-pc.conf
index 58c9b0d..b94deb2 100644
--- a/meta/conf/machine/atom-pc.conf
+++ b/meta/conf/machine/atom-pc.conf
@@ -42,3 +42,5 @@ GLIBC_ADDONS = "nptl"
 GLIBC_EXTRA_OECONF = "--with-tls"
 
 EXTRA_OECONF_append_pn-matchbox-panel-2 = " --with-battery=acpi"
+
+ROOTLESS_X = "1"
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.14.0.bb b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.14.0.bb
index 017a2e0..099cf9d 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.14.0.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.14.0.bb
@@ -9,8 +9,13 @@ Infrastructure (DRI)."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=8730ad58d11c7bbad9a7066d69f7808e"
 
+PR = "r1"
+
 EXTRA_OECONF += "--disable-xvmc"
 
+# --enable-kms-only option is required by ROOTLESS_X
+EXTRA_OECONF += '${@base_conditional( "ROOTLESS_X", "1", " --enable-kms-only", "", d )}'
+
 DEPENDS += "virtual/libx11 libxvmc drm xf86driproto glproto \
 	    virtual/libgl xineramaproto xf86driproto libpciaccess"
 
-- 
1.6.6.1



