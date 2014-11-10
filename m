Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa07-10.prod.phx3.secureserver.net
	(p3plsmtpa07-10.prod.phx3.secureserver.net [173.201.192.239])
	by mail.openembedded.org (Postfix) with ESMTP id 481D77204C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Nov 2014 21:13:24 +0000 (UTC)
Received: from llc.pab ([75.72.225.8])
	by p3plsmtpa07-10.prod.phx3.secureserver.net with 
	id DxDM1p00G0BVjqb01xDQvq; Mon, 10 Nov 2014 14:13:24 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Nov 2014 15:13:01 -0600
Message-Id: <c6541063809c2a82669f494eadb0294fdef8b55c.1415647839.git.pab@pabigot.com>
X-Mailer: git-send-email 1.8.5.5
In-Reply-To: <cover.1415647839.git.pab@pabigot.com>
References: <cover.1415647839.git.pab@pabigot.com>
In-Reply-To: <cover.1415647839.git.pab@pabigot.com>
References: <cover.1415647839.git.pab@pabigot.com>
Subject: [RFC 04/14] bluez-hcidump: select provider for bluez4/bluez5
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Nov 2014 21:13:28 -0000

bluez-hcidump was a separate package in bluez4, but was integrated into
bluez5.

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
 meta/conf/distro/include/default-providers.inc       | 1 +
 meta/recipes-connectivity/bluez/bluez-hcidump_2.5.bb | 2 ++
 meta/recipes-connectivity/bluez5/bluez5.inc          | 3 ++-
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index e357870..55633ba 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -45,5 +45,6 @@ PREFERRED_PROVIDER_udev ?= "${@bb.utils.contains('DISTRO_FEATURES','systemd','sy
 # There are issues with runtime packages and PREFERRED_PROVIDER, see YOCTO #5044 for details
 # on this rather strange entry.
 PREFERRED_PROVIDER_bluez4 ?= "bluez4"
+PREFERRED_PROVIDER_bluez-hcidump ?= "bluez-hcidump"
 # Alternative is ltp-ddt in meta-oe: meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bb
 PREFERRED_PROVIDER_ltp ?= "ltp"
diff --git a/meta/recipes-connectivity/bluez/bluez-hcidump_2.5.bb b/meta/recipes-connectivity/bluez/bluez-hcidump_2.5.bb
index 5c1f476..3950630 100644
--- a/meta/recipes-connectivity/bluez/bluez-hcidump_2.5.bb
+++ b/meta/recipes-connectivity/bluez/bluez-hcidump_2.5.bb
@@ -3,7 +3,9 @@ DESCRIPTION = "The hcidump tool reads raw HCI data coming from and going to a Bl
 and displays the commands, events and data in a human-readable form."
 
 SECTION = "console"
+# hcidump was integrated into bluez5
 DEPENDS = "bluez4"
+RCONFLICTS_${PN} = "bluez5"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
                     file://src/hcidump.c;beginline=1;endline=23;md5=3bee3a162dff43a5be7470710b99fbcf"
diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 97a28e3..241b16f 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -7,7 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
                     file://COPYING.LIB;md5=fb504b67c50331fc78734fed90fb0e09 \
                     file://src/main.c;beginline=1;endline=24;md5=9bc54b93cd7e17bf03f52513f39f926e"
 DEPENDS = "udev libusb dbus-glib glib-2.0 libcheck readline"
-PROVIDES += "virtual/bluez"
+PROVIDES += "virtual/bluez bluez-hcidump"
+RPROVIDES_${PN} += "bluez-hcidump"
 
 RCONFLICTS_${PN} = "bluez4"
 
-- 
1.8.5.5


