Return-Path: <qianl.fnst@cn.fujitsu.com>
X-Greylist: delayed 735 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 07 Nov 2014 09:41:39 UTC
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 698F865C7C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Nov 2014 09:41:39 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="43016610"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 07 Nov 2014 17:26:07 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sA79T7Fe003657
	for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Nov 2014 17:29:07 +0800
Received: from Fedora (10.167.226.40) by G08CNEXCHPEKD03.g08.fujitsu.local
	(10.167.33.89) with Microsoft SMTP Server id 14.3.181.6; Fri, 7 Nov 2014
	17:29:23 +0800
From: Qian Lei <qianl.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 4 Nov 2014 14:04:56 +0900
Message-ID: <1415077496-11116-1-git-send-email-qianl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.4.2
X-TM-AS-MML: disable
X-TM-AS-Product-Ver: IMSS-7.1.0.1403-7.5.0.1018-21074.003
X-TM-AS-Result: No--14.725-7.0-31-10
X-imss-scan-details: No--14.725-7.0-31-10
X-TM-AS-User-Approved-Sender: No
X-TMASE-MatchedRID: ++xGSS8gmLa8eaYomTBk5LttJwl7IC+WwJjn8yqLU6JcKZwALwMGsz0J
	SifQ1MZ53GkTKZpjphs4cmJUVpBxQhe/T4M8CnPQA9lly13c/gGpqkk/s2R6YSXuTGSWN4vnFIC
	vJhXEzsdX5t7w06f3W33UwFifFlW7RUqOXUf3BH2zI1v7J4hECl7OZ6hrwwnzFAsTXoyZ8Mtah6
	9TDPcjLgCjTld9C1ZIkY0mrOR3shuR9GF2J2xqMxRFJJyf5BJe3QfwsVk0UbtuRXh7bFKB7prSb
	YsoSYrjkSuZUE6KE1O0rBV280EhU6+WYPpzZLQtxYVzI3UCCaY=
MIME-Version: 1.0
Resent-Date: Fri, 7 Nov 2014 17:28:56 +0800
Resent-From: Qian Lei <qianl.fnst@cn.fujitsu.com>
Resent-Message-ID: <20141107172858.2514c068@Fedora>
Resent-To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] Bluez5: Add gatttool to new package bluez5-tools
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
X-List-Received-Date: Fri, 07 Nov 2014 09:41:42 -0000
Content-Type: text/plain

Gatttool in bluez5 is not installed into system any more. But in some cases
we do need this tool to debug some thing. So I add a new package named bluez5-tools
which includes some programs we may need but not installed.

Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index c3dd946..6c05f07 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -42,11 +42,12 @@ do_install_append() {
 	    install -m 0644 ${S}/profiles/input/input.conf ${D}/${sysconfdir}/bluetooth/
 	fi
 	# at_console doesn't really work with the current state of OE, so punch some more holes so people can actually use BT
+        install -m 0755 ${S}/attrib/gatttool ${D}/${bindir}/
 	install -m 0644 ${WORKDIR}/bluetooth.conf ${D}/${sysconfdir}/dbus-1/system.d/
 }
 
 ALLOW_EMPTY_libasound-module-bluez = "1"
-PACKAGES =+ "libasound-module-bluez ${PN}-testtools ${PN}-obex"
+PACKAGES =+ "libasound-module-bluez ${PN}-testtools ${PN}-obex ${PN}-tools"
 
 FILES_libasound-module-bluez = "${libdir}/alsa-lib/lib*.so ${datadir}/alsa"
 FILES_${PN} += "${libdir}/bluetooth/plugins ${libdir}/bluetooth/plugins/*.so ${base_libdir}/udev/ ${nonarch_base_libdir}/udev/ ${systemd_unitdir}/ ${datadir}/dbus-1"
@@ -63,6 +64,8 @@ SYSTEMD_SERVICE_${PN}-obex = "obex.service"
 
 FILES_${PN}-testtools = "${libdir}/bluez/test/*"
 
+FILES_${PN}-tools = "${bindir}/gatttool"
+
 FILES_${PN}-dbg += "\
   ${libdir}/${BPN}/bluetooth/.debug \
   ${libdir}/bluetooth/plugins/.debug \
-- 
1.8.4.2


