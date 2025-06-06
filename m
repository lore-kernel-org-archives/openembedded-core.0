Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8315EC5B549
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 06:50:38 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.27997.1749192632947683525
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 23:50:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8252d755fa=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5565umRa017749
	for <openembedded-core@lists.openembedded.org>; Thu, 5 Jun 2025 23:50:32 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9rw0fg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 23:50:32 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 5 Jun 2025 23:50:16 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 5 Jun 2025 23:50:15 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATCH V3 11/12] libsoup-2.4: fix CVE-2025-2784
Date: Fri, 6 Jun 2025 14:50:02 +0800
Message-ID: <20250606065003.3681416-12-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250606065003.3681416-1-changqing.li@windriver.com>
References: <20250606065003.3681416-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: r6fHY4htTkQxxJtdEvqxELXsj-QlWRpi
X-Authority-Analysis: v=2.4 cv=VIHdn8PX c=1 sm=1 tr=0 ts=68428fb8 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=6IFa9wvqVegA:10 a=GHR8O2WEAAAA:20 a=t7CeM3EgAAAA:8 a=9ZAmBD_aSAHDPC3Ooc0A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDA2MiBTYWx0ZWRfX3DCdcTF+CESk 4fEx4bS/hxhHOZgpVtrvAX404gMmlN1Yg7D4RDoCIRATF7KqF8U/Ob3EbnzaHeUpIZSAt3vBOkJ tcFdIWyMSaqqL4+365D3EfWo9KYmk1uPxLhn7EEyhmlROOO8Wqcrea1+iHf2IKPusNDskePh+on
 QjIdS4w4hVY9yo07bHuY1fKahSzUdhZrpjkcaM+MahMG/GJJJBnfbyrL68e8pWiyCwSWtVqlWgj f5m+tiN/MsEXqrHiepatP76jrwXhLn2tNzQkxp4QFlOdPlbrEpLTNUYHXd7t98Nd94mmeO+55/D IBhINIzyEoJu9EZALidpvya06BPhZg3lpp3aSRCjOEHbHRFXvt00w/Lbg2z39vMjWFPXM3Bdsm7
 jQQ0LoCWJpKTwDREC7Bb7ZVW2LerMbmK6Gojz5XcIiVY2Az86denfy5+LqRpe9+0H4YHsohC
X-Proofpoint-ORIG-GUID: r6fHY4htTkQxxJtdEvqxELXsj-QlWRpi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_01,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=777
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506060062
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 06:50:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218110

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/422

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../libsoup/libsoup-2.4/CVE-2025-2784.patch   | 56 +++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-2784.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-2784.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-2784.patch
new file mode 100644
index 00000000000..106f9071683
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-2784.patch
@@ -0,0 +1,56 @@
+From 2eacbd762332795e00692ddab2515c6da23198d3 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Mon, 12 May 2025 14:06:41 +0800
+Subject: [PATCH] sniffer: Add better coverage of skip_insignificant_space()
+
+CVE: CVE-2025-2784
+Upstream-Status: Backport
+[https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/435/diffs?commit_id=242a10fbb12dbdc12d254bd8fc8669a0ac055304;
+ https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/442/diffs?commit_id=c415ad0b6771992e66c70edf373566c6e247089d]
+
+Test code is not added since it uses some functions not defined in
+version 2.74. These tests are not used now, so just ignore them.
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-content-sniffer.c |  9 +++----
+ 1 files changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/libsoup/soup-content-sniffer.c b/libsoup/soup-content-sniffer.c
+index 5f2896e..9554636 100644
+--- a/libsoup/soup-content-sniffer.c
++++ b/libsoup/soup-content-sniffer.c
+@@ -612,8 +612,10 @@ sniff_text_or_binary (SoupContentSniffer *sniffer, SoupBuffer *buffer)
+ }
+ 
+ static gboolean
+-skip_insignificant_space (const char *resource, int *pos, int resource_length)
++skip_insignificant_space (const char *resource, gsize *pos, gsize resource_length)
+ {
++	if (*pos >= resource_length)
++		return TRUE;
+ 	while ((resource[*pos] == '\x09') ||
+ 	       (resource[*pos] == '\x20') ||
+ 	       (resource[*pos] == '\x0A') ||
+@@ -632,7 +634,7 @@ sniff_feed_or_html (SoupContentSniffer *sniffer, SoupBuffer *buffer)
+ {
+ 	const char *resource = (const char *)buffer->data;
+ 	int resource_length = MIN (512, buffer->length);
+-	int pos = 0;
++	gsize pos = 0;
+ 
+ 	if (resource_length < 3)
+ 		goto text_html;
+@@ -642,9 +644,6 @@ sniff_feed_or_html (SoupContentSniffer *sniffer, SoupBuffer *buffer)
+ 		pos = 3;
+ 
+  look_for_tag:
+-	if (pos > resource_length)
+-		goto text_html;
+-
+ 	if (skip_insignificant_space (resource, &pos, resource_length))
+ 		goto text_html;
+
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
index 8f0b7062762..0da309ebd8a 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -39,6 +39,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-46421.patch \
            file://CVE-2025-4948.patch \
            file://CVE-2025-4476.patch \
+           file://CVE-2025-2784.patch \
 "
 SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
 
-- 
2.34.1


