Return-Path: <praveen.kumar@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07863C3ABD8
	for <webhook@archiver.kernel.org>; Fri, 16 May 2025 11:44:35 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.11008.1747395873439653497
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 May 2025 04:44:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7231654f5a=praveen.kumar@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GB83N2024643
	for <openembedded-core@lists.openembedded.org>; Fri, 16 May 2025 11:44:32 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46mbc8v3rp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 16 May 2025 11:44:32 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 16 May 2025 04:44:25 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Fri, 16 May 2025 04:44:23 -0700
From: Praveen Kumar <praveen.kumar@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: Praveen Kumar <praveen.kumar@windriver.com>
Subject: [oe-core][scarthgap][PATCH 1/1] glib-2.0 : fix CVE-2025-4373
Date: Fri, 16 May 2025 17:14:21 +0530
Message-ID: <20250516114421.3941135-1-praveen.kumar@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: NmZZalEgt7SgqsKsTVavfcD3HA-86fB7
X-Proofpoint-ORIG-GUID: NmZZalEgt7SgqsKsTVavfcD3HA-86fB7
X-Authority-Analysis: v=2.4 cv=IIACChvG c=1 sm=1 tr=0 ts=68272520 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=dt9VzEwgFbYA:10 a=PYnjg3YJAAAA:8 a=xNf9USuDAAAA:8 a=GHR8O2WEAAAA:20 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=pedpZTtsAAAA:8
 a=iP4e_i8taq-sWq2_hYYA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=EA_oED63Isst-uzJqiZM:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDExMSBTYWx0ZWRfXwwpO7GKa+Y2k KwP91nR0yCYLu7U6pT4fU/n4WXfxETWvOa+5StPdKQVsEtQp010euAi3P94EMYypyJBddDEjBBG /WzwEbhOHKm97JEQjjHhqUyrytXdHrq1/MNtWUDBlDY+K6RXGJtFjQ9VlKvuE8xH3dOatDLwuX4
 68tl19bOk6iW5YVGo86vqXnyHwheD0k9EEUSUYeQqKld/8igSIjGAabX8a4dfpVM1rH3a8kuSDG W07kjOAnMi2kyK3sS0pktHU2EyI4SDl64ZE78Q87EVHzLXY68GbgyUV06sGbMH0+jhXBHDmklZE K+oD5rA31jO6Mb3KuJuF59ep1jEFbhKT/mcmJyeXcuREhvn0SS8FksnfBIW+LVIxBujtoOvk+zj
 sUvvFm0MMohh2RBI3hD3vgvOxV1PZoCDvsQwOrV19ZA0W6VrdGZviEZ+w+/08NK+Jn0LhigM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_05,2025-05-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 mlxscore=0 suspectscore=0 malwarescore=0 phishscore=0
 bulkscore=0 impostorscore=0 mlxlogscore=999 priorityscore=1501
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505070000
 definitions=main-2505160111
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 May 2025 11:44:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216748

A flaw was found in GLib, which is vulnerable to an integer overflow
in the g_string_insert_unichar() function. When the position at which
to insert the character is large, the position will overflow, leading
to a buffer underwrite.

References:
https://nvd.nist.gov/vuln/detail/CVE-2025-4373
https://security-tracker.debian.org/tracker/CVE-2025-4373

Upstream-patches:
https://gitlab.gnome.org/GNOME/glib/-/commit/cc647f9e46d55509a93498af19659baf9c80f2e3
https://gitlab.gnome.org/GNOME/glib/-/commit/4d435bb4809793c445846db8fb87e3c9184c4703

Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
---
 .../glib-2.0/glib-2.0/CVE-2025-4373-01.patch  | 120 ++++++++++++++++++
 .../glib-2.0/glib-2.0/CVE-2025-4373-02.patch  |  29 +++++
 meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb |   2 +
 3 files changed, 151 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-4373-01.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-4373-02.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-4373-01.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-4373-01.patch
new file mode 100644
index 0000000000..f99c4de7e1
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-4373-01.patch
@@ -0,0 +1,120 @@
+From cc647f9e46d55509a93498af19659baf9c80f2e3 Mon Sep 17 00:00:00 2001
+From: Michael Catanzaro <mcatanzaro@redhat.com>
+Date: Thu, 10 Apr 2025 10:57:20 -0500
+Subject: [PATCH 1/2] gstring: carefully handle gssize parameters
+
+Wherever we use gssize to allow passing -1, we need to ensure we don't
+overflow the value by assigning a gsize to it without checking if the
+size exceeds the maximum gssize. The safest way to do this is to just
+use normal gsize everywhere instead and use gssize only for the
+parameter.
+
+Our computers don't have enough RAM to write tests for this. I tried
+forcing string->len to high values for test purposes, but this isn't
+valid and will just cause out of bounds reads/writes due to
+string->allocated_len being unexpectedly small, so I don't think we can
+test this easily.
+
+CVE: CVE-2025-4373
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/cc647f9e46d55509a93498af19659baf9c80f2e3]
+
+Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
+---
+ glib/gstring.c | 36 +++++++++++++++++++++++-------------
+ 1 file changed, 23 insertions(+), 13 deletions(-)
+
+diff --git a/glib/gstring.c b/glib/gstring.c
+index 9f04144..d016b65 100644
+--- a/glib/gstring.c
++++ b/glib/gstring.c
+@@ -490,8 +490,9 @@ g_string_insert_len (GString     *string,
+     return string;
+
+   if (len < 0)
+-    len = strlen (val);
+-  len_unsigned = len;
++    len_unsigned = strlen (val);
++  else
++    len_unsigned = len;
+
+   if (pos < 0)
+     pos_unsigned = string->len;
+@@ -788,10 +789,12 @@ g_string_insert_c (GString *string,
+   g_string_maybe_expand (string, 1);
+
+   if (pos < 0)
+-    pos = string->len;
++    pos_unsigned = string->len;
+   else
+-    g_return_val_if_fail ((gsize) pos <= string->len, string);
+-  pos_unsigned = pos;
++    {
++      pos_unsigned = pos;
++      g_return_val_if_fail (pos_unsigned <= string->len, string);
++    }
+
+   /* If not just an append, move the old stuff */
+   if (pos_unsigned < string->len)
+@@ -824,6 +827,7 @@ g_string_insert_unichar (GString  *string,
+                          gssize    pos,
+                          gunichar  wc)
+ {
++  gsize pos_unsigned;
+   gint charlen, first, i;
+   gchar *dest;
+
+@@ -865,15 +869,18 @@ g_string_insert_unichar (GString  *string,
+   g_string_maybe_expand (string, charlen);
+
+   if (pos < 0)
+-    pos = string->len;
++    pos_unsigned = string->len;
+   else
+-    g_return_val_if_fail ((gsize) pos <= string->len, string);
++    {
++      pos_unsigned = pos;
++      g_return_val_if_fail (pos_unsigned <= string->len, string);
++    }
+
+   /* If not just an append, move the old stuff */
+-  if ((gsize) pos < string->len)
+-    memmove (string->str + pos + charlen, string->str + pos, string->len - pos);
++  if (pos_unsigned < string->len)
++    memmove (string->str + pos_unsigned + charlen, string->str + pos_unsigned, string->len - pos_unsigned);
+
+-  dest = string->str + pos;
++  dest = string->str + pos_unsigned;
+   /* Code copied from g_unichar_to_utf() */
+   for (i = charlen - 1; i > 0; --i)
+     {
+@@ -931,6 +938,7 @@ g_string_overwrite_len (GString     *string,
+                         const gchar *val,
+                         gssize       len)
+ {
++  gssize len_unsigned;
+   gsize end;
+
+   g_return_val_if_fail (string != NULL, NULL);
+@@ -942,14 +950,16 @@ g_string_overwrite_len (GString     *string,
+   g_return_val_if_fail (pos <= string->len, string);
+
+   if (len < 0)
+-    len = strlen (val);
++    len_unsigned = strlen (val);
++  else
++    len_unsigned = len;
+
+-  end = pos + len;
++  end = pos + len_unsigned;
+
+   if (end > string->len)
+     g_string_maybe_expand (string, end - string->len);
+
+-  memcpy (string->str + pos, val, len);
++  memcpy (string->str + pos, val, len_unsigned);
+
+   if (end > string->len)
+     {
+--
+2.40.0
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-4373-02.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-4373-02.patch
new file mode 100644
index 0000000000..ea586c90dc
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-4373-02.patch
@@ -0,0 +1,29 @@
+From 4d435bb4809793c445846db8fb87e3c9184c4703 Mon Sep 17 00:00:00 2001
+From: Peter Bloomfield <peterbloomfield@bellsouth.net>
+Date: Fri, 11 Apr 2025 05:52:33 +0000
+Subject: [PATCH 2/2] gstring: Make len_unsigned unsigned
+
+CVE: CVE-2025-4373
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/4d435bb4809793c445846db8fb87e3c9184c4703]
+
+Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
+---
+ glib/gstring.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/glib/gstring.c b/glib/gstring.c
+index d016b65..d9ad0c3 100644
+--- a/glib/gstring.c
++++ b/glib/gstring.c
+@@ -938,7 +938,7 @@ g_string_overwrite_len (GString     *string,
+                         const gchar *val,
+                         gssize       len)
+ {
+-  gssize len_unsigned;
++  gsize len_unsigned;
+   gsize end;
+
+   g_return_val_if_fail (string != NULL, NULL);
+--
+2.40.0
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
index 1a65f48399..e1a3b57270 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
@@ -27,6 +27,8 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://CVE-2025-3360-04.patch \
            file://CVE-2025-3360-05.patch \
            file://CVE-2025-3360-06.patch \
+           file://CVE-2025-4373-01.patch \
+           file://CVE-2025-4373-02.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
-- 
2.40.0


