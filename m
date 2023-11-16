Return-Path: <meenali.gupta@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 692A4C54FB9
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 11:18:07 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.4564.1700133485570283105
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Nov 2023 03:18:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=pAjOQMmc;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9684df30ff=meenali.gupta@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3AGBHFhU004377
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 11:18:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=7IGVe
	j2lQZDDK+e60Eh7Avn/9k/woBRQQxA8OSXXXSk=; b=pAjOQMmcf0HkEunpDv3BA
	qgDTvk90uUeW25g3vmlFCF/zLWClnpJaYObEQuGtZ9VK1TNvc3pNZcC5AkuQePd/
	zE1hIgeyK686+/jQHOk2S1k3zRbpbZkZWL1x0GZhIWVD14yXdSYNtnx/gICkKn3r
	m4xP3k/hfWyj7H/TBC2QluIax/7nEeRhncByAxJf8WOlN6Tn2XFbq5oJ71mREUK2
	tEuVuemUFELn8Vcn3re7tF5wYXiI0BsV/VSMH7I73cgTD2omL+9Byqew2phc6flO
	RXCwhFGe+9gK2ce+d/W7nAC+5BbhjJ/iWWJtpvEkI3EZ2pflp23f7VvgVjrPqHQI
	A==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ua0k6ct3f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 11:18:04 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 03:18:07 -0800
From: mgupta1 <meenali.gupta@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][PATCH 2/5] avahi: fix CVE-2023-38470
Date: Thu, 16 Nov 2023 11:17:44 +0000
Message-ID: <20231116111744.451044-1-meenali.gupta@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: IAgzlekjBeBMVbkNzXRm9cuJPsWy8cSo
X-Proofpoint-ORIG-GUID: IAgzlekjBeBMVbkNzXRm9cuJPsWy8cSo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_09,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=823 spamscore=0
 lowpriorityscore=0 mlxscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311060001
 definitions=main-2311160090
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 11:18:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190778

From: Meenali Gupta <meenali.gupta@windriver.com>

A vulnerability was found in Avahi. A reachable assertion exists
in the avahi_escape_label() function.

Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
---
 meta/recipes-connectivity/avahi/avahi_0.8.bb  |  1 +
 .../avahi/files/CVE-2023-38470.patch          | 59 +++++++++++++++++++
 2 files changed, 60 insertions(+)
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-38470.patch

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-connectivity/avahi/avahi_0.8.bb
index 90b33ba81b..a0b31a4697 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -27,6 +27,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/avahi-${PV}.tar.gz \
            file://local-ping.patch \
            file://invalid-service.patch \
            file://CVE-2023-38469.patch \
+           file://CVE-2023-38470.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/lathiat/avahi/releases/"
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-38470.patch b/meta/recipes-connectivity/avahi/files/CVE-2023-38470.patch
new file mode 100644
index 0000000000..91f9e677ac
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/CVE-2023-38470.patch
@@ -0,0 +1,59 @@
+From af7bfad67ca53a7c4042a4a2d85456b847e9f249 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Petr=20Men=C5=A1=C3=ADk?= <pemensik@redhat.com>
+Date: Tue, 11 Apr 2023 15:29:59 +0200
+Subject: [PATCH] avahi: Ensure each label is at least one byte long
+
+The only allowed exception is single dot, where it should return empty
+string.
+
+Fixes #454.
+
+Upstream-Status: Backport [https://github.com/lathiat/avahi/commit/94cb6489114636940ac683515417990b55b5d66c]
+CVE: CVE-2023-38470
+
+Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
+---
+ avahi-common/domain-test.c | 14 ++++++++++++++
+ avahi-common/domain.c      |  2 +-
+ 2 files changed, 15 insertions(+), 1 deletion(-)
+
+diff --git a/avahi-common/domain-test.c b/avahi-common/domain-test.c
+index cf763ec..3acc1c1 100644
+--- a/avahi-common/domain-test.c
++++ b/avahi-common/domain-test.c
+@@ -45,6 +45,20 @@ int main(AVAHI_GCC_UNUSED int argc, AVAHI_GCC_UNUSED char *argv[]) {
+     printf("%s\n", s = avahi_normalize_name_strdup("fo\\\\o\\..f oo."));
+     avahi_free(s);
+
++    printf("%s\n", s = avahi_normalize_name_strdup("."));
++    avahi_free(s);
++
++    s = avahi_normalize_name_strdup(",.=.}.=.?-.}.=.?.?.}.}.?.?.?.z.?.?.}.}."
++		    "}.?.?.?.r.=.=.}.=.?.}}.}.?.?.?.zM.=.=.?.?.}.}.?.?.}.}.}"
++		    ".?.?.?.r.=.=.}.=.?.}}.}.?.?.?.zM.=.=.?.?.}.}.?.?.?.zM.?`"
++		    "?.}.}.}.?.?.?.r.=.?.}.=.?.?.}.?.?.?.}.=.?.?.}??.}.}.?.?."
++		    "?.z.?.?.}.}.}.?.?.?.r.=.=.}.=.?.}}.}.?.?.?.zM.?`?.}.}.}."
++		    "??.?.zM.?`?.}.}.}.?.?.?.r.=.?.}.=.?.?.}.?.?.?.}.=.?.?.}?"
++		    "?.}.}.?.?.?.z.?.?.}.}.}.?.?.?.r.=.=.}.=.?.}}.}.?.?.?.zM."
++		    "?`?.}.}.}.?.?.?.r.=.=.?.?`.?.?}.}.}.?.?.?.r.=.?.}.=.?.?."
++		    "}.?.?.?.}.=.?.?.}");
++    assert(s == NULL);
++
+     printf("%i\n", avahi_domain_equal("\\065aa bbb\\.\\046cc.cc\\\\.dee.fff.", "Aaa BBB\\.\\.cc.cc\\\\.dee.fff"));
+     printf("%i\n", avahi_domain_equal("A", "a"));
+
+diff --git a/avahi-common/domain.c b/avahi-common/domain.c
+index 3b1ab68..e66d241 100644
+--- a/avahi-common/domain.c
++++ b/avahi-common/domain.c
+@@ -201,7 +201,7 @@ char *avahi_normalize_name(const char *s, char *ret_s, size_t size) {
+         }
+
+         if (!empty) {
+-            if (size < 1)
++            if (size < 2)
+                 return NULL;
+
+             *(r++) = '.';
+--
+2.40.0
-- 
2.40.0


