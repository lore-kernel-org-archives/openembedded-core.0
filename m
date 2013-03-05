Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1UCrPc-0006FX-Vl
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Mar 2013 13:56:10 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r25CdeOL016685
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Mar 2013 04:39:40 -0800 (PST)
Received: from pek-usp-3.wrs.com (128.224.163.124) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 5 Mar 2013 04:39:37 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 5 Mar 2013 20:42:35 +0800
Message-ID: <4058a124fddd182115e1470762fe01b967d60ff6.1362472906.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.11.2
In-Reply-To: <cover.1362472906.git.liezhi.yang@windriver.com>
References: <cover.1362472906.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] avahi: fix installed but not shipped warning
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
X-List-Received-Date: Tue, 05 Mar 2013 12:56:12 -0000
Content-Type: text/plain

The avahi recipe has a warning when build without systemd feature:

WARNING: QA Issue: avahi: Files/directories were installed but not shipped
  /usr/share/dbus-1

The /usr/share/dbus-1 is empty without systemd feature, there would be
/usr/share/dbus-1/system-services with systemd. Use rmdir to fix the
problem, and remove the ${datadir}/dbus-1/interfaces from the FILES list
which had been removed clearly by the do_install.

[YOCTO #3939]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-connectivity/avahi/avahi.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
index 3a4547c..1b7e26a 100644
--- a/meta/recipes-connectivity/avahi/avahi.inc
+++ b/meta/recipes-connectivity/avahi/avahi.inc
@@ -90,7 +90,6 @@ FILES_avahi-daemon = "${sbindir}/avahi-daemon \
                       ${datadir}/avahi/introspection/*.introspect \
                       ${datadir}/avahi/avahi-service.dtd \
                       ${datadir}/avahi/service-types \
-                      ${datadir}/dbus-1/interfaces \
                       ${datadir}/dbus-1/system-services"
 FILES_libavahi-client = "${libdir}/libavahi-client.so.*"
 FILES_libavahi-ui = "${libdir}/libavahi-ui.so.*"
@@ -128,6 +127,7 @@ do_install() {
 	# if /var/run become non-empty in the future, need to install it via volatile
 	rm -rf ${D}/var/run
 	rm -rf ${D}${datadir}/dbus-1/interfaces
+	rmdir --ignore-fail-on-non-empty ${D}${datadir}/dbus-1
 	rm -rf ${D}${libdir}/avahi
 
 	install -d ${D}${sysconfdir}/udhcpc.d
-- 
1.7.11.2



