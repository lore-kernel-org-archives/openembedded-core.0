Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SZTSV-0003Vs-OG
	for openembedded-core@lists.openembedded.org;
	Tue, 29 May 2012 22:56:03 +0200
Received: from mail-we0-f180.google.com ([74.125.82.180])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 29 May 2012 13:44:21 -0700
Received: by weyt11 with SMTP id t11so2828741wey.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2012 13:44:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=0DmsCDewQOPcrBJhv1EvlUn9191NxP6ogjtJ7pQGsDI=;
	b=PL8mrWD01FTvDWncPX/vGnv+mygnw2Ek/CUGwAcwvl6RsQ+hkbOKZdsQJmORSjd8FD
	1BaZpOoCTg2I9y9IV98EVjg36QD/Uxh756MFd1o9jGj+VrrSt6LCqQxEhA787fYp0q5u
	mcEZmxgRAmfScFJCd9K+zYZwi2KIq9hw/fI0NlQgxelkVLPOrGm3u+06cDIbm2iZbP/7
	0+CaTEwrWOplxOv6gXDq2uulBDjRckGHnLxmPv+TUbjlS6j4LfLXSa11igH4XMCzjJjc
	7Y/KvXdMxp08vcFi0pKUDmpzpvcsQFb2LH8g+DRIHOuVfX79WnCVe/VjAeYhz24PrceK
	v73Q==
Received: by 10.216.30.213 with SMTP id k63mr3763667wea.59.1338324259200;
	Tue, 29 May 2012 13:44:19 -0700 (PDT)
Received: from localhost.localdomain (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id
	fm1sm30464662wib.10.2012.05.29.13.44.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 29 May 2012 13:44:18 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 May 2012 21:43:56 +0100
Message-Id: <2855b63c190e90f3adf8e0a9fdb12d1a1f969079.1338323483.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1338323483.git.ross.burton@intel.com>
References: <cover.1338323483.git.ross.burton@intel.com>
In-Reply-To: <cover.1338323483.git.ross.burton@intel.com>
References: <cover.1338323483.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQluWwJ8DIw1A4tprFxLlffRfOuTBqrgHlliNioYx5m0IfGbfrzhbdjBOLNop9EE59vbQ2oC
Subject: [PATCH 3/4] connman: respect the 3g feature and enable/disable ofono support
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
X-List-Received-Date: Tue, 29 May 2012 20:56:04 -0000

[YOCTO #2357]
---
 meta/recipes-connectivity/connman/connman.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index b6b0253..28f5f00 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -17,7 +17,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
 DEPENDS  = "dbus glib-2.0 ppp iptables gnutls \
             ${@base_contains('DISTRO_FEATURES', 'bluetooth','bluez4', '', d)} \
             ${@base_contains('DISTRO_FEATURES', 'wifi','wpa-supplicant', '', d)} \
-            ofono \
+            ${@base_contains('DISTRO_FEATURES', '3g','ofono', '', d)} \
             "
 
 TIST = "--enable-tist"
@@ -34,7 +34,7 @@ EXTRA_OECONF += "\
     ${@base_contains('DISTRO_FEATURES', 'wifi','--enable-wifi ${TIST}', '--disable-wifi', d)} \
     ${@base_contains('DISTRO_FEATURES', 'bluetooth','--enable-bluetooth ${TIST}', '--disable-bluetooth', d)} \
     --enable-dnsproxy \
-    --enable-ofono \
+    ${@base_contains('DISTRO_FEATURES', '3g', '', '--disable-ofono', d)} \
     --enable-tools \
     --enable-test \
     --disable-polkit \
-- 
1.7.7.6



