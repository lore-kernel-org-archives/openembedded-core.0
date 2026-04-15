Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAA8AED7B97
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 02:16:34 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10221.1776219390695179469
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Apr 2026 19:16:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=cGysKJkp;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8565aba85a=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F1UCdg2337951
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 19:16:30 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=lGTiVnq9W1u5eSxMopGhTI2NScqX3NgU3YefTt9/2nY=; b=cGysKJkppMEd
	6A/kkw9K1Pq6GnWMFxNnuBaYPQ27OF3ht87+dMo46Ulg/PNiJSlQPhND0+Bkerqp
	93SFZ+RjcT+se1Y6thewhQmJ/YLPWj79VdZkf5L3CmF+wwJ7YKRP09s2/5+g2AT7
	xFCDtg1vFpeb7b4k70IuLHCwy+SLqL7EJUe8DWVNDxv3vHlqZ7sLUoTV2zzCRIBE
	aKW9bZGibkpKV9aeOgDYYaS1mH+Ms9mpAtuaRJHTq/A7Lq2xzuEggXoJp7Xof/kE
	2reiVfTb7Dy4dhhrB8BjpvCE4k+/z7CwA/BVgBCers3VhtHGyIeWdUQvFkzJprAQ
	IuoC0vJryw==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012057.outbound.protection.outlook.com [40.93.195.57])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dh87msgev-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 19:16:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qu3haapRZfr80S/nBwBYKYyFd8fghYd58Z55k/3e65hurytMCol1XRPF/kMDSHy1tG589sK8Hy2j9CH8mcaVlq8XYsyerm2Dy5HbPG3wENn56Z/r04Zh43FQDY7bd8DwiRLFF5VnuDSQKwwfQ/gxpWE046MATkUQ+db/C5sOTFCn223gQyihSfVS5bc51GpfH9FjLS6OAqZVIzoQGvPAd1B+WKm4UFwnY9JUABsAEsSd683l8ZZppmLTbxmnstyAfXQuXcQNiWJTWQK7Bcw5pmEfaOtanWbk7PqQqH65gkEaG9HXGy7szlxKXJ77Zst8HRDKxe7K0zw1Uf1xbMNMTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lGTiVnq9W1u5eSxMopGhTI2NScqX3NgU3YefTt9/2nY=;
 b=BwBdy039tnAFHTf/KX49wNUJQGxb8XMUmHJ/8EV2z8JY5nZ5sQ/ezvwiwwDU8jkiAXQ+ithZ76ZTGOU0l2hOHyE+DeVq4/1tNbkAqwoj73l5R1oDOsr3yH5Fj0GxGy/kf4WdcKWbCodSPG23p05l6/7VQETGoGYyjoA04We83Imt57TzyKLLmWaViCDs97Kc2LDDIOtE9xrnRKZ68dwvJgh3j0q11raTK4iQiThCvb+Q0WIaSmexWnAg2T06XH5tG3w43odle7hvTbupVO9/Tl56zEdiDyhpY5VydFdxcdxaMS0gFppLee7W2r+tZCGQM6OzMMJsv21UN8ZoHdR8CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by BL1PR11MB6002.namprd11.prod.outlook.com (2603:10b6:208:386::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 02:16:28 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9818.017; Wed, 15 Apr 2026
 02:16:27 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [V3][PATCH] gstreamer1.0-plugins-bad: add ANY_OF_DISTRO_FEATURES
Date: Wed, 15 Apr 2026 10:16:11 +0800
Message-Id: <20260415021611.525515-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <18A61B7E9B9AB538.1398202@lists.openembedded.org>
References: <18A61B7E9B9AB538.1398202@lists.openembedded.org>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0037.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b5::17) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|BL1PR11MB6002:EE_
X-MS-Office365-Filtering-Correlation-Id: 370fa4e6-ddd6-40ae-8487-08de9a94ffe4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|22082099003|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	Ujpweo2fAdxXtcKKbO3NvQCyKSrMXpQS5aZlmKMn0bIIpyhrYmlz8QZWTICaRG6SHEVl8zmH6jB6bXeq1Eq9HXVoqEEg/jlqv8X8O345HFuLVScJIPDhPqBLyJ8N2l0tA5MBLas44xD5iarm2CXb/+O2ToF+KHW9OytMrZ31NTo+vkMdCFxwNRyGT7KxiC5TpI7mNl3cll2cl2ZPCpMueAwsZIG4ib1dZfcOiHfCFTcYHUMSCItAEOgLOU/7tSygdj0I4yOQnlda/DNJDiJLS8Ibrkgsgmy/9eJxfaL8LUxpEtArwWYlGRs+us1EmhvZpX1nvo15x5Dy2gPcIpzNToBaMgnufppJSEVMXcGVsBxYTkA2iOwdsSNTxqyl+3l9EC5ag3n+L+mQv/Ems2C9ONBXwu/Dbp1dnt/S8OldUpXh+iO3aImrsL1rKAsWgwcau9MgZ+rCzzOVbG3hqIRnbbcbXFA3lPjJWt2jHVgMuJ4vXdLVoCoN/C9Nde51mipxP00d7edTVSVig/GjuJTPY4x2qlZj6rYCa4tKSEcUBWxKNY/dHR2LvBYqO+MOtb0okv06mcNgaorCYaCs1ueun/31V2KHC9tRyT48pmLRcrD0DYO5gXBuZ+e4PpKhyG7DXGWQLnQczRJmgShjOFXuEYok+TBa0ghhdqgiJzotaOP/smuo5bzAIPwZuqNHIoO7DPhils6pZkI4QrweltkWS4HYkdH3+eWxMYMRexiHQ1hD+uppvQ71lM1BFEz/T2jfzUWzB9Jrw7pFpuG1znAXY7gnK9tdjcWiNVjEn04Amlw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(22082099003)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?J0rFqL/kTRCIngjvFzn5Nvm3BROWwOFNoYO26xqSkH4fAs4U0uOJT09X0zAQ?=
 =?us-ascii?Q?xZTw/IfnYGfKs0UEs4WvuI/LH21b0J5fJPRKWL3EqoJDLgmExfC54oI25mk9?=
 =?us-ascii?Q?O810rkEuTYEfXPAd0+fyncEzF98QOsTDmbDHY0qA8SawHzYd+uKxcscjkB72?=
 =?us-ascii?Q?4kuJOlNhBWUkyD3T9eQSMat/LiuTd3J8zVZy7EBAjy9mjksBZS7zxr9JUjoo?=
 =?us-ascii?Q?BM0M6WZdKGI726wplRadY+5tXYjWmXGkCiCpasmk9U2eFO3HnYqkRvHlR9Lw?=
 =?us-ascii?Q?7YEdl+N07z7f5g2y3nGG1JnCBwkN5PMFC5HhEPlzQxUU8eYG3Y6LUx0+Klj2?=
 =?us-ascii?Q?8ROYDM5UG6uDEefE4/JsmwYmb/rdhdMSx8qUlGbz3N/JhowEFRgZOMMwiR84?=
 =?us-ascii?Q?+SazevpDdGY388gC7sI8WbQ8jC94w4gB+7/dlKEYbCf1FfIyHAelMPJYYqj6?=
 =?us-ascii?Q?cY0oRnssoEkWydC1VNpPLVi4vyftlI4flebeSp0NtlCXSJIQEmbCtUX+OG21?=
 =?us-ascii?Q?/DztTC0UuzHwM1qgLi+PP2xvSV8pHsqqBjJT7v9ExD2Lh8IsEfwKY2crts/v?=
 =?us-ascii?Q?FGWMLS16hZ8giVD6fSAqM/Dqk2lc9aHFhMkaM9BStrM9KgWW/AhpDTW1zfcG?=
 =?us-ascii?Q?8+YM5e2ZjKalcqor/0QvL+zBE0IRRZB0kD7KJbT3ElMzM+MkTjn4HJQk6+cT?=
 =?us-ascii?Q?1/QQQewBEkfNG0O5nNr2PSyda/j9Qjweg0mSEmTxaymSzrvP5P0XJspBYILX?=
 =?us-ascii?Q?QFYzHI1RH0kolTVL8Z8U/pMddeiK+SVrfZBPoRj5uQB9p/LbpzoDHf65n51l?=
 =?us-ascii?Q?rLesMmiYfdiLdl4aSL9Mu+DXDP5bLDyG599+Wnink0qN9XL7AB81R3SrldsX?=
 =?us-ascii?Q?MtqLN8QB6iYy36IDfviAOhDpxANjSIqZL8POQbzXs+nMgyfRBVG+2ap6ggTj?=
 =?us-ascii?Q?3LS5yspdf9kHdj+n9rBipds7B44XUb9TyrAWJpfOKF7KGPi13HQhudiZ9M0W?=
 =?us-ascii?Q?QvJVSusGDP7ORX0aQp0arFwXVodI8ICvFjsw7NXQct5wKu/70bK9BbUEl6am?=
 =?us-ascii?Q?DbSt2p7XS0ZKzIGVkG2+IohPKaCdupACCY/C2OnFSiKYsIntzQcjRrD2F2kZ?=
 =?us-ascii?Q?NnF+7hUlLMYppebwJhjMSE8CozqPQ/A/pCB/RXE3GpeeaafUntKcT3y0feAT?=
 =?us-ascii?Q?ogxp29dSNsHT3wmeuxOeucRfveQeuOmP7/YeVbiLBBB4cECo0zPMRJBcPFfG?=
 =?us-ascii?Q?mrTmEFe4GDof3RZqxrZ01yHDnbGQl6M8ER21CG3c2mKz5DDfbbZSyp0rGauQ?=
 =?us-ascii?Q?tuF2Xme7kFNeGaMZ72FOz3kBOLcvbNMd6l8G8vMjkqf2PN0Hcwf/ZlOMCjIo?=
 =?us-ascii?Q?F8UrDcIVBeOTW0kmNg8O3M3s3xSg3UXFg0wO0sLZ4ke8n885K/KEk+Cd9/KK?=
 =?us-ascii?Q?JgAxEF7q1R81Xp0EYckJ9+kH2CRmyWzDboN9RwIMb1q64aqrBnI34RiT8yWs?=
 =?us-ascii?Q?/MCUfDNW8U9h/3V2lrCIeUnscBUT3kqC/l6P2RWuhgvSb24Phoz4m4Fs2hh3?=
 =?us-ascii?Q?B6sDfjndkAW8ZDmNJOXL4KQS1VctOPpqDOkYoBnXbqfymOUa9/5uEIbAfltI?=
 =?us-ascii?Q?iAjsqb5yy5sVjc1GqGJsk90Oxi4EXjgT8A3fGCAbyXwwdQ86qxAo8nqtJS8V?=
 =?us-ascii?Q?xk/Jej6crW/Q6HJHNFmfJa5062nlUPUa6xxLajwChMWe6QE87k15JRvmQFx0?=
 =?us-ascii?Q?Ka0wavYKZg3xQf7QIobhVufrLkpf7m0=3D?=
X-Exchange-RoutingPolicyChecked: 
	sBU1wkf9bQntmytuaKmE2LflZsPpVkOz9bEvKBJxom6BLReSXXKee9ZU4zExN4bW/+SZbt06/34xYQOXyyUbiX6ccKV/5U7VoDLU3VnOBcNnqGYEdX8OMa2sd8eFo9WlqL6353jYsTo6YbmtUJ6iE6niBICNve1FwgVO6ku/cAq05oSw4ewhpO0nDERGROrovtaMzJzpsv02eJ9x1qPtneIvAK06BQdUEIZ0MrNpPq9G4UvdLICJGU6PyyWDPf+c41oewvfCGOqTKIlQMcEFEqy5fDlBKUY36TrFX2ieuqG7cOAbYcDLbD6ZWzBeLcB2dMk2RrbiJcjbRTeZGwf/fQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 370fa4e6-ddd6-40ae-8487-08de9a94ffe4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 02:16:27.7425
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 12SlgcfyU81YjHCIa/SWYE4rNU52mZoxSI5eTHvNynUXrkO80MRFsRFx570J5eU3T2FB1BZMEjpjpQFysM7n/OaRejlNBIXL6kVquRDXK/c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6002
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDAxOSBTYWx0ZWRfXyO8//MHJG0iJ
 KjL2a2YryS7wrkogYaL+gwSQ50NOUTtaIfYJWtW7Sz87tPgXpvm6LIFuKw0RCfqsW/vQOmkETkj
 LerDYnKG0T6GrB3BFDnJLoDE/pkUob8xQUtHkgORfgWtqr0p+A8d1s0OpfjLhD0kaVsFRQAorv4
 SFggQqbXykqvHzy08dD71e6znGi91MkbFfDxvlIUlAi9MJ3KWvyBVhYzOOttVcQnlmDIRtUnvGo
 9pIyc85nMuzhjL3mVwsBIivt7mQAf1PaiA3jR+MUvanDfB/0P6QDQA3us6dFrPp3zXFrm+u/VbJ
 KR9AjMMpitm/8CLTEGWdQjMlKkIGrjTXYpjJ+4YKUoyB33uY18q0krf5oWRYvX5St4uMha/hO9I
 LiHpTYDFi7ribmcoXmP/M68IFR3LB+GzriOYYrGkJmRxU5C2/gXPM4QIBhIKmiQoC+GkjPNzW+9
 ZrYjDLhD9FRW+qsmk/g==
X-Proofpoint-ORIG-GUID: xLU49B_qkwIGnxF13O3NaKcl9qw9-qOC
X-Authority-Analysis: v=2.4 cv=GupyPE1C c=1 sm=1 tr=0 ts=69def4fe cx=c_pps
 a=8TTB3MyXo5LrYHl2kKBanA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=kMG_xlHWQGcNhEGIYbkA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: xLU49B_qkwIGnxF13O3NaKcl9qw9-qOC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150019
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 02:16:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235176

When vulkan is enabled in DISTRO_FEATURES without x11 or wayland,
do_configure will failed with error:
gst-libs/gst/vulkan/meson.build:311:4: ERROR: Problem encountered: No Windowing system found. vulkansink will not work

when vulkan is enabled in DISTRO_FEATURES, set ANY_OF_DISTRO_FEATURES to
x11 or wayland to skip building of gstreamer1.0-plugins-bad

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb             | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb
index cdf3a20dff..aabcafe121 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb
@@ -19,7 +19,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 DEPENDS += "gstreamer1.0-plugins-base"
 
-inherit gobject-introspection
+inherit gobject-introspection features_check
+
+# When vulkan is enabled, at least one of x11 or wayland is needed
+ANY_OF_DISTRO_FEATURES = "${@bb.utils.contains('DISTRO_FEATURES', 'vulkan', 'x11 wayland', '', d)}"
 
 PACKAGECONFIG ??= " \
     ${GSTREAMER_ORC} \
-- 
2.34.1


