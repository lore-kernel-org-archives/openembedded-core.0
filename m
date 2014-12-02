Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 6EA9C60232
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Dec 2014 15:53:57 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id ex7so28484962wid.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Dec 2014 07:53:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=1lYBrD3KPDEDLUrUxNYBjajoIwywz50OKE0TralFi/s=;
	b=NoyqWuLiBGS6p6gWKcPsl5D5mVIYcnOczWA8753169rfNVrOUy6G2GwNrL74h9LKrl
	RtrBd4vd7wc+UD1qY6hkwdBv96wIyDlJXVOarncD/C514dLUUGYfLJLV939xgr3l36I7
	OX90sbtdzvh6mBc0LdRSEdcnTcXpOx1278/5WJuMQwtAu/AV+1R0Ksw4mo2wFC7hHRdP
	UDyvJDoea5HSuiD+XhgqeLkdP3OFO2u+elyOVtchUGxcVA8p8OFZXUBDVcvnmocjJf7L
	5lVyZ/Li2SB1zQ/hpjg5ZhFiNj2xfMnKMkiopg2iEPX0Un0Pno+v6Boa88Gf+4yude1K
	1eyw==
X-Gm-Message-State: ALoCoQngmxTeMjG2kRmTo3Dgl2cTWZJ4CvSZjADChmQLn9oD1/nbrwEDbZKWHPdSv924EN9kjXGB
X-Received: by 10.180.211.84 with SMTP id na20mr6331092wic.41.1417535638260;
	Tue, 02 Dec 2014 07:53:58 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id j2sm32437034wjs.28.2014.12.02.07.53.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 02 Dec 2014 07:53:57 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Dec 2014 15:53:24 +0000
Message-Id: <3a7428b3c625eac7b7a2ae405e6bbcfb5dbf92d3.1417535164.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1417535164.git.ross.burton@intel.com>
References: <cover.1417535164.git.ross.burton@intel.com>
In-Reply-To: <cover.1417535164.git.ross.burton@intel.com>
References: <cover.1417535164.git.ross.burton@intel.com>
Subject: [PATCH 2/4] neard: remove libexec hacks
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
X-List-Received-Date: Tue, 02 Dec 2014 15:53:58 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-connectivity/neard/neard.inc              |   10 +++-------
 meta/recipes-connectivity/neard/neard/neard.in         |    2 +-
 meta/recipes-connectivity/neard/neard/neard.service.in |    2 +-
 3 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-connectivity/neard/neard.inc b/meta/recipes-connectivity/neard/neard.inc
index e714cad..59ae9b0 100644
--- a/meta/recipes-connectivity/neard/neard.inc
+++ b/meta/recipes-connectivity/neard/neard.inc
@@ -13,22 +13,18 @@ inherit autotools-brokensep pkgconfig systemd update-rc.d
 
 EXTRA_OECONF += "--enable-tools"
 
-do_install() {
-	oe_runmake DESTDIR=${D} libexecdir=${libexecdir} install
-}
-
 # This would copy neard start-stop shell and test scripts
 do_install_append() {
 	if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
 		install -d ${D}${sysconfdir}/init.d/
-		sed "s:@installpath@:${libexecdir}:" ${WORKDIR}/neard.in \
+		sed "s:@pkglibexecdir@:${libexecdir}/nfc:" ${WORKDIR}/neard.in \
 		  > ${D}${sysconfdir}/init.d/neard
 		chmod 0755 ${D}${sysconfdir}/init.d/neard
 	fi
 
 	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
 		install -d ${D}${systemd_unitdir}/system
-		sed "s:@installpath@:${libexecdir}:" ${WORKDIR}/neard.service.in \
+		sed "s:@pkglibexecdir@:${libexecdir}/nfc:" ${WORKDIR}/neard.service.in \
 		  > ${D}${systemd_unitdir}/system/neard.service
 	fi
 
@@ -41,7 +37,7 @@ do_install_append() {
 PACKAGES =+ "${PN}-tests"
 
 FILES_${PN}-tests = "${libdir}/${BPN}/*-test"
-FILES_${PN}-dbg += "${libdir}/${BPN}/*/.debug"
+FILES_${PN}-dbg += "${libexecdir}/nfc/.debug ${libdir}/${BPN}/*/.debug"
 
 RDEPENDS_${PN} = "dbus python python-dbus python-pygobject"
 
diff --git a/meta/recipes-connectivity/neard/neard/neard.in b/meta/recipes-connectivity/neard/neard/neard.in
index a47d4d9..c9e72ae 100644
--- a/meta/recipes-connectivity/neard/neard/neard.in
+++ b/meta/recipes-connectivity/neard/neard/neard.in
@@ -12,7 +12,7 @@
 # Description:       neard is a daemon used to enable NFC features
 ### END INIT INFO
 
-DAEMON=@installpath@/neard
+DAEMON=@pkglibexecdir@/neard
 PIDFILE=/var/run/neard.pid
 DESC="Linux NFC daemon"
 
diff --git a/meta/recipes-connectivity/neard/neard/neard.service.in b/meta/recipes-connectivity/neard/neard/neard.service.in
index a6f8a84..458173f 100644
--- a/meta/recipes-connectivity/neard/neard/neard.service.in
+++ b/meta/recipes-connectivity/neard/neard/neard.service.in
@@ -6,7 +6,7 @@ After=syslog.target
 [Service]
 Type=dbus
 BusName=org.neard
-ExecStart=@installpath@/neard -n
+ExecStart=@pkglibexecdir@/neard -n
 
 [Install]
 Alias=dbus-org.neard.service
-- 
1.7.10.4


