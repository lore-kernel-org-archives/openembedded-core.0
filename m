Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFCBCC4332F
	for <webhook@archiver.kernel.org>; Fri, 23 Dec 2022 03:38:45 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.64790.1671766722997768577
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Dec 2022 19:38:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=BtjqfqV7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=935673a273=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BN3cgGn003365
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Dec 2022 19:38:42 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=hwwr0KVcik8Wo/OxU7Yp+0/wpCBATdhIbLE4AoZh1BY=;
 b=BtjqfqV7zuzl2OsQLkrLSetMxJHLTN5QYwF/77Mpa5NtA40Wjpr+LO0APeYTkHZAjn+3
 u9AwFgUm11zQi/p+wF32VBEb8uOTHGZbmbFNb7MqSTE8UlOKPaaWecsqHiUtau/tkQgi
 fyIk5oOJfq+cSO0VaMS1oiwrt8fEftnaUKFDj6fOmj0Sk04h64ZX/HZli0sMoYKmDfvA
 JIH1Cu71Dgtu9gAaROdMzdkHepux4QWGUAoUg+dt17P3OJj76M97BJLVa6yrBNdmahWH
 KiQIK5jG27KKhdlwGDoXRBWGHmTq5vzbMEztAycsR0D3gLKdYcECwOHsT8EscIiakETA sg== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mhe5qcawk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Dec 2022 19:38:42 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 22 Dec 2022 19:38:41 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Thu, 22 Dec 2022 19:38:40 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <liezhi.yang@windriver.com>
Subject: [PATCH] base.bbclass: Fix way to check ccache path
Date: Fri, 23 Dec 2022 11:38:40 +0800
Message-ID: <20221223033840.2574054-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: ypSFJCvuVng8XuUrB6KwtCeiucUIqTGf
X-Proofpoint-GUID: ypSFJCvuVng8XuUrB6KwtCeiucUIqTGf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-22_12,2022-12-22_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=937 phishscore=0 mlxscore=0
 adultscore=0 spamscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212230029
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Dec 2022 03:38:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174973

From: Changqing Li <changqing.li@windriver.com>

The previous code had 2 issues:
1. make hosttools/ccache always link to host's ccache (/usr/bin/ccache)
even we have one buildtools
2. make hosttools/gcc etc, link to host's gcc event we have one
buildtools when keyword ccache in buildtools's path, eg:
/mnt/ccache/bin/buildtools

This patch is for fix above issues.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/classes-global/base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
index c4ac43c569..64e805c947 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -116,7 +116,7 @@ def setup_hosttools_dir(dest, toolsvar, d, fatal=True):
             # /usr/local/bin/ccache/gcc -> /usr/bin/ccache, then which(gcc)
             # would return /usr/local/bin/ccache/gcc, but what we need is
             # /usr/bin/gcc, this code can check and fix that.
-            if "ccache" in srctool:
+            if os.path.islink(srctool) and os.path.basename(os.readlink(srctool)) == 'ccache':
                 srctool = bb.utils.which(path, tool, executable=True, direction=1)
             if srctool:
                 os.symlink(srctool, desttool)
-- 
2.25.1


