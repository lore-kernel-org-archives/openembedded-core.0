Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T9eqo-0005m9-IN
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Sep 2012 18:22:43 +0200
Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 06 Sep 2012 09:10:15 -0700
Received: by wibhm2 with SMTP id hm2so5156699wib.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2012 09:10:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=TPqARPqHrAhsmYRiPnF8Y3K1TgJB9+gDDsLC2R5ZSBE=;
	b=DzOIWOdeRWL+18JbKndOpjHx62VeiMNR22P6gCeY17ivkE16q71rHgl5/+yWA/4gVl
	mcip+iLAciXwBAZttnMUYGq44/ffj7a7v9jYMAQs0svHHSLFxxpCOUktzc1AugvxD5BC
	OuJMv+yBj03ter778XlsVeMkZitMI77lV9YG7ekxytvj7IS3PUTUZW4gtGAxj0H/dlub
	TUvNTX/pHQY5lJFctQS+y35NFiD1lu712wpB+32Z5DIARJhCEGvn3BmvtNvBacILPh5S
	B2gY17YX2N2UI26CfjYk7LbJlFyuMAa4v1YFOrkVuvPUekyNcdTvZzzkGuJOd3xacPHQ
	PVng==
Received: by 10.180.84.1 with SMTP id u1mr5870347wiy.15.1346947813015;
	Thu, 06 Sep 2012 09:10:13 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id fr4sm6731950wib.8.2012.09.06.09.10.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Sep 2012 09:10:11 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Sep 2012 17:09:29 +0100
Message-Id: <1346947769-12659-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQlLOav8gDljsGuiUZmfzPU6oPZSWUIQq8zpRAX0c5CewuGn+oUIlxfBGi5dEO/E+L3RHxA1
Subject: [PATCH] gssdp: build examples which require GTK+ only if we have X11
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Sep 2012 16:22:43 -0000

They just need GTK+ not libglade, so fix the depends.

The recipe also had multple checksums, so remove the old ones.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-connectivity/gupnp/gssdp_0.10.0.bb |   16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-connectivity/gupnp/gssdp_0.10.0.bb b/meta/recipes-connectivity/gupnp/gssdp_0.10.0.bb
index f3494e7..b87c755 100644
--- a/meta/recipes-connectivity/gupnp/gssdp_0.10.0.bb
+++ b/meta/recipes-connectivity/gupnp/gssdp_0.10.0.bb
@@ -2,12 +2,14 @@ SUMMARY = "Resource discovery and announcement over SSDP"
 DESCRIPTION = "GSSDP implements resource discovery and announcement over SSDP (Simpe Service Discovery Protocol)."
 LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
-DEPENDS = "glib-2.0 libsoup-2.4 libglade gobject-introspection-stub"
+DEPENDS = "glib-2.0 libsoup-2.4 gobject-introspection-stub"
+
+PR = "r2"
 
 SRC_URI = "http://gupnp.org/sites/all/files/sources/${BPN}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "725c32e8f92a072cc34f0e091937df2a"
-SRC_URI[sha256sum] = "8eaab799f699836770ec2fcc08abfef2f824a82ae959c6af7b39ffb6968b9fd7"
+SRC_URI[md5sum] = "aec6a56ac1d4f8a4837da83f2d152556"
+SRC_URI[sha256sum] = "94de92bb4f7906ed2f047b0146a3b21d53d09908fe1f0149484f61c6afc598ea" 
 
 inherit autotools pkgconfig
 
@@ -17,9 +19,5 @@ FILES_gssdp-tools = "${bindir}/gssdp* ${datadir}/gssdp/*.glade"
 
 EXTRA_OECONF = "--disable-introspection"
 
-PR = "r1"
-
-SRC_URI[md5sum] = "aec6a56ac1d4f8a4837da83f2d152556"
-SRC_URI[sha256sum] = "94de92bb4f7906ed2f047b0146a3b21d53d09908fe1f0149484f61c6afc598ea" 
-
-
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'gtk', '', d)}"
+PACKAGECONFIG[gtk] = "--with-gtk,--without-gtk,gtk+"
-- 
1.7.10



