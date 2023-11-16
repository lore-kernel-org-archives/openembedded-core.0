Return-Path: <meenali.gupta@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68C3BC197A0
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 11:18:37 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.4568.1700133517128881733
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Nov 2023 03:18:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=HjiPT4Kk;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9684df30ff=meenali.gupta@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3AG717Ao004301
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 03:18:36 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=OtvuJ
	G1997BEDX47lzOXCZp6x0djfxADfvs0MWEv+l4=; b=HjiPT4KkseU9a15Vz21um
	DScL7h4MEcw90KBIlH3bUK2KDlo0MefgOtHNGZ/yKGKvKcly527HfUophHDuH3Y7
	wrN+nsvNhBVISJ2pWyzkVzR73XjKTY7lJ0fvds7gXOmJHYMS5NyNkOW/xwzN2JQQ
	RGhM3SteNtnr27uc+9Ln4lgctriJi9rHKRIHZFCNZkNu82Q/jki6MPlqR8InC8ST
	N4hirq5RmZIiMXN4osW79seMBAWEXdfL9yLNAtwCUle3g5P+YmbZ2MizP3j6kSqR
	YO1Q8RZM+QtcP18OR+mCIDfRWGj4nnolwEoM+LGJmlRZip6ZkCzvJY7eA8Bw3lon
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uaa0kmkjg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 03:18:36 -0800 (PST)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 03:18:40 -0800
From: mgupta1 <meenali.gupta@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][PATCH 3/5] avahi: fix CVE-2023-38471
Date: Thu, 16 Nov 2023 11:18:17 +0000
Message-ID: <20231116111817.603293-1-meenali.gupta@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: vmFBWbh4APTq4Bc_DzxN104uluvXAzyy
X-Proofpoint-GUID: vmFBWbh4APTq4Bc_DzxN104uluvXAzyy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_09,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 mlxlogscore=937 lowpriorityscore=0 adultscore=0 mlxscore=0
 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2311160090
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 11:18:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190779

From: Meenali Gupta <meenali.gupta@windriver.com>

A vulnerability was found in Avahi. A reachable assertion exists
in the dbus_set_host_name function.

Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
---
 meta/recipes-connectivity/avahi/avahi_0.8.bb  |  1 +
 .../avahi/files/CVE-2023-38471.patch          | 73 +++++++++++++++++++
 2 files changed, 74 insertions(+)
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-38471.patch

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-connectivity/avahi/avahi_0.8.bb
index a0b31a4697..9c903d6868 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -28,6 +28,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/avahi-${PV}.tar.gz \
            file://invalid-service.patch \
            file://CVE-2023-38469.patch \
            file://CVE-2023-38470.patch \
+           file://CVE-2023-38471.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/lathiat/avahi/releases/"
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-38471.patch b/meta/recipes-connectivity/avahi/files/CVE-2023-38471.patch
new file mode 100644
index 0000000000..b3f716495d
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/CVE-2023-38471.patch
@@ -0,0 +1,73 @@
+From 48d745db7fd554fc33e96ec86d3675ebd530bb8e Mon Sep 17 00:00:00 2001
+From: Michal Sekletar <msekleta@redhat.com>
+Date: Mon, 23 Oct 2023 13:38:35 +0200
+Subject: [PATCH] avahi: core: extract host name using avahi_unescape_label()
+
+Previously we could create invalid escape sequence when we split the
+string on dot. For example, from valid host name "foo\\.bar" we have
+created invalid name "foo\\" and tried to set that as the host name
+which crashed the daemon.
+
+Fixes #453
+
+Upstream-Status: Backport [https://github.com/lathiat/avahi/commit/894f085f402e023a98cbb6f5a3d117bd88d93b09]
+CVE: CVE-2023-38471
+
+Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
+---
+ avahi-core/server.c | 27 +++++++++++++++++++++------
+ 1 file changed, 21 insertions(+), 6 deletions(-)
+
+diff --git a/avahi-core/server.c b/avahi-core/server.c
+index e507750..40f1d68 100644
+--- a/avahi-core/server.c
++++ b/avahi-core/server.c
+@@ -1295,7 +1295,11 @@ static void update_fqdn(AvahiServer *s) {
+ }
+
+ int avahi_server_set_host_name(AvahiServer *s, const char *host_name) {
+-    char *hn = NULL;
++    char label_escaped[AVAHI_LABEL_MAX*4+1];
++    char label[AVAHI_LABEL_MAX];
++    char *hn = NULL, *h;
++    size_t len;
++
+     assert(s);
+
+     AVAHI_CHECK_VALIDITY(s, !host_name || avahi_is_valid_host_name(host_name), AVAHI_ERR_INVALID_HOST_NAME);
+@@ -1305,17 +1309,28 @@ int avahi_server_set_host_name(AvahiServer *s, const char *host_name) {
+     else
+         hn = avahi_normalize_name_strdup(host_name);
+
+-    hn[strcspn(hn, ".")] = 0;
++    h = hn;
++    if (!avahi_unescape_label((const char **)&hn, label, sizeof(label))) {
++        avahi_free(h);
++        return AVAHI_ERR_INVALID_HOST_NAME;
++    }
++
++    avahi_free(h);
++
++    h = label_escaped;
++    len = sizeof(label_escaped);
++    if (!avahi_escape_label(label, strlen(label), &h, &len))
++        return AVAHI_ERR_INVALID_HOST_NAME;
+
+-    if (avahi_domain_equal(s->host_name, hn) && s->state != AVAHI_SERVER_COLLISION) {
+-        avahi_free(hn);
++    if (avahi_domain_equal(s->host_name, label_escaped) && s->state != AVAHI_SERVER_COLLISION)
+         return avahi_server_set_errno(s, AVAHI_ERR_NO_CHANGE);
+-    }
+
+     withdraw_host_rrs(s);
+
+     avahi_free(s->host_name);
+-    s->host_name = hn;
++    s->host_name = avahi_strdup(label_escaped);
++    if (!s->host_name)
++        return AVAHI_ERR_NO_MEMORY;
+
+     update_fqdn(s);
+
+--
+2.40.0
-- 
2.40.0


