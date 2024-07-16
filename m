Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5248CC3DA49
	for <webhook@archiver.kernel.org>; Tue, 16 Jul 2024 09:37:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.6823.1721122615359975987
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jul 2024 02:36:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7927234458=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46G0iL4R004497
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Jul 2024 09:36:54 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40c10xa7h1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Jul 2024 09:36:54 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 16 Jul 2024 02:36:51 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][scarthgap][PATCH 1/1] less: fix CVE-2024-32487
Date: Tue, 16 Jul 2024 09:36:39 +0000
Message-ID: <20240716093639.3854924-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: L9CSbRbWDer3l9rFUpgpl6Ly6AWTP99q
X-Proofpoint-GUID: L9CSbRbWDer3l9rFUpgpl6Ly6AWTP99q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-15_19,2024-07-16_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 spamscore=0 mlxlogscore=968
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2407160069
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jul 2024 09:37:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202092

From: Archana Polampalli <archana.polampalli@windriver.com>

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../less/files/CVE-2024-32487.patch           | 74 +++++++++++++++++++
 meta/recipes-extended/less/less_643.bb        |  1 +
 2 files changed, 75 insertions(+)
 create mode 100644 meta/recipes-extended/less/files/CVE-2024-32487.patch

diff --git a/meta/recipes-extended/less/files/CVE-2024-32487.patch b/meta/recipes-extended/less/files/CVE-2024-32487.patch
new file mode 100644
index 0000000000..2d33099cd3
--- /dev/null
+++ b/meta/recipes-extended/less/files/CVE-2024-32487.patch
@@ -0,0 +1,74 @@
+From 007521ac3c95bc76e3d59c6dbfe75d06c8075c33 Mon Sep 17 00:00:00 2001
+From: Mark Nudelman <markn@greenwoodsoftware.com>
+Date: Thu, 11 Apr 2024 17:49:48 -0700
+Subject: [PATCH] Fix bug when viewing a file whose name contains a newline.
+
+CVE: CVE-2024-32487
+
+Upstream-Status: Backport [https://github.com/gwsw/less/commit/007521ac3c95bc76e3d59c6dbfe75d06c8075c33]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ filename.c | 29 ++++++++++++++++++++++++-----
+ 1 file changed, 24 insertions(+), 5 deletions(-)
+
+diff --git a/filename.c b/filename.c
+index a8726dc..c4b35b1 100644
+--- a/filename.c
++++ b/filename.c
+@@ -133,6 +133,15 @@ static int metachar(char c)
+	return (strchr(metachars(), c) != NULL);
+ }
+
++/*
++ * Must use quotes rather than escape char for this metachar?
++ */
++static int must_quote(char c)
++{
++	/* {{ Maybe the set of must_quote chars should be configurable? }} */
++	return (c == '\n');
++}
++
+ /*
+  * Insert a backslash before each metacharacter in a string.
+  */
+@@ -164,6 +173,9 @@ public char * shell_quote(char *s)
+				 * doesn't support escape chars.  Use quotes.
+				 */
+				use_quotes = 1;
++			} else if (must_quote(*p))
++			{
++				len += 3; /* open quote + char + close quote */
+			} else
+			{
+				/*
+@@ -193,15 +205,22 @@ public char * shell_quote(char *s)
+	{
+		while (*s != '\0')
+		{
+-			if (metachar(*s))
++			if (!metachar(*s))
+			{
+-				/*
+-				 * Add the escape char.
+-				 */
++				*p++ = *s++;
++			} else if (must_quote(*s))
++			{
++				/* Surround the char with quotes. */
++				*p++ = openquote;
++				*p++ = *s++;
++				*p++ = closequote;
++			} else
++			{
++				/* Insert an escape char before the char. */
+				strcpy(p, esc);
+				p += esclen;
++				*p++ = *s++;
+			}
+-			*p++ = *s++;
+		}
+		*p = '\0';
+	}
+--
+2.40.0
diff --git a/meta/recipes-extended/less/less_643.bb b/meta/recipes-extended/less/less_643.bb
index 67834bdd58..537283bde4 100644
--- a/meta/recipes-extended/less/less_643.bb
+++ b/meta/recipes-extended/less/less_643.bb
@@ -27,6 +27,7 @@ DEPENDS = "ncurses"
 
 SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz \
            file://run-ptest \
+           file://CVE-2024-32487.patch \
            "
 
 SRC_URI[sha256sum] = "2911b5432c836fa084c8a2e68f6cd6312372c026a58faaa98862731c8b6052e8"
-- 
2.40.0


