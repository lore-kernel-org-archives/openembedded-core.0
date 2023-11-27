Return-Path: <li.wang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 300B2C0755A
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 06:57:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.87676.1701068254526021818
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Nov 2023 22:57:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=GYzCiJrm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=969515cd65=li.wang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3AR6j2O3001096;
	Mon, 27 Nov 2023 06:57:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=lhuHX
	BW638IThDNl7UWFQJlZO7M17qzd/nYfbQ98BR8=; b=GYzCiJrmmUYUnZHlgMFPF
	57x5cTlN33Sy40k7ihPhoB9ws5vV4FNbyXDndpLshfDAQRTtZD+6vjar8aKN11st
	qktSSNEfZmg9Cshvsz6WjDXO8Ry6qXLOGykXWXUruxf4iDnVp2LoobNypLn2EgVq
	UBoLAtKelDjbjTloDArzJoSniWh5v+10qqkjA6tS0LRVVrkGAl1XXB7Z7LrO6tve
	bbNdyCVpxozCDzYl35oBpz/pI83HdQrZntX8vvOw+MwjaHgfmmQthCbX0TIhiQhG
	S1U+vJQkwYRR01uXZIhGnvaxnpzWNI4UT37sqKbn0pML+qwsXis7oZ/jWDZMcjl9
	w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uk7w6hbeg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 27 Nov 2023 06:57:33 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 26 Nov 2023 22:57:39 -0800
Received: from pek-lwang1-d1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.34 via Frontend Transport; Sun, 26 Nov 2023 22:57:38 -0800
From: Li Wang <li.wang@windriver.com>
To: <steve@sakoman.com>
CC: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][Kirkstone][PATCH] systemtap_git: fix used uninitialized error
Date: Mon, 27 Nov 2023 14:54:47 +0800
Message-ID: <20231127065447.3889632-1-li.wang@windriver.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: jBzK5bnu0c8s_Dx7bw1f2eph4v7y7rKf
X-Proofpoint-ORIG-GUID: jBzK5bnu0c8s_Dx7bw1f2eph4v7y7rKf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1011 spamscore=0 suspectscore=0 bulkscore=0 mlxscore=0
 adultscore=0 phishscore=0 malwarescore=0 impostorscore=0 mlxlogscore=988
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2311270047
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 06:57:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191257

bpf-translate.cxx: error: 'this_column_size' may be used uninitialized in this function [-Werror=maybe-uninitialized]
bpf-translate.cxx: error: 'num' may be used uninitialized in this function [-Werror=maybe-uninitialized]

Signed-off-by: Li Wang <li.wang@windriver.com>
---
 ...x-Prevent-Werror-maybe-uninitialized.patch | 53 +++++++++++++++++++
 .../recipes-kernel/systemtap/systemtap_git.bb |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-bpf-translate.cxx-Prevent-Werror-maybe-uninitialized.patch

diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-bpf-translate.cxx-Prevent-Werror-maybe-uninitialized.patch b/meta/recipes-kernel/systemtap/systemtap/0001-bpf-translate.cxx-Prevent-Werror-maybe-uninitialized.patch
new file mode 100644
index 0000000000..130eefab5d
--- /dev/null
+++ b/meta/recipes-kernel/systemtap/systemtap/0001-bpf-translate.cxx-Prevent-Werror-maybe-uninitialized.patch
@@ -0,0 +1,53 @@
+From df3425f51a512f65522522daf1f78c7fab0a63fd Mon Sep 17 00:00:00 2001
+From: Aaron Merey <amerey@redhat.com>
+Date: Fri, 25 Feb 2022 19:18:29 -0500
+Subject: [PATCH] bpf-translate.cxx: Prevent -Werror=maybe-uninitialized
+
+Two variables in bpf-translate.cxx can trigger -Werror=maybe-uninitialized.
+The code is designed so that uninitialized uses are not actually possible,
+but to convince gcc of this we move a throw statement and initialize one
+of the variables with a value.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=systemtap.git;a=commit;h=df3425f51a512f65522522daf1f78c7fab0a63fd]
+
+Signed-off-by: Li Wang <li.wang@windriver.com>
+---
+ bpf-translate.cxx | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/bpf-translate.cxx b/bpf-translate.cxx
+index 3f45c721f..1b63d6078 100644
+--- a/bpf-translate.cxx
++++ b/bpf-translate.cxx
+@@ -1203,7 +1203,7 @@ bpf_unparser::emit_asm_arg (const asm_stmt &stmt, const std::string &arg,
+     {
+       /* arg is a register number */
+       std::string reg = arg[0] == 'r' ? arg.substr(1) : arg;
+-      unsigned long num;
++      unsigned long num = ULONG_MAX;
+       bool parsed = false;
+       try {
+         num = stoul(reg, 0, 0);
+@@ -1941,8 +1941,6 @@ bpf_unparser::visit_foreach_loop(foreach_loop* s)
+   for (unsigned k = 0; k < arraydecl->index_types.size(); k++)
+     {
+       auto type = arraydecl->index_types[k];
+-      if (type != pe_long && type != pe_string)
+-        throw SEMANTIC_ERROR(_("unhandled foreach index type"), s->tok);
+       int this_column_size;
+       // PR23875: foreach should handle string keys
+       if (type == pe_long)
+@@ -1953,6 +1951,10 @@ bpf_unparser::visit_foreach_loop(foreach_loop* s)
+         {
+           this_column_size = BPF_MAXSTRINGLEN;
+         }
++      else
++        {
++          throw SEMANTIC_ERROR(_("unhandled foreach index type"), s->tok);
++        }
+       if (info.sort_column == k + 1) // record sort column
+         {
+           info.sort_column_size = this_column_size;
+-- 
+2.25.1
+
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index ce86d5274d..c84fc27001 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -9,6 +9,7 @@ require systemtap_git.inc
 SRC_URI += "file://0001-improve-reproducibility-for-c-compiling.patch \
             file://0001-staprun-address-ncurses-6.3-failures.patch \
             file://0001-gcc12-c-compatibility-re-tweak-for-rhel6-use-functio.patch \
+            file://0001-bpf-translate.cxx-Prevent-Werror-maybe-uninitialized.patch \
            "
 
 DEPENDS = "elfutils"
-- 
2.31.1


