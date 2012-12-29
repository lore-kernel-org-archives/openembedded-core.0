Received: from mail-pa0-f45.google.com ([209.85.220.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Top4G-00076v-Qh
	for openembedded-core@lists.openembedded.org;
	Sat, 29 Dec 2012 06:35:04 +0100
Received: by mail-pa0-f45.google.com with SMTP id bg2so6337357pad.18
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Dec 2012 21:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=KRh9S9zUPa4IxB5dTcjIstZlnWcDSW6KfO93gTRmE8g=;
	b=Amuy4EDdy5zERlIw/MKkGrgITiPnF0+QjLcFH0zLnFvLj8eQFthTE1T7VA2m9m12HF
	OeXinfVDoM8cqNC0NbANYgrrY910+sA1/9XpjKYwUmTAMs2RIoyC1KYqIUSTe7p6qHPN
	3mJ/F8cWYMxllz8iiSutIA9z4A7UzERFD/kZ/ckfI50uQYQ4o1FR6JJqOEPzwIltrr88
	p2i3V+3Xy/5diqI5AiAZ/aqmk5WKTp2DQwKsL6cuHUfcjVGG6dKoEavUesO8qs1GWmtp
	6MdCKjeSGwiLHe0xpr3IHBI7rYLdf9ck6OsHzt9zi0SYegG963Mdmihm3eeXcu6NPdn+
	NEcQ==
X-Received: by 10.66.80.68 with SMTP id p4mr104355993pax.35.1356758387829;
	Fri, 28 Dec 2012 21:19:47 -0800 (PST)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id vs3sm20848581pbc.61.2012.12.28.21.19.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 28 Dec 2012 21:19:46 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Dec 2012 22:19:27 -0700
Message-Id: <db269f17fc9a08bad95abd77c54811ff4e57bc09.1356758000.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1356758000.git.chris_larson@mentor.com>
References: <cover.1356758000.git.chris_larson@mentor.com>
In-Reply-To: <cover.1356758000.git.chris_larson@mentor.com>
References: <cover.1356758000.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 5/6] chkconfig: package the update-alternatives implementation
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
X-List-Received-Date: Sat, 29 Dec 2012 05:35:23 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 .../recipes-extended/chkconfig/chkconfig_1.3.58.bb | 26 ++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb b/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
index df9b193..4c6985f 100644
--- a/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
+++ b/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
@@ -1,5 +1,4 @@
 SUMMARY = "A system tool for maintaining the /etc/rc*.d hierarchy"
-
 DESCRIPTION = "Chkconfig is a basic system utility.  It updates and queries runlevel \
 information for system services.  Chkconfig manipulates the numerous \
 symbolic links in /etc/rc.d, to relieve system administrators of some \
@@ -11,8 +10,9 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5574c6965ae5f583e55880e397fbb018"
 
 DEPENDS = "libnewt popt"
+PROVIDES += "virtual/update-alternatives"
 
-PR = "r6"
+PR = "r7"
 
 SRC_URI = "http://fedorahosted.org/releases/c/h/chkconfig/${BPN}-${PV}.tar.bz2"
 
@@ -29,18 +29,22 @@ EXTRA_OEMAKE = "\
     'BINDIR=${base_sbindir}' \
     'SBINDIR=${sbindir}' \
     'MANDIR=${mandir}' \
+    'ALTDIR=${localstatedir}/lib/alternatives' \
+    'ALTDATADIR=${sysconfdir}/alternatives' \
 "
 
 do_unpack[postfuncs] += "obey_variables"
 do_unpack[vardeps] += "obey_variables"
 obey_variables () {
 	sed -i -e 's,/etc,${sysconfdir},; s,/lib/systemd,${base_libdir}/systemd,' leveldb.h
+	sed -i -e 's,/etc/alternatives,${sysconfdir}/alternatives,' \
+	       -e 's,/var/lib/alternatives,${localstatedir}/lib/alternatives,' \
+	       -e 's,/usr/share/locale,${datadir}/locale,' alternatives.c
 }
 
 do_install() {
 	oe_runmake 'DESTDIR=${D}' 'INSTALLNLSDIR=${D}${datadir}/locale' install
-	mkdir -p ${D}${sysconfdir}/chkconfig.d
-	rm -f ${D}${sbindir}/update-alternatives
+	install -d ${D}${sysconfdir}/chkconfig.d
 }
 
 do_install_append_linuxstdbase() {
@@ -49,4 +53,18 @@ do_install_append_linuxstdbase() {
 	ln -sf ${base_sbindir}/chkconfig ${D}/${libdir}/lsb/remove_initd
 }
 
+PACKAGES =+ "${PN}-alternatives ${PN}-alternatives-doc"
+SUMMARY_${PN}-alternatives = "Maintain symbolic links determining default commands"
+DESCRIPTION_${PN}-alternatives = "alternatives creates, removes, maintains and displays \
+information about the symbolic links comprising the alternatives system."
+SUMMARY_${PN}-alternatives-doc = "${SUMMARY_${PN}-alternatives} - Documentation files"
+DESCRIPTION_${PN}-alternatives-doc = "${DESCRIPTION_${PN}-alternatives}  \
+This package contains documentation."
+RPROVIDES_${PN}-alternatives += "update-alternatives"
+RCONFLICTS_${PN}-alternatives = "update-alternatives-cworth update-alternatives-dpkg"
+FILES_${PN}-alternatives = "${sbindir}/alternatives ${sbindir}/update-alternatives \
+			    ${sysconfdir}/alternatives ${localstatedir}/lib/alternatives"
+FILES_${PN}-alternatives-doc = "${mandir}/man8/alternatives.8 \
+                                ${mandir}/man8/update-alternatives.8"
+
 FILES_${PN}_append_linuxstdbase += "${libdir}/lsb"
-- 
1.8.0



