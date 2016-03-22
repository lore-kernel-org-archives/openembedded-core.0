Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 37408606D0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 20:36:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u2MKaJNH008175
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 13:36:19 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 22 Mar 2016 13:36:18 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Mar 2016 13:36:19 -0700
Message-ID: <1458678979-12352-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [PATCH 1/1] bind: /var/cache/bind
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
X-List-Received-Date: Tue, 22 Mar 2016 20:36:23 -0000
Content-Type: text/plain

Change the ownership of /var/cache/bind to bind rather than root.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 meta/recipes-connectivity/bind/bind_9.10.2-P4.bb |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/bind/bind_9.10.2-P4.bb b/meta/recipes-connectivity/bind/bind_9.10.2-P4.bb
index 19f87d7..b309b06 100644
--- a/meta/recipes-connectivity/bind/bind_9.10.2-P4.bb
+++ b/meta/recipes-connectivity/bind/bind_9.10.2-P4.bb
@@ -43,7 +43,7 @@ PACKAGECONFIG ?= ""
 PACKAGECONFIG[httpstats] = "--with-libxml2,--without-libxml2,libxml2"
 
 USERADD_PACKAGES = "${PN}"
-USERADD_PARAM_${PN} = "--system --home /var/cache/bind --no-create-home \
+USERADD_PARAM_${PN} = "--system --home ${localstatedir}/cache/bind --no-create-home \
                        --user-group bind"
 
 INITSCRIPT_NAME = "bind"
@@ -73,7 +73,7 @@ do_install_append() {
 	rm "${D}${mandir}/man1/nslookup.1"
 	rmdir "${D}${localstatedir}/run"
 	rmdir --ignore-fail-on-non-empty "${D}${localstatedir}"
-	install -d "${D}${localstatedir}/cache/bind"
+	install -d -o bind "${D}${localstatedir}/cache/bind"
 	install -d "${D}${sysconfdir}/bind"
 	install -d "${D}${sysconfdir}/init.d"
 	install -m 644 ${S}/conf/* "${D}${sysconfdir}/bind/"
@@ -81,7 +81,6 @@ do_install_append() {
 	sed -i -e '1s,#!.*python,#! /usr/bin/env python,' ${D}${sbindir}/dnssec-coverage ${D}${sbindir}/dnssec-checkds
 
 	# Install systemd related files
-	install -d ${D}${localstatedir}/cache/bind
 	install -d ${D}${sbindir}
 	install -m 755 ${WORKDIR}/generate-rndc-key.sh ${D}${sbindir}
 	install -d ${D}${systemd_unitdir}/system
-- 
1.7.9.5


