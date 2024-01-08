Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B582EC3DA6E
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 09:11:43 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.3001.1704705099017343113
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jan 2024 01:11:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ZRed5J/G;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=17376a1c8b=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4088AYo0009209
	for <openembedded-core@lists.openembedded.org>; Mon, 8 Jan 2024 09:11:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=eKvIC
	vvw74TAyDv8L5CDvidnahk+DaY5TgNCOHjiiY4=; b=ZRed5J/GKCbhCX9WdI4G0
	PPPBeLdJ6cJV6JYyQ2nnS99YFagPgRahR7moRVEZh2nCjPfvxrcu5pVJc3prQyhm
	OWmrsS4XZ0CHSTxQotPFKTTjIHdz2gAS7ptxgpNp8zsgZD4BSykQxPMPtJAgmius
	bknUpcvtKLxWjg4aVWBkdLJNZV8eld7/yx+sLh2/6P5pKvD95h1yldbI0yHzLXFC
	UE2mwR+wWNI/0twKun08SvpL+qGH0aQ7OqPAKRVbWmDzS3SPMz/2wfe/yMD2Bej5
	Cje2twz9a9C5aH40lkB6xWrKwfbRSNpbX7Q0ISv/fE8EE+GDhEQkacICP0yPCxKu
	A==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vewu59tjy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 08 Jan 2024 09:11:38 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 8 Jan 2024 01:12:12 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 8 Jan 2024 01:12:12 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] gptfdisk: Make the version consistent
Date: Mon, 8 Jan 2024 17:11:33 +0800
Message-ID: <20240108091133.2870481-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: GdW3Xafr1N62uo0k5xX-M9ZSzbPJ86UM
X-Proofpoint-ORIG-GUID: GdW3Xafr1N62uo0k5xX-M9ZSzbPJ86UM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=568
 priorityscore=1501 impostorscore=0 malwarescore=0 mlxscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401080076
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Jan 2024 09:11:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193397

From: Mingli Yu <mingli.yu@windriver.com>

The previous change [262aa17e0e popt: update 1.18 -> 1.19] backports a
patch [1] for gptfdisk and make the version bump from 1.0.9 to 1.0.9.1
and make the package version inconsistent as below:
root@qemux86-64:~# rpm -qa | grep gptfdisk
gptfdisk-1.0.9-r0.core2_64
root@qemux86-64:~# rpm -ql gptfdisk
/usr
/usr/sbin
/usr/sbin/cgdisk
/usr/sbin/fixparts
/usr/sbin/gdisk
/usr/sbin/sgdisk
root@qemux86-64:~# gdisk --help
GPT fdisk (gdisk) version 1.0.9.1

[snip]

So update the bumped version part to make the package version consistent.

[1] https://sourceforge.net/p/gptfdisk/code/ci/5d5e76d369a412bfb3d2cebb5fc0a7509cef878d

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...h-of-sgdisk-when-compiled-with-lates.patch | 25 +++++--------------
 1 file changed, 6 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-devtools/fdisk/gptfdisk/0001-Fix-failure-crash-of-sgdisk-when-compiled-with-lates.patch b/meta/recipes-devtools/fdisk/gptfdisk/0001-Fix-failure-crash-of-sgdisk-when-compiled-with-lates.patch
index 218d9d6713..095d00b1e2 100644
--- a/meta/recipes-devtools/fdisk/gptfdisk/0001-Fix-failure-crash-of-sgdisk-when-compiled-with-lates.patch
+++ b/meta/recipes-devtools/fdisk/gptfdisk/0001-Fix-failure-crash-of-sgdisk-when-compiled-with-lates.patch
@@ -1,4 +1,4 @@
-From 5d5e76d369a412bfb3d2cebb5fc0a7509cef878d Mon Sep 17 00:00:00 2001
+From e7f9c9909c27d6ceed5aa4ca17023a1bc94b620a Mon Sep 17 00:00:00 2001
 From: Rod Smith <rodsmith@rodsbooks.com>
 Date: Fri, 15 Apr 2022 18:10:14 -0400
 Subject: [PATCH] Fix failure & crash of sgdisk when compiled with latest popt
@@ -6,11 +6,11 @@ Subject: [PATCH] Fix failure & crash of sgdisk when compiled with latest popt
 
 Upstream-Status: Backport [https://sourceforge.net/p/gptfdisk/code/ci/5d5e76d369a412bfb3d2cebb5fc0a7509cef878d/]
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
 ---
- NEWS      | 8 ++++++++
- gptcl.cc  | 2 +-
- support.h | 2 +-
- 3 files changed, 10 insertions(+), 2 deletions(-)
+ NEWS     | 8 ++++++++
+ gptcl.cc | 2 +-
+ 2 files changed, 9 insertions(+), 1 deletion(-)
 
 diff --git a/NEWS b/NEWS
 index c7add56..9e153fd 100644
@@ -41,19 +41,6 @@ index 34c9421..0d578eb 100644
     poptResetContext(poptCon);
  
     if (device != NULL) {
-diff --git a/support.h b/support.h
-index 8ba9ad1..f91f1bc 100644
---- a/support.h
-+++ b/support.h
-@@ -8,7 +8,7 @@
- #include <stdlib.h>
- #include <string>
- 
--#define GPTFDISK_VERSION "1.0.9"
-+#define GPTFDISK_VERSION "1.0.9.1"
- 
- #if defined (__FreeBSD__) || defined (__FreeBSD_kernel__) || defined (__APPLE__)
- // Darwin (Mac OS) & FreeBSD: disk IOCTLs are different, and there is no lseek64
 -- 
-2.30.2
+2.35.5
 
-- 
2.25.1


