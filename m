Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Sh0Qn-0001Bv-ES
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jun 2012 17:33:25 +0200
Received: from mail-we0-f180.google.com ([74.125.82.180])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 19 Jun 2012 08:22:40 -0700
Received: by weyt11 with SMTP id t11so4230723wey.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2012 08:22:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=NtlRJgxhW/X6LyVA4I+t9g+EEblwjQSgmy4qIq67J8U=;
	b=gevn4e9kLCI9NyB9g3iGn+eXBOLBSmGntAu9fLrVuu+j1mA44CHwrBuErdz0vi+yUc
	JGRy5vnauzXldO9qjhQe8B78sphmmXjnBhXDAs1juRrbd5LhDrxDt91Y47ilUg0CXaGY
	vvqladu1x0bPq0pMVQDTFT3uzZW70d9/vlfqGxNPeTqNvS3CJ5TB0DvJSFJuuXwAy22K
	mrj1UMkWw2rk68mrwGh3QaQRCFeUGNkj8bf9bFMCP+Cgd+00IGiXPnd6nS5y2gkVLA0Z
	61NI9QVuf9fCqurVxKLT0NiiEdIXErkF9uUDP/tyoi1319/0KTaGVVGw31C+XIV+PqMR
	RqjQ==
Received: by 10.216.213.143 with SMTP id a15mr11517976wep.156.1340119358982;
	Tue, 19 Jun 2012 08:22:38 -0700 (PDT)
Received: from localhost.localdomain (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id q6sm33612651wiy.0.2012.06.19.08.22.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 19 Jun 2012 08:22:37 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jun 2012 16:22:26 +0100
Message-Id: <aa5b72de3af8fa6881625ea09ae8afd3412f87d3.1340119197.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <b434d2456d62bc5ffcd1cc513b977d8eb0f0bdb2.1340119197.git.ross.burton@intel.com>
References: <b434d2456d62bc5ffcd1cc513b977d8eb0f0bdb2.1340119197.git.ross.burton@intel.com>
In-Reply-To: <cover.1340119197.git.ross.burton@intel.com>
References: <cover.1340119197.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmUYc4YFWZZYdyHJAFdDcBX+fV6o/77xBY1LpKxeIVUJH9id0AHAZcQRQDRYsY0byp0D3xk
Subject: [PATCH 2/6] connman: add compat RPROVIDES for older packaging
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
X-List-Received-Date: Tue, 19 Jun 2012 15:33:25 -0000

wifi, bluetooth and 3g used to be plugins so were packaged separately, but not
anymore.
---
 meta/recipes-connectivity/connman/connman.inc |   21 +++++++++++++++++----
 1 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index 7a10615..7215f25 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -20,7 +20,7 @@ DEPENDS  = "dbus glib-2.0 ppp iptables gnutls \
             ${@base_contains('DISTRO_FEATURES', '3g','ofono', '', d)} \
             "
 
-INC_PR = "r7"
+INC_PR = "r8"
 
 TIST = "--enable-tist"
 TIST_powerpc = ""
@@ -74,13 +74,26 @@ do_install_append() {
 	rmdir ${D}${libdir}/connman/scripts
 }
 
+# These used to be plugins, but now they are core
+RPROVIDES_${PN} = "\
+	connman-plugin-loopback \
+	connman-plugin-ethernet \
+	${@base_contains('DISTRO_FEATURES', 'bluetooth','connman-plugin-bluetooth', '', d)} \
+	${@base_contains('DISTRO_FEATURES', 'wifi','connman-plugin-wifi', '', d)} \
+	${@base_contains('DISTRO_FEATURES', '3g','connman-plugin-ofono', '', d)} \
+	"
+
+RDEPENDS_${PN} = "\
+	${@base_contains('DISTRO_FEATURES', 'bluetooth', 'bluez4', '', d)} \
+	${@base_contains('DISTRO_FEATURES', 'wifi','wpa-supplicant', '', d)} \
+	${@base_contains('DISTRO_FEATURES', '3g','ofono', '', d)} \
+	"
+
 PACKAGES_DYNAMIC = "${PN}-plugin-*"
 
 python populate_packages_prepend() {
 	depmap = dict( pppd="ppp",
-	               wifi="wpa-supplicant",
-	               bluetooth="bluez4",
-	               ofono="ofono" )
+				 )
 	packages = []
 	multilib_prefix = (d.getVar("MLPREFIX", True) or "")
 	hook = lambda file,pkg,b,c,d:packages.append((file,pkg))
-- 
1.7.7.6



