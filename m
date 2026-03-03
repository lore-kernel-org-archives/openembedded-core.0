Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0D18E67A71
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 06:56:45 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12727.1772521002987145397
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Mar 2026 22:56:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=pZUtRcnM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=75229269e5=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6235t7Tg4044898
	for <openembedded-core@lists.openembedded.org>; Mon, 2 Mar 2026 22:56:42 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=7ZNcwwztaxQcYNHFJKO6
	HLKzjCJGdbLWiyhuYzuUfWA=; b=pZUtRcnMAliYYKfFbu7+KsibcPDJVW/en162
	fA+mX0mDTL9pnEnPOfIlLN4RjNoCEUq2AqSAuCs8eQIY0hLEnsq5jC50gQmOXPdW
	y1SZ0KjwwJ2POpjcyiJiKMOeK/FLwXz6G3jeVKxSbYEn9DE28i5qMwYB668VxzCJ
	wtlazESvh+Xn8dNIEB4xR2nWYofiR+ilsx2CQKhRUmep4KHhUXINU10+se9sP/Iu
	evemwFGUDTUPqJn6y8/TvXYZE2F4oSSy5VQQ0kJlRi0+3+LYnT6oU8i3NR22TRJw
	mscGdr/9SPRhMjbELPAuSDu3UWOQCJ/g/ifx6b89JRs8Bay1eA==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cm0rgju8t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 22:56:42 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 2 Mar 2026 22:56:41 -0800
Received: from pek-lpg-core5.wrs.com (128.224.153.45) by
 ala-exchng01.corp.ad.wrs.com (10.11.232.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 2 Mar 2026 22:56:41 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 01/19] btrfs-tools: upgrade 6.17.1 -> 6.19
Date: Tue, 3 Mar 2026 14:56:22 +0800
Message-ID: <20260303065640.2541884-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: quRC1K6nrbQmLWXxXX_22dIPsUKmWy-I
X-Authority-Analysis: v=2.4 cv=Of+VzxTY c=1 sm=1 tr=0 ts=69a6862a cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=iKiJcTA2PjBS6x5JeXcw:22 a=aFIx6uq9AAAA:20 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=NEAV23lmAAAA:8 a=Y1pU1iggeUwA-e5CKGgA:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: quRC1K6nrbQmLWXxXX_22dIPsUKmWy-I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA0NyBTYWx0ZWRfX8+lpJFRiYO7D
 MzrcWuRKYn+Opn6svhR3h75TSIqtPrUQAHFVK+v5PqwfTQmfDSOrH5s6JD8yVggxIlBwuD7v4EZ
 6ELXWwIfD33fnw/rhqDhGQAUFx5heghF//u3j+N4wS565R4fIX1Ve/i6d2hRDul/EgByONQhfnh
 15ptBKzXzBkIX3EshB9dSijUUTJM4P7BQE3GtsNkG9JWmoBU+pc6wmGFmMU3dXbviJwV9JxFW9o
 lmQkl1SQwa1U5TIJkedcWnsFBB3XMNPYUfgx5d0Qn1B50iPtjGVXwAYobj8uhNsSehBsFJqfzQJ
 6ophPL7Yh4It72uy2qwXWUtQ4jmLjwFsol0v8/G17DOGvFCRcMGQRhfW8SYT2fF/As2wtODszS/
 P1Jf3gFm0GMri9A+tuNYshoaec+tyH+4mKsudGHkzsi5N+ebeug2RR/Qw/gqHWPbVQhiopWUeDc
 HpJxWoHyiMdeBammBjg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030047
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 06:56:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232239

Release Notes:
https://github.com/kdave/btrfs-progs/releases/tag/v6.19

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...d-a-possibility-to-specify-where-python-modules-ar.patch | 6 +++---
 .../{btrfs-tools_6.17.1.bb => btrfs-tools_6.19.bb}          | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_6.17.1.bb => btrfs-tools_6.19.bb} (98%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
index 2cd66d2722..7272c27c6c 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
@@ -1,4 +1,4 @@
-From 030ec81c0dac1e067faf49924d5631bb22ccc90d Mon Sep 17 00:00:00 2001
+From 7edcee57078769b7752275e0e5f35aefbfefc9eb Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 23 May 2018 21:20:35 +0300
 Subject: [PATCH] Add a possibility to specify where python modules are
@@ -11,10 +11,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile b/Makefile
-index 7e36aa42..edff7d5b 100644
+index 96c11830..3f2585cb 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -996,7 +996,7 @@ endif
+@@ -997,7 +997,7 @@ endif
  ifeq ($(PYTHON_BINDINGS),1)
  install_python: libbtrfsutil_python
  	$(Q)cd libbtrfsutil/python; \
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.17.1.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.19.bb
similarity index 98%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_6.17.1.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_6.19.bb
index 8a6e4c268f..460f70a35a 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.17.1.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.19.bb
@@ -18,7 +18,7 @@ DEPENDS = "util-linux zlib"
 SRC_URI = "git://github.com/kdave/btrfs-progs.git;branch=master;protocol=https;tag=v${PV} \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
-SRCREV = "06981428c08f78f019a2f4956407fd84b495e21e"
+SRCREV = "9ac9a97ee3ebcc71c584a202a31ccd6442c436dc"
 
 PACKAGECONFIG ??= " \
     programs \
-- 
2.34.1


