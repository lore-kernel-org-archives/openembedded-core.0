Return-Path: <meenali.gupta@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE1F3C4332F
	for <webhook@archiver.kernel.org>; Sun, 29 Oct 2023 09:37:13 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.69789.1698572225675445834
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Oct 2023 02:37:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ZPOR9BJd;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9666a5140e=meenali.gupta@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 39T9b5aw023018;
	Sun, 29 Oct 2023 02:37:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=yxcWz
	okryXY+LYoiM/pWvyqcyXea42UraFgquB0nc04=; b=ZPOR9BJdJ79cUCCWObjMj
	G+kj05iWr6gFhgbEtyhtUE04ob8XUb1L0E6YMI4hltXmWZfO8TJwSAYac2a5XICt
	8eQwslELq7RudxpvS4drD/pMIIYH3vfsXiDqxNy3maLkoKb3DcqUNiT93oUkQEWo
	sw/tLWbQ25OFWi7t0CFSfkUDxdspQAPy9WwtyfUIbYcyJiysWGSAP6V4WpMbrUUb
	qFWK3O/OTmsNsTtn7DBA+MUU2yr53bCIk6bVrq3v47OVRAtfi6JnOK1d9iH27vpF
	3KqAMDyJEb+UNeXV0SxRkD0x0nL0x9GitDlDuYJJ+xlRn3AEcqOUd5Zjw0/sCuXU
	A==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3u11tfrsqd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 29 Oct 2023 02:37:04 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 29 Oct 2023 02:37:04 -0700
From: mgupta1 <meenali.gupta@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][master][mickledore][kirkstone][PATCH 1/1] avahi: fix CVE-2023-38470
Date: Sun, 29 Oct 2023 09:36:44 +0000
Message-ID: <20231029093644.3918509-1-meenali.gupta@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: 2gnL5pHforYf_B3mxaa3v7B4MQ0Cbt0_
X-Proofpoint-ORIG-GUID: 2gnL5pHforYf_B3mxaa3v7B4MQ0Cbt0_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-28_24,2023-10-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 mlxscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2310240000 definitions=main-2310290083
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Oct 2023 09:37:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189768

From: Meenali Gupta <meenali.gupta@windriver.com>

The only allowed exception is single dot, where it should return empty
string.

Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
---
 meta/recipes-connectivity/avahi/avahi_0.8.bb  |  1 +
 .../avahi/files/CVE-2023-38470.patch          | 54 +++++++++++++++++++
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-38470.patch

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-connectivity/avahi/avahi_0.8.bb
index b5c966c102..14e2548a55 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -26,6 +26,7 @@ SRC_URI = "https://github.com/lathiat/avahi/releases/download/v${PV}/avahi-${PV}
            file://0001-Fix-opening-etc-resolv.conf-error.patch \
            file://handle-hup.patch \
            file://local-ping.patch \
+           file://CVE-2023-38470.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://github.com/lathiat/avahi/releases/"
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-38470.patch b/meta/recipes-connectivity/avahi/files/CVE-2023-38470.patch
new file mode 100644
index 0000000000..fedb73e665
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/CVE-2023-38470.patch
@@ -0,0 +1,54 @@
+From 5fe17efad532a39d550f364683bc9386822a9eb9 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Petr=20Men=C5=A1=C3=ADk?= <pemensik@redhat.com>
+Date: Tue, 11 Apr 2023 15:29:59 +0200
+Subject: [PATCH] avahi: Ensure each label is at least one byte long
+
+Upstream-Status: Backport [https://github.com/lathiat/avahi/pull/457/commits/b6cf29f98adce7355e8c51a6af1e338a5f94e16e]
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


