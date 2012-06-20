Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1ShJqj-0004Pt-CG
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jun 2012 14:17:29 +0200
Received: from mail-wg0-f44.google.com ([74.125.82.44])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 20 Jun 2012 05:06:43 -0700
Received: by wgbdr13 with SMTP id dr13so5078867wgb.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2012 05:06:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=HW437MCTy5hO90spIu+XwP/0x/coyX0aDaVzbUVcWOk=;
	b=Yp/TQHk4gnM5o5DHn79JLGwiUYyh4KqX8hYzV6FxMBC/03MYV/X/JMxtEE3z4XN+bg
	KXJRPW3yvG+y1+T34Zh/RFhGRVo1JW/HJZcK1H2tmglwwCJJZb7GxFvMbf7G7/1iP4Kh
	b6JMrLKBHabPin8ZiTI9XEf8AMv2UjXpsR4pVb5Hnwezyp6lsMJwgDT1LryX/oEWLwfd
	tderWrjjlt2fM0FZcT0JXNdcKP3LwNGwgDwf8ucJxQkO1z17b1McFMr1F381o/g7FKb4
	bTjc87rOa1kOFsH4RjZA9Sv1dx8KYwMJIYOPM2aH5Y943h1zS9cYZYNWBajKxfy0oHcg
	MdfA==
Received: by 10.216.203.201 with SMTP id f51mr12512565weo.52.1340194001669;
	Wed, 20 Jun 2012 05:06:41 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPS id z8sm73366810wiy.1.2012.06.20.05.06.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Jun 2012 05:06:40 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jun 2012 13:06:38 +0100
Message-Id: <1340193998-28590-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQlQYGDhca6je6n9Mspbl2xylNLZEPyw1LCZp8b25MhDMPKJ6gJvwGzrTvHf4SSBSCyuVdw7
Subject: [PATCH] sato-icon-theme: inherit the GNOME icon theme (Yocto #2594)
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
X-List-Received-Date: Wed, 20 Jun 2012 12:17:29 -0000

Many apps want to use the full GNOME icon theme and install it, but if our theme
doesn't inherit it the the icons are not available.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../0001-Inherit-the-GNOME-icon-theme.patch        |   29 ++++++++++++++++++++
 .../sato-icon-theme/sato-icon-theme_0.4.1.bb       |    5 ++--
 2 files changed, 32 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-sato/sato-icon-theme/sato-icon-theme/0001-Inherit-the-GNOME-icon-theme.patch

diff --git a/meta/recipes-sato/sato-icon-theme/sato-icon-theme/0001-Inherit-the-GNOME-icon-theme.patch b/meta/recipes-sato/sato-icon-theme/sato-icon-theme/0001-Inherit-the-GNOME-icon-theme.patch
new file mode 100644
index 0000000..073ad25
--- /dev/null
+++ b/meta/recipes-sato/sato-icon-theme/sato-icon-theme/0001-Inherit-the-GNOME-icon-theme.patch
@@ -0,0 +1,29 @@
+From b9f02989310a3c920589f1aa646bcbf16b2572a0 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Wed, 13 Jun 2012 11:07:33 +0100
+Subject: [PATCH] Inherit the GNOME icon theme
+
+If the GNOME icon theme isn't installed this is a no-op, but if it is then
+you'll get fallback from Sato to GNOME for icons that are not in Sato.
+
+As applications that use the full GNOME icon theme depend on gnome-icon-theme,
+this just works.
+---
+ index.theme |    1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/index.theme b/index.theme
+index c4b03a7..688fbbf 100644
+--- a/index.theme
++++ b/index.theme
+@@ -1,6 +1,7 @@
+ [Icon Theme]
+ Name=Sato
+ Comment=Sato icon theme
++Inherits=gnome
+ 
+ Directories=16x16/apps,16x16/status,16x16/stock,16x16/places,16x16/mimetypes,16x16/devices,16x16/actions,22x22/apps,22x22/status,22x22/stock,22x22/places,22x22/mimetypes,22x22/devices,22x22/actions,32x32/apps,32x32/status,32x32/stock,32x32/places,32x32/mimetypes,32x32/devices,32x32/actions,48x48/apps,48x48/status,48x48/stock,48x48/places,48x48/mimetypes,48x48/devices,48x48/actions,64x64/apps,64x64/status,64x64/stock,64x64/places,64x64/mimetypes,64x64/devices,64x64/actions,
+ 
+-- 
+1.7.10
+
diff --git a/meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb b/meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb
index 652424a..108f8e8 100644
--- a/meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb
+++ b/meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb
@@ -2,10 +2,11 @@ require sato-icon-theme.inc
 
 DEPENDS += "icon-naming-utils-native"
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "http://pokylinux.org/releases/sato/${BPN}-${PV}.tar.gz \
-           file://iconpath-option.patch"
+           file://iconpath-option.patch \
+           file://0001-Inherit-the-GNOME-icon-theme.patch"
 
 SRC_URI[md5sum] = "86a847f3128a43a9cf23b7029a656f50"
 SRC_URI[sha256sum] = "0b0a2807a6a96918ac799a86094ec3e8e2c892be0fd679a4232c2a77f2f61732"
-- 
1.7.10



