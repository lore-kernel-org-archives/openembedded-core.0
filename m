Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F010C4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 05:44:25 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.25311.1701841460399317972
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Dec 2023 21:44:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Ts4j++2w;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=070494c48b=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3B65DYhb020840
	for <openembedded-core@lists.openembedded.org>; Tue, 5 Dec 2023 21:44:19 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=vu3LLHSEYi9d6xRMnyQd+MX9jKPQnv/SOO2M7Qv99aE=; b=
	Ts4j++2w+YOZN8meYcOucCIxe4q2GZ8XNbf1kLt8sUjwL2UFlH7FSwR5JvHEo4sV
	azH8kcytRynZLwgGyVWw+ybSpa/OjyQODI9JsDbolKkT0fKcCozvc8d4NhtfD3tW
	nOMJSHdMHRJU9ZDUfjzuhwCgpAV1vLXeG+bb5yAc7cuj3Uf4j4UFsUZxE7+qdSsY
	sk8IeoaHSLMRO6NCb5zJBo8GrNNi986+JCP/83wBougCbmGlE/mVAx+MwJdUKwc5
	7Yy36U5vMa6w8c1HliHGiMZcKTUgfJ5Uvj/Pcr3KwCu5owl13woREzAK3HP+IBGU
	uRt6ZUdyplgxuEffX3AH5Q==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3utd2r07ff-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 21:44:19 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Dec 2023 21:44:22 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 5 Dec 2023 21:44:22 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v3] openssh: Add PACKAGECONFIG option to customize sshd mode
Date: Wed, 6 Dec 2023 13:44:17 +0800
Message-ID: <20231206054417.3713005-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231205074322881971a5@mail.local>
References: <20231205074322881971a5@mail.local>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: imLDiKx8-gRm0AUbf35ZT3ythtYx-FD2
X-Proofpoint-GUID: imLDiKx8-gRm0AUbf35ZT3ythtYx-FD2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 adultscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312060046
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 05:44:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191869

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
index 2c1c821ea9..8273cc0f64 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.5p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.5p1.bb
@@ -50,16 +50,20 @@ INITSCRIPT_NAME:${PN}-sshd = "sshd"
 INITSCRIPT_PARAMS:${PN}-sshd = "defaults 9"
 
 SYSTEMD_PACKAGES = "${PN}-sshd"
-SYSTEMD_SERVICE:${PN}-sshd = "sshd.socket sshd.service"
+SYSTEMD_SERVICE:${PN}-sshd = "${@bb.utils.contains('PACKAGECONFIG','systemd-sshd-socket-mode','sshd.socket', '', d)} ${@bb.utils.contains('PACKAGECONFIG','systemd-sshd-service-mode','sshd.service', '', d)}"
 
 inherit autotools-brokensep ptest pkgconfig
 
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
+# systemd-sshd-socket-mode means sshd.socket and systemd-sshd-service-mode
+# corresponding to sshd.service
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} systemd-sshd-socket-mode"
 PACKAGECONFIG[kerberos] = "--with-kerberos5,--without-kerberos5,krb5"
 PACKAGECONFIG[ldns] = "--with-ldns,--without-ldns,ldns"
 PACKAGECONFIG[libedit] = "--with-libedit,--without-libedit,libedit"
 PACKAGECONFIG[manpages] = "--with-mantype=man,--with-mantype=cat"
 PACKAGECONFIG[systemd] = "--with-systemd,--without-systemd,systemd"
+PACKAGECONFIG[systemd-sshd-socket-mode] = ""
+PACKAGECONFIG[systemd-sshd-service-mode] = ""
 
 EXTRA_AUTORECONF += "--exclude=aclocal"
 
@@ -124,15 +128,23 @@ do_install:append () {
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


