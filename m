Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E18BBE77188
	for <webhook@archiver.kernel.org>; Thu, 16 Jan 2025 06:58:08 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.43018.1737010681417647286
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 22:58:01 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=311110a243=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50G6hVAL021445
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 22:58:01 -0800
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 443mt753aw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 22:58:00 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 15 Jan 2025 22:57:50 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 15 Jan 2025 22:57:48 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH  1/1] socat: Fix CVE-2024-54661
Date: Thu, 16 Jan 2025 06:57:47 +0000
Message-ID: <20250116065747.1926599-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 5tadDAqUy1hxlZkb0JZsMZEpvkXjvFLm
X-Authority-Analysis: v=2.4 cv=SeoNduRu c=1 sm=1 tr=0 ts=6788adf8 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=VdSt8ZQiCzkA:10 a=PYnjg3YJAAAA:8 a=iox4zFpeAAAA:8 a=rFFRleaeAAAA:8 a=t7CeM3EgAAAA:8 a=LqKLPXsZjyQVp64znIkA:9
 a=WzC6qhA0u3u7Ye7llzcV:22 a=YLtI_f64H5IAZ6mI3Lwl:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 5tadDAqUy1hxlZkb0JZsMZEpvkXjvFLm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_02,2025-01-15_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 mlxlogscore=999 mlxscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 adultscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501160049
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jan 2025 06:58:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209934

From: Archana Polampalli <archana.polampalli@windriver.com>

readline.sh in socat through 1.8.0.1 relies on the /tmp/$USER/stderr2 file.

References:
https://nvd.nist.gov/vuln/detail/CVE-2024-54661
https://bugzilla.suse.com/show_bug.cgi?id=1225462#c7

Upstream-patch:
http://www.dest-unreach.org/socat/download/socat-1.8.0.2.tar.bz2

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../socat/files/CVE-2024-54661.patch          | 31 +++++++++++++++++++
 .../socat/socat_1.7.4.4.bb                    |  4 ++-
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/socat/files/CVE-2024-54661.patch

diff --git a/meta/recipes-connectivity/socat/files/CVE-2024-54661.patch b/meta/recipes-connectivity/socat/files/CVE-2024-54661.patch
new file mode 100644
index 0000000000..aa170bc895
--- /dev/null
+++ b/meta/recipes-connectivity/socat/files/CVE-2024-54661.patch
@@ -0,0 +1,31 @@
+From da5d4bd0a79a9adb69469fe4e542b6874eec663c Mon Sep 17 00:00:00 2001
+From: Archana Polampalli <archana.polampalli@windriver.com>
+Date: Thu, 12 Dec 2024 13:00:06 +0000
+Subject: [PATCH] socat: Fix CVE-2024-54661
+
+readline.sh in socat through 1.8.0.1 relies on the /tmp/$USER/stderr2 file.
+
+CVE: CVE-2024-54661
+
+Upstream-Status: Backport [http://www.dest-unreach.org/socat/download/socat-1.8.0.2.tar.bz2]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+
+%% original patch: CVE-2024-54661.patch
+---
+ readline.sh | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/readline.sh b/readline.sh
+index b6f8438..5c59458 100755
+--- a/readline.sh
++++ b/readline.sh
+@@ -26,5 +26,5 @@ mkdir -p /tmp/$USER || exit 1
+ #
+ #
+
+-exec socat -d readline"$HISTOPT",noecho='[Pp]assword:' exec:"$PROGRAM",sigint,pty,setsid,ctty,raw,echo=0,stderr 2>/tmp/$USER/stderr2
++exec socat -d readline"$HISTOPT",noecho='[Pp]assword:' exec:"$PROGRAM",sigint,pty,setsid,ctty,raw,echo=0,stderr 2>$STDERR
+
+--
+2.40.0
diff --git a/meta/recipes-connectivity/socat/socat_1.7.4.4.bb b/meta/recipes-connectivity/socat/socat_1.7.4.4.bb
index 5a379380d1..86ca5879be 100644
--- a/meta/recipes-connectivity/socat/socat_1.7.4.4.bb
+++ b/meta/recipes-connectivity/socat/socat_1.7.4.4.bb
@@ -9,7 +9,9 @@ LICENSE = "GPL-2.0-with-OpenSSL-exception"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://README;beginline=257;endline=287;md5=82520b052f322ac2b5b3dfdc7c7eea86"
 
-SRC_URI = "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2"
+SRC_URI = "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2 \
+           file://CVE-2024-54661.patch \
+          "
 
 SRC_URI[sha256sum] = "fbd42bd2f0e54a3af6d01bdf15385384ab82dbc0e4f1a5e153b3e0be1b6380ac"
 
-- 
2.40.0


