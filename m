Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A65A4C8303C
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 08:16:02 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.13674.1751962559388451012
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Jul 2025 01:15:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9284fa5eea=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5685eAPd012006
	for <openembedded-core@lists.openembedded.org>; Tue, 8 Jul 2025 01:15:59 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47q3jn2e3g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 08 Jul 2025 01:15:58 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Tue, 8 Jul 2025 01:15:43 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Tue, 8 Jul 2025 01:15:43 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATCH 1/2] libsoup-2.4: fix CVE-2025-4945
Date: Tue, 8 Jul 2025 16:15:55 +0800
Message-ID: <20250708081556.3561610-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 9Y_fXI539CNYP270vLWl5x4YRC7hXGCf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDA2NiBTYWx0ZWRfX0C90wlvWuEDX jE/bNEFHK5D/jk7HBcmAlTBDY/rUmYzfn1Q0BP/R9KC7/F6miqDll8VN1y8lQPI8UQmZFUEaO1d Wnik9echfKqoCnyvsIriCRM3wBoA6JuambIiUTIaRnsV37BNE1/Jox67Kwp/BZuBG1/Djj57QpU
 Y4q8E2uzTGjybnuioKoD7LMLfewGTp5UQdhpZI72boytnN9P3xtP40ZRcN5BjZe+wI67v9jL/F1 WynC5u3HEt4c52kthbjyUkvVxb8BARPQjLqrkytIPse1cKrnEb0hqm6/u9s5cj1a0cjwAmCCuI6 dkra0vTGjxJrAdVB9so5RUQSwIiv2DS9V7RX9zu9gj5Wa6nub7OiraWwuNbAy/66tze6nfy1dXJ
 FEcBUGEmfh6h7zBTAtMFEOipckTYr+2uejfv6TxdVIs2Ah+IWUes4D7sy4IEdd6T/9u9MqVw
X-Proofpoint-ORIG-GUID: 9Y_fXI539CNYP270vLWl5x4YRC7hXGCf
X-Authority-Analysis: v=2.4 cv=fv3cZE4f c=1 sm=1 tr=0 ts=686cd3be cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=Wb1JkmetP80A:10 a=GHR8O2WEAAAA:20 a=t7CeM3EgAAAA:8 a=OpW423ZGpPkB8jfHPfgA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_02,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 phishscore=0 mlxlogscore=921 malwarescore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 mlxscore=0 impostorscore=0 spamscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507080066
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Jul 2025 08:16:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220016

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/448

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../libsoup/libsoup-2.4/CVE-2025-4945.patch   | 117 ++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |   1 +
 2 files changed, 118 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4945.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4945.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4945.patch
new file mode 100644
index 0000000000..c9fbdbacc8
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4945.patch
@@ -0,0 +1,117 @@
+From 3844026f74a41dd9ccab955899e005995293d246 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Tue, 8 Jul 2025 14:58:30 +0800
+Subject: [PATCH] soup-date-utils: Add value checks for date/time parsing
+
+Reject date/time when it does not represent a valid value.
+
+Closes #448
+
+CVE: CVE-2025-4945
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/8988379984e33dcc7d3aa58551db13e48755959f]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-date.c  | 21 +++++++++++++++------
+ tests/cookies-test.c | 10 ++++++++++
+ 2 files changed, 25 insertions(+), 6 deletions(-)
+
+diff --git a/libsoup/soup-date.c b/libsoup/soup-date.c
+index 9602d1f..4c114c1 100644
+--- a/libsoup/soup-date.c
++++ b/libsoup/soup-date.c
+@@ -284,7 +284,7 @@ parse_day (SoupDate *date, const char **date_string)
+ 	while (*end == ' ' || *end == '-')
+ 		end++;
+ 	*date_string = end;
+-	return TRUE;
++	return date->day >= 1 && date->day <= 31;
+ }
+ 
+ static inline gboolean
+@@ -324,7 +324,7 @@ parse_year (SoupDate *date, const char **date_string)
+ 	while (*end == ' ' || *end == '-')
+ 		end++;
+ 	*date_string = end;
+-	return TRUE;
++	return date->year > 0 && date->year < 9999;
+ }
+ 
+ static inline gboolean
+@@ -348,7 +348,7 @@ parse_time (SoupDate *date, const char **date_string)
+ 	while (*p == ' ')
+ 		p++;
+ 	*date_string = p;
+-	return TRUE;
++	return  date->hour >= 0 && date->hour < 24 && date->minute >= 0 && date->minute < 60 && date->second >= 0 && date->second < 60;
+ }
+ 
+ static inline gboolean
+@@ -361,8 +361,15 @@ parse_timezone (SoupDate *date, const char **date_string)
+ 		gulong val;
+ 		int sign = (**date_string == '+') ? -1 : 1;
+ 		val = strtoul (*date_string + 1, (char **)date_string, 10);
++		if (val > 9999)
++			return FALSE;
+ 		if (**date_string == ':')
+-			val = 60 * val + strtoul (*date_string + 1, (char **)date_string, 10);
++		{
++			gulong val2 = strtoul (*date_string + 1, (char **)date_string, 10);
++			if (val > 99 || val2 > 99)
++				return FALSE;
++			val = 60 * val + val2;
++		}
+ 		else
+ 			val =  60 * (val / 100) + (val % 100);
+ 		date->offset = sign * val;
+@@ -407,7 +414,8 @@ parse_textual_date (SoupDate *date, const char *date_string)
+ 		if (!parse_month (date, &date_string) ||
+ 		    !parse_day (date, &date_string) ||
+ 		    !parse_time (date, &date_string) ||
+-		    !parse_year (date, &date_string))
++		    !parse_year (date, &date_string) ||
++		    !g_date_valid_dmy(date->day, date->month, date->year))
+ 			return FALSE;
+ 
+ 		/* There shouldn't be a timezone, but check anyway */
+@@ -419,7 +427,8 @@ parse_textual_date (SoupDate *date, const char *date_string)
+ 		if (!parse_day (date, &date_string) ||
+ 		    !parse_month (date, &date_string) ||
+ 		    !parse_year (date, &date_string) ||
+-		    !parse_time (date, &date_string))
++		    !parse_time (date, &date_string) ||
++		    !g_date_valid_dmy(date->day, date->month, date->year))
+ 			return FALSE;
+ 
+ 		/* This time there *should* be a timezone, but we
+diff --git a/tests/cookies-test.c b/tests/cookies-test.c
+index 2e2a54f..6035a86 100644
+--- a/tests/cookies-test.c
++++ b/tests/cookies-test.c
+@@ -413,6 +413,15 @@ do_remove_feature_test (void)
+ 	soup_uri_free (uri);
+ }
+ 
++static void
++do_cookies_parsing_int32_overflow (void)
++{
++	SoupCookie *cookie = soup_cookie_parse ("Age=1;expires=3Mar9    999:9:9+ 999999999-age=main=gne=", NULL);
++	g_assert_nonnull (cookie);
++	g_assert_null (soup_cookie_get_expires (cookie));
++	soup_cookie_free (cookie);
++}
++
+ int
+ main (int argc, char **argv)
+ {
+@@ -434,6 +443,7 @@ main (int argc, char **argv)
+ 	g_test_add_func ("/cookies/accept-policy-subdomains", do_cookies_subdomain_policy_test);
+ 	g_test_add_func ("/cookies/parsing", do_cookies_parsing_test);
+ 	g_test_add_func ("/cookies/parsing/no-path-null-origin", do_cookies_parsing_nopath_nullorigin);
++	g_test_add_func ("/cookies/parsing/int32-overflow", do_cookies_parsing_int32_overflow);
+ 	g_test_add_func ("/cookies/get-cookies/empty-host", do_get_cookies_empty_host_test);
+ 	g_test_add_func ("/cookies/remove-feature", do_remove_feature_test);
+ 	g_test_add_func ("/cookies/secure-cookies", do_cookies_strict_secure_test);
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
index 0da309ebd8..7e00cd678a 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -40,6 +40,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-4948.patch \
            file://CVE-2025-4476.patch \
            file://CVE-2025-2784.patch \
+           file://CVE-2025-4945.patch \
 "
 SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
 
-- 
2.34.1


