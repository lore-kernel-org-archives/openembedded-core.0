Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90AD8C61CE5
	for <webhook@archiver.kernel.org>; Tue,  3 Jun 2025 09:21:17 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.7024.1748942473507152490
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jun 2025 02:21:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8249232b55=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5536YxFw021779
	for <openembedded-core@lists.openembedded.org>; Tue, 3 Jun 2025 09:21:12 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9q0qg0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 09:21:12 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 3 Jun 2025 02:21:15 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Tue, 3 Jun 2025 02:21:14 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATCH 3/6] libsoup-2.4: fix CVE-2025-32907
Date: Tue, 3 Jun 2025 17:21:04 +0800
Message-ID: <20250603092107.4053025-3-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250603092107.4053025-1-changqing.li@windriver.com>
References: <20250603092107.4053025-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: uwC5qPFp1YYxRTwbOdmqlE-73_r2k1pc
X-Authority-Analysis: v=2.4 cv=X8RSKHTe c=1 sm=1 tr=0 ts=683ebe88 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=6IFa9wvqVegA:10 a=GHR8O2WEAAAA:20 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=OpW423ZGpPkB8jfHPfgA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDA4MSBTYWx0ZWRfX/4HEdgPnQw7W 8YfgMUaCzhU2R1whepCS14//nyQ99pQ9a5TXBN/trvHve+xAMjPQplW/At8LmCSEmsdQ8PaE2nu pQh8y0QSQIL4jsR2lagJk+8mid7ZVjspjbO+uwZgxc22q0H2ADXDr9LQ+HfIAyf+s6764rnXsVN
 j8GV5l3IOcpXlh84J7Es/iSx/UXqIY4YB6iTPQKaWMdSejzI+dgc7iASiT+ozGlt95StzvAHK6B xKsvRoz2ogA6nL36Bgw2FqPsFilqVk69joChUPQz79mpfPLe6ip+rMoEi6angqiOULcoe0kMOu3 khye7Uq8eScFxDFgGrIiGks/9LFrXvNFocdAaWmW3VEmIrMmdwO5oM7a6+k0YNZPvtlntX8E9Mn
 HL6ui946ZucAJdvkqh5I1uvQ2GSYB20sYxEvNB7eOjkrPR+sgz3QptbjIcGIDldZ36aRlRjf
X-Proofpoint-ORIG-GUID: uwC5qPFp1YYxRTwbOdmqlE-73_r2k1pc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 mlxlogscore=678 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506030081
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 09:21:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217790

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/428

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../libsoup/libsoup-2.4/CVE-2025-32907.patch  | 39 +++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |  3 +-
 .../libsoup-3.4.4/CVE-2025-32907-1.patch      | 14 +++----
 .../libsoup-3.4.4/CVE-2025-32907-2.patch      |  6 +--
 4 files changed, 51 insertions(+), 11 deletions(-)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32907.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32907.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32907.patch
new file mode 100644
index 0000000000..41dd3ff3f4
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32907.patch
@@ -0,0 +1,39 @@
+From 8158b4084dcba2a233dfcb7359c53ab2840148f7 Mon Sep 17 00:00:00 2001
+From: Milan Crha <mcrha@redhat.com>
+Date: Tue, 15 Apr 2025 12:17:39 +0200
+Subject: [PATCH 1/2] soup-message-headers: Correct merge of ranges
+
+It had been skipping every second range, which generated an array
+of a lot of insane ranges, causing large memory usage by the server.
+
+Closes #428
+
+Part-of: <https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/452>
+
+CVE: CVE-2025-32907
+Upstream-Status: Backport
+[https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/452/diffs?commit_id=9bb92f7a685e31e10e9e8221d0342280432ce836]
+
+Test part not applied since test codes use some functions not in this
+version
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-message-headers.c |   1 +
+ 1 files changed, 1 insertions(+)
+
+diff --git a/libsoup/soup-message-headers.c b/libsoup/soup-message-headers.c
+index 78b2455..00b9763 100644
+--- a/libsoup/soup-message-headers.c
++++ b/libsoup/soup-message-headers.c
+@@ -1024,6 +1024,7 @@ soup_message_headers_get_ranges_internal (SoupMessageHeaders  *hdrs,
+ 			if (cur->start <= prev->end) {
+ 				prev->end = MAX (prev->end, cur->end);
+ 				g_array_remove_index (array, i);
++				i--;
+ 			}
+ 		}
+ 	}
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
index b986e2eea2..3823591893 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -31,7 +31,8 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32912-1.patch \
            file://CVE-2025-32912-2.patch \
            file://CVE-2025-32914.patch \
-          "
+           file://CVE-2025-32907.patch \
+"
 SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
 
 CVE_PRODUCT = "libsoup"
diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32907-1.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32907-1.patch
index 41b7d276a4..026a38c39a 100644
--- a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32907-1.patch
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32907-1.patch
@@ -1,4 +1,4 @@
-From 7507b0713c2f02af1cd561ebb99477e0a099419d Mon Sep 17 00:00:00 2001
+From 4741bc288ece52f5dbaebc568e72ce14da3e2757 Mon Sep 17 00:00:00 2001
 From: Milan Crha <mcrha@redhat.com>
 Date: Tue, 15 Apr 2025 12:17:39 +0200
 Subject: [PATCH 1/2] soup-message-headers: Correct merge of ranges
@@ -22,10 +22,10 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  create mode 100644 tests/server-mem-limit-test.c
 
 diff --git a/libsoup/soup-message-headers.c b/libsoup/soup-message-headers.c
-index ee7a3cb..f101d4b 100644
+index 95e2c31..d69d6e8 100644
 --- a/libsoup/soup-message-headers.c
 +++ b/libsoup/soup-message-headers.c
-@@ -1244,6 +1244,7 @@ soup_message_headers_get_ranges_internal (SoupMessageHeaders  *hdrs,
+@@ -1210,6 +1210,7 @@ soup_message_headers_get_ranges_internal (SoupMessageHeaders  *hdrs,
  			if (cur->start <= prev->end) {
  				prev->end = MAX (prev->end, cur->end);
  				g_array_remove_index (array, i);
@@ -34,17 +34,17 @@ index ee7a3cb..f101d4b 100644
  		}
  	}
 diff --git a/tests/meson.build b/tests/meson.build
-index ee118a0..8e7b51d 100644
+index 9bf88be..7ef7ac5 100644
 --- a/tests/meson.build
 +++ b/tests/meson.build
-@@ -102,6 +102,7 @@ tests = [
+@@ -93,6 +93,7 @@ tests = [
    {'name': 'samesite'},
    {'name': 'session'},
    {'name': 'server-auth'},
 +  {'name': 'server-mem-limit'},
    {'name': 'server'},
-   {'name': 'sniffing',
-     'depends': [test_resources],
+   {'name': 'sniffing'},
+   {'name': 'ssl',
 diff --git a/tests/server-mem-limit-test.c b/tests/server-mem-limit-test.c
 new file mode 100644
 index 0000000..98f1c40
diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32907-2.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32907-2.patch
index 9c838a55af..c1b6a1feba 100644
--- a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32907-2.patch
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32907-2.patch
@@ -1,4 +1,4 @@
-From f31dfc357ffdd8d18d3593a06cd4acb888eaba70 Mon Sep 17 00:00:00 2001
+From 85716d2769b3e1acda024d2c7cbfb68139c5d90b Mon Sep 17 00:00:00 2001
 From: Milan Crha <mcrha@redhat.com>
 Date: Tue, 13 May 2025 14:20:46 +0200
 Subject: [PATCH 2/2] server-mem-limit-test: Limit memory usage only when not
@@ -21,10 +21,10 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  2 files changed, 13 insertions(+), 4 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index d4110da..74323ea 100644
+index 73a9fa0..a9531a4 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -357,6 +357,10 @@ configinc = include_directories('.')
+@@ -374,6 +374,10 @@ configinc = include_directories('.')
  
  prefix = get_option('prefix')
  
-- 
2.34.1


