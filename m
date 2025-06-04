Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EA0CC61CE8
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 11:34:42 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.14435.1749036878344385307
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 04:34:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8250671ff5=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55448x9v006347
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Jun 2025 04:34:37 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9rtevb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 04:34:37 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 4 Jun 2025 04:34:37 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 4 Jun 2025 04:34:36 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATCH V2 08/14] libsoup-2.4: fix CVE-2025-4948
Date: Wed, 4 Jun 2025 19:34:20 +0800
Message-ID: <20250604113426.464818-9-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250604113426.464818-1-changqing.li@windriver.com>
References: <20250604113426.464818-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDA4OCBTYWx0ZWRfXx3sv+XoOiEVy NDQkTHL1VdxBO1Vnrv/zQt/oGA8EMHJHaIbjrcaRwArt+Q/g+iCvbXPgF4V3tELHLXtf6KFD31M e9OnYk/cXGOfh04sA035bPzHTLp766SCcet2bBDC+cZPJbv3iRVBoXGHq7B91LOLlzpYBy6z4+e
 gLSpdTYY/z/O0lkPvVWHyRSr5LbPIc/cR1WBk0eoCeYCIUEvk03N6DKCf3E5KGv0ehDFhLdpw+7 f/ZTGEtscPEbI0JljEInR8cLnof8W5aRhiu6NH9EUwdvl3pPmNwTRoFlfJKTyxeDAaLKV5fM3fq SvNLzBVyxLjG2wVVNx7IAn7QP+oEDgxfwfjPtCyzLE0W10qE8xXDyH0c5QzPEoy54uTRj1hNDRp
 AyK+txobpMjYMLgWqL6Tecn5gtoX47zJSGVrtjmKi8ceDllwNq1Y7bkYXJznmGUPNRUIpMj2
X-Authority-Analysis: v=2.4 cv=PvyTbxM3 c=1 sm=1 tr=0 ts=68402f4d cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=6IFa9wvqVegA:10 a=GHR8O2WEAAAA:20 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=_9wbE66-DFzY0cZEwEkA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: RtK3t5C4ECb-AdVyIMJ6L3Ns4Wuh5DMe
X-Proofpoint-ORIG-GUID: RtK3t5C4ECb-AdVyIMJ6L3Ns4Wuh5DMe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_03,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 bulkscore=0 adultscore=0 mlxscore=0 mlxlogscore=730 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506040088
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 11:34:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217934

From: Changqing Li <changqing.li@windriver.com>

Refer:
http://gitlab.gnome.org/GNOME/libsoup/-/issues/449

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../libsoup/libsoup-2.4/CVE-2025-4948.patch   | 38 +++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4948.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4948.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4948.patch
new file mode 100644
index 0000000000..b15b8c763d
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4948.patch
@@ -0,0 +1,38 @@
+From dfdc9b3cc73e6fe88cc12792ba00e14642572339 Mon Sep 17 00:00:00 2001
+From: Milan Crha <mcrha@redhat.com>
+Date: Thu, 15 May 2025 17:49:11 +0200
+Subject: [PATCH] soup-multipart: Verify boundary limits for multipart body
+
+It could happen that the boundary started at a place which resulted into
+a negative number, which in an unsigned integer is a very large value.
+Check the body size is not a negative value before setting it.
+
+Closes https://gitlab.gnome.org/GNOME/libsoup/-/issues/449
+
+Part-of: <https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/463>
+
+CVE: CVE-2025-4948
+Upstream-Status: Backport
+[https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/463/diffs?commit_id=f2f28afe0b3b2b3009ab67d6874457ec6bac70c0]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-multipart.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libsoup/soup-multipart.c b/libsoup/soup-multipart.c
+index dd93973..ce2fc10 100644
+--- a/libsoup/soup-multipart.c
++++ b/libsoup/soup-multipart.c
+@@ -214,7 +214,7 @@ soup_multipart_new_from_message (SoupMessageHeaders *headers,
+ 		 */
+ 		part_body = soup_buffer_new_subbuffer (flattened,
+ 						       split - flattened->data,
+-						       end - 2 - split);
++						       end - 2 >= split ? end - 2 - split : 0);
+ 		g_ptr_array_add (multipart->bodies, part_body);
+ 
+ 		start = end;
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
index d37b553a92..1c7b13001e 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -36,6 +36,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32052.patch \
            file://CVE-2025-32050.patch \
            file://CVE-2025-46421.patch \
+           file://CVE-2025-4948.patch \
 "
 SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
 
-- 
2.34.1


