Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RZ5gx-0005hL-Hp
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Dec 2011 20:01:07 +0100
Received: by ggnh1 with SMTP id h1so3539746ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Dec 2011 10:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=5ZBPyA2L9qrS+/aWBTnRWxeQiLugc12ScEL5BMH8DTQ=;
	b=nzNPEmX2/M2UiJ9R85rFPbG0Q+Ffep5bA5lj14RhTVZbGgMzEb96oyfUduv7VVfeZU
	CNk0H3pueO+SP1E8HLSMqcIZ7ktzk8ljYxGQtM5j7WhUe+dXbeSlJ9Ikx8iklpJkbJRF
	RgIgb1dv/212hJlN2gxAm6mi5Z2yFl8HiPvmU=
Received: by 10.101.182.16 with SMTP id j16mr2218263anp.37.1323456853165;
	Fri, 09 Dec 2011 10:54:13 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id 39sm26237714anu.6.2011.12.09.10.54.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 09 Dec 2011 10:54:12 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Dec 2011 18:54:02 +0000
Message-Id: <1323456842-16941-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH] connman: disable ntp support
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
X-List-Received-Date: Fri, 09 Dec 2011 19:01:07 -0000

OE-Core does not provide ntpd at this moment and as there's no known
user of this plugin at this moment we are disabling it.

[YOCTO #1817]

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-connectivity/connman/connman.inc     |    6 ++----
 meta/recipes-connectivity/connman/connman_0.78.bb |    2 +-
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index e90aa4b..d695fee 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
                     file://src/main.c;beginline=1;endline=20;md5=4b55b550fa6b33cc2055ef30dd262b3e"
 
 # we need to define the depends here, the dynamic stuff is too late
-DEPENDS  = "dbus glib-2.0 ppp iptables gnutls ntp \
+DEPENDS  = "dbus glib-2.0 ppp iptables gnutls \
             ${@base_contains('DISTRO_FEATURES', 'bluetooth','bluez4', '', d)} \
             ${@base_contains('DISTRO_FEATURES', 'wifi','wpa-supplicant', '', d)} \
             "
@@ -36,8 +36,7 @@ EXTRA_OECONF += "\
     --disable-polkit \
     --enable-client \
     --enable-fake \
-    --enable-ntpd \
-    --with-ntpd=${bindir}/ntpd \
+    --disable-ntpd \
 "
 
 INITSCRIPT_NAME = "connman"
@@ -72,7 +71,6 @@ python populate_packages_prepend() {
 	               wifi="wpa-supplicant",
 	               resolvconf="resolvconf",
 	               bluetooth="bluez4",
-	               ntpd="ntp",
 	               ofono="ofono" )
 	packages = []
 	multilib_prefix = (d.getVar("MLPREFIX", True) or "")
diff --git a/meta/recipes-connectivity/connman/connman_0.78.bb b/meta/recipes-connectivity/connman/connman_0.78.bb
index cc23c28..5ea2bb7 100644
--- a/meta/recipes-connectivity/connman/connman_0.78.bb
+++ b/meta/recipes-connectivity/connman/connman_0.78.bb
@@ -1,6 +1,6 @@
 require connman.inc
 
-PR = "r1"
+PR = "r2"
 
 # 0.78 tag
 SRCREV = "02f5d5fe2d7c71514a6387ba2b772b42d8e8d297"
-- 
1.7.2.5



