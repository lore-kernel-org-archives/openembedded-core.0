Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 814FCD58E62
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 06:40:32 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.154844.1772433628279047514
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Mar 2026 22:40:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=jk7FktwK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7521d66b7e=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6224HAa41201972;
	Mon, 2 Mar 2026 06:40:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=sUY7t57b2
	EvedohGDO8KDbsmtBKeS3C6ZmH/7ivffIQ=; b=jk7FktwKPSlMLp4K+LXbOGj12
	8YvRY53rJ/3LeRJYK2Fz4KiMgnlUIAAvg9aCOha0OCnbOMfCEEdWVNfUz0gdeayI
	8kLw6pNzIH8CD82rfJmBjhRrtW5WG+GahCETbdavivxcvS5YYqWkRPnolrmuq686
	g5Z/ou16uw+GZyg86fd0wJ6CbdjqPShK1DTTceCBPPhoDAhY8CZo165qbeqGRLeY
	z9FOIjUevl904ztfGi6tUX8WXAtJNuauyN0KN3VeYGTX2sXAHspuqTCF/qmx+2U5
	nxVfbJJGwAsXDwizNeQHWtKB4y/u30XBvgnNvGRHwzz3iiB/YRi5umqY7NeYQ==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cknjvj2ag-13
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 02 Mar 2026 06:40:26 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Sun, 1 Mar 2026 22:40:16 -0800
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (10.11.232.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Sun, 1 Mar 2026 22:40:15 -0800
From: <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
CC: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] lttng-tools: not rrecommend on lttng-modules
Date: Mon, 2 Mar 2026 14:40:10 +0800
Message-ID: <20260302064010.1421315-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: bx87-ju5gs1vHqKAim56bisuwKBvpMRg
X-Proofpoint-ORIG-GUID: bx87-ju5gs1vHqKAim56bisuwKBvpMRg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA1NiBTYWx0ZWRfXyGeRAuAfP/y7
 jEUtzsvsalZwRvaiyK6gB7xNxyFde3aPLTKELF66pxBkNCIPKDNtsfJzG7j/RGqI7g1BQ36PnWt
 MEoyudLR5vRRFT0o13lXleRhF3/a8GlwmmVa+QAK4NI31ZmGbpvYq3CfccZ1DqsHco5qVpCMYOw
 z0RAUO/kWaH9uM9Z5DDWIeA1f0LFa/p3dn2LFxy8J55JBZT74fXUf6+t7yUWkCAf0mAvv9gd3C3
 xkwBunuAy8UDAU7lDlGVTLjCoxrdRLX0rf39AhufOnvASqAFwUNxSGufZi4TZo+TWe7WUBBabCY
 63v56rG4d1+sKueeYewPBdj+flFH5oWMrHSyQW9Te4ggLlODVPHylh8Hg4qhBTlNcxKQE8iU8t9
 PEWZ+RlyTKvdIhnP+/akqOFDVQVs+Jf15Jyw8Mu7jNtWQb+vJSGRhpfx5OjxKLWfl2ZRwVVOlIF
 Kyxh5UrT+/FjdQN1+WA==
X-Authority-Analysis: v=2.4 cv=P/g3RyAu c=1 sm=1 tr=0 ts=69a530da cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=a5LkSv8FAAAA:8 a=3WQPG5ikAAAA:8 a=xNf9USuDAAAA:8
 a=t7CeM3EgAAAA:8 a=PS4G5R6sXIA4BzX8kiUA:9 a=E2cWBXyb0kjxxB1PlMdk:22
 a=zBohcZEwHkW0jPBbCVRQ:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020056
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 06:40:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232171

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


