Received: from comal.ext.ti.com ([198.47.26.152])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1S5GBS-0001Iz-AA
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Mar 2012 13:41:34 +0100
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q27CWs5w022401
	for <openembedded-core@lists.openembedded.org>;
	Wed, 7 Mar 2012 06:32:55 -0600
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id q27CWrNi001911
	for <openembedded-core@lists.openembedded.org>;
	Wed, 7 Mar 2012 18:02:54 +0530 (IST)
Received: from dbdp31.itg.ti.com (172.24.170.98) by dbde70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 7 Mar 2012 18:02:53 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp31.itg.ti.com (8.13.8/8.13.8) with ESMTP id q27CWo8X025797;
	Wed, 7 Mar 2012 18:02:52 +0530 (IST)
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 7 Mar 2012 06:32:48 -0600
Message-ID: <1331123568-23178-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCHv2] bluez4: add dependency on libcheck to enable test modules
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
X-List-Received-Date: Wed, 07 Mar 2012 12:41:35 -0000
Content-Type: text/plain

* The later versions of bluez such as 4.98 require libcheck
  in order to build the test packages as enabled by the
  --enable-test option passed in EXTRA_OECONF.
* Failure to have the libcheck package availalbe results in the
  configure script ignoring the --enable-test option and not
  building the test modules.
* Adding libcheck, which is greater than the minimum required
  version of the check library of 0.9.6 allows building the
  test modules.
* Build tested for am335x-evm MACHINE type and run time tested
  by back porting this fix to the oe-classic and arago setup
  and booting on am335x-evm.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
* Updated in version 2:
    * Bumped the PR of the bluez4_4.98 recipe.  I assume this is the
      way to handle changes to the .inc file since there is no INC_PR

---
 meta/recipes-connectivity/bluez/bluez4.inc     |    2 +-
 meta/recipes-connectivity/bluez/bluez4_4.98.bb |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/bluez/bluez4.inc b/meta/recipes-connectivity/bluez/bluez4.inc
index 9158687..fbbe0bf 100644
--- a/meta/recipes-connectivity/bluez/bluez4.inc
+++ b/meta/recipes-connectivity/bluez/bluez4.inc
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
                     file://COPYING.LIB;md5=fb504b67c50331fc78734fed90fb0e09 \
                     file://src/main.c;beginline=1;endline=24;md5=9bc54b93cd7e17bf03f52513f39f926e \
                     file://sbc/sbc.c;beginline=1;endline=25;md5=1a40781ed30d50d8639323a184aeb191"
-DEPENDS = "udev alsa-lib libusb dbus-glib glib-2.0"
+DEPENDS = "udev alsa-lib libusb dbus-glib glib-2.0 libcheck"
 RDEPENDS_${PN}-dev = "bluez-hcidump"
 
 ASNEEDED = ""
diff --git a/meta/recipes-connectivity/bluez/bluez4_4.98.bb b/meta/recipes-connectivity/bluez/bluez4_4.98.bb
index 2412b1b..9a4c682 100644
--- a/meta/recipes-connectivity/bluez/bluez4_4.98.bb
+++ b/meta/recipes-connectivity/bluez/bluez4_4.98.bb
@@ -1,6 +1,6 @@
 require bluez4.inc
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI += "file://bluetooth.conf \
             file://sbc_mmx.patch \
-- 
1.7.0.4



