Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SsN5U-0004gS-Ex
	for openembedded-core@lists.openembedded.org;
	Sat, 21 Jul 2012 01:58:24 +0200
Received: by obcva7 with SMTP id va7so5510507obc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2012 16:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=IEU9FYXUvSaiXePxpLPgmhcOpbOF23ezWJfN6FrLQKw=;
	b=qUw0CzoPYt7CJvR/hfh7Zt36OtB5CuMk79Rd+jmsBhzCmUxsWLVLXomQv/k/AP0MA8
	GF5mfl9eY59uU/Ee9q6T3Gfawum4d+yeCtAuLi8e2RU1VNiHjI0ZD2DattsrvUTNLJmH
	ID5JCIJPWwoknulc7AKsovzsWSe03r5l16or4E/8cdphT681nxIhWc2+J4s593xVYoH5
	ZCp8zOJUP7PqsCgOzG9+NBb7cYguDXZlv+SXqn8fvMFT5EpYA8ioodQXUQ+Su2Bzv3Qe
	9qejKA32/NoU+035es9eVvaYZYtg5pPfbF9J+ShymOIeB2qs7KrKXblGcpZkWurnVxsI
	4xBg==
Received: by 10.182.156.97 with SMTP id wd1mr9450804obb.25.1342828020330;
	Fri, 20 Jul 2012 16:47:00 -0700 (PDT)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id i5sm3448352oei.4.2012.07.20.16.46.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 20 Jul 2012 16:46:59 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jul 2012 16:46:39 -0700
Message-Id: <f904e8dc0fb4e6b1d39feecaf87b2975c9c45d7c.1342827927.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1342827927.git.chris_larson@mentor.com>
References: <cover.1342827927.git.chris_larson@mentor.com>
In-Reply-To: <cover.1342827927.git.chris_larson@mentor.com>
References: <cover.1342827927.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 1/3] bluez4: use PACKAGECONFIG to control 'pie'
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
X-List-Received-Date: Fri, 20 Jul 2012 23:58:24 -0000

From: Christopher Larson <chris_larson@mentor.com>

This lets us control whether we build position independent executables. As, as
far as I know no distros are adding a 'pie' distro feature, the effect of this
commit for most will be to disable pie in bluez4. I think this is best to
ensure consistent behavior among the recipes with regard to this.

This also sidesteps a build failure I've seen with bluez4 failing due to
libudev.a not having been built fPIC.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-connectivity/bluez/bluez4.inc      |    6 +++++-
 meta/recipes-connectivity/bluez/bluez4_4.101.bb |    2 +-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/bluez/bluez4.inc b/meta/recipes-connectivity/bluez/bluez4.inc
index 6dc06f4..6ddd58d 100644
--- a/meta/recipes-connectivity/bluez/bluez4.inc
+++ b/meta/recipes-connectivity/bluez/bluez4.inc
@@ -10,8 +10,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
 DEPENDS = "udev libusb dbus-glib glib-2.0 libcheck"
 RDEPENDS_${PN}-dev = "bluez-hcidump"
 
-PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)}"
+PACKAGECONFIG ??= "\
+    ${@base_contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)}\
+    ${@base_contains('DISTRO_FEATURES', 'pie', 'pie', '', d)}\
+"
 PACKAGECONFIG[alsa] = "--enable-alsa,--disable-alsa,alsa-lib"
+PACKAGECONFIG[pie] = "--enable-pie,--disable-pie,"
 
 ASNEEDED = ""
 
diff --git a/meta/recipes-connectivity/bluez/bluez4_4.101.bb b/meta/recipes-connectivity/bluez/bluez4_4.101.bb
index 4a360b6..e26d4ea 100644
--- a/meta/recipes-connectivity/bluez/bluez4_4.101.bb
+++ b/meta/recipes-connectivity/bluez/bluez4_4.101.bb
@@ -1,6 +1,6 @@
 require bluez4.inc
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI += "file://bluetooth.conf \
             file://sbc_mmx.patch"
-- 
1.7.9.5



