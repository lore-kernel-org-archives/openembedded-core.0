Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1ShfFo-0007cE-O2
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jun 2012 13:08:48 +0200
Received: from mail-we0-f180.google.com ([74.125.82.180])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 21 Jun 2012 03:58:01 -0700
Received: by weyt11 with SMTP id t11so297437wey.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2012 03:58:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=dGnmA2iMtmCF5XJYYgtFgqt4+QDcQ3KKhXWRVNPKKQU=;
	b=iy17rhoHLuM9FN0xD/AdkqlYwAT0cc6KclmWkONTR0IF1KNUw8TCCrZxpnsatwQiJF
	26VrZRSuTc9Wo2DWrx7PtDqKCUt0/GszUM1K/sT3p2ybNfXU8CRlW4y46Vur482R694l
	Het0dMj3uWLo5+g9ynb6b2FwRE+++wV5v+sfpWaxUB6Ude1WYrE6cal1IgQkwj7d6Zyk
	UdOfI49mheguLAO+OHRx1Ew5oAlS82iilbgk5QsPx7sYoAfkerqoWVZLyRTZOOTtC+cC
	syzbYha/ldyJbi5jU9ufxR8CfqFNK854S0A7ayY368WTX7jkTjhpDWSboay2eUu2QkUc
	ip9g==
Received: by 10.180.78.233 with SMTP id e9mr19322833wix.5.1340276279593;
	Thu, 21 Jun 2012 03:57:59 -0700 (PDT)
Received: from localhost.localdomain (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id
	gv7sm45215679wib.4.2012.06.21.03.57.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Jun 2012 03:57:58 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Jun 2012 11:57:56 +0100
Message-Id: <1340276276-11520-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.7.6
X-Gm-Message-State: ALoCoQnd2CAPCpKBHcWzuHtC7Tnesu6CL/AE/Mgx1n78SdO94jO01jvUKz44KIbo1jZJqqN6cMEq
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
X-List-Received-Date: Thu, 21 Jun 2012 11:08:49 -0000

Many apps want to use the full GNOME icon theme and install it, but if our theme
doesn't inherit it the the icons are not available.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../0001-Inherit-the-GNOME-icon-theme.patch        |   31 ++++++++++++++++++++
 .../sato-icon-theme/sato-icon-theme_0.4.1.bb       |    5 ++-
 2 files changed, 34 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-sato/sato-icon-theme/sato-icon-theme/0001-Inherit-the-GNOME-icon-theme.patch

diff --git a/meta/recipes-sato/sato-icon-theme/sato-icon-theme/0001-Inherit-the-GNOME-icon-theme.patch b/meta/recipes-sato/sato-icon-theme/sato-icon-theme/0001-Inherit-the-GNOME-icon-theme.patch
new file mode 100644
index 0000000..fa595dc
--- /dev/null
+++ b/meta/recipes-sato/sato-icon-theme/sato-icon-theme/0001-Inherit-the-GNOME-icon-theme.patch
@@ -0,0 +1,31 @@
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
+
+Upstream-Status: Backport
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
1.7.7.6



