Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5942CD98F2
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 18:52:59 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4246.1782154378355198123
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2026 11:52:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=P/Q5URsx;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=A4yBRD4J;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: rs@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MFaEAq3427514;
	Mon, 22 Jun 2026 13:52:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=ivNRTe0Q8q0+w
	1+lobgXaUNOcHBHi3dFeBBPO/baG24=; b=P/Q5URsxQuPqp1M166fcPHxNvfUsM
	bABrAcS92zTXN2eUi8hY+Zqc4Xzn3WfxGfj5KRrGMR+cRKfXecvNTxlLJGVLrnMg
	TVw8QO1UBA5TBx/wDZwIjuO1/6LU5keEDriLkBXfSp9iu/AL76hN+xX+JcQfeJTt
	pN9AjKccpjfDzUjNkUp+YfvIwNLjAKBQHJjybCPxtM+ctxbBD0yIFXFKotxYey77
	4+9cZ5P1j4gPl3+wjSvikkc+Js3twE4HM8Wcjr5AbevpDzhDWDN8jgAdjAQYm6Ei
	F986D85H/0npPunL+LY1BPV1dBKYsqAla9CnaRjzgNOiv1u80bVjFE6DQ==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011035.outbound.protection.outlook.com [40.107.208.35])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4ey43bjgdm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 22 Jun 2026 13:52:39 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C/Nlpmab8SGfhjpk1zEkVpFm7OJQ7e8I1XzLY0UmZk2lWbagljV75KoQTASJeHyUb/axBqo/byDTsmN5kuNpSS3KPGEE7gVgZBI32ZmFeUTMJh/deMHKNmGKZ07tP8meNVKVdOOUyxAN5KezXi1DjSyWIOMzVfGDUGqMB6hc8y9Wr9m5OTHMZBqphCQdQ8WXFkVCmQ/tkOqd5zWOSCjmNL7RXAKmulYcxe2bI3t9TRQM5tZlp4E2KeewYjNaCu1dJQUBudGf3OGp8GN4stEdulBFw+WSCUqpTwKyO23FNdxISN9gxRbgkmTOHnuO2eTlRa51YL6gCmFhkEjUuP+3Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ivNRTe0Q8q0+w1+lobgXaUNOcHBHi3dFeBBPO/baG24=;
 b=XkR4Dpc9bfTVR10f0LAWERnn5W/1v5PB9+sX2ASOf3NXCLx41rP9p7cjw1PA+z8vj7TUg2aLyP/wiAEvQQfszyJNQAaV/iY/UCN91esDBgDdcxP+MsoIja4gPy3OhttqTeWD1W1kvBOUzNV1xlt5N1miikzkmaVLmv92TvZ2V71wST5lp1HLkkCvLRNkpD9hOI6Ed2uNqL3tSH/RvnpsKPYWksYGRneECPJShNYAkf8gPTCIQ9YQzt2el8tajEO7PBCg1YpqdfTAdGOaRo6ReZm/F0Oz76pcp72s2jIx97rzE/hsgyF5B3Wei2DI3NvpgjKv6uuyE08ikya0u4wYKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ivNRTe0Q8q0+w1+lobgXaUNOcHBHi3dFeBBPO/baG24=;
 b=A4yBRD4JmiV9eB5DffI4z/HjWSwvPLDjk8GH3kkw87i9AYLfN6BmdV7VqEXajCBmWJFjJGx6N6SHO3hEGlLcvg8Z309xzEOhDL/FrjZvi6N4EAb5rLA0fcoYcyG8z+VFbVv4h0e9JlG86hhcmCv+3Cda13ZFAT+sz7AKg+Ur6TM=
Received: from CH0PR03CA0417.namprd03.prod.outlook.com (2603:10b6:610:11b::6)
 by PH3PPF539203119.namprd10.prod.outlook.com (2603:10b6:518:1::79e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Mon, 22 Jun
 2026 18:52:34 +0000
Received: from DS2PEPF00003445.namprd04.prod.outlook.com
 (2603:10b6:610:11b:cafe::14) by CH0PR03CA0417.outlook.office365.com
 (2603:10b6:610:11b::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.20 via Frontend Transport; Mon,
 22 Jun 2026 18:52:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS2PEPF00003445.mail.protection.outlook.com (10.167.17.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Mon, 22 Jun 2026 18:52:31 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 22 Jun
 2026 13:52:30 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 22 Jun
 2026 13:52:30 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 22 Jun 2026 13:52:30 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.39])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65MIqUNJ543894;
	Mon, 22 Jun 2026 13:52:30 -0500
From: <rs@ti.com>
To: <raj.khem@gmail.com>, <richard.purdie@linuxfoundation.org>,
        <mathieu.dubois-briand@bootlin.com>, <alex@linutronix.de>,
        <otavio@ossystems.com.br>, <kexin.hao@windriver.com>
CC: <afd@ti.com>, <detheridge@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
        <openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: [oe-core][PATCHv4] xuser-account: convert to standard-user-account
Date: Mon, 22 Jun 2026 13:52:27 -0500
Message-ID: <20260622185227.3975860-1-rs@ti.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003445:EE_|PH3PPF539203119:EE_
X-MS-Office365-Filtering-Correlation-Id: b8b8f28f-7fb4-40f5-2b72-08ded08f6a31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|82310400026|36860700016|376014|13003099007|20052099010|18002099003|3023799007|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	W+ARwqDUHuGib5dcFAX8hm1uDL66AHzlJztwtIJiEVcoO0P0lpwNx1T0AoPhBU/r5xnAMyKwQDfrt6H38O17zPQWR1Eeq9jEggY0B05JsPHLxPMqqpYbA8pW+xSGiwrYIinVOrIK22l98KKPWD5qwToiLWMOjJNBJ/WIT+76qKf4Z+FQDgOKiuLsDhb8/wAsxj7aIs61iNGof1T3VXvLZNmCuKgjvujVk+AIPx/8/s1V6IVZM1fYdIiwASIIgVu4GZPZF331wrhONdKHphZW/cIFYrQhmTzJgCopuYHU1O1NJTJIQwjYVIDZat7tdvufZCW/kLBj6IbN6kRQOFec6UgDX5wuiRnS2yYWJloSLZrpiOV3C7a9KDrEMy6fsblS1BON8kqTtn4CFC+VA61Cfvhc5+zD876EgjKQnvhSCnZPpPBo/gqoxfuAOHuuxOwLDYHcVmQTT5WnhmvNFSpNH2vSxblOf8IwKo88WS7s2TxQ0+nuIi7t12wqCX7xdnHdxtTs0bv0BtrVeWMYGY7OT/+ZLBdesnckzXy2y1refC190HWIdVP9lvNeHB4B2II0Im/CK2NqhiXzTOshx9SUsrJVlLAgfNVwvkqc2qgdIAYT6ZpBFDJSL1AeCTIWCoR+NxWk1lYxcK9GPkvaeehFGQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(82310400026)(36860700016)(376014)(13003099007)(20052099010)(18002099003)(3023799007)(6133799003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	UUlIMUDmdpfyg/tHSAy+dOlufN/wVHZ5CsVf017Ht192qibDJaLw565QEVc/UD1Db+TPwe4u9fQ3JhcHKpVfYTvhd3IuzK8RI9Kp3yW/0q4/F7/PH3ldaQclJUtGiybWMUKN8rDUbnV1J0/cpJHVDXjIG3skSO+AmlM7oQzj8Sog2Qrp3CxbWy2Wq7CPPfWrpyMI/ndf46B1URQ/vggfsetjqL36BtlqdR8m9q+aKAHtFAROttRQW9+Zcth8u5i+1bM2EWbWLHbhUI/yd5e/mOl8cJ5ILcAJD9pQDRqqCeiCeYgZDm+Th3FVDKZL8q3m5OFCMQUiN1DwEHCxC6z9Sb6yTroGKbuv0g7V7ePvQbhuLZrG05euPq1zIDeehIon0Zf+FEbf9YuC83kVfzsO9735/b3Mv5ALQrjB2oQbUjwt0AcjEsQUWv/J01qPH3hB
X-Exchange-RoutingPolicyChecked: 
	Ja1ERD5MlHdq2p6KGRHnmvYcbtN3PHKBjAnfummNe4ryTLcNW3/sd8FVPo5HBjSO9Bfxb2wRn71IRn2zFhdgij+1dhh7lTDS7oPirjI/iiwpxUvvrl0WEDwdMVrWidTZK2JlFRwt96PpQKoQJbaJ9HMO9ycMyqc2Jrh4UivdXrD02PcDTZDglFcxwyzYW7oHLYEx+vQ/c7dBLAp+vY9aOtyi5EOImObKaxJ59+j8i0LEZM2hIt6yrnYJTJn5Yj9NBWhO5Sv1Nk9La4rtV9DIWw7+U9tsElDt0HbWBhnIJ+nBerNOpcMfaJq0iAynUdqlxIW22kYk6LYLzZBDS77dlA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 18:52:31.2667
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8b8f28f-7fb4-40f5-2b72-08ded08f6a31
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF00003445.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF539203119
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDE4MyBTYWx0ZWRfX68yKKQEVBpTK
 Ijf4xeo0HVhNVKYgiSbWpLzAOi7gGqhwGswe6Z1JuE8OCtWL9t9tl9usYMprNApImjfO/ZTFqNt
 fa8RHABsBlGjv6TYsok/82Rn8tuQmdk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDE4MyBTYWx0ZWRfX9PH+VvhdBL00
 WVR1taZW6sp32F0/1FdhFAK15DnJjOBtL6bnO1uD+G2xzGryvro1p0+gqJlJgAo2Fn0ahGkGyKJ
 +9MEqEib+IiVTzwOSgQ4OJDURDkonFCCEb1aTWJLzcSuhYO0MR1vXsZTDZOq6ULs/a+zV1gss5q
 JgGlZdWFxzgS7n/5xdBpM6zamqNUjEA3ETDtGqntK/unurWdeyPm1WCCABK9gNe1A06Xh6KMJ4T
 GljWYEXDMEarCgqyx6BTmPpaJpEvjxYVobXX3MEDkXFyQi7GMZB8j9h6I6TKG2Kr1girdKRH/Jn
 lDJcbufYXF3Uf6Mu/wDQ2MJmRYPZhkdOzQdokqdxCgv8XsH194h0fXkped76v2RAdJpZgHbxMvU
 MQPKVQCrOk+ckNku1CjsnlHh0U3M3i75C6P6Snx1Br1QvYMha2EVE1dGJWN+oDb2guO8I1qOAc2
 EajOBNlLfBX2og6+2SQ==
X-Authority-Analysis: v=2.4 cv=TPl1jVla c=1 sm=1 tr=0 ts=6a398477 cx=c_pps
 a=pKPYWX2mfyrwmcKrUbCwIA==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=Q4-j1AaZAAAA:8 a=iGHA9ds3AAAA:8 a=e5mUnYsNAAAA:8 a=sozttTNsAAAA:8
 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8 a=ag1SF4gXAAAA:8 a=l2p9iwxLtlSgQCY6vywA:9
 a=-vRB9dRCtfH_pLRD:21 a=9H3Qd4_ONW2Ztcrla5EB:22 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=FdTzh2GWekK77mhwV6Dw:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-ORIG-GUID: 3JwAJ6XqQfxsgywzv4o3_NK64ApTJ-bW
X-Proofpoint-GUID: 3JwAJ6XqQfxsgywzv4o3_NK64ApTJ-bW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_03,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606220183
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 18:52:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239316

From: Randolph Sapp <rs@ti.com>

Change this single xuser account template into a generic
standard-user-account that uses distro level variables for
configuration.

This allows for seamless configuration of multiple out-of-box scripts
and tests across layers without having to implicitly hope that the
username or groups haven't been changed by a bbappend or recipe
override.

This also adds a class and a variable to allow recipes to assert that
the user is in requested groups.

This was proposed specifically to remove some issues highlighted in:
https://lists.openembedded.org/g/openembedded-core/message/230665

Signed-off-by: Randolph Sapp <rs@ti.com>
---
v2:
	- Add seat to the default STANDARD_USER_SYSTEM_GROUPS var
v3:
	- Add STANDARD_USER_GROUPS_EXPECT to indicate what groups are
	  expected to be provided by other projects
	- Set user UID and GID as 1000 in the static tracking files
	- Update the weston test's user name
v4:
	- Bump weston-init and xserver-nodm-init PR to try and work
	  around some suspected caching issues in CI
---
 meta-selftest/files/static-group              |  3 +-
 meta-selftest/files/static-passwd             |  3 +-
 meta/classes-recipe/standard-user.bbclass     | 26 ++++++++++
 .../distro/include/default-distrovars.inc     | 16 ++++++
 meta/conf/distro/include/maintainers.inc      |  2 +-
 meta/conf/documentation.conf                  |  5 ++
 meta/lib/oeqa/runtime/cases/weston.py         |  2 +-
 meta/recipes-graphics/wayland/weston-init.bb  | 14 ++---
 .../x11-common/xserver-nodm-init_3.0.bb       | 10 ++--
 .../{system-xuser.conf => system-user.conf}   |  2 +-
 .../standard-user-account_0.1.bb              | 51 +++++++++++++++++++
 .../user-creation/xuser-account_0.1.bb        | 30 -----------
 scripts/sstate-sysroot-cruft.sh               |  6 +--
 13 files changed, 120 insertions(+), 50 deletions(-)
 create mode 100644 meta/classes-recipe/standard-user.bbclass
 rename meta/recipes-support/user-creation/files/{system-xuser.conf => system-user.conf} (90%)
 create mode 100644 meta/recipes-support/user-creation/standard-user-account_0.1.bb
 delete mode 100644 meta/recipes-support/user-creation/xuser-account_0.1.bb

diff --git a/meta-selftest/files/static-group b/meta-selftest/files/static-group
index 6a9ece20a897..a59712680649 100644
--- a/meta-selftest/files/static-group
+++ b/meta-selftest/files/static-group
@@ -20,15 +20,14 @@ pulse:x:520:
 bind:x:521:
 builder:x:522:
 weston-launch:x:524:
-weston:x:525:
 wayland:x:526:
 render:x:527:
 sgx:x:528:
 ptest:x:529:
-xuser:x:530:
 seat:x:531:
 audio:x:532:
 empower:x:533:
 cmake-example:x:534:
 meson-example:x:535:
+user:x:1000:
 nogroup:x:65534:
diff --git a/meta-selftest/files/static-passwd b/meta-selftest/files/static-passwd
index 98017c81532f..381fbeda4ed4 100644
--- a/meta-selftest/files/static-passwd
+++ b/meta-selftest/files/static-passwd
@@ -16,8 +16,7 @@ pulse:x:520:520::/:/bin/nologin
 bind:x:521:521::/:/bin/nologin
 builder:x:522:522::/:/bin/nologin
 _apt:x:523:523::/:/bin/nologin
-weston:x:525:525::/:/bin/nologin
 ptest:x:529:529::/:/bin/nologin
-xuser:x:530:530::/:/bin/nologin
 cmake-example:x:534:534::/var/lib/cmake-example:/bin/false
 meson-example:x:535:535::/var/lib/meson-example:/bin/false
+user:x:1000:1000::/:/bin/nologin
diff --git a/meta/classes-recipe/standard-user.bbclass b/meta/classes-recipe/standard-user.bbclass
new file mode 100644
index 000000000000..ff931b80920e
--- /dev/null
+++ b/meta/classes-recipe/standard-user.bbclass
@@ -0,0 +1,26 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+STANDARD_USER_PACKAGES ?= "${PN}"
+REQUIRED_STANDARD_USER_GROUPS ?= ""
+
+python __anonymous() {
+    d.appendVar("DEPENDS", " standard-user-account")
+
+    for pkg in d.getVar('STANDARD_USER_PACKAGES').split():
+        d.appendVar("RDEPENDS:" + pkg, " standard-user-account")
+
+    active_groups = set(d.getVar('STANDARD_USER_GROUPS').split())
+    active_groups.update(d.getVar('STANDARD_USER_SYSTEM_GROUPS').split())
+    required_groups = set(d.getVar('REQUIRED_STANDARD_USER_GROUPS').split())
+
+    if not required_groups.issubset(active_groups):
+        raise bb.parse.SkipRecipe(
+            "one of '%s' needs to be in STANDARD_USER_GROUPS or "
+            "STANDARD_USER_SYSTEM_GROUPS"
+            % ' '.join(required_groups)
+        )
+}
diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index 69c6db589b77..603ca1e84e8c 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -66,3 +66,19 @@ KERNEL_IMAGETYPES ??= "${KERNEL_IMAGETYPE}"
 # the variable to be empty.
 # Git example url: git://git.yoctoproject.org/yocto-firewall-test;protocol=git;rev=master;branch=master
 CONNECTIVITY_CHECK_URIS ?= "https://www.yoctoproject.org/connectivity.html"
+
+# The STANDARD_USER_NAME is the default underprivileged user account name.
+# The STANDARD_USER_GROUPS is a space delimited list of user groups that account
+# should belong to, and STANDARD_USER_SYSTEM_GROUPS is the same but for system
+# groups. The STANDARD_USER_GROUPS_EXPECT is a space delimited list of groups we
+# should expect to already exist in the system. Any groups in the other two
+# variables that are not in STANDARD_USER_GROUPS_EXPECT will be created as part
+# of the standard-user-account recipe.
+#
+# Please take note that not all tooling currently supports changing these
+# variables. Scripts like sstate-sysroot-cruft.sh and reproducible builds expect
+# these values to be the defaults listed below.
+STANDARD_USER_NAME ??= "user"
+STANDARD_USER_GROUPS ??= ""
+STANDARD_USER_SYSTEM_GROUPS ??= "video render tty audio input shutdown disk wayland seat"
+STANDARD_USER_GROUPS_EXPECT ??= "video tty audio input shutdown disk"
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 86048e791c28..76db73a4628d 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -815,6 +815,7 @@ RECIPE_MAINTAINER:pn-spirv-tools = "Jose Quaresma <quaresma.jose@gmail.com>"
 RECIPE_MAINTAINER:pn-sqlite3 = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-squashfs-tools = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER:pn-ssh-pregen-hostkeys = "Richard Purdie <richard.purdie@linuxfoundation.org>"
+RECIPE_MAINTAINER:pn-standard-user-account = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-startup-notification = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-strace = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER:pn-stress-ng = "Unassigned <unassigned@yoctoproject.org>"
@@ -941,7 +942,6 @@ RECIPE_MAINTAINER:pn-xserver-xf86-config = "Unassigned <unassigned@yoctoproject.
 RECIPE_MAINTAINER:pn-xserver-xorg = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-xset = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-xtrans = "Unassigned <unassigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-xuser-account = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-xvinfo = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-xwayland = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-xwininfo = "Unassigned <unassigned@yoctoproject.org>"
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 842cf31739de..88849ea516af 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -346,6 +346,7 @@ RDEPENDS[doc] = "Lists a package's runtime dependencies (i.e. other packages) th
 REQUIRED_COMBINED_FEATURES[doc] = "When a recipe inherits the features_check class, all items in this variable must be included in COMBINED_FEATURES."
 REQUIRED_DISTRO_FEATURES[doc] = "When a recipe inherits the features_check class, all items in this variable must be included in DISTRO_FEATURES."
 REQUIRED_MACHINE_FEATURES[doc] = "When a recipe inherits the features_check class, all items in this variable must be included in MACHINE_FEATURES."
+REQUIRED_STANDARD_USER_GROUPS[doc] = "When a recipe inherits the standard-user class, all items in this variable must be included in STANDARD_USER_GROUPS or STANDARD_USER_SYSTEM_GROUPS."
 RM_WORK_EXCLUDE[doc] = "With rm_work enabled, this variable specifies a list of packages whose work directories should not be removed."
 ROOTFS[doc] = "Indicates a filesystem image to include as the root filesystem."
 ROOTFS_POSTPROCESS_COMMAND[doc] = "Added by classes to run post processing commands once the OpenEmbedded build system has created the root filesystem."
@@ -388,6 +389,10 @@ SSTATE_MIRRORS[doc] = "Configures the OpenEmbedded build system to search other
 STAGING_KERNEL_DIR[doc] = "The directory with kernel headers that are required to build out-of-tree modules."
 STAMP[doc] = "Specifies the base path used to create recipe stamp files. The path to an actual stamp file is constructed by evaluating this string and then appending additional information."
 STAMPS_DIR[doc] = "Specifies the base directory in which the OpenEmbedded build system places stamps."
+STANDARD_USER_GROUPS[doc] = "Specifies the default underprivileged user's groups."
+STANDARD_USER_GROUPS_EXPECT[doc] = "Specifies the groups that do not need to be created."
+STANDARD_USER_NAME[doc] = "Specifies the default underprivileged user's account name."
+STANDARD_USER_SYSTEM_GROUPS[doc] = "Specifies the default underprivileged user's system groups."
 SUMMARY[doc] = "The short (80 characters or less) summary of the binary package for packaging systems such as opkg, rpm or dpkg. By default, SUMMARY is used to define the DESCRIPTION variable if DESCRIPTION is not set in the recipe."
 SYSLINUX_DEFAULT_CONSOLE[doc] = "Specifies the kernel boot default console."
 SYSLINUX_OPTS[doc] = "Lists additional options to add to the syslinux file."
diff --git a/meta/lib/oeqa/runtime/cases/weston.py b/meta/lib/oeqa/runtime/cases/weston.py
index b0dccee73bf4..6339fda97b0f 100644
--- a/meta/lib/oeqa/runtime/cases/weston.py
+++ b/meta/lib/oeqa/runtime/cases/weston.py
@@ -29,7 +29,7 @@ class WestonTest(OERuntimeTestCase):
         return output.split(" ")
 
     def get_weston_command(self, cmd):
-        return 'export XDG_RUNTIME_DIR=/run/user/`id -u weston`; export WAYLAND_DISPLAY=wayland-1; %s' % cmd
+        return 'export XDG_RUNTIME_DIR=/run/user/`id -u user`; export WAYLAND_DISPLAY=wayland-1; %s' % cmd
 
     def run_weston_init(self):
         if 'systemd' in self.tc.td['VIRTUAL-RUNTIME_init_manager']:
diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index 29cfba083370..2f21582a8e0d 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -16,6 +16,8 @@ SRC_URI = "file://init \
 
 S = "${UNPACKDIR}"
 
+PR = "r1"
+
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xwayland', '', d)}"
 PACKAGECONFIG:append:qemuriscv64 = " use-pixman"
 PACKAGECONFIG:append:qemuppc64 = " use-pixman"
@@ -26,8 +28,8 @@ PACKAGECONFIG[use-pixman] = ",,"
 
 DEFAULTBACKEND ??= ""
 DEFAULTBACKEND:qemuall ?= "drm"
-WESTON_USER ??= "weston"
-WESTON_USER_HOME ??= "/home/${WESTON_USER}"
+WESTON_USER = "${STANDARD_USER_NAME}"
+WESTON_USER_HOME = "/home/${WESTON_USER}"
 
 do_install() {
 	# Install weston-start script
@@ -83,14 +85,14 @@ do_install() {
 
 INHIBIT_UPDATERCD_BBCLASS = "${@oe.utils.conditional('VIRTUAL-RUNTIME_init_manager', 'systemd', '1', '', d)}"
 
-inherit update-rc.d systemd useradd
-
-USERADD_PACKAGES = "${PN}"
+inherit update-rc.d systemd standard-user
 
 # rdepends on weston which depends on virtual/egl
 #
 require ${THISDIR}/required-distro-features.inc
 
+REQUIRED_STANDARD_USER_GROUPS = "video input render seat wayland"
+
 RDEPENDS:${PN} = "weston kbd ${@bb.utils.contains('PACKAGECONFIG', 'xwayland', 'weston-xwayland', '', d)}"
 
 INITSCRIPT_NAME = "weston"
@@ -109,5 +111,3 @@ FILES:${PN} += "\
 CONFFILES:${PN} += "${sysconfdir}/xdg/weston/weston.ini ${sysconfdir}/default/weston"
 
 SYSTEMD_SERVICE:${PN} = "weston.service weston.socket"
-USERADD_PARAM:${PN} = "--home ${WESTON_USER_HOME} --shell /bin/sh --user-group -G video,input,render,seat,wayland ${WESTON_USER}"
-GROUPADD_PARAM:${PN} = "-r wayland; -r render; -r seat"
diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb b/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
index 169269eefb34..990d2accc2e1 100644
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
+++ b/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
@@ -14,11 +14,15 @@ SRC_URI = "file://xserver-nodm \
 
 S = "${UNPACKDIR}"
 
+PR = "r1"
+
 # Since we refer to ROOTLESS_X which is normally enabled per-machine
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit update-rc.d systemd features_check
+inherit_defer ${@oe.utils.conditional('ROOTLESS_X', '1', 'standard-user', '', d)}
 
+REQUIRED_STANDARD_USER_GROUPS = "video tty audio input shutdown disk"
 REQUIRED_DISTRO_FEATURES = "x11 ${@oe.utils.conditional('ROOTLESS_X', '1', 'pam', '', d)}"
 
 PACKAGECONFIG ??= "blank"
@@ -38,8 +42,8 @@ do_install() {
     BLANK_ARGS="${@bb.utils.contains('PACKAGECONFIG', 'blank', '', '-s 0 -dpms', d)}"
     NO_CURSOR_ARG="${@bb.utils.contains('PACKAGECONFIG', 'nocursor', '-nocursor', '', d)}"
     if [ "${ROOTLESS_X}" = "1" ] ; then
-        XUSER_HOME="/home/xuser"
-        XUSER="xuser"
+        XUSER_HOME="/home/${STANDARD_USER_NAME}"
+        XUSER="${STANDARD_USER_NAME}"
         install -D capability.conf ${D}${sysconfdir}/security/capability.conf
         sed -i "s:@USER@:${XUSER}:" ${D}${sysconfdir}/security/capability.conf
     else
@@ -62,7 +66,7 @@ do_install() {
     fi
 }
 
-RDEPENDS:${PN} = "xinit ${@oe.utils.conditional('ROOTLESS_X', '1', 'xuser-account libcap libcap-bin', '', d)}"
+RDEPENDS:${PN} = "xinit ${@oe.utils.conditional('ROOTLESS_X', '1', 'libcap libcap-bin', '', d)}"
 
 INITSCRIPT_NAME = "xserver-nodm"
 INITSCRIPT_PARAMS = "start 9 5 . stop 20 0 1 2 3 6 ."
diff --git a/meta/recipes-support/user-creation/files/system-xuser.conf b/meta/recipes-support/user-creation/files/system-user.conf
similarity index 90%
rename from meta/recipes-support/user-creation/files/system-xuser.conf
rename to meta/recipes-support/user-creation/files/system-user.conf
index d42e3d1f5080..7e94a1c938f9 100644
--- a/meta/recipes-support/user-creation/files/system-xuser.conf
+++ b/meta/recipes-support/user-creation/files/system-user.conf
@@ -1,7 +1,7 @@
 <!DOCTYPE busconfig PUBLIC "-//freedesktop//DTD D-BUS Bus Configuration 1.0//EN"
  "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
 <busconfig>
-    <policy user="xuser">
+    <policy user="@STANDARD_USER_NAME@">
         <allow send_destination="net.connman"/>
         <allow send_destination="net.connman.vpn"/>
         <allow send_destination="org.ofono"/>
diff --git a/meta/recipes-support/user-creation/standard-user-account_0.1.bb b/meta/recipes-support/user-creation/standard-user-account_0.1.bb
new file mode 100644
index 000000000000..7366ac867528
--- /dev/null
+++ b/meta/recipes-support/user-creation/standard-user-account_0.1.bb
@@ -0,0 +1,51 @@
+SUMMARY = "Creates a standard user account"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+SRC_URI = "file://system-user.conf"
+
+inherit allarch useradd
+
+S = "${UNPACKDIR}"
+
+do_configure[noexec] = "1"
+do_compile[noexec] = "1"
+
+COMMON_ARGS = "--create-home --user-group"
+
+python __anonymous() {
+    common_args = d.getVar("COMMON_ARGS") or ""
+    user = d.getVar("STANDARD_USER_NAME") or ""
+    pn = d.getVar("PN") or ""
+
+    unique_groups = sorted(set((d.getVar("STANDARD_USER_GROUPS") or "").split()))
+    unique_system_groups = sorted(set((d.getVar("STANDARD_USER_SYSTEM_GROUPS") or "").split()))
+    expected_groups = sorted(set((d.getVar("STANDARD_USER_GROUPS_EXPECT") or "").split()))
+
+    if unique_groups or unique_system_groups:
+        joined_groups = ','.join(unique_groups + unique_system_groups)
+        d.setVar(f"USERADD_PARAM:{pn}", f"{common_args} --groups {joined_groups} {user}")
+
+        # make sure all the groups exist
+        groupadd_str = ""
+        for group in unique_groups:
+            if group in expected_groups:
+                continue
+            groupadd_str += f" {group} ;"
+        for group in unique_system_groups:
+            if group in expected_groups:
+                continue
+            groupadd_str += f" --system {group} ;"
+        d.setVar(f"GROUPADD_PARAM:{pn}", f"{groupadd_str}")
+}
+
+# default case, and a requirement to satisfy the parser check
+USERADD_PACKAGES = "${PN}"
+USERADD_PARAM:${PN} = "${COMMON_ARGS} ${STANDARD_USER_NAME}"
+
+do_install () {
+	install -D -m 0644 ${UNPACKDIR}/system-user.conf ${D}${datadir}/dbus-1/system.d/system-user.conf
+	sed -i -e 's|@STANDARD_USER_NAME@|${STANDARD_USER_NAME}|g' ${D}${datadir}/dbus-1/system.d/system-user.conf
+}
+
+FILES:${PN} = "${datadir}/dbus-1/system.d/system-user.conf"
diff --git a/meta/recipes-support/user-creation/xuser-account_0.1.bb b/meta/recipes-support/user-creation/xuser-account_0.1.bb
deleted file mode 100644
index 04f506e7a39f..000000000000
--- a/meta/recipes-support/user-creation/xuser-account_0.1.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-SUMMARY = "Creates an 'xuser' account used for running X11"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-
-SRC_URI = "file://system-xuser.conf"
-
-inherit allarch useradd
-
-S = "${UNPACKDIR}"
-
-do_configure() {
-    :
-}
-
-do_compile() {
-    :
-}
-
-do_install() {
-    install -D -m 0644 ${UNPACKDIR}/system-xuser.conf ${D}${sysconfdir}/dbus-1/system.d/system-xuser.conf
-}
-
-FILES:${PN} = "${sysconfdir}/dbus-1/system.d/system-xuser.conf"
-
-USERADD_PACKAGES = "${PN}"
-USERADD_PARAM:${PN} = "--create-home \
-                       --groups video,tty,audio,input,shutdown,disk \
-                       --user-group xuser"
-
-ALLOW_EMPTY:${PN} = "1"
diff --git a/scripts/sstate-sysroot-cruft.sh b/scripts/sstate-sysroot-cruft.sh
index b2002badfbe7..5e1ae9c53503 100755
--- a/scripts/sstate-sysroot-cruft.sh
+++ b/scripts/sstate-sysroot-cruft.sh
@@ -127,9 +127,9 @@ WHITELIST="${WHITELIST} \
 # generated by useradd.bbclass
 WHITELIST="${WHITELIST} \
   [^/]*/home \
-  [^/]*/home/xuser \
-  [^/]*/home/xuser/.bashrc \
-  [^/]*/home/xuser/.profile \
+  [^/]*/home/user \
+  [^/]*/home/user/.bashrc \
+  [^/]*/home/user/.profile \
   [^/]*/home/builder \
   [^/]*/home/builder/.bashrc \
   [^/]*/home/builder/.profile \
-- 
2.54.0


