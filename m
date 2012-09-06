Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T9eZR-0005NV-Du
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Sep 2012 18:04:45 +0200
Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 06 Sep 2012 08:52:13 -0700
Received: by wibhq4 with SMTP id hq4so5809082wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2012 08:52:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=g7V8nj5hDKoEeNm8oKb2hW75nTHTvcYP9N5P3CPVn2c=;
	b=ZxKQI+LP4rEAMvfNMg2yuPIXT9QTmJQddo58WaCUwahSsW6wTC2fJbY/CsGIIqK9e9
	XmhGWaYzU6vrEFIwEZMDNeERENMlJLd80G2DhHdmcVpnVcFwtnf7hHBCxPS1xqxBratc
	fUkhbLUAE6meYlrNP1dr4zOos3ht8OMRUHgJDhOT1lVhQXlDJu2g0DBTfZfOKVmlwTCc
	8RE//sKyWnHs7AOevMSqpw27ksByh6fuGqAqFGO0+7qFbrlQ9SPAPWioNpnugY0kQOUM
	jGjSTXLbpY/x0MlvhCRwfZw0XMadFQm9cQDeoiQ7H3UBqMjtSTA4fqY199okcKiYXjQY
	y/jQ==
Received: by 10.180.24.4 with SMTP id q4mr46656541wif.19.1346946737576;
	Thu, 06 Sep 2012 08:52:17 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id ef5sm6648470wib.3.2012.09.06.08.52.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Sep 2012 08:52:16 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Sep 2012 16:51:31 +0100
Message-Id: <1346946691-28296-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQnlDOuxpEYYbucPeGKSP/Y6uwk+W3ZaOqCdNjsvyM/x3+0jEZi7iETp/6tk/afMgHIqA347
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
X-List-Received-Date: Thu, 06 Sep 2012 16:04:45 -0000

Also they just need GTK+ not libglade, so fix the depends.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-connectivity/gupnp/gssdp_0.10.0.bb |   12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-connectivity/gupnp/gssdp_0.10.0.bb b/meta/recipes-connectivity/gupnp/gssdp_0.10.0.bb
index f3494e7..ad41ac1 100644
--- a/meta/recipes-connectivity/gupnp/gssdp_0.10.0.bb
+++ b/meta/recipes-connectivity/gupnp/gssdp_0.10.0.bb
@@ -2,7 +2,9 @@ SUMMARY = "Resource discovery and announcement over SSDP"
 DESCRIPTION = "GSSDP implements resource discovery and announcement over SSDP (Simpe Service Discovery Protocol)."
 LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
-DEPENDS = "glib-2.0 libsoup-2.4 libglade gobject-introspection-stub"
+DEPENDS = "glib-2.0 libsoup-2.4 gobject-introspection-stub"
+
+PR = "r2"
 
 SRC_URI = "http://gupnp.org/sites/all/files/sources/${BPN}-${PV}.tar.gz"
 
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



