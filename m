Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FEB8C4167B
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 05:52:08 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.93131.1701755525562093917
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Dec 2023 21:52:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=eDbhESZX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0703886c81=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3B55q4DF026742;
	Tue, 5 Dec 2023 05:52:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=WDKGWJ7zhDsL/t+pQmNVNF7hTCUrQtm0fx2ZXNw4l/s=; b=
	eDbhESZXjsWvnPoDVi6bNswSzLXtHH3A0hkSXi6y0OUKHfRueu03Xwr41p7UnQ0D
	7fmCmg1QMXLhahSwF8yo0UjGlN7rQ228ymHw/4pd8B3BEgaNojBw2vqdhvrqbvuV
	lmvJy7tHme6hau+F0GHGqoLHa3j3hbeXWDtGcUFiwqdmy7MfFTCwDpHPNBTOEMWE
	ab29x88s+w+Pi/7dQrFCqC7J6rYMK62zeRdrXsOmvOQPsdYSYMJUGs26zbgPKwaj
	2/i1up7WBEHJhYwzsZaOtYmCPq+KLA6135cgGQPCWW7D1d/ZcTHibzxKywJpej21
	O9EiPxIHvJsLveWStG+3XQ==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3usss48680-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 05:52:04 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Dec 2023 21:52:06 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 4 Dec 2023 21:52:05 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2] openssh: Add PACKAGECONFIG option to customize sshd mode
Date: Tue, 5 Dec 2023 13:52:01 +0800
Message-ID: <20231205055201.1738005-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <ef31fe38-2390-ecb8-405a-570895ef1ab9@windriver.com>
References: <ef31fe38-2390-ecb8-405a-570895ef1ab9@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: kAqiH9sjHnFK36P3lrtFyYnLNPfcyKqc
X-Proofpoint-GUID: kAqiH9sjHnFK36P3lrtFyYnLNPfcyKqc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 mlxscore=0 adultscore=0 impostorscore=0 phishscore=0 mlxlogscore=999
 malwarescore=0 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2312050047
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 05:52:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191794

From: Mingli Yu <mingli.yu@windriver.com>

Add systemd-sshd-socket-mode PACKAGECONFIG option to choose sshd.socket
and systemd-sshd-service-mode PACKAGECONFIG option to choose installing
sshd.service.

The systemd-sshd-socket-mode PACKAGECONFIG option is enabled by default
and user can customize the above two PACKAGECONFIG option to choose the
sshd mode.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../openssh/openssh_9.5p1.bb                  | 24 ++++++++++++++-----
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh_9.5p1.bb b/meta/recipes-connectivity/openssh/openssh_9.5p1.bb
index bbb8fb091a..a10f5c5a61 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.5p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.5p1.bb
@@ -50,16 +50,20 @@ INITSCRIPT_NAME:${PN}-sshd = "sshd"
 INITSCRIPT_PARAMS:${PN}-sshd = "defaults 9"
 
 SYSTEMD_PACKAGES = "${PN}-sshd"
-SYSTEMD_SERVICE:${PN}-sshd = "sshd.socket sshd.service"
+SYSTEMD_SERVICE:${PN}-sshd = "${@bb.utils.contains('PACKAGECONFIG','systemd-sshd-socket-mode','sshd.socket', '', d)} ${@bb.utils.contains('PACKAGECONFIG','systemd-sshd-service-mode','sshd.service', '', d)}"
 
 inherit autotools-brokensep ptest pkgconfig
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
 
-PACKAGECONFIG ??= ""
+# systemd-sshd-socket-mode means sshd.socket and systemd-sshd-service-mode
+# corresponding to sshd.service
+PACKAGECONFIG ??= " systemd-sshd-socket-mode"
 PACKAGECONFIG[kerberos] = "--with-kerberos5,--without-kerberos5,krb5"
 PACKAGECONFIG[ldns] = "--with-ldns,--without-ldns,ldns"
 PACKAGECONFIG[libedit] = "--with-libedit,--without-libedit,libedit"
 PACKAGECONFIG[manpages] = "--with-mantype=man,--with-mantype=cat"
+PACKAGECONFIG[systemd-sshd-socket-mode] = ""
+PACKAGECONFIG[systemd-sshd-service-mode] = ""
 
 EXTRA_AUTORECONF += "--exclude=aclocal"
 
@@ -125,15 +129,23 @@ do_install:append () {
 	echo "HostKey /var/run/ssh/ssh_host_ed25519_key" >> ${D}${sysconfdir}/ssh/sshd_config_readonly
 
 	install -d ${D}${systemd_system_unitdir}
-	install -c -m 0644 ${WORKDIR}/sshd.socket ${D}${systemd_system_unitdir}
-	install -c -m 0644 ${WORKDIR}/sshd.service ${D}${systemd_system_unitdir}
-	install -c -m 0644 ${WORKDIR}/sshd@.service ${D}${systemd_system_unitdir}
+	if ${@bb.utils.contains('PACKAGECONFIG','systemd-sshd-socket-mode','true','false',d)}; then
+	    install -c -m 0644 ${WORKDIR}/sshd.socket ${D}${systemd_system_unitdir}
+	    install -c -m 0644 ${WORKDIR}/sshd@.service ${D}${systemd_system_unitdir}
+	    sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
+		    -e 's,@SBINDIR@,${sbindir},g' \
+		    -e 's,@BINDIR@,${bindir},g' \
+		    -e 's,@LIBEXECDIR@,${libexecdir}/${BPN},g' \
+            ${D}${systemd_system_unitdir}/sshd.socket
+	elif ${@bb.utils.contains('PACKAGECONFIG','systemd-sshd-service-mode','true','false',d)}; then
+	    install -c -m 0644 ${WORKDIR}/sshd.service ${D}${systemd_system_unitdir}
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


