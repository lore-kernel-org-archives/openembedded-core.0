Return-Path: <meenali.gupta@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B10EC54FB9
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 11:19:17 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.4608.1700133550622071137
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Nov 2023 03:19:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=eu6W+FHk;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9684df30ff=meenali.gupta@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3AGAxkkJ030003
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 11:19:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=jBbMZ
	XEPOUL1uUCWXA2W4+11eK5D9hY8MVvqoHrgysU=; b=eu6W+FHkZbeXgjvyc1Cm6
	MQbswOZVsDvkeYLFf5QquzOOXFwNKSTxn6efyYvQ7j0ASIS11N1QMcSfzwl8SLtS
	zJHsYcm11iNT6lZOT7KnTFsv7yH3/Ts7GBZ2hUYg7gIbGRGfybldj9ApYDJOigqq
	SrVgRNH9Fw/4o6dMZge4wvK85DUfHsoP8kSiiYlHFc/DMGEDWtwHBWBtbgPXuRtI
	TTt9U1dEEYzebgjK4N0p9CbyOcQ7D0ltsdiC27Hf9wks+VRDO/uNZpI/9ImIGROZ
	ND2Q/Pqit6ARpokzSdXIVBgkOtijQfWEI9Esop/Rf9iEBivglZ5x29qviGYM25CQ
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3u9xtxcvrf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 11:19:09 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 03:19:12 -0800
From: mgupta1 <meenali.gupta@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][PATCH 4/5] avahi fix CVE-2023-38472
Date: Thu, 16 Nov 2023 11:18:49 +0000
Message-ID: <20231116111849.712496-1-meenali.gupta@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: 3zutp9kCRPSgcdERZ0yF7gRVEl5WZ9dF
X-Proofpoint-GUID: 3zutp9kCRPSgcdERZ0yF7gRVEl5WZ9dF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_09,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=982 bulkscore=0 mlxscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311060001
 definitions=main-2311160090
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 11:19:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190780

From: Meenali Gupta <meenali.gupta@windriver.com>

A vulnerability was found in Avahi. A reachable assertion exists
in the avahi_rdata_parse() function.

Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
---
 meta/recipes-connectivity/avahi/avahi_0.8.bb  |  1 +
 .../avahi/files/CVE-2023-38472.patch          | 46 +++++++++++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-38472.patch

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-connectivity/avahi/avahi_0.8.bb
index 9c903d6868..84eb1c554d 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -29,6 +29,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/avahi-${PV}.tar.gz \
            file://CVE-2023-38469.patch \
            file://CVE-2023-38470.patch \
            file://CVE-2023-38471.patch \
+           file://CVE-2023-38472.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/lathiat/avahi/releases/"
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-38472.patch b/meta/recipes-connectivity/avahi/files/CVE-2023-38472.patch
new file mode 100644
index 0000000000..a1de8e2a5a
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/CVE-2023-38472.patch
@@ -0,0 +1,46 @@
+From 8cf606779dc356768afc6b70e53f2808a9655143 Mon Sep 17 00:00:00 2001
+From: Michal Sekletar <msekleta@redhat.com>
+Date: Thu, 19 Oct 2023 17:36:44 +0200
+Subject: [PATCH] avahi: core: make sure there is rdata to process before
+ parsing it
+
+Fixes #452
+
+Upstream-Status: Backport [https://github.com/lathiat/avahi/commit/b024ae5749f4aeba03478e6391687c3c9c8dee40]
+CVE: CVE-2023-38472
+
+Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
+---
+ avahi-client/client-test.c      | 3 +++
+ avahi-daemon/dbus-entry-group.c | 2 +-
+ 2 files changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/avahi-client/client-test.c b/avahi-client/client-test.c
+index 7d04a6a..57750a4 100644
+--- a/avahi-client/client-test.c
++++ b/avahi-client/client-test.c
+@@ -258,6 +258,9 @@ int main (AVAHI_GCC_UNUSED int argc, AVAHI_GCC_UNUSED char *argv[]) {
+     printf("%s\n", avahi_strerror(avahi_entry_group_add_service (group, AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, 0, "Lathiat's Site", "_http._tcp", NULL, NULL, 80, "foo=bar", NULL)));
+     printf("add_record: %d\n", avahi_entry_group_add_record (group, AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, 0, "TestX", 0x01, 0x10, 120, "\5booya", 6));
+
++    error = avahi_entry_group_add_record (group, AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, 0, "TestX", 0x01, 0x10, 120, "", 0);
++    assert(error != AVAHI_OK);
++
+     avahi_entry_group_commit (group);
+
+     domain = avahi_domain_browser_new (avahi, AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, NULL, AVAHI_DOMAIN_BROWSER_BROWSE, 0, avahi_domain_browser_callback, (char*) "omghai3u");
+diff --git a/avahi-daemon/dbus-entry-group.c b/avahi-daemon/dbus-entry-group.c
+index 4e879a5..aa23d4b 100644
+--- a/avahi-daemon/dbus-entry-group.c
++++ b/avahi-daemon/dbus-entry-group.c
+@@ -340,7 +340,7 @@ DBusHandlerResult avahi_dbus_msg_entry_group_impl(DBusConnection *c, DBusMessage
+         if (!(r = avahi_record_new_full (name, clazz, type, ttl)))
+             return avahi_dbus_respond_error(c, m, AVAHI_ERR_NO_MEMORY, NULL);
+
+-        if (avahi_rdata_parse (r, rdata, size) < 0) {
++        if (!rdata || avahi_rdata_parse (r, rdata, size) < 0) {
+             avahi_record_unref (r);
+             return avahi_dbus_respond_error(c, m, AVAHI_ERR_INVALID_RDATA, NULL);
+         }
+--
+2.40.0
-- 
2.40.0


