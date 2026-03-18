Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF96D10706E1
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 10:10:43 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10703.1773828631598800429
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 03:10:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ggnGxlC/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7537156b97=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I3FKVU2781910;
	Wed, 18 Mar 2026 10:10:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=sUY7t57b2EvedohGDO8KDbsmtBKeS3C6ZmH/7ivffIQ=; b=
	ggnGxlC/4R4NYWR7bpWxB2bfdbt/mXWSOW4SlS4IVxUAKhx5bm4pBGKdyP+zP7ir
	mNjGuKbZHwoeFkTH08CxpCza8s5nJR9iZZDl0QI2FlNuXpvXVAv8FcpdM8Qy1Jm7
	1z4zqfn1Fm4wu8Tc+6BtroHthWvPghGRr6HLRoIZlpNJOju6DVeHyRDwIYd6zeua
	1mLxKeQR5q7KAJPcqL2T7v+AKmKBVDlSwDGMXha9gRRDSZ6cV2BXx/5Oa0xgt8jm
	sv1D6g5VsnPYx7JYpARt8hdHyCdHKWdkFypJKXjEczdYuSu6UPoKM+tJ50ap6+Nj
	rlxYyoRKTYSKVZYXRDayfw==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cy9ans574-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 18 Mar 2026 10:10:29 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 18 Mar 2026 03:10:28 -0700
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 18 Mar 2026 03:10:28 -0700
From: <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
CC: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2 1/2] lttng-tools: not rrecommend on lttng-modules
Date: Wed, 18 Mar 2026 18:10:24 +0800
Message-ID: <20260318101025.2718647-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260318101025.2718647-1-kai.kang@windriver.com>
References: <20260318101025.2718647-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=IrMTsb/g c=1 sm=1 tr=0 ts=69ba7a15 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=a5LkSv8FAAAA:8 a=3WQPG5ikAAAA:8 a=xNf9USuDAAAA:8
 a=t7CeM3EgAAAA:8 a=PS4G5R6sXIA4BzX8kiUA:9 a=E2cWBXyb0kjxxB1PlMdk:22
 a=zBohcZEwHkW0jPBbCVRQ:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: wO1qqKVggrJtbBituxRwEznTe6RvfzZf
X-Proofpoint-GUID: wO1qqKVggrJtbBituxRwEznTe6RvfzZf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA4NSBTYWx0ZWRfX+NixfnWQcQWF
 2hfz02iHy+E9Dj7HAQ1Vpi9OWyZoRTnLNKnUGNe8m1ln7GrymLhS+XSM1UgenV/wwzzwEctYH0F
 O35tiZ0oyfr/ZSgTrtzbMhMEIj/bqVGZDtFY4SfjO97IC47qAdgqFuD0rHzfDjVGnTVMYAJcEGk
 AlNSgW6vGecHQSVXraEERHW7efy79czdP9Iprb4jHlg7MB7vd3BGPm21l7fi1QdKsJdK0BcTJza
 9MmAqJw3ljaEDqNS5FDAnWu5gn3MQxm+M5JqtZN3PrERl0mI0zacsrOExhKyXQiYsQDd255g7VP
 4QCF7cckTNAws/4E/8ppvEMStwPxrTAb/qOYIbVPTnFtvyV7IgZR4vMQcUyShDDZHKjohMkx8RL
 N0eBjoNfuuROUi8WUzSSEQ3vm7O/MAF0q3heEKGD6nGW4JWx5UV9FlzsHJrlrZbDg6LLISsiERZ
 nOEsDhj/cvwaZEmJCNQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180085
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 10:10:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233375

From: Kai Kang <kai.kang@windriver.com>

As in the lttng manual [1]:

  Most distributions mark the LTTng-modules and LTTng-UST packages as
  optional when installing LTTng-tools (which is always required). In
  the following sections, we always provide the steps to install all
  three, but note that:

  * You only need to install LTTng-modules if you intend to use the
    Linux kernel LTTng tracer.
  * You only need to install LTTng-UST if you intend to use the user
    space LTTng tracer.

there should be no force dependency between lttng-tools and
lttng-modules. When set lttng-modules in RRECOMMENDS, it always forces
to build lttng-modules whether it is required or not.

Compare to rpm spec [2] and debian conf [3], there are no any dependency
between them too.

So remove the RRECOMMENDS setting.

[1]: https://lttng.org/docs/v2.14/#doc-installing-lttng
[2]: https://rpmfind.net/linux/RPM/fedora/updates/testing/43/aarch64/Packages/l/lttng-tools-2.14.0-4.fc43.aarch64.html
[3]: https://packages.debian.org/trixie/lttng-tools

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-kernel/lttng/lttng-tools_2.14.1.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.14.1.bb b/meta/recipes-kernel/lttng/lttng-tools_2.14.1.bb
index 620ddfb1cf..3a3f2cff2c 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.14.1.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.14.1.bb
@@ -14,7 +14,6 @@ include lttng-platforms.inc
 
 DEPENDS = "liburcu popt libxml2 util-linux bison-native babeltrace2"
 RDEPENDS:${PN} = "libgcc"
-RRECOMMENDS:${PN} += "${LTTNGMODULES}"
 RDEPENDS:${PN}-ptest += "make perl bash gawk procps perl-module-overloading coreutils util-linux kmod ${LTTNGMODULES} sed python3-core grep binutils python3-multiprocessing"
 RDEPENDS:${PN}-ptest:append:libc-glibc = " glibc-utils"
 RDEPENDS:${PN}-ptest:append:libc-musl = " musl-utils"
-- 
2.34.1


