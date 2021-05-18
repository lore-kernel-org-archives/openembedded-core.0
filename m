Received: from mail.digitalendoscopy.de (mail.digitalendoscopy.de [128.65.149.218])
 by mx.groups.io with SMTP id smtpd.web12.547.1621357958768030383
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 May 2021 10:12:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: digitalendoscopy.de, ip: 128.65.149.218, mailfrom: v.vogelhuber@digitalendoscopy.de)
Received: from [192.168.20.14] (port=59618 helo=srv-msx01.digitendos.de)
	by mail.digitalendoscopy.de with esmtps (TLSv1.2:AES256-SHA:256)
	(Exim 4.82_1-5b7a7c0-XX)
	(envelope-from <v.vogelhuber@digitalendoscopy.de>)
	id 1lj3Gj-0007HZ-0I
	for openembedded-core@lists.openembedded.org; Tue, 18 May 2021 19:12:33 +0200
Received: from DE133.digitendos.de (10.242.2.15) by srv-msx01.digitendos.de
 (192.168.20.14) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 18 May
 2021 19:12:32 +0200
X-CTCH-RefID: str=0001.0A782F21.60A3F581.001A,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
From: "Volker Vogelhuber" <v.vogelhuber@digitalendoscopy.de>
To: <openembedded-core@lists.openembedded.org>
CC: Volker Vogelhuber <v.vogelhuber@digitalendoscopy.de>
Subject: [[dunfell][meta][PATCH]] Make busybox's syslog.cfg depend on VIRTUAL-RUNTIME_base-utils-syslog
Date: Tue, 18 May 2021 19:12:19 +0200
Message-ID: <20210518171219.210704-1-v.vogelhuber@digitalendoscopy.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Return-Path: v.vogelhuber@digitalendoscopy.de
X-Originating-IP: [10.242.2.15]
X-ClientProxiedBy: srv-msx01.digitendos.de (192.168.20.14) To
 srv-msx01.digitendos.de (192.168.20.14)
X-TM-AS-Product-Ver: SMEX-11.7.0.1065-8.600.1012-26164.006
X-TM-AS-Result: No-2.530900-0.000000-31
X-TM-AS-User-Approved-Sender: Yes
X-TM-AS-User-Blocked-Sender: No
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

syslog.cfg is added to the list of sources for busybox
independent of the VIRTUAL-RUNTIME_base-utils-syslog variable. So even
if VIRTUAL-RUNTIME_base-utils-syslog being set e.g. to empty, syslogd will
be enabled. So only include syslog.cfg in SRC_URI if
VIRTUAL-RUNTIME_base-utils-syslog is set to busybox-syslog.

Signed-off-by: Volker Vogelhuber <v.vogelhuber@digitalendoscopy.de>
---
 meta/recipes-core/busybox/busybox_1.31.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox_1.31.1.bb b/meta/recipes-core/busybox/busybox_1.31.1.bb
index 7563368..93a1613 100644
--- a/meta/recipes-core/busybox/busybox_1.31.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.31.1.bb
@@ -34,7 +34,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://resize.cfg \
            ${@["", "file://init.cfg"][(d.getVar('VIRTUAL-RUNTIME_init_manager') == 'busybox')]} \
            ${@["", "file://mdev.cfg"][(d.getVar('VIRTUAL-RUNTIME_dev_manager') == 'busybox-mdev')]} \
-           file://syslog.cfg \
+           ${@["", "file://syslog.cfg"][(d.getVar('VIRTUAL-RUNTIME_base-utils-syslog') == 'busybox-syslog')]} \
            file://unicode.cfg \
            file://rcS \
            file://rcK \
-- 
2.25.1

