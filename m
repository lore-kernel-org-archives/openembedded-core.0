Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D671C83F12
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 08:31:22 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.13849.1751963477119179000
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Jul 2025 01:31:17 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9284fa5eea=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5684b6Zl004706
	for <openembedded-core@lists.openembedded.org>; Tue, 8 Jul 2025 08:31:16 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47ps91tnxh-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 08 Jul 2025 08:31:16 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Tue, 8 Jul 2025 01:31:01 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Tue, 8 Jul 2025 01:31:00 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [kirkstone][PATCH 2/2] libsoup: fix CVE-2025-4945
Date: Tue, 8 Jul 2025 16:31:13 +0800
Message-ID: <20250708083113.2142107-2-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250708083113.2142107-1-changqing.li@windriver.com>
References: <20250708083113.2142107-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=PLcP+eqC c=1 sm=1 tr=0 ts=686cd754 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=Wb1JkmetP80A:10 a=GHR8O2WEAAAA:20 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=OpW423ZGpPkB8jfHPfgA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: KIzQYjt4tSJnX4eQ1xeesO-rMujihcTQ
X-Proofpoint-ORIG-GUID: KIzQYjt4tSJnX4eQ1xeesO-rMujihcTQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDA2OCBTYWx0ZWRfX9lBVqke+TPCZ 0S+l9mVU8OWR1p3Kqvj04O34SVRb55ncRRgYGmgQ2WrmRu0PTFD6F3K1svsANrycthHNp16Cgmk V8E0hOVIFDK2Y8/xgqeN7jFhLUZyF5koeB7yfFMVmHkDxxoNPjjF5CqptqrRkQB8RpX3AUrfIRu
 nLteHb3JZP+yiB1eIb38Bw/D9e/S0r1Y9e33msEYQ2t48LBOAg1AjClps4+a/3taVdMJCAIWkd0 rwM8MM2aQvcxHTS9+J2ODbbegnXN3xB+U/WAT9SPt7Q8ArkJjGw7krLImnAhTAH1BAg90aXr43L ZKW/Awf06YbUjTAEVSrQEZwy2Bqc6chtCeimbIAD6bEPwXdHuUad+TcT++I7XBWIx0xxU64oGYp
 q0BsDm6RRIdnuhPK+LURr8TdIrgqw4Vz0lKzIh3WkKQZslGiSnZws/y8jRhpWu0tkbrUkHGS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_02,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 impostorscore=0 phishscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 adultscore=0 mlxlogscore=972 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507080068
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Jul 2025 08:31:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220019

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/448

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../libsoup/libsoup/CVE-2025-4945.patch       | 118 ++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.0.7.bb |   1 +
 2 files changed, 119 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-4945.patch

diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2025-4945.patch b/meta/recipes-support/libsoup/libsoup/CVE-2025-4945.patch
new file mode 100644
index 0000000000..cb6640a6c6
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup/CVE-2025-4945.patch
@@ -0,0 +1,118 @@
+From ee76a57af0e9fe1e43d3ab5a146a3da233573819 Mon Sep 17 00:00:00 2001
+From: Milan Crha <mcrha@redhat.com>
+Date: Thu, 15 May 2025 07:59:14 +0200
+Subject: [PATCH] soup-date-utils: Add value checks for date/time parsing
+
+Reject date/time when it does not represent a valid value.
+
+Closes https://gitlab.gnome.org/GNOME/libsoup/-/issues/448
+
+CVE: CVE-2025-4945
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/8988379984e33dcc7d3aa58551db13e48755959f]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-date-utils.c | 23 +++++++++++++++--------
+ tests/cookies-test.c      | 10 ++++++++++
+ 2 files changed, 25 insertions(+), 8 deletions(-)
+
+diff --git a/libsoup/soup-date-utils.c b/libsoup/soup-date-utils.c
+index 061057e..43616d6 100644
+--- a/libsoup/soup-date-utils.c
++++ b/libsoup/soup-date-utils.c
+@@ -138,7 +138,7 @@ parse_day (int *day, const char **date_string)
+ 	while (*end == ' ' || *end == '-')
+ 		end++;
+ 	*date_string = end;
+-	return TRUE;
++	return *day >= 1 && *day <= 31;
+ }
+ 
+ static inline gboolean
+@@ -178,7 +178,7 @@ parse_year (int *year, const char **date_string)
+ 	while (*end == ' ' || *end == '-')
+ 		end++;
+ 	*date_string = end;
+-	return TRUE;
++	return *year > 0 && *year < 9999;
+ }
+ 
+ static inline gboolean
+@@ -202,7 +202,7 @@ parse_time (int *hour, int *minute, int *second, const char **date_string)
+ 	while (*p == ' ')
+ 		p++;
+ 	*date_string = p;
+-	return TRUE;
++	return *hour >= 0 && *hour < 24 && *minute >= 0 && *minute < 60 && *second >= 0 && *second < 60;
+ }
+ 
+ static inline gboolean
+@@ -218,9 +218,14 @@ parse_timezone (GTimeZone **timezone, const char **date_string)
+ 		gulong val;
+ 		int sign = (**date_string == '+') ? 1 : -1;
+ 		val = strtoul (*date_string + 1, (char **)date_string, 10);
+-		if (**date_string == ':')
+-			val = 60 * val + strtoul (*date_string + 1, (char **)date_string, 10);
+-		else
++		if (val > 9999)
++			return FALSE;
++		if (**date_string == ':') {
++			gulong val2 = strtoul (*date_string + 1, (char **)date_string, 10);
++			if (val > 99 || val2 > 99)
++				return FALSE;
++			val = 60 * val + val2;
++		} else
+ 			val =  60 * (val / 100) + (val % 100);
+ 		offset_minutes = sign * val;
+                 utc = (sign == -1) && !val;
+@@ -273,7 +278,8 @@ parse_textual_date (const char *date_string)
+ 		if (!parse_month (&month, &date_string) ||
+ 		    !parse_day (&day, &date_string) ||
+ 		    !parse_time (&hour, &minute, &second, &date_string) ||
+-		    !parse_year (&year, &date_string))
++		    !parse_year (&year, &date_string) ||
++		    !g_date_valid_dmy (day, month, year))
+ 			return NULL;
+ 
+ 		/* There shouldn't be a timezone, but check anyway */
+@@ -285,7 +291,8 @@ parse_textual_date (const char *date_string)
+ 		if (!parse_day (&day, &date_string) ||
+ 		    !parse_month (&month, &date_string) ||
+ 		    !parse_year (&year, &date_string) ||
+-		    !parse_time (&hour, &minute, &second, &date_string))
++		    !parse_time (&hour, &minute, &second, &date_string) ||
++		    !g_date_valid_dmy (day, month, year))
+ 			return NULL;
+ 
+ 		/* This time there *should* be a timezone, but we
+diff --git a/tests/cookies-test.c b/tests/cookies-test.c
+index 1c04534..6ba4458 100644
+--- a/tests/cookies-test.c
++++ b/tests/cookies-test.c
+@@ -419,6 +419,15 @@ do_remove_feature_test (void)
+ 	g_uri_unref (uri);
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
+@@ -440,6 +449,7 @@ main (int argc, char **argv)
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
diff --git a/meta/recipes-support/libsoup/libsoup_3.0.7.bb b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
index 3ddcb3e568..af8554aa78 100644
--- a/meta/recipes-support/libsoup/libsoup_3.0.7.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
@@ -44,6 +44,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32051-2.patch \
            file://CVE-2025-46421.patch \
            file://CVE-2025-4948.patch \
+           file://CVE-2025-4945.patch \
           "
 SRC_URI[sha256sum] = "ebdf90cf3599c11acbb6818a9d9e3fc9d2c68e56eb829b93962972683e1bf7c8"
 
-- 
2.34.1


