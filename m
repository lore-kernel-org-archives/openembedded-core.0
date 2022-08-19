Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B63A0C32771
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 09:54:39 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.1241.1660902877379841619
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 02:54:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=RMvTafVp;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=5230971fa8=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27J6oNtO013338
	for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 02:54:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=7LU3NXJIe0W+Mk1BCW0EWJR/U8LpCgjHpsRyldoYLIA=;
 b=RMvTafVp7bbjQ14/xmeecY6HOktGlFmTXd2Gsu9/0ILwgpZIGhgCy8M5sBaLvoYtVam7
 GREVb5RBG0MJGXPwyLY16vqrMNzmdPWWEPQ+qv7ZKtOlGZuqiSFRvDKsh8w+wnDWJfSK
 FqBq0Jn56NwR5gryEMMQW/c+Zk1Ob7G5s+H0PJIVJhsMjqMzRBYs/dQxOIwL17kin64I
 JxSF9cQsyfvsiNpPRd7HHkJYP+pYeCCOfm3KFhauSqJBMtl9cqTcdG/wWyFHbp/FYB5R
 yjY7FVzg6txOTHEpMB9wJbP+8q36WJ4RVBjp7dD9EmjSKlituqm1Uo9AiX+X3le9Mra1 5g==
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com
 [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hxbfjmy91-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 02:54:36 -0700
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 19 Aug 2022 02:54:36 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 19 Aug 2022 02:54:36 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Fri, 19 Aug 2022 02:54:35 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [kirkstone][master][PATCH] parselogs.py: ignore systemd-logind
 warning message
Date: Fri, 19 Aug 2022 17:54:34 +0800
Message-ID: <20220819095434.1712401-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 51F7tF-ZlhI_lQiA9tYFsfNQZfbMjBSo
X-Proofpoint-ORIG-GUID: 51F7tF-ZlhI_lQiA9tYFsfNQZfbMjBSo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-19_05,2022-08-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 mlxlogscore=898 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 lowpriorityscore=0 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208190039
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 09:54:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169620

From: Changqing Li <changqing.li@windriver.com>

During upower.servie startup, it will send message "GetAll
org.freedesktop.DBus.Properties" to systemd-logind.service. Property
RebootToBootLoaderMenu and RebootToBootLoaderEntry will return warning
message when env SYSTEMD_REBOOT_TO_BOOT_LOADER_MENU,
SYSTEMD_REBOOT_TO_BOOT_LOADER_ENTRY are not set, and also efi boot is
not used. The message just warning and not harmful.

Since do_testimage run qemu, and use basic bios to boot, test_parselogs
failed with error:
-----------------------
Central error: Aug  8 02:53:59 qemuarm systemd-logind[383]: Failed to read LoaderConfigTimeoutOneShot variable, ignoring: Operation not supported
***********************

So just ignore this error message so that parselogs.py test case does not
fail.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/lib/oeqa/runtime/cases/parselogs.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/runtime/cases/parselogs.py
index 15dda7947f..1b678f2ff7 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -66,6 +66,8 @@ common_errors = [
     "[pulseaudio] authkey.c: Failed to load authentication key",
     "was skipped because of a failed condition check",
     "was skipped because all trigger condition checks failed",
+    "Failed to read LoaderConfigTimeoutOneShot variable, ignoring: Operation not supported",
+    "Failed to read LoaderEntryOneShot variable, ignoring: Operation not supported",
     ]
 
 video_related = [
-- 
2.25.1


