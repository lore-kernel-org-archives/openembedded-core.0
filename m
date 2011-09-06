Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R0yZ2-0001sA-Ko for openembedded-core@lists.openembedded.org;
	Tue, 06 Sep 2011 18:31:57 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p86GOMUR015328 for <openembedded-core@lists.openembedded.org>;
	Tue, 6 Sep 2011 17:24:22 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id opJRkwiFdYbc
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Sep 2011 17:24:22 +0100 (BST)
Received: from [192.168.8.246] ([83.217.123.106]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p86GOIs2015304
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 Sep 2011 17:24:21 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 06 Sep 2011 17:15:59 +0100
Message-ID: <1315325759.12207.41.camel@ted>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: [PATCH] glib-networking: Ensure certificates are consistently disabled
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
X-List-Received-Date: Tue, 06 Sep 2011 16:31:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Currently configure is looking whether the build system has certificates
to determine the certificate paths. This is clear contamination so
this patch disables that functionality to ensure builds are consistent.
    
We could equally set this option to a consistent path if we start
installing certificates.
    
[YOCTO #1451]
 
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-core/glib-networking/glib-networking_2.28.7.bb b/meta/recipes-core/glib-networking/glib-networking_2.28.7.bb
index f492dd3..521c925 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.28.7.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.28.7.bb
@@ -15,6 +15,8 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/2.28/${BPN}-${PV}.tar.bz2"
 SRC_URI[md5sum] = "c10e51571d03c10111a37bcd21fbf777"
 SRC_URI[sha256sum] = "98bedfbd530c4b1b53c91025fe82290bafd289d249e4eb549c3b90d23a76021c"
 
+EXTRA_OECONF = "--without-ca-certificates"
+
 inherit autotools pkgconfig
 
 FILES_${PN} += "${libdir}/gio/modules/libgio* ${datadir}/dbus-1/services/"



