Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B184CC71153
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 03:05:39 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.13566.1693883138245343491
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Sep 2023 20:05:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=cUGD1xCS;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7612c9faba=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38531WO6019005
	for <openembedded-core@lists.openembedded.org>; Tue, 5 Sep 2023 03:05:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=XgdLG
	iucPvPPV1FVvARYrQmayF8laXvA0wetS889lTI=; b=cUGD1xCS/AQ/8+V7FeUhO
	dS9hgsLXFRg81Mb3udGk7qsewjXZHjQAtBkFEHkAINtlLo07vRHu3FhqIMA2Tsr2
	moi+jso+UQIhBquDzFrHdHmNEbZPRSj96ob7VskhSvjXaZGaXxX7TCLLgAsaMbRW
	9eTsNYjR9YbvMZbJtOr5OBjxUlDu0GaT+5GanqUKtZQULneoMLbk/asMLfkMxSW3
	pMj//SFcW3/nKpW9DyfuX33PXtDzRrEmb++KnRz/ltcv6sOM3k84en+D6/w1Hrp1
	5s/7hE2FxEhPYpqKEzdL3qkMME0dNnk2cWHdemXwsKKFOL/gtqkyokxgg6w7hdhM
	A==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sw33k0wft-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 03:05:37 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 4 Sep 2023 20:05:25 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Mon, 4 Sep 2023 20:05:25 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [kirkstone][PATCH] sysklogd: fix integration with systemd-journald
Date: Tue, 5 Sep 2023 11:05:27 +0800
Message-ID: <20230905030527.2776991-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: qVTQlvNWKYiseeh427NcJ54vQ99xri6G
X-Proofpoint-ORIG-GUID: qVTQlvNWKYiseeh427NcJ54vQ99xri6G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-05_01,2023-08-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309050026
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 03:05:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187195

From: Changqing Li <changqing.li@windriver.com>

Fix an issue with early log messages being lost when running in systemd.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...KillMode-process-is-not-recommended-.patch | 33 ++++++++
 ...-messages-lost-when-running-in-syste.patch | 75 +++++++++++++++++++
 .../sysklogd/sysklogd_2.3.0.bb                |  2 +
 3 files changed, 110 insertions(+)
 create mode 100644 meta/recipes-extended/sysklogd/files/0001-syslogd.service-KillMode-process-is-not-recommended-.patch
 create mode 100644 meta/recipes-extended/sysklogd/files/0002-Fix-62-early-log-messages-lost-when-running-in-syste.patch

diff --git a/meta/recipes-extended/sysklogd/files/0001-syslogd.service-KillMode-process-is-not-recommended-.patch b/meta/recipes-extended/sysklogd/files/0001-syslogd.service-KillMode-process-is-not-recommended-.patch
new file mode 100644
index 0000000000..6c7e7cea44
--- /dev/null
+++ b/meta/recipes-extended/sysklogd/files/0001-syslogd.service-KillMode-process-is-not-recommended-.patch
@@ -0,0 +1,33 @@
+From b732dd0001c66f3ff1e0aef919c84ca9f0f81252 Mon Sep 17 00:00:00 2001
+From: Joachim Wiberg <troglobit@gmail.com>
+Date: Sat, 22 Apr 2023 07:40:24 +0200
+Subject: [PATCH 1/2] syslogd.service: KillMode=process is not recommended,
+ drop
+
+The default 'control-group' ensures all processes started by sysklogd
+are stopped when the service is stopped, this is what we want.
+
+Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
+
+Upstream-Status: Backport [https://github.com/troglobit/sysklogd/commit/c82c004de7e25e770039cba5d6a34c30dd548533]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ syslogd.service.in | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/syslogd.service.in b/syslogd.service.in
+index 91e080a..d614c5f 100644
+--- a/syslogd.service.in
++++ b/syslogd.service.in
+@@ -9,7 +9,6 @@ EnvironmentFile=-@SYSCONFDIR@/default/syslogd
+ ExecStart=@SBINDIR@/syslogd -F -p /run/systemd/journal/syslog $SYSLOGD_OPTS
+ StandardOutput=null
+ Restart=on-failure
+-KillMode=process
+ 
+ [Install]
+ WantedBy=multi-user.target
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/sysklogd/files/0002-Fix-62-early-log-messages-lost-when-running-in-syste.patch b/meta/recipes-extended/sysklogd/files/0002-Fix-62-early-log-messages-lost-when-running-in-syste.patch
new file mode 100644
index 0000000000..78ae57eeeb
--- /dev/null
+++ b/meta/recipes-extended/sysklogd/files/0002-Fix-62-early-log-messages-lost-when-running-in-syste.patch
@@ -0,0 +1,75 @@
+From ba8156eab79784ef816958327e701923890e98f7 Mon Sep 17 00:00:00 2001
+From: Joachim Wiberg <troglobit@gmail.com>
+Date: Sat, 22 Apr 2023 08:27:57 +0200
+Subject: [PATCH 2/2] Fix #62: early log messages lost when running in systemd
+
+This is a follow-up to d7576c7 which initially added support for running
+in systemd based systems.  Since the unit file sources the syslog.socket
+we have /run/systemd/journal/syslog open already on descriptor 3.  All
+we need to do is verify that's the mode syslogd runs in.
+
+Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
+
+Upstream-Status: Backport [https://github.com/troglobit/sysklogd/commit/7ec64e5f9c1bc284792d028647fb36ef3e64dff7]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ src/syslogd.c      | 21 +++++++++++++++------
+ syslogd.service.in |  2 +-
+ 2 files changed, 16 insertions(+), 7 deletions(-)
+
+diff --git a/src/syslogd.c b/src/syslogd.c
+index fa4303f..e96ca9a 100644
+--- a/src/syslogd.c
++++ b/src/syslogd.c
+@@ -162,6 +162,7 @@ void        untty(void);
+ static void parsemsg(const char *from, char *msg);
+ static int  opensys(const char *file);
+ static void printsys(char *msg);
++static void unix_cb(int sd, void *arg);
+ static void logmsg(struct buf_msg *buffer);
+ static void fprintlog_first(struct filed *f, struct buf_msg *buffer);
+ static void fprintlog_successive(struct filed *f, int flags);
+@@ -436,12 +437,20 @@ int main(int argc, char *argv[])
+ 				.pe_serv = "syslog",
+ 			});
+ 
+-	/* Default to _PATH_LOG for the UNIX domain socket */
+-	if (!pflag)
+-		addpeer(&(struct peer) {
+-				.pe_name = _PATH_LOG,
+-				.pe_mode = 0666,
+-			});
++	/* Figure out where to read system log messages from */
++	if (!pflag) {
++		/* Do we run under systemd-journald (Requires=syslog.socket)? */
++		if (fcntl(3, F_GETFD) != -1) {
++			if (socket_register(3, NULL, unix_cb, NULL) == -1)
++				err(1, "failed registering syslog.socket (3)");
++		} else {
++			/* Default to _PATH_LOG for the UNIX domain socket */
++			addpeer(&(struct peer) {
++					.pe_name = _PATH_LOG,
++					.pe_mode = 0666,
++				});
++		}
++	}
+ 
+ 	if (!Foreground && !Debug) {
+ 		ppid = waitdaemon(30);
+diff --git a/syslogd.service.in b/syslogd.service.in
+index d614c5f..bc82af9 100644
+--- a/syslogd.service.in
++++ b/syslogd.service.in
+@@ -6,7 +6,7 @@ Requires=syslog.socket
+ 
+ [Service]
+ EnvironmentFile=-@SYSCONFDIR@/default/syslogd
+-ExecStart=@SBINDIR@/syslogd -F -p /run/systemd/journal/syslog $SYSLOGD_OPTS
++ExecStart=@SBINDIR@/syslogd -F $SYSLOGD_OPTS
+ StandardOutput=null
+ Restart=on-failure
+ 
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/sysklogd/sysklogd_2.3.0.bb b/meta/recipes-extended/sysklogd/sysklogd_2.3.0.bb
index 7043f3d391..0dc5ef93e2 100644
--- a/meta/recipes-extended/sysklogd/sysklogd_2.3.0.bb
+++ b/meta/recipes-extended/sysklogd/sysklogd_2.3.0.bb
@@ -12,6 +12,8 @@ inherit update-rc.d update-alternatives systemd autotools
 
 SRC_URI = "git://github.com/troglobit/sysklogd.git;branch=master;protocol=https \
            file://sysklogd \
+           file://0001-syslogd.service-KillMode-process-is-not-recommended-.patch \
+           file://0002-Fix-62-early-log-messages-lost-when-running-in-syste.patch \
            "
 
 SRCREV = "03c2c9c68d5d02675326527774e7e9cba3490ba0"
-- 
2.25.1


