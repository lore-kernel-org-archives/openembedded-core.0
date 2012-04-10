Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SHhlg-0004Kz-Ov
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Apr 2012 22:34:24 +0200
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Apr 2012 22:25:04 +0200
Message-Id: <1334089504-25910-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] busybox: fix options -b, -a and -P
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
X-List-Received-Date: Tue, 10 Apr 2012 20:34:24 -0000

* busybox-udhcpc-no_deconfig.patch broke the options,
  preventing udhcpc from forking into the background
  if no lease can be obtained.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 .../busybox-udhcpc-no_deconfig.patch               |   19 +++++++++++++------
 meta/recipes-core/busybox/busybox_1.19.4.bb        |    2 +-
 2 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox-1.19.4/busybox-udhcpc-no_deconfig.patch b/meta/recipes-core/busybox/busybox-1.19.4/busybox-udhcpc-no_deconfig.patch
index 481d8b3..13004f7 100644
--- a/meta/recipes-core/busybox/busybox-1.19.4/busybox-udhcpc-no_deconfig.patch
+++ b/meta/recipes-core/busybox/busybox-1.19.4/busybox-udhcpc-no_deconfig.patch
@@ -1,4 +1,4 @@
-From 16c5fa61059f9862b2534c75dad75f7ece338208 Mon Sep 17 00:00:00 2001
+From 53626cd06a3ef05ed847daea802ef0aa9661caa7 Mon Sep 17 00:00:00 2001
 From: Anders Darander <anders@chargestorm.se>
 Date: Thu, 3 Nov 2011 08:51:31 +0100
 Subject: [PATCH] busybox-udhcpc-no_deconfig.patch
@@ -23,12 +23,16 @@ Signed-off-by: Qing He <qing.he@intel.com>
 Updated to Busybox 1.19.3
 
 Signed-off-by: Anders Darander <anders@chargestorm.se>
+
+Fixed options -b, -a and -P.
+
+Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
 ---
- networking/udhcp/dhcpc.c |   27 ++++++++++++++++++++-------
- 1 files changed, 20 insertions(+), 7 deletions(-)
+ networking/udhcp/dhcpc.c |   29 +++++++++++++++++++++--------
+ 1 files changed, 21 insertions(+), 8 deletions(-)
 
 diff --git a/networking/udhcp/dhcpc.c b/networking/udhcp/dhcpc.c
-index 4d755e6..eb80484 100644
+index 4d755e6..a21e2c6 100644
 --- a/networking/udhcp/dhcpc.c
 +++ b/networking/udhcp/dhcpc.c
 @@ -29,6 +29,9 @@
@@ -41,14 +45,17 @@ index 4d755e6..eb80484 100644
  /* struct client_config_t client_config is in bb_common_bufsiz1 */
  
  
-@@ -82,6 +85,7 @@ enum {
+@@ -82,8 +85,9 @@ enum {
  	OPT_x = 1 << 18,
  	OPT_f = 1 << 19,
  	OPT_B = 1 << 20,
 +	OPT_D = 1 << 21,
  /* The rest has variable bit positions, need to be clever */
- 	OPTBIT_B = 20,
+-	OPTBIT_B = 20,
++	OPTBIT_D = 21,
  	USE_FOR_MMU(             OPTBIT_b,)
+ 	IF_FEATURE_UDHCPC_ARPING(OPTBIT_a,)
+ 	IF_FEATURE_UDHCP_PORT(   OPTBIT_P,)
 @@ -899,7 +903,8 @@ static void perform_renew(void)
  		state = RENEW_REQUESTED;
  		break;
diff --git a/meta/recipes-core/busybox/busybox_1.19.4.bb b/meta/recipes-core/busybox/busybox_1.19.4.bb
index 3f22669..ad8297e 100644
--- a/meta/recipes-core/busybox/busybox_1.19.4.bb
+++ b/meta/recipes-core/busybox/busybox_1.19.4.bb
@@ -1,5 +1,5 @@
 require busybox.inc
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://udhcpscript.patch \
-- 
1.7.5.4



