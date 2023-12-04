Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39502C4167B
	for <webhook@archiver.kernel.org>; Mon,  4 Dec 2023 08:54:20 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.65306.1701680051994550576
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Dec 2023 00:54:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=iapgIbJi;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0702d3e63d=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3B466Wp2011010
	for <openembedded-core@lists.openembedded.org>; Mon, 4 Dec 2023 08:54:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=2AAM/
	Aj6ZWBOmzsmjTdDE8D0i2fnvYULnjqGBSfJn+8=; b=iapgIbJiaBLRccRa5gjph
	gSUPdLCiq0KHSMj6V62emM3IzhPiKU4AMFXvgdV4IDF1SaMPqTJQJiPy73h3xwdZ
	wCoVyS8QU5ZtWECzdFKTR97vlE5MzOLrs3FeVCIkPy3gmBTub9B5EEUBoIXnfi7V
	owOC2Ri2NXakTxXHY5U+YSevMIAk1FC5V9IsaRhVOHeOcYTxuGxzpQitsccn61Dc
	jaPB/teT5Ev7IX9+ZdtDAW6ZTx19Le0d2WXKxfew//pUoqzQNtamGGf303aLw9/S
	YABTVZsUz7dRYk1YXDKByG9cb7dY2YjLq6z+eOPgBK1u14Rp1C85I6fJmlEIHRsQ
	w==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3us4d5gahg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 08:54:10 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Dec 2023 00:54:13 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 4 Dec 2023 00:54:12 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] openssh: Add SSHD_SERVICE_TYPE variable
Date: Mon, 4 Dec 2023 16:54:08 +0800
Message-ID: <20231204085408.2125531-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Z0SCjq6Q1S0ZoRoX-cETk924tcpIgaVF
X-Proofpoint-GUID: Z0SCjq6Q1S0ZoRoX-cETk924tcpIgaVF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0
 mlxlogscore=999 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0
 mlxscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2312040066
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 08:54:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191727

From: Mingli Yu <mingli.yu@windriver.com>

There are two types of sshd server now, one is based on socket
activation(sshd.socket) and another is service activation(sshd.service).
And the default sshd service type is based on socket by default as below.
============================================
 # systemctl status sshd.socket
* sshd.socket
     Loaded: loaded (/lib/systemd/system/sshd.socket; enabled; preset: enabled)
     Active: active (listening) since Mon 2023-12-04 08:34:33 UTC; 22s ago
     Listen: [::]:22 (Stream)
   Accepted: 0; Connected: 0;
    Process: 228 ExecStartPre=/bin/mkdir -p /var/run/sshd (code=exited, status=0/SUCCESS)
      Tasks: 0 (limit: 263)
     Memory: 84.0K
     CGroup: /system.slice/sshd.socket

Dec 04 08:34:33 qemux86-64 systemd[1]: Starting sshd.socket...
Dec 04 08:34:33 qemux86-64 systemd[1]: Listening on sshd.socket.
============================================

And use can switch to service activation if they want as below after
the device boot up.
============================================
 # systemctl disable sshd.socket
Removed "/etc/systemd/system/sockets.target.wants/sshd.socket".
 # systemctl stop sshd.socket
 # systemctl start sshd.service
 # systemctl status sshd.service
* sshd.service - OpenSSH server daemon
     Loaded: loaded (/lib/systemd/system/sshd.service; enabled; preset: enabled)
     Active: active (running) since Mon 2023-12-04 08:48:14 UTC; 53s ago
    Process: 390 ExecStartPre=/bin/mkdir -p /var/run/sshd (code=exited, status=0/SUCCESS)
   Main PID: 391 (sshd)
      Tasks: 1 (limit: 263)
     Memory: 2.1M
     CGroup: /system.slice/sshd.service
             `-391 "sshd: /usr/sbin/sshd -D [listener] 0 of 10-100 startups"

Dec 04 08:48:14 qemux86-64 systemd[1]: Starting OpenSSH server daemon...
Dec 04 08:48:14 qemux86-64 systemd[1]: Started OpenSSH server daemon.
Dec 04 08:48:14 qemux86-64 sshd[391]: Server listening on 0.0.0.0 port 22.
Dec 04 08:48:14 qemux86-64 sshd[391]: Server listening on :: port 22.
============================================

But it's more convenient to determine the service type at build time
if there are so many devices.

So add SSHD_SERVICE_TYPE variable to enable sshd.socket or sshd.service
at build time and we still enable sshd.socket by default now.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../openssh/openssh_9.5p1.bb                   | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh_9.5p1.bb b/meta/recipes-connectivity/openssh/openssh_9.5p1.bb
index bbb8fb091a..6a603cd12d 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.5p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.5p1.bb
@@ -50,7 +50,7 @@ INITSCRIPT_NAME:${PN}-sshd = "sshd"
 INITSCRIPT_PARAMS:${PN}-sshd = "defaults 9"
 
 SYSTEMD_PACKAGES = "${PN}-sshd"
-SYSTEMD_SERVICE:${PN}-sshd = "sshd.socket sshd.service"
+SYSTEMD_SERVICE:${PN}-sshd = "${@bb.utils.contains('SSHD_SERVICE_TYPE', '1', 'sshd.service', 'sshd.socket', d)}"
 
 inherit autotools-brokensep ptest pkgconfig
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
@@ -125,15 +125,23 @@ do_install:append () {
 	echo "HostKey /var/run/ssh/ssh_host_ed25519_key" >> ${D}${sysconfdir}/ssh/sshd_config_readonly
 
 	install -d ${D}${systemd_system_unitdir}
-	install -c -m 0644 ${WORKDIR}/sshd.socket ${D}${systemd_system_unitdir}
-	install -c -m 0644 ${WORKDIR}/sshd.service ${D}${systemd_system_unitdir}
-	install -c -m 0644 ${WORKDIR}/sshd@.service ${D}${systemd_system_unitdir}
+	if ${@bb.utils.contains('SSHD_SERVICE_TYPE','1','true','false',d)}; then
+	    install -c -m 0644 ${WORKDIR}/sshd.service ${D}${systemd_system_unitdir}
+	else
+	    install -c -m 0644 ${WORKDIR}/sshd.socket ${D}${systemd_system_unitdir}
+	    install -c -m 0644 ${WORKDIR}/sshd@.service ${D}${systemd_system_unitdir}
+	    sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
+		    -e 's,@SBINDIR@,${sbindir},g' \
+		    -e 's,@BINDIR@,${bindir},g' \
+		    -e 's,@LIBEXECDIR@,${libexecdir}/${BPN},g' \
+            ${D}${systemd_system_unitdir}/sshd.socket
+	fi
 	install -c -m 0644 ${WORKDIR}/sshdgenkeys.service ${D}${systemd_system_unitdir}
 	sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
 		-e 's,@SBINDIR@,${sbindir},g' \
 		-e 's,@BINDIR@,${bindir},g' \
 		-e 's,@LIBEXECDIR@,${libexecdir}/${BPN},g' \
-		${D}${systemd_system_unitdir}/sshd.socket ${D}${systemd_system_unitdir}/*.service
+		${D}${systemd_system_unitdir}/*.service
 
 	sed -i -e 's,@LIBEXECDIR@,${libexecdir}/${BPN},g' \
 		${D}${sysconfdir}/init.d/sshd
-- 
2.25.1


