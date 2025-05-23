Return-Path: <praveen.kumar@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D42EBC3DA6D
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 06:36:57 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.42718.1747982208214498600
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 23:36:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7238169bb2=praveen.kumar@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54N5Mp5O017945
	for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 23:36:48 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46rwfrbh5p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 23:36:47 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 22 May 2025 23:36:28 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 22 May 2025 23:36:26 -0700
From: Praveen Kumar <praveen.kumar@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: Praveen Kumar <praveen.kumar@windriver.com>
Subject: [oe-core][kirkstone][PATCH 1/1] glib-2.0: fix CVE-2025-4373
Date: Fri, 23 May 2025 12:06:39 +0530
Message-ID: <20250523063639.3912866-1-praveen.kumar@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDA1OSBTYWx0ZWRfX8x7MRyNrMtXP 3WXb/vVVpCJQvg68lo+mxNYxOfBF6fK5ISnsd/ipENBP/Tv2iPABYD2miej0g7aa2O3s5fIOk/a 6A87vGpKx9Bx/2HgOjVFLTvMwZa0DGL5DiVvWSl0W9AMwyHwqXk0Lq3UgzY20Y0y8N9xQ87/QS0
 AYXUVfsBt/E+jsOYmZrR2N2faBmTCIkkLaAA8WKtAF4Wiz5FIAPBDgy2ddJRr2PKjoiaA0EeQHZ cpxioCAIRRU556AtDoaTe9CuxgDjrt53xFiOjw5tOdXZ7YUjisPNrS3SFgDuX3XbtYq6digvyxe WtO4waN3IzReMToC7K1i/kU+Ci/FLuwTBUT1Kgh9ag869OakJvfjL07dZxSougqVTNMaK35XrDW
 QUvjbFI/DnJtf9FE+7j2xkrSTtpfYdyREsB8gVo3zOigMFw5U1d17WPArGL9BA5wTcQMGY9T
X-Proofpoint-ORIG-GUID: eKdJ235sJTGp-b64X6tMCv-RgSI-od_A
X-Proofpoint-GUID: eKdJ235sJTGp-b64X6tMCv-RgSI-od_A
X-Authority-Analysis: v=2.4 cv=TrPmhCXh c=1 sm=1 tr=0 ts=6830177f cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=dt9VzEwgFbYA:10 a=PYnjg3YJAAAA:8 a=xNf9USuDAAAA:8 a=GHR8O2WEAAAA:20 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=pedpZTtsAAAA:8
 a=rNgwEY_66sRwW8iD-9gA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=EA_oED63Isst-uzJqiZM:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_02,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 malwarescore=0 impostorscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 suspectscore=0 clxscore=1015 spamscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505230059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 06:36:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217177

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
 meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb |   2 +
 3 files changed, 151 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-4373-01.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-4373-02.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-4373-01.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-4373-01.patch
new file mode 100644
index 0000000000..5b43850c53
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
+index 0a509e5..d6f8735 100644
+--- a/glib/gstring.c
++++ b/glib/gstring.c
+@@ -424,8 +424,9 @@ g_string_insert_len (GString     *string,
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
+@@ -723,10 +724,12 @@ g_string_insert_c (GString *string,
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
+@@ -759,6 +762,7 @@ g_string_insert_unichar (GString  *string,
+                          gssize    pos,
+                          gunichar  wc)
+ {
++  gsize pos_unsigned;
+   gint charlen, first, i;
+   gchar *dest;
+
+@@ -800,15 +804,18 @@ g_string_insert_unichar (GString  *string,
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
+@@ -866,6 +873,7 @@ g_string_overwrite_len (GString     *string,
+                         const gchar *val,
+                         gssize       len)
+ {
++  gssize len_unsigned;
+   gsize end;
+
+   g_return_val_if_fail (string != NULL, NULL);
+@@ -877,14 +885,16 @@ g_string_overwrite_len (GString     *string,
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
index 0000000000..d5a4d8dacd
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
+index d6f8735..d097e2f 100644
+--- a/glib/gstring.c
++++ b/glib/gstring.c
+@@ -873,7 +873,7 @@ g_string_overwrite_len (GString     *string,
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
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
index cebd84dd50..8d2c452088 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
@@ -60,6 +60,8 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://CVE-2025-3360-04.patch \
            file://CVE-2025-3360-05.patch \
            file://CVE-2025-3360-06.patch \
+           file://CVE-2025-4373-01.patch \
+           file://CVE-2025-4373-02.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch"
 
-- 
2.40.0


