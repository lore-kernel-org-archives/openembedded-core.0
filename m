Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RMOTK-0001g7-1P
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Nov 2011 19:26:34 +0100
Received: by ggnp1 with SMTP id p1so6191ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Nov 2011 11:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=jMsSNw4S/eIcyANzR0a/tmJOFcOzTY7k7ta5ko8+Pkc=;
	b=S1Ps4xIBe+43O9r7PtfVHINFYtyrtcEMUi40VIiKLi/XgaMYkNm1EUB/GG7mHM3vVX
	KoVJXX9HrXQOUgQPHaruFnhzD/sVkGOSU4UbN+rsMtDjurcxOldH/V0KqsX3UPc4pKMZ
	6FU0/LYXSV5Er8WBqJyURAppL7x6HFQZarLls=
Received: by 10.236.200.131 with SMTP id z3mr22491419yhn.129.1320430823591;
	Fri, 04 Nov 2011 11:20:23 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id q57sm16408660yhi.22.2011.11.04.11.20.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 Nov 2011 11:20:22 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Nov 2011 18:20:06 +0000
Message-Id: <a2bccb25da0713e6909b7e5c535450ce2e0ebc3a.1320430778.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1320430778.git.otavio@ossystems.com.br>
References: <cover.1320430778.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1320430778.git.otavio@ossystems.com.br>
References: <cover.1320430778.git.otavio@ossystems.com.br>
Subject: [PATCH 3/5] dhcp: drop unused dhcp3.inc file
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
X-List-Received-Date: Fri, 04 Nov 2011 18:26:34 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-connectivity/dhcp/dhcp3.inc |   49 ------------------------------
 1 files changed, 0 insertions(+), 49 deletions(-)
 delete mode 100644 meta/recipes-connectivity/dhcp/dhcp3.inc

diff --git a/meta/recipes-connectivity/dhcp/dhcp3.inc b/meta/recipes-connectivity/dhcp/dhcp3.inc
deleted file mode 100644
index 6c7483e..0000000
--- a/meta/recipes-connectivity/dhcp/dhcp3.inc
+++ /dev/null
@@ -1,49 +0,0 @@
-SECTION = "console/network"
-DESCRIPTION = "Internet Software Consortium DHCP package"
-HOMEPAGE = "http://www.isc.org/"
-
-LICENSE = "ISC"
-LIC_FILES_CHKSUM = "file://LICENSE;beginline=4;md5=bb6fd41f5895b67088ebea61ad365e74"
-
-SRC_URI = "ftp://ftp.isc.org/isc/dhcp/dhcp-${PV}.tar.gz \
-	   file://init-relay file://default-relay \
-	   file://init-server file://default-server \
-	   file://dhclient.conf file://dhcpd.conf"
-
-inherit autotools
-
-TARGET_CFLAGS += "-D_GNU_SOURCE"
-
-do_compile() {
-	make RANLIB=${RANLIB} PREDEFINES='-D_PATH_DHCPD_DB=\"/var/lib/dhcp/dhcpd.leases\" \
-        -D_PATH_DHCLIENT_DB=\"/var/lib/dhcp/dhclient.leases\" \
-        -D_PATH_DHCLIENT_SCRIPT=\"/sbin/dhclient-script\" \
-        -D_PATH_DHCPD_CONF=\"/etc/dhcp/dhcpd.conf\" \
-        -D_PATH_DHCLIENT_CONF=\"/etc/dhcp/dhclient.conf\"'
-}
-
-do_install() {
-	make -e DESTDIR=${D} USRMANDIR=${mandir}/man1 ADMMANDIR=${mandir}/man8 FFMANDIR=${mandir}/man5 LIBMANDIR=${mandir}/man3 LIBDIR=${libdir} INCDIR=${includedir} install
-	install -d ${D}${sysconfdir}/init.d
-	install -d ${D}${sysconfdir}/default
-	install -d ${D}${sysconfdir}/dhcp
-	install -m 0755 ${WORKDIR}/init-relay ${D}${sysconfdir}/init.d/dhcp-relay
-	install -m 0644 ${WORKDIR}/default-relay ${D}${sysconfdir}/default/dhcp-relay
-	install -m 0755 ${WORKDIR}/init-server ${D}${sysconfdir}/init.d/dhcp-server
-	install -m 0644 ${WORKDIR}/default-server ${D}${sysconfdir}/default/dhcp-server
-	install -m 0644 ${WORKDIR}/dhclient.conf ${D}${sysconfdir}/dhcp/dhclient.conf
-	install -m 0644 ${WORKDIR}/dhcpd.conf ${D}${sysconfdir}/dhcp/dhcpd.conf
-	install -d ${D}${base_sbindir}/
-	mv ${D}${sbindir}/dhclient ${D}${base_sbindir}/
-	install -m 0755 ${S}/client/scripts/linux ${D}${base_sbindir}/dhclient-script
-}
-
-PACKAGES += "dhcp-server dhcp-client dhcp-relay dhcp-omshell"
-FILES_${PN} = ""
-FILES_dhcp-server = "${sbindir}/dhcpd ${sysconfdir}/init.d/dhcp-server ${sysconfdir}/default/dhcp-server ${sysconfdir}/dhcp/dhcpd.conf"
-FILES_dhcp-relay = "${sbindir}/dhcrelay ${sysconfdir}/init.d/dhcp-relay ${sysconfdir}/default/dhcp-relay"
-
-FILES_dhcp-client = "${base_sbindir}/dhclient ${base_sbindir}/dhclient-script ${sysconfdir}/dhcp/dhclient.conf"
-RDEPENDS_dhcp-client = "bash"
-
-FILES_dhcp-omshell = "${bindir}/omshell"
-- 
1.7.2.5



