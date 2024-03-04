Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07469C48BF6
	for <webhook@archiver.kernel.org>; Mon,  4 Mar 2024 01:13:05 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.88066.1709514776055059307
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Mar 2024 17:12:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=gufyE/iX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3793e32de6=kai.kang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42414XtP028362
	for <openembedded-core@lists.openembedded.org>; Mon, 4 Mar 2024 01:12:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=zFbak
	DIWTu9GLqWysT5aex+hdLIm1WMG//+zKZcIe14=; b=gufyE/iXTPH4LA1+OcJuY
	NCRIhbDo+I3sC+eUpcv7XZI+TgGu9OzmyE8MtaUKlPsbehxNqBhCb76usLRQ8TpG
	aBdzR2UFGc67AS0GiZ3wdvIlezkHoq3bvQeeif6Hs54GUhSXEWgI1+EZ+7/X3ceB
	S5Eux6APf5hyLjtN6TZAnKWU/rdsE7ck8H7TfPvsfHBhCdDfm0O0yoMURdgywPr0
	UegEt3TELzEP5MqWYRhmj2BtV+cWAgn6b9Q1irFL6jRTQw9opsAzErAfFhabujp1
	rPgCab8CjS7AHLEpIXza3PKgh2jLhbocrztfns7w9zO+VqnXnTEfiy2mwoVdG82q
	A==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wku3698g4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 04 Mar 2024 01:12:55 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 3 Mar 2024 17:12:54 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Sun, 3 Mar 2024 17:12:53 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] glibc: fix multilib headers conflict for arm
Date: Mon, 4 Mar 2024 09:12:49 +0800
Message-ID: <20240304011249.1930843-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 7Iqfa2CbDxzHx4Z4GRIDeG22-8wQCrmd
X-Proofpoint-GUID: 7Iqfa2CbDxzHx4Z4GRIDeG22-8wQCrmd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-03_12,2024-03-01_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 spamscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0
 mlxlogscore=851 suspectscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403040007
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Mar 2024 01:13:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196580

From: Kai Kang <kai.kang@windriver.com>

The header files conflic when multilib enabled for arm:

| Error: Transaction test error:
|   file /usr/include/finclude/math-vector-fortran.h conflicts between attempted installs of
    lib32-libc6-dev-2.39+git0+312e159626-r0.armv7at2hf_neon and libc6-dev-2.39+git0+312e159626-r0.cortexa72

Invoke function oe_multilib_header to resolve it.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-core/glibc/glibc-package.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index 1ef987be0a..fa085f31d2 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -167,6 +167,8 @@ do_install_armmultilib () {
 	oe_multilib_header fpu_control.h gnu/lib-names.h gnu/stubs.h ieee754.h
 
 	oe_multilib_header sys/elf.h sys/procfs.h sys/ptrace.h sys/ucontext.h sys/user.h
+
+	oe_multilib_header finclude/math-vector-fortran.h
 }
 
 
-- 
2.34.1


