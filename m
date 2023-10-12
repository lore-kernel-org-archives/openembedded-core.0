Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA5D8CDB46E
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 06:10:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.5337.1697091017032874268
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Oct 2023 23:10:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=iE8yFafe;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=86495b29a9=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39C5koqo008020
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 23:10:16 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=xppzE
	PpFW6/EkLEx2OypnHijMslGbBHuYQf0NKb7u6c=; b=iE8yFafeMYCKsPUI2UvOA
	tf5071i+vuzNQ7N+1HOZWSzsuhGy66cBzUXNraBX+8+/p9Y0XcN+rYodGVDwIzfl
	/N3kvqujC06qsUF6dEL9yGtmRmSoOtjsG2X9GGHAP7HZpiN1u50JVbWUxxvL0GxV
	VFsKarMIYMtEISagB+cnYHPuxphb888uoVyE9E/pr1BV+kNBwCXCeyoldHV8lGWS
	FDlOz6FuwzdoUWy+3avyvYxZo84yFvJygayU2cGQepuzksXu8mqXw6z/0w6J0+Ru
	44ErUKXb0DOiTnls4IiFvxtzgzO0fBAuGLxNtqH+4A6vI3SBm6KN3c7J1qlA2SiC
	Q==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3tnhq495n3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 23:10:16 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 11 Oct 2023 23:10:15 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.32 via Frontend Transport; Wed, 11 Oct 2023 23:10:14 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] openssh: Add sshd.service
Date: Thu, 12 Oct 2023 14:10:14 +0800
Message-ID: <20231012061014.871229-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: R564_lndGF7z0K5Jw4BJQ6R1DbEBCdzm
X-Proofpoint-GUID: R564_lndGF7z0K5Jw4BJQ6R1DbEBCdzm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-12_02,2023-10-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 clxscore=1011 mlxlogscore=999 phishscore=0 mlxscore=0
 spamscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2309180000 definitions=main-2310120052
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Oct 2023 06:10:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188983

From: Mingli Yu <mingli.yu@windriver.com>

For systems with a large amount of SSH traffic, it shoule be better to
run a single SSH server for all incoming connections.

And both sshd.socket and sshd.service are deployed on other distros
like ubuntu, fedora and etc.

So add sshd.service to make it possible to run a standalone SSH server.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../openssh/openssh/sshd.service                | 17 +++++++++++++++++
 .../openssh/openssh_9.4p1.bb                    |  4 +++-
 2 files changed, 20 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/sshd.service

diff --git a/meta/recipes-connectivity/openssh/openssh/sshd.service b/meta/recipes-connectivity/openssh/openssh/sshd.service
new file mode 100644
index 0000000000..6ace67d8ae
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/sshd.service
@@ -0,0 +1,17 @@
+[Unit]
+Description=OpenSSH server daemon
+Wants=sshdgenkeys.service
+After=sshdgenkeys.service
+
+[Service]
+Environment="SSHD_OPTS="
+EnvironmentFile=-/etc/default/ssh
+ExecStartPre=/usr/bin/mkdir -p /var/run/sshd
+ExecStart=-@SBINDIR@/sshd -D $SSHD_OPTS
+ExecReload=@BASE_BINDIR@/kill -HUP $MAINPID
+KillMode=process
+Restart=on-failure
+RestartSec=42s
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta/recipes-connectivity/openssh/openssh_9.4p1.bb b/meta/recipes-connectivity/openssh/openssh_9.4p1.bb
index e2508aa63a..3ef83a2219 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.4p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.4p1.bb
@@ -16,6 +16,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://ssh_config \
            file://init \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
+           file://sshd.service \
            file://sshd.socket \
            file://sshd@.service \
            file://sshdgenkeys.service \
@@ -48,7 +49,7 @@ INITSCRIPT_NAME:${PN}-sshd = "sshd"
 INITSCRIPT_PARAMS:${PN}-sshd = "defaults 9"
 
 SYSTEMD_PACKAGES = "${PN}-sshd"
-SYSTEMD_SERVICE:${PN}-sshd = "sshd.socket"
+SYSTEMD_SERVICE:${PN}-sshd = "sshd.socket sshd.service"
 
 inherit autotools-brokensep ptest
 
@@ -122,6 +123,7 @@ do_install:append () {
 
 	install -d ${D}${systemd_system_unitdir}
 	install -c -m 0644 ${WORKDIR}/sshd.socket ${D}${systemd_system_unitdir}
+	install -c -m 0644 ${WORKDIR}/sshd.service ${D}${systemd_system_unitdir}
 	install -c -m 0644 ${WORKDIR}/sshd@.service ${D}${systemd_system_unitdir}
 	install -c -m 0644 ${WORKDIR}/sshdgenkeys.service ${D}${systemd_system_unitdir}
 	sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
-- 
2.25.1


