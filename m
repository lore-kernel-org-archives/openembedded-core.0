Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7C30C83F0F
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 08:16:02 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.13665.1751962561278430045
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Jul 2025 01:16:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9284fa5eea=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5685dsKw013258
	for <openembedded-core@lists.openembedded.org>; Tue, 8 Jul 2025 08:16:00 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47pu19jkfh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 08 Jul 2025 08:16:00 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Tue, 8 Jul 2025 01:15:44 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Tue, 8 Jul 2025 01:15:44 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATCH 2/2] libsoup: fix CVE-2025-4945
Date: Tue, 8 Jul 2025 16:15:56 +0800
Message-ID: <20250708081556.3561610-2-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250708081556.3561610-1-changqing.li@windriver.com>
References: <20250708081556.3561610-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: t5E826k9ke1VdVw7BfH5n13B4tzuJTHu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDA2NiBTYWx0ZWRfX7QKOcnjQZqLs LzvGsEtVonSN7gnO3vOO5RjhVq+JbuScq/Q69uLeZz/pS7JVoase3Jb4lrI4ZlAg8vBWg5tnvxT vmULJt6bt28TRN2sb3YlxxXvI0qH0S7hnLQpky5C3tG4l3lKBs/BWbA2zO2qrbvTMBnEI/CIhQp
 vPB+ry7i4H0akkM12uHrLbKscHz2eACks5Q30AbHpKjMnq6dY+7AEduBo1J1HG6+RQFIaN1CvfL 9QcbKvQFC9VfJmj64TehhVxbg+iBui3woKkQZv6d1jkJ1LJJAV3IOFY/ac4eXDxBj9Whae1qsbA AIawaICd+17xSLOYTKJ52om9Ui9aqXGmJ8pCHa3vKEAuQ9jUrV95h09XHtTcjDTcOxV5IpH3G87
 WOqw6Svg+6d3134qY0rI3dOJ0tkxvBrs1lvz8edON0sfa1z+Vv+IqlMxWldCjdfStK7Yri9F
X-Authority-Analysis: v=2.4 cv=ZrntK87G c=1 sm=1 tr=0 ts=686cd3c0 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=Wb1JkmetP80A:10 a=GHR8O2WEAAAA:20 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=OpW423ZGpPkB8jfHPfgA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: t5E826k9ke1VdVw7BfH5n13B4tzuJTHu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_02,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 mlxlogscore=999 clxscore=1015 phishscore=0 suspectscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507080066
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Jul 2025 08:16:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220017

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/448

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../libsoup/libsoup-3.4.4/CVE-2025-4945.patch | 118 ++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.4.4.bb |   1 +
 2 files changed, 119 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-4945.patch

diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-4945.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-4945.patch
new file mode 100644
index 0000000000..cf34dcd231
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-4945.patch
@@ -0,0 +1,118 @@
+From f168bc7d6dbf04915cd7bf6bfe962bd23f63ec3b Mon Sep 17 00:00:00 2001
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
+index fd785f5..34ca995 100644
+--- a/libsoup/soup-date-utils.c
++++ b/libsoup/soup-date-utils.c
+@@ -129,7 +129,7 @@ parse_day (int *day, const char **date_string)
+ 	while (*end == ' ' || *end == '-')
+ 		end++;
+ 	*date_string = end;
+-	return TRUE;
++	return *day >= 1 && *day <= 31;
+ }
+ 
+ static inline gboolean
+@@ -169,7 +169,7 @@ parse_year (int *year, const char **date_string)
+ 	while (*end == ' ' || *end == '-')
+ 		end++;
+ 	*date_string = end;
+-	return TRUE;
++	return *year > 0 && *year < 9999;
+ }
+ 
+ static inline gboolean
+@@ -193,7 +193,7 @@ parse_time (int *hour, int *minute, int *second, const char **date_string)
+ 	while (*p == ' ')
+ 		p++;
+ 	*date_string = p;
+-	return TRUE;
++	return *hour >= 0 && *hour < 24 && *minute >= 0 && *minute < 60 && *second >= 0 && *second < 60;
+ }
+ 
+ static inline gboolean
+@@ -209,9 +209,14 @@ parse_timezone (GTimeZone **timezone, const char **date_string)
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
+@@ -264,7 +269,8 @@ parse_textual_date (const char *date_string)
+ 		if (!parse_month (&month, &date_string) ||
+ 		    !parse_day (&day, &date_string) ||
+ 		    !parse_time (&hour, &minute, &second, &date_string) ||
+-		    !parse_year (&year, &date_string))
++		    !parse_year (&year, &date_string) ||
++		    !g_date_valid_dmy (day, month, year))
+ 			return NULL;
+ 
+ 		/* There shouldn't be a timezone, but check anyway */
+@@ -276,7 +282,8 @@ parse_textual_date (const char *date_string)
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
+index cafa26e..ccf7a4c 100644
+--- a/tests/cookies-test.c
++++ b/tests/cookies-test.c
+@@ -434,6 +434,15 @@ do_cookies_parsing_nopath_nullorigin (void)
+ 	soup_cookie_free (cookie);
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
+ static void
+ do_cookies_equal_nullpath (void)
+ {
+@@ -655,6 +664,7 @@ main (int argc, char **argv)
+ 	g_test_add_func ("/cookies/accept-policy-subdomains", do_cookies_subdomain_policy_test);
+ 	g_test_add_func ("/cookies/parsing", do_cookies_parsing_test);
+ 	g_test_add_func ("/cookies/parsing/no-path-null-origin", do_cookies_parsing_nopath_nullorigin);
++	g_test_add_func ("/cookies/parsing/int32-overflow", do_cookies_parsing_int32_overflow);
+ 	g_test_add_func ("/cookies/parsing/equal-nullpath", do_cookies_equal_nullpath);
+ 	g_test_add_func ("/cookies/parsing/control-characters", do_cookies_parsing_control_characters);
+ 	g_test_add_func ("/cookies/get-cookies/empty-host", do_get_cookies_empty_host_test);
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup_3.4.4.bb b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
index 37319f007f..f64d0d6745 100644
--- a/meta/recipes-support/libsoup/libsoup_3.4.4.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
@@ -44,6 +44,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-46421.patch \
            file://CVE-2025-4948.patch \
            file://CVE-2025-2784.patch \
+           file://CVE-2025-4945.patch \
 "
 SRC_URI[sha256sum] = "291c67725f36ed90ea43efff25064b69c5a2d1981488477c05c481a3b4b0c5aa"
 
-- 
2.34.1


