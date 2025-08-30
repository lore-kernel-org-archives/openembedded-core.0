Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0FBBCA0FFF
	for <webhook@archiver.kernel.org>; Sat, 30 Aug 2025 17:02:46 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.14025.1756573359671064337
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Aug 2025 10:02:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=RO4QjYUV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1337cb0bab=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57UGjCW33621438
	for <openembedded-core@lists.openembedded.org>; Sat, 30 Aug 2025 10:02:39 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=MXGCpqRLM0dz3g/0lYXb
	fKXYn/cG5Q6Rc1vuq90fOOc=; b=RO4QjYUVOtJHONi5qy/wB0f0aRgWoZSTdZpo
	eyJlGymXqeS52DR2Usz1WRPTOoCSff3rd4wrJ5HMqWgVHnZCc8wdNJ6XLZnImRsv
	nRjQlpADUZiLBXr29tZUqI+A++pyhlpB9XVkHLcbxPb6bRGQ2R4UgNOdAXtJy2iI
	7tALk4w4VYk4+ByV3oKy9Usd2oeqqgP1B8x296okSaNE7pqXR0ZtDGBFwfEY2awS
	mPkUYgUQs4UNfKRqJb2Y4C1g7EMt8/rculG4lwA2jGektpas94eB3NQkteG7dpR8
	IYuNBUn/lp+m0Cu5l5wtcT3xnq21s1/QwnoY6+WzE+FbDxP8aw==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48v0tfg4n0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 30 Aug 2025 10:02:39 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Sat, 30 Aug 2025 10:02:37 -0700
Received: from pop-os.wrs.com (10.11.232.110) by ala-exchng01.corp.ad.wrs.com
 (10.11.224.121) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Sat, 30 Aug 2025 10:02:37 -0700
From: <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/2] util-linux: include/mount-api-utils: avoid using sys/mount.h
Date: Sat, 30 Aug 2025 13:02:36 -0400
Message-ID: <20250830170237.3756511-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: qK6xFfhVf4UBK1yq6JKJRWo_1lFm4h80
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDE3OSBTYWx0ZWRfX/R8ve3SdIoT6
 8Dch5maIvyvyoZzD+t773PZ9fu4oDkk5EKFulfY02QFhJ08LT1xVqtuqgE00jLX54qyv+22+7t8
 aVgX3TYeoEnI2g8kaaLNmGk3QKh7YVTHAwP4o3v57E6WXXJ0h45x+Bhswb+mAnlfDUrMQSh/Sis
 N6qEGGXG1HUGW/9L29Lj/tJMMTH+NrRFokupUmzxvcvxq5yQzUVMMbwu6Hva5gYHQ3I8qCJn5Bo
 OIF94Zt/XaTWPtpZidpkzy5Mux5IwMVHfL4NNSyVLWQx6RKDUkZhnWleSUK2kGAGl9CrrDBKZDI
 mi7H70/kTgD67PYaILdtd0CBOL46cGIt+Dv2fpxQbQnTWOzGKfgvPCVJRAgNjg=
X-Authority-Analysis: v=2.4 cv=XJ0wSRhE c=1 sm=1 tr=0 ts=68b32eaf cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=2OwXVqhp2XgA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8
 a=LwFLTbV6kcevpKzbwBAA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: qK6xFfhVf4UBK1yq6JKJRWo_1lFm4h80
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-30_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Aug 2025 17:02:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222625

From: Randy MacLeod <Randy.MacLeod@windriver.com>

Avoid compile error:
| In file included from /usr/include/linux/fs.h:19,
|                  from /usr/include/linux/btrfs.h:29,
|                  from ../sources/util-linux-2.41.1/libmount/src/btrfs.c:18:
| /usr/include/x86_64-linux-gnu/sys/mount.h:35:3: \
                   error: expected identifier before numeric constant
|    35 |   MS_RDONLY = 1,                /* Mount read-only.  */
|       |   ^~~~~~~~~

This is seen on PopOS 22.04, an Ubuntu/Debian-based distro.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta/recipes-core/util-linux/util-linux.inc   |  1 +
 ...nt-api-utils-avoid-using-sys-mount.h.patch | 29 +++++++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/0001-include-mount-api-utils-avoid-using-sys-mount.h.patch

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index c5698d9cab..4c1105b6ae 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -21,6 +21,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://0001-lsfd-mkfds-foreign-sockets-skip-when-lacking-sock_di.patch \
            file://0001-ts-kill-decode-use-RTMIN-from-kill-L-instead-of-hard.patch \
            file://0001-tests-helpers-test_sigstate.c-explicitly-reset-SIGIN.patch \
+           file://0001-include-mount-api-utils-avoid-using-sys-mount.h.patch \
            "
 
 SRC_URI[sha256sum] = "be9ad9a276f4305ab7dd2f5225c8be1ff54352f565ff4dede9628c1aaa7dec57"
diff --git a/meta/recipes-core/util-linux/util-linux/0001-include-mount-api-utils-avoid-using-sys-mount.h.patch b/meta/recipes-core/util-linux/util-linux/0001-include-mount-api-utils-avoid-using-sys-mount.h.patch
new file mode 100644
index 0000000000..544f45362d
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/0001-include-mount-api-utils-avoid-using-sys-mount.h.patch
@@ -0,0 +1,29 @@
+From 2a9b48d20d74f65ac708b3bcee6a7e2a61aadf88 Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Thu, 21 Aug 2025 09:59:10 +0200
+Subject: [PATCH] include/mount-api-utils: avoid using sys/mount.h
+
+The file is unnecessary and introduces duplicate #define of MS_* macros.
+
+Fixes: https://github.com/util-linux/util-linux/issues/3674
+Signed-off-by: Karel Zak <kzak@redhat.com>
+Upstream-Status: Backport [https://github.com/util-linux/util-linux/commit/2a9b48d20d74f65ac708b3bcee6a7e2a61aadf88]
+---
+ include/mount-api-utils.h | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/include/mount-api-utils.h b/include/mount-api-utils.h
+index 920d6766a..e35524168 100644
+--- a/include/mount-api-utils.h
++++ b/include/mount-api-utils.h
+@@ -6,7 +6,6 @@
+ #define UTIL_LINUX_MOUNT_API_UTILS
+ 
+ #ifdef HAVE_LINUX_MOUNT_H
+-#include <sys/mount.h>
+ #include <linux/mount.h>
+ #include <linux/unistd.h>
+ #include <sys/syscall.h>
+-- 
+2.34.1
+
-- 
2.34.1


