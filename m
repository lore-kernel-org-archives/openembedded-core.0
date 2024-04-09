Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE2FFC67861
	for <webhook@archiver.kernel.org>; Tue,  9 Apr 2024 06:18:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.130044.1712643512826500300
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Apr 2024 23:18:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4829c615fb=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4394g3CG024888
	for <openembedded-core@lists.openembedded.org>; Tue, 9 Apr 2024 06:18:32 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xaukxtbty-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 09 Apr 2024 06:18:31 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4396IVfO024486
	for <openembedded-core@lists.openembedded.org>; Tue, 9 Apr 2024 06:18:31 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xaukxtbtw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Apr 2024 06:18:31 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bfo5bKw+t0R2i3nQ118XF+WzQbx5GHrEgJoddfTIIdpGIbc3iwBfy8pyh2FJjjeRHUROXG4MHagE1IjuOs0vbMQYbrhuGc1CLhR2HepqtzCS4KsgBVHwlLXj7sX0oR6vQ1fpFXL1r0qf68pRJ+A65Ed6jvPwi2ujd+v9HnK3GsgbB4ArCvC5NpDmvpl1NduVdZdOIfVHw8DGOIDfQpdPY96HfSKr4IdwpcKRUEBHcwZJmBAnXEfhWx+zIkpY+u16ltXmT9ZtFUO/vOpIxCaZXdMNZUXbPGfD0hBPqcUfqXS85QgNMfOGmTCiV6rsxSLM0P9PPLqOFfsgDEymGd1PYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bsF18WMjs6PEi9wB8dhR6Vh+AhrTE/613Cs31nIm7pE=;
 b=hyXY9Kqn59Q38xLH2k3iyCNAPv7NxVIeFwRYtjdU92d6MlRWd7Swkuh3//dQkd9npHA2o9zboFLnNcZWeXnlvodmYA47uRkt0tDFdBn7ud1/1jtK70LuQBp3Ndd0gn2Mz0GHjHjKcW7aMbfdqYfLj7NXzN5a83+Q9R8OaqJwtcVSBUf5PR3E16Vx2SKCvrq38afAfrk9my3UrnXDFpklDfId07gVlQ1MShgUl1/qHaT/dxBk+Vl9TlbYMlZBMtyqsS9EDDdA8qCyz3OPygRwT1zlHnMO0sKpWJAHajEuHazI1Ey1jjzM+ffFTYJ2D+dtQavRNsX8UhXG2uh6bgarKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by MW3PR11MB4697.namprd11.prod.outlook.com (2603:10b6:303:2c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Tue, 9 Apr
 2024 06:18:28 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::5dcc:ddee:208a:33b5]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::5dcc:ddee:208a:33b5%4]) with mapi id 15.20.7452.019; Tue, 9 Apr 2024
 06:18:28 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-core@lists.openembedded.org, alexandre.belloni@bootlin.com
Subject: [OE-core][PATCH v2] iputils: splitting the ping6 as a package
Date: Tue,  9 Apr 2024 14:58:26 +0800
Message-Id: <20240409065826.776876-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0175.apcprd04.prod.outlook.com
 (2603:1096:4:14::13) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|MW3PR11MB4697:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/BgojVAaRTp1bEPQTuJH1xsbgP9AzVhFeLAtEhl0+rCt1pEkjSsbsLnCeOsAjm5QB/v/8iMNOVPLEy5HNb+uc05z4NZsMhr6V3nwPnP2fpbvLGxWrgDvPzne/hJS6fvJfnUiwZkdibMVVCcBsq0/+oGstvJ2NRNkN0HA0PWCMOVz7my8ORlrsY2XPBzf8Qaocb+9KymxjYpL4lRx8GRZqc5TcQUKq5RFlTu9Y2x6m9lZxjw3ij9UfU57EVZCv05rnyS9hJuLMdPZsrg+6p50fBs3Be7DEqNWgDtbmAJc8cVuMfdUOV9k/Wre5Epql0Byn+X5hUW4yGJa5ZXIdMXsEyetAPmqfdDFkZtE6M0w0IkbJYD52DecGID+SdH02iQQXVIH5odRWtq31ULc02jxfDX0zg4WZhfEBelke1mEpMNmAaju23GY4GxC6cYPYpNN8v3y3tIl0hNNhBRh0hvMSW/gRoNuSXizbl699Q2VfgXScJtYQqMz7XLBDiT+r/QxLD+uZJhiXsO6PltXprdmYIZk/nzI4YcziTxwKOCCsKppeSK8raJ1TJ7UMCu3cBSL+cQcD9Czv68WAZs6RYLQ6w4hpkone0gQa7JnNfao/TV7Ph4UM4FQ4MwnHsbbTHBELbqXIIxqxV3tSK+f9W2d/tAUdcQivwNrNjVt+hG8Vb8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(52116005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HfsUhVgSGI6KDoogJ0tyeIxJDk4bknzVdJoO6mwcC7pt6YDpbAvVY6Yv5pBo?=
 =?us-ascii?Q?yhTUIsy8rS4EnSMJIAdh3ppt+MY6pB13b39ZPomfGFKp4kwuqr2XRkVB3Ofc?=
 =?us-ascii?Q?8rWWdY6tCy7pMFye98afNskC6WcoWM2Zj1MrfIaGWRqji49eb9nwEBi/Zx2O?=
 =?us-ascii?Q?rbnrz2dBItfDMJDPXoTEja6SD06BIZUgw9L8dmS4aON3UMxgFUJL6A7j4WoN?=
 =?us-ascii?Q?D4JGRD9rBio6W0njooTnfZpQASXROb0Y0IjeN+25WjtzT4Yw4qmh52c48aen?=
 =?us-ascii?Q?QnMe2wl4dJ9eaBvIdR1VQs3h1FfoiiTEuhGrlt44RQfjV8JYrMY0hVbMJOGK?=
 =?us-ascii?Q?RA0sGC/t3kvaxQbrjtClt2GSegOX2ypQecOm4P/jldLwl7a1KXP3gFKCtiMq?=
 =?us-ascii?Q?AAcfF0uBF4wL+VDqgHK3b+hTzf1c5tfvO2iJlzx5xm5loQBH/E/Zma0eC211?=
 =?us-ascii?Q?Z1+UW4sTifWR+QqtCvUy1kgV0r1+g9wQiwpgqPrFZoRlAoofQYrRGFhDcREa?=
 =?us-ascii?Q?n7MXk1UuL88SCh5Rc96Gk/de5+de/AyPFiOLU5ZaFotnuvk6zviwGV3AUT4c?=
 =?us-ascii?Q?lUFok8uQjMx/7ih7hJwPGZQPwzm8y7HQbyKMrNAtYADqyhWDi3z97k+XhLDk?=
 =?us-ascii?Q?D94xytrVatFCdCL6Rec2ClCZMU48OjnVX/vCnNJ+Lt+79OL33n7s9SMdjey+?=
 =?us-ascii?Q?UdXEpPGdhp1WO4gIAjus8scCk7PNSGG8RehVvlp0PXHdAlNjrXSudPbLl3WM?=
 =?us-ascii?Q?k3dzx2QXt9jc6h9YDpJBaKmDoWsiyag9j0NRGJC0vJIziToksohZwdarl0lP?=
 =?us-ascii?Q?CP+c/DnUPbax14Ru1iVhgI2G/rqx89CKh31LjZ26Ati/2OhAHVdbvksiCNi9?=
 =?us-ascii?Q?B8tCZA5W3xiwvR9tXoyg7n0dx5LgEER0UiGD2yKu4DfMayRykDzzAv8k0FTF?=
 =?us-ascii?Q?oc9OoIplp9lLs5WGeMr/7iN30GL3+PZMpl/voDZQXDTkMM9tBczVDz8wl5UL?=
 =?us-ascii?Q?YRXPb0Ag0UVvueJis92TFYrrYwwq5lRhbaN627YpLCQCLsk7xd5OPVaSWLVe?=
 =?us-ascii?Q?wuXoq1SBH5XkajMJ/sV2WCEg/EdXJrQXIQ4/RmemFX3v+vIO6wOYEWsxEKSk?=
 =?us-ascii?Q?EjKJmUjtynpwBg99bZAyAIB/LbPdV69qeHEcdvAjV/jYLzVaNv+Ui+hWxR+w?=
 =?us-ascii?Q?9vdCruiJm8HOlm4cCzOggUIzakGVhfnutBC45yAPdwmwyQWlyOhRCRjBPNqI?=
 =?us-ascii?Q?AmU0sted6kwKarrToSedMKM5kIwikN1ZchQsHoadAJxhNV662WLb43qtOUQd?=
 =?us-ascii?Q?xwqI9GBdlJ7PI4Pfd02dXl/LFp9D7vI4B8kH1OsnlMwnep/M1Lb/K8VkCMh2?=
 =?us-ascii?Q?GpWoMnKO5SEuZn/4AatoWcwy+Kf5eE89oeLWtUws7aP8GaIO5vZocug3Zylu?=
 =?us-ascii?Q?eFvnmiGxNK1kk2+1nEdOJ/YAv8Y4Zw/B+YAUAHPC8Vqi9gUCX674Zs8UtQFG?=
 =?us-ascii?Q?Ga3anNW8oJn6iseQVgb1PZ/ooxxJxb4U0vpPoM/coQkRpMRQJITmgr7i0Go4?=
 =?us-ascii?Q?mUTNaKTEmvVV0ZdQjU46RoFrasnjA6Unpmw2ytrKf4R+jymHjSnP7CQrVBqa?=
 =?us-ascii?Q?wQ=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 334c52ff-9462-4469-7207-08dc585cdeda
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2024 06:18:28.0751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BfFmQejMFTP4IUvR34AigO9xZiZGu8d7vRzwqIG4LVMSaXgq0q3n0O2bWcWdqTvJKSVHzdSIBbHhfOP7m0DAVhiNfcSOMCN5giIT1obZqsQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4697
X-Proofpoint-GUID: HhaxjEcSOG33jrUbURSWnjp5YZ3E9NEp
X-Proofpoint-ORIG-GUID: i4kRNbDKkGgCJy4tVN0JqN5t0NnAbX_N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-09_03,2024-04-05_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 priorityscore=1501 spamscore=0 clxscore=1011
 suspectscore=0 malwarescore=0 mlxscore=0 phishscore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2404010003 definitions=main-2404090037
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Apr 2024 06:18:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198020

From: Xiangyu Chen <xiangyu.chen@windriver.com>

The iputils merged the ping4 and ping6 command into the ping since the
commit ebad35fe[1], currently, iputils ping support being called using
"ping -6" or "ping6" symlinks.

In oe-core, there are two packages provide ipv6 ping, inetutils and iputils,
the inetutils-ping6 doesn't support "-I" option to bind the interface, that
cause some of scripts(e.g. LTP test[2]) which was based on iputils-ping6 fails.

If someone or a package needs iputils-ping6, they can enable it in local.conf
or add it into rdepends directly.

Ref:
[1] https://github.com/iputils/iputils/commit/e3de851b809c7b72ccc654a72b6af61d
[2] https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/ \
    containers/netns/netns_comm.sh#L25

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
Changes:
v1->v2 fix build package error under musl
---
 meta/recipes-extended/iputils/iputils_20240117.bb | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/iputils/iputils_20240117.bb b/meta/recipes-extended/iputils/iputils_20240117.bb
index 5a5e15528e..3880689742 100644
--- a/meta/recipes-extended/iputils/iputils_20240117.bb
+++ b/meta/recipes-extended/iputils/iputils_20240117.bb
@@ -35,7 +35,11 @@ ALTERNATIVE_PRIORITY = "100"
 ALTERNATIVE:${PN}-ping = "ping"
 ALTERNATIVE_LINK_NAME[ping] = "${base_bindir}/ping"
 
-SPLITPKGS = "${PN}-ping ${PN}-arping ${PN}-tracepath ${PN}-clockdiff"
+ALTERNATIVE:${PN}-ping6 = "ping6"
+ALTERNATIVE_LINK_NAME[ping6] = "${base_bindir}/ping6"
+
+SPLITPKGS = "${PN}-ping ${PN}-arping ${PN}-tracepath ${PN}-clockdiff \
+             ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', '${PN}-ping6', '', d)}"
 PACKAGES += "${SPLITPKGS}"
 
 ALLOW_EMPTY:${PN} = "1"
@@ -43,6 +47,13 @@ RDEPENDS:${PN} += "${SPLITPKGS}"
 
 FILES:${PN} = ""
 FILES:${PN}-ping = "${base_bindir}/ping.${BPN}"
+FILES:${PN}-ping6 = "${base_bindir}/ping6.${BPN}"
 FILES:${PN}-arping = "${base_bindir}/arping"
 FILES:${PN}-tracepath = "${base_bindir}/tracepath"
 FILES:${PN}-clockdiff = "${base_bindir}/clockdiff"
+
+do_install:append() {
+	if ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'true', 'false', d)}; then
+		ln -sf ping ${D}/${base_bindir}/ping6
+	fi
+}
-- 
2.25.1


