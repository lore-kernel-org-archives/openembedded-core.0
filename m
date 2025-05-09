Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0990C3ABC9
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 10:22:45 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.11121.1746786158758393059
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 May 2025 03:22:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7224ebccee=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54950Kow029334
	for <openembedded-core@lists.openembedded.org>; Fri, 9 May 2025 03:22:38 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46djnjxyda-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 03:22:38 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 9 May 2025 03:22:37 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Fri, 9 May 2025 03:22:36 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][Walnascar][PATCH  4/5] openssh: fix CVE-2025-32728
Date: Fri, 9 May 2025 10:22:27 +0000
Message-ID: <20250509102228.3422688-4-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250509102228.3422688-1-archana.polampalli@windriver.com>
References: <20250509102228.3422688-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDEwMCBTYWx0ZWRfX56J+YI3hE2NE mhKic09ZyUynKPOBp+gH/qaUEJae1KN4jVifxy4cuVmpalnjrzXsMlFjhb0Y8bgykbXLvAw/xww aticDaZGqXTwGb919jCnAqfv/eFNX0giKQB5kry11PVvu6ztq7zuWvelart7Qi4lWGuw6yctfMk
 wYwL1BwrhwafeBvilUrZDrdKGzE72qtandv3Vigf4fPgtq6oIzeKfDZC+r2Echdaa/no+Gm3oxw 47wcTPVNy3u759CLS2PHGTuwev+FfQPdWaOtFp1/nFGLV7MJEU1xh0+c3EGfz32N1+lC53hEUTH UvxQ1BbTJiKDlMKKdoEijhpG0cJwJZ2my5DLQRqx8QvsuoUaF5Se57NopI+6q5Ad3Ht2cZ0IFdb
 GHKLzCVtUfFUJZddbkNCYrVJzwqb74n6/3zLPN+Cs0zLDnCr0M3KtO/aCPaynqPxGa52WIsv
X-Proofpoint-ORIG-GUID: cwkOq4WsTY4-Doi-h20lyfq4PhbpR-xP
X-Proofpoint-GUID: cwkOq4WsTY4-Doi-h20lyfq4PhbpR-xP
X-Authority-Analysis: v=2.4 cv=KdHSsRYD c=1 sm=1 tr=0 ts=681dd76e cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=dt9VzEwgFbYA:10 a=NEAV23lmAAAA:8 a=3tcz3bTJAAAA:8 a=t7CeM3EgAAAA:8 a=5G3tLGQadNnIt0CeWF8A:9 a=4EbjBm0RLgFgoQzmu6QD:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_04,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 suspectscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2505090100
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 10:22:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216195

From: Archana Polampalli <archana.polampalli@windriver.com>

In sshd in OpenSSH before 10.0, the DisableForwarding directive does not adhere to the
documentation stating that it disables X11 and agent forwarding.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../openssh/openssh/CVE-2025-32728.patch      | 43 +++++++++++++++++++
 .../openssh/openssh_9.9p2.bb                  |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2025-32728.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2025-32728.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2025-32728.patch
new file mode 100644
index 0000000000..db47947b42
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2025-32728.patch
@@ -0,0 +1,43 @@
+From fc86875e6acb36401dfc1dfb6b628a9d1460f367 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Wed, 9 Apr 2025 07:00:03 +0000
+Subject: [PATCH] upstream: Fix logic error in DisableForwarding option. This
+ option
+
+was documented as disabling X11 and agent forwarding but it failed to do so.
+Spotted by Tim Rice.
+
+OpenBSD-Commit-ID: fffc89195968f7eedd2fc57f0b1f1ef3193f5ed1
+
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/fc86875e6acb36401dfc1dfb6b628a9d1460f367]
+CVE: CVE-2025-32728
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ session.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/session.c b/session.c
+index aa342e8..eb932b8 100644
+--- a/session.c
++++ b/session.c
+@@ -2191,7 +2191,8 @@ session_auth_agent_req(struct ssh *ssh, Session *s)
+	if ((r = sshpkt_get_end(ssh)) != 0)
+		sshpkt_fatal(ssh, r, "%s: parse packet", __func__);
+	if (!auth_opts->permit_agent_forwarding_flag ||
+-	    !options.allow_agent_forwarding) {
++	    !options.allow_agent_forwarding ||
++	    options.disable_forwarding) {
+		debug_f("agent forwarding disabled");
+		return 0;
+	}
+@@ -2586,7 +2587,7 @@ session_setup_x11fwd(struct ssh *ssh, Session *s)
+		ssh_packet_send_debug(ssh, "X11 forwarding disabled by key options.");
+		return 0;
+	}
+-	if (!options.x11_forwarding) {
++	if (!options.x11_forwarding || options.disable_forwarding) {
+		debug("X11 forwarding disabled in server configuration file.");
+		return 0;
+	}
+--
+2.25.1
diff --git a/meta/recipes-connectivity/openssh/openssh_9.9p2.bb b/meta/recipes-connectivity/openssh/openssh_9.9p2.bb
index 5191725796..8d3ea4d632 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.9p2.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.9p2.bb
@@ -25,6 +25,7 @@ SRC_URI = "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.ta
            file://sshd_check_keys \
            file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch \
            file://0001-regress-test-exec-use-the-absolute-path-in-the-SSH-e.patch \
+           file://CVE-2025-32728.patch \
            "
 SRC_URI[sha256sum] = "91aadb603e08cc285eddf965e1199d02585fa94d994d6cae5b41e1721e215673"
 
-- 
2.40.0


