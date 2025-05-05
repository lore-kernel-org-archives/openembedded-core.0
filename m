Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3638C3ABB6
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 11:47:26 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.48345.1746445638710655211
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 May 2025 04:47:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=722014930e=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545ASvI5008510
	for <openembedded-core@lists.openembedded.org>; Mon, 5 May 2025 04:47:18 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46djnjsca0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 05 May 2025 04:47:17 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 5 May 2025 04:47:17 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Mon, 5 May 2025 04:47:15 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][scarthgap][PATCH 1/1] elfutils: Fix CVE-2025-1371
Date: Mon, 5 May 2025 11:47:11 +0000
Message-ID: <20250505114711.862998-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDExMiBTYWx0ZWRfXwnXmxapRCV7Z AMUMCvQonzWa3VJQefNn8SexWA3vXFnqvmncScuH0+gl5zSK/qwV+xFwtBJtSZW1Jnv3ANhwcBL ZejzUpa55Bd6KHANnN8Q+TBhAADxElZJ02/kb3Wb6mLGX8YlnMTrenJTKd1XyrEBOfK8IZxqWmM
 fQNLJ1WD9b/ghnRePVDxzN1gLWKgSlNprOZWk0E/42yiayHHpnO/bftOfx9F/NBk3X6fclCwEx+ tQKm2nUXokx0ORE0SjxM4PGVNLSJwCLVSQqSXHrI74pRfHNdv2NEDb4UpYRQPd+ig4mNMV5CUXa 5JeqMaDR9y8t+pkrazDvFLrX63HIGRewoE7WQeI5MmvKXRawrRz1J0bdo94kP01W8SLzs4ASMvz
 NwrYpgjDwWBN0Il5RnDBPf+JyfZP8wfwK8zUyVm2jqAVmmEbqAH7edIF82F5Ehr3sq2JHwD7
X-Proofpoint-ORIG-GUID: -e9I3VtbBP4tX1eGoMqzSgX68y5y15qJ
X-Proofpoint-GUID: -e9I3VtbBP4tX1eGoMqzSgX68y5y15qJ
X-Authority-Analysis: v=2.4 cv=KdHSsRYD c=1 sm=1 tr=0 ts=6818a546 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=dt9VzEwgFbYA:10 a=PYnjg3YJAAAA:8 a=fxJcL_dCAAAA:8 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=n9Nvxce8AAAA:8
 a=cVSlY04uC90GVjj1GKEA:9 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22 a=V4tbcg9hxeXQX3VEsxKP:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_05,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 suspectscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2505050112
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 May 2025 11:47:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216007

From: Soumya Sambu <soumya.sambu@windriver.com>

A vulnerability has been found in GNU elfutils 0.192 and classified as problematic.
This vulnerability affects the function handle_dynamic_symtab of the file readelf.c
of the component eu-read. The manipulation leads to null pointer dereference.
Attacking locally is a requirement. The exploit has been disclosed to the public and
may be used. The patch is identified as b38e562a4c907e08171c76b8b2def8464d5a104a. It
is recommended to apply a patch to fix this issue.

References:
https://nvd.nist.gov/vuln/detail/CVE-2025-1371
https://ubuntu.com/security/CVE-2025-1371

Upstream patch:
https://sourceware.org/cgit/elfutils/commit/?id=b38e562a4c907e08171c76b8b2def8464d5a104a

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../elfutils/elfutils_0.191.bb                |  1 +
 .../elfutils/files/CVE-2025-1371.patch        | 41 +++++++++++++++++++
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-devtools/elfutils/files/CVE-2025-1371.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.191.bb b/meta/recipes-devtools/elfutils/elfutils_0.191.bb
index 85e024179b..bab3d94d12 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.191.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.191.bb
@@ -26,6 +26,7 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://CVE-2025-1352.patch \
            file://CVE-2025-1365.patch \
            file://CVE-2025-1372.patch \
+           file://CVE-2025-1371.patch \
            "
 SRC_URI:append:libc-musl = " \
            file://0003-musl-utils.patch \
diff --git a/meta/recipes-devtools/elfutils/files/CVE-2025-1371.patch b/meta/recipes-devtools/elfutils/files/CVE-2025-1371.patch
new file mode 100644
index 0000000000..ebb57bd4e5
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/CVE-2025-1371.patch
@@ -0,0 +1,41 @@
+From b38e562a4c907e08171c76b8b2def8464d5a104a Mon Sep 17 00:00:00 2001
+From: Mark Wielaard <mark@klomp.org>
+Date: Sun, 9 Feb 2025 00:07:13 +0100
+Subject: [PATCH] readelf: Handle NULL phdr in handle_dynamic_symtab
+
+A corrupt ELF file can have broken program headers, in which case
+gelf_getphdr returns NULL. This could crash handle_dynamic_symtab
+while searching for the PT_DYNAMIC phdr. Fix this by checking whether
+gelf_phdr returns NULL.
+
+          * src/readelf.c (handle_dynamic_symtab): Check whether
+          gelf_getphdr returns NULL.
+
+https://sourceware.org/bugzilla/show_bug.cgi?id=32655
+
+Signed-off-by: Mark Wielaard <mark@klomp.org>
+
+CVE: CVE-2025-1371
+
+Upstream-Status: Backport [https://sourceware.org/cgit/elfutils/commit/?id=b38e562a4c907e08171c76b8b2def8464d5a104a]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ src/readelf.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/readelf.c b/src/readelf.c
+index fc04556..13344bf 100644
+--- a/src/readelf.c
++++ b/src/readelf.c
+@@ -2912,7 +2912,7 @@ handle_dynamic_symtab (Ebl *ebl)
+   for (size_t i = 0; i < phnum; ++i)
+     {
+       phdr = gelf_getphdr (ebl->elf, i, &phdr_mem);
+-      if (phdr->p_type == PT_DYNAMIC)
++      if (phdr == NULL || phdr->p_type == PT_DYNAMIC)
+	break;
+     }
+   if (phdr == NULL)
+--
+2.40.0
-- 
2.40.0


