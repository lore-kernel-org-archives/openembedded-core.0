Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SmTDf-0003kL-9e
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jul 2012 19:18:27 +0200
Received: from mail-wi0-f172.google.com ([209.85.212.172])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 04 Jul 2012 10:07:22 -0700
Received: by wibhm11 with SMTP id hm11so4517055wib.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Jul 2012 10:07:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=Sr3O6xVdL5dcO0xCkTh800rMuBnEDLCuQk1H6ZdCb3k=;
	b=XSzUntR74b0PVu+eNkQuCagaocW9Ocllaovu07rKhIBOm4tcNbPn4UIo163mKZYBOs
	eDjDhCL/aAE2IQAOYjMdH7eiPuOduVXxnSuFQNEef7nLIokfSqdutVKZ+b9wiQkoNlX9
	TfQeHwkLukiETgEUh86KvRpZJGhrunbWom3a29MqZsFCXXoJcipvv+fcMDjIgwebwaWK
	msHpVdS5jb3FtXOaheB6M0AsoLHXeZN/pErY+mapX8OSaH+E/x4t6t6bfUpAOa8oKnT7
	aeK+THVb+llKJT4xb3GDw+XmNnV2CKu0mIinI7/1URiOsoC5tE6Xje0y9JWZL3tTGDJP
	xI+w==
Received: by 10.216.216.154 with SMTP id g26mr6301768wep.120.1341421640548;
	Wed, 04 Jul 2012 10:07:20 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id db7sm37749064wib.6.2012.07.04.10.07.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 04 Jul 2012 10:07:19 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Jul 2012 18:07:12 +0100
Message-Id: <1341421633-26056-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQmfvKDPUXGM4rggTHXCVEBIe1rn6vVFrziaBgd6PiKUn2g9xU3C0FwLyscXjdbo9P3FK/6l
Subject: [PATCH] gthumb: run make install in parallel
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
X-List-Received-Date: Wed, 04 Jul 2012 17:18:27 -0000

We used to disable parallel make install because it was live-locking.  I've
since fixed a bug in gconf.bbclass that could have caused this, where
gconftool was incorrectly running in make install.  It's certainly been seen
to crash when attempting a buggy atomic rename, so I wouldn't rule out it
live-locking too.

I can't replicate the live lock in my own testing (8-way).  If it comes back
we can revert this and have another look.

[YOCTO #2319]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/gthumb/gthumb_2.12.4.bb |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-gnome/gthumb/gthumb_2.12.4.bb b/meta/recipes-gnome/gthumb/gthumb_2.12.4.bb
index 6ab63bb..7dfccb5 100644
--- a/meta/recipes-gnome/gthumb/gthumb_2.12.4.bb
+++ b/meta/recipes-gnome/gthumb/gthumb_2.12.4.bb
@@ -4,12 +4,10 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 DEPENDS = "glib-2.0 gtk+ libxml2 gnome-doc-utils libunique gconf libpng gstreamer jpeg tiff gst-plugins-base"
 
-PR = "r3"
+PR = "r4"
 
 EXTRA_OECONF = "--disable-gnome-keyring --disable-libsoup --disable-exiv2 --disable-clutter"
 
-PARALLEL_MAKEINST=""
-
 inherit gnome pkgconfig
 
 SRC_URI[archive.md5sum] = "97fc13221b0c5d80c27a2e25a3a3ac6f"
-- 
1.7.10



