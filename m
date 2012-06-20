Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1ShJEs-00019o-75
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jun 2012 13:38:22 +0200
Received: from mail-wi0-f172.google.com ([209.85.212.172])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 20 Jun 2012 04:27:36 -0700
Received: by wibhm11 with SMTP id hm11so1400216wib.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2012 04:27:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=VHspnYPXS/HqkxrrFua8RShI1t7oKyNyGBRi+Kan2yg=;
	b=BioxJhXzAuIiTyTpC4ZCv/ks5D7bAs1ixk+NEaPXIF84N8eqBP4eZkhSK/5vF7azT0
	btn56R1/WWNKQkuxxOMj3QYelSFKfbDih6rROeclldHEGcxD1cqLEjCZWIQe1bsX0BpZ
	AnB+VxucKe358VTmDVJZMjb2s+fgQYZDQGnLTvpnkGV2rUkaUz6xK4LYM2C8Scqh6mi2
	9AZFIOsVN3q6aCB0fE1wKh/b5Wigy6qCwopvfvNtsjFnMqBIrPpQnqNRWWtAd6IMda6f
	IMrWtzNxaqX5PX3L/Jce3p8qgbdj7uCRBZG4niKjbA9g1nYNG7OqHZOx87z0xOmPlaT7
	80Kg==
Received: by 10.180.92.69 with SMTP id ck5mr11336040wib.14.1340191653523;
	Wed, 20 Jun 2012 04:27:33 -0700 (PDT)
Received: from localhost.localdomain (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id
	fo7sm38528660wib.9.2012.06.20.04.27.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Jun 2012 04:27:31 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jun 2012 12:27:18 +0100
Message-Id: <715f2b8f8d165641f28a3eceea55570491e2f9b5.1340191527.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1340191527.git.ross.burton@intel.com>
References: <cover.1340191527.git.ross.burton@intel.com>
In-Reply-To: <cover.1340191527.git.ross.burton@intel.com>
References: <cover.1340191527.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmhz8O8JeNCT/VSkjb8e1nd/YOrYXwwFf+GUlD04biJWC1zAB3lREqir/j1SoKfaqGDcsmE
Subject: [PATCH 1/6] connman: rationalise configure options
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
X-List-Received-Date: Wed, 20 Jun 2012 11:38:22 -0000

dnsproxy and ntpd don't exist anymore, and the client is almost entirely useless.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-connectivity/connman/connman.inc |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index 3412323..7a10615 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -20,7 +20,7 @@ DEPENDS  = "dbus glib-2.0 ppp iptables gnutls \
             ${@base_contains('DISTRO_FEATURES', '3g','ofono', '', d)} \
             "
 
-INC_PR = "r6"
+INC_PR = "r7"
 
 TIST = "--enable-tist"
 TIST_powerpc = ""
@@ -35,14 +35,12 @@ EXTRA_OECONF += "\
     --enable-ethernet \
     ${@base_contains('DISTRO_FEATURES', 'wifi','--enable-wifi ${TIST}', '--disable-wifi', d)} \
     ${@base_contains('DISTRO_FEATURES', 'bluetooth','--enable-bluetooth ${TIST}', '--disable-bluetooth', d)} \
-    --enable-dnsproxy \
     ${@base_contains('DISTRO_FEATURES', '3g', '', '--disable-ofono', d)} \
     --enable-tools \
     --enable-test \
     --disable-polkit \
-    --enable-client \
+    --disable-client \
     --enable-fake \
-    --disable-ntpd \
 "
 
 INITSCRIPT_NAME = "connman"
-- 
1.7.7.6



