Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAA83C4706F
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 02:17:53 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.20963.1704161872369152471
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jan 2024 18:17:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=fFJvQELA;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1731cdf363=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4021e4SK032306
	for <openembedded-core@lists.openembedded.org>; Tue, 2 Jan 2024 02:17:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=OowcN
	GdnHvOyvc52L9aX5InkMc21UtdSmOzj/CtbV2o=; b=fFJvQELAFZcHNcNjRfzQm
	/UJ1wzjVimaq3gHVDYnZqYh51fby+bT73oOV82jenggWAux06+GCLaRPjnLkPs7I
	VVRz0FmBMXuZc1TXfJV2h3u497WcPHbmAcSGgT60k2e0OH4Osu1W1s80ECBlFnbD
	ElDKmvkBKRuGMeCZDO7bzBCJO13eqzuFEzOoKTgzpQzHOPo65MGfMbq0yYB/93IX
	/Z26TGgk5vdbaaAp6xXUEqt08hUb7qFJZ8G/Q0jIU7HJ5f8U2Y6oetZgeYJ+ZIZl
	Ni6Jx6JfZpxKDxUVy/6iCJFh1K/gdmg4WqgDbt+wXeya+waXd1orMBNEOw1Z/3R6
	Q==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3va8dxae84-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 02:17:51 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 1 Jan 2024 18:17:54 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 1 Jan 2024 18:17:54 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v5] openssh: Add PACKAGECONFIG option to customize sshd mode
Date: Tue, 2 Jan 2024 10:17:48 +0800
Message-ID: <20240102021748.1700165-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: qifWJpA_lmaJA61MIyyrWvZ0m9Ryhldx
X-Proofpoint-ORIG-GUID: qifWJpA_lmaJA61MIyyrWvZ0m9Ryhldx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 adultscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 clxscore=1015 mlxlogscore=999 priorityscore=1501 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401020016
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 02:17:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193194

From: Mingli Yu <mingli.yu@windriver.com>

Add systemd-sshd-socket-mode PACKAGECONFIG option to choose installing
sshd.socket and systemd-sshd-service-mode PACKAGECONFIG option to choose
installing sshd.service.

The systemd-sshd-socket-mode PACKAGECONFIG option is enabled by default
and user can choose the above two PACKAGECONFIG option to customize the
sshd mode.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../openssh/openssh_9.5p1.bb                  | 25 ++++++++++++++-----
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh_9.5p1.bb b/meta/recipes-connectivity/openssh/openssh_9.5p1.bb
index bbb8fb091a..0312d5bd66 100644
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
+# systemd-sshd-socket-mode means installing sshd.socket
+# and systemd-sshd-service-mode corresponding to sshd.service
+PACKAGECONFIG ??= "systemd-sshd-socket-mode"
 PACKAGECONFIG[kerberos] = "--with-kerberos5,--without-kerberos5,krb5"
 PACKAGECONFIG[ldns] = "--with-ldns,--without-ldns,ldns"
 PACKAGECONFIG[libedit] = "--with-libedit,--without-libedit,libedit"
 PACKAGECONFIG[manpages] = "--with-mantype=man,--with-mantype=cat"
+PACKAGECONFIG[systemd-sshd-socket-mode] = ""
+PACKAGECONFIG[systemd-sshd-service-mode] = ""
 
 EXTRA_AUTORECONF += "--exclude=aclocal"
 
@@ -125,15 +129,24 @@ do_install:append () {
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
+	fi
+	if ${@bb.utils.contains('PACKAGECONFIG','systemd-sshd-service-mode','true','false',d)}; then
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


