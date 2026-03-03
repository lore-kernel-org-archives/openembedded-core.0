Return-Path: <sven.kalmbach@loewensteinmedical.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0102E67A8A
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 07:43:46 +0000 (UTC)
Received: from mx08-00640e01.pphosted.com (mx08-00640e01.pphosted.com [143.55.148.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13334.1772523817473740826
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Mar 2026 23:43:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@loewensteinmedical.com header.s=pplm042024 header.b=oE4oblhe;
 spf=pass (domain: loewensteinmedical.com, ip: 143.55.148.42, mailfrom: sven.kalmbach@loewensteinmedical.com)
Received: from pps.filterd (m0376841.ppops.net [127.0.0.1])
	by mx08-00640e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6235QMNf349542
	for <openembedded-core@lists.openembedded.org>; Tue, 3 Mar 2026 08:43:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	loewensteinmedical.com; h=cc:content-transfer-encoding
	:content-type:date:from:message-id:mime-version:subject:to; s=
	pplm042024; bh=9nET7Fgur2GuonqxbrpX3xqQrdiXnJO/tzmaCCu2QhA=; b=o
	E4oblhewPbOXXuIyj+Faf4OdHDJSKsE0m86L15oWIM9VR3E+5t5UiBDw0wxS1gIx
	YFTESUHRvVTEWn3GY52PRfnC0RYbG1WpSgI2Rk9sbsEoiJ86ttHNUtRowzFl4l18
	uXjk+QE4WaQC6jQ3kqJrp2fxfusgxTyjtcU3sDayEjGKQU/9elH5juPrdnZy/Hek
	SdHQZnjabJQfbQ/V0N7AYeld03g+LWU48LhUqVsT2+Pl5wUbUfNe6WQ8Grw6Aglw
	eVI+ld+ENbXI82x/OOcPfudbOVeIIlR4D9EAxFMDe6CePEycXflW7Mvg1Gqfrlma
	Bv7CQQsCNxdXbw8xIUNDw==
Received: from am0pr02cu008.outbound.protection.outlook.com (mail-westeuropeazon11023088.outbound.protection.outlook.com [52.101.72.88])
	by mx08-00640e01.pphosted.com (PPS) with ESMTPS id 4cmcre1fp9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 08:43:35 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z9HODrgHh2/QOKQ0rsY+Q7bRH9UAOjfOdm8UVw+lPxUxbFWiYAve62FZoxXafDCrubklgvAHJV/8Qqk2+tyUuUsiziktJZTZyggaM/VQAN91Mkkw5sZmRsNh1cGk/nfn2KkggLhX9Q8UFo9oYD2WrCLdWhAzsIR8aXVfMts4BVlJHQeHJKELR/KfGX+cckSDPRfZE4Z7Z9wM2Q7nSjc33L2+Me3W1bD/cm5YP0brQAT4ZbonuZAn9x8vOy62Y0ycj2Kz2f5DVh7OtQSDq0ifNNtLoqu6YZ3PM+00NKDrSx6F+zvq+MZ2rcFkWiWFiNzbBEDeSo8ALgOfHWACBXHKFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9nET7Fgur2GuonqxbrpX3xqQrdiXnJO/tzmaCCu2QhA=;
 b=Jc4iYMC2Sak5dIbme4QePya1MVhMvLx7n4ZedR3DEzSsecTZmVsc0innQx3l5F1Y9mlxVwCpnVTs4j7teRmQp1F33faccblxtPo9jAqxHNKCy7ciVmuGxUiCeYTuPVpfw571nSd0C+ukds/TUR87cS6AdFfnUNJFcPWAJMJm6ztgDD+7+i2XEXtKvm2QjDdlqJY/RuYoZj7sArRcGC/v0qG5VXbcsBae11nhU1gFtCE57q+Ck89IwdoSmAxFvD1OC6eiw9wFITbPH62RJ/y9DRWWQfO25VUR8bYkz3ku2a7zCIDATUqTYSPJN+9Dxb/YklLe+NYIIdfo3bqXF6JIPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.93.157.195) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=loewensteinmedical.com; dmarc=pass (p=quarantine sp=quarantine
 pct=100) action=none header.from=loewensteinmedical.com; dkim=none (message
 not signed); arc=none (0)
Received: from DU2PR04CA0026.eurprd04.prod.outlook.com (2603:10a6:10:3b::31)
 by VI1PR01MB7165.eurprd01.prod.exchangelabs.com (2603:10a6:800:195::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Tue, 3 Mar
 2026 07:43:31 +0000
Received: from DB5PEPF00014B8F.eurprd02.prod.outlook.com
 (2603:10a6:10:3b:cafe::64) by DU2PR04CA0026.outlook.office365.com
 (2603:10a6:10:3b::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.21 via Frontend Transport; Tue,
 3 Mar 2026 07:43:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.93.157.195)
 smtp.mailfrom=loewensteinmedical.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=loewensteinmedical.com;
Received-SPF: Pass (protection.outlook.com: domain of loewensteinmedical.com
 designates 20.93.157.195 as permitted sender)
 receiver=protection.outlook.com; client-ip=20.93.157.195;
 helo=westeu11-emailsignatures-cloud.codetwo.com; pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 DB5PEPF00014B8F.mail.protection.outlook.com (10.167.8.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Tue, 3 Mar 2026 07:43:31 +0000
Received: from DUZPR08CU001.outbound.protection.outlook.com (40.93.64.66) by westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Tue, 03 Mar 2026 07:43:30 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=loewensteinmedical.com;
Received: from DU2PR01MB8525.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2f4::7) by DU2PR01MB8846.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2fd::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 07:43:25 +0000
Received: from DU2PR01MB8525.eurprd01.prod.exchangelabs.com
 ([fe80::14f2:586c:9b87:8b8]) by DU2PR01MB8525.eurprd01.prod.exchangelabs.com
 ([fe80::14f2:586c:9b87:8b8%4]) with mapi id 15.20.9654.020; Tue, 3 Mar 2026
 07:43:25 +0000
From: Sven Kalmbach <sven.kalmbach@loewensteinmedical.com>
To: openembedded-core@lists.openembedded.org
CC: "sven.kalmbach" <sven.kalmbach@loewensteinmedical.com>
Subject: [meta][PATCH] systemd: add nologin shell to polkitd user
Date: Tue, 3 Mar 2026 08:43:15 +0100
Message-ID: <20260303074315.48077-1-sven.kalmbach@loewensteinmedical.com>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0168.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::20) To DU2PR01MB8525.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2f4::7)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 
	DU2PR01MB8525:EE_|DU2PR01MB8846:EE_|DB5PEPF00014B8F:EE_|VI1PR01MB7165:EE_
X-MS-Office365-Filtering-Correlation-Id: aede30d8-d48c-4dc8-74af-08de78f8910d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info-Original: 
 TFhriB8AW/1AKqAg/2eYBlDKw9fg2TGftmVmIQA79PwkAu6rQuE0MqD1ZjS9ktZjYMbFW614XH21TzFYisaRu1SYOdbIdQ0UDmo57BZQ4d7IDzUslZDsGOvDrsOibRHeIwqSATeKad+d+PQwmpC9JwstnE6djUieHNwvVJdRLxp03MuumCI3/uGLmysBUWGr0tTjL4D63NFD0m6n5Lzov+Baicrsdy0/1gESKsRzjDCvRsDPK+AQZP8rzVACZtQrR1aznBEQCqju9d/YEYsFnQAPxiRfjvYj5F2kE/z/V6E9gVXIzkMemLWlLkLqZGXfncKpU8RKbME4zHD7zquqNwnpvZLDd1/bVnmolRPhcgyYVT1Nb060vNSrXL1k65eZDbP9BaSty4LVdTqGU107Nkhjrnnp78A2eNnQTlcTSt4xN9mp+qgEx5CKiPoykyiMIjyS7GTCRudrr8d/vEeq31mY0fIK7bhXcpT1N+cX+TqPZff/vniBuH2YMZO8Nx5NqvvahrkkRJjD7hNhE3heHqJRKV3c22tWzbp5koYxG33jqP2V/TEawNCS9T4oFrV849O7kRkDQtc3W9Nczx07VyqsBDP1THvGzqZoDTeSc4qGdD8g0Q2k+8+sTEcAfyvHbKsfM42IpfoUch3+/gXVWmxQPumVECmi3EFPmKC0kwOVG4omaQ9mNjfaALP4itqicnqvrAPiVxExXrjL/jOl8JqMnc2htuUx3GBPfWKOquA=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8525.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR01MB8846
X-CodeTwo-MessageID: 0151a3d5-ee8a-43f8-ae3b-c398db14db21.20260303074330@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B8F.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	2bd9fe0b-2a8d-436c-d162-08de78f88cc0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|35042699022|14060799003|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	qYYNjzI2sc4nnPLgzvqSC1VqWa+22b+e9uSo29qPYsS8vbw/k/kby5XyhRmgxwrU0ORVKDLtQz/ynqvUTKDEN/l5ULPJTBSNHUX9N7In9DiHH5Uf0CPzYC+Hv1f1OJQ+OQnDLvFIIOTtVhkqRPvibyTfCzSb5agZXNreJkAYoz/MhiHHL+hIlwJG3ZLclUherOLJvYnyZMCGQpu7SJOzDrArWQstuBXm18IB0HuXJQnUOidIJ/3lMwK90g4D0OLOE7BAGW11243EKYqGTK+asXUDbTP9bEch+qG9nUOMCqSuaZLV9OgAngWSBLnIrK4drKA+t0XbU/eHx9ZizY0Ya/LA4kzcJwVUnQcBRXVGz9YCBvocfnlFKM1QKynDVLRr0iNBoNvwAmGWE+9rHK9SyYilXO5sZd8lZQmGAwT0Xv8bLPR32DjQQYXV++tVkTrDHyTlH6QMjVwHigFpaaN56/BZON0q4qyhNvBZsMX8wFXk242xhtpbY0q3gZ1ikJqrgweErH2aqDj9UCQ407VVkOAshyDc3VPEdkUvArgEuVLPRpGqKmewGnejKg10pIQZ3a1CnzoafqGd6JhQfL57/MFxHa0L8yWVUolszslcyTbvkTZtQmx2wEJsQEoupUEpf123DOaf+gD+eIEZE6LEkfmfRGdeYR3KkCnnONGv7l5RPxcqRVcdrZtCi8gDd3KkIQHLXMpgRLYWVT0YC4u1EiZoowgVG9OW2lZosDLu/+42GdZJ8bHU5pW31vLjFezMXMBglwRjaSuqbw2crv65hcLbfF9FyUOVZcLRXWUo2QR+2JQXbqaQ3WHo/ulbsYcVAb7WgVHP5YYbVB4NIEsHSg==
X-Forefront-Antispam-Report: 
	CIP:20.93.157.195;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu11-emailsignatures-cloud.codetwo.com;PTR:westeu11-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230040)(376014)(35042699022)(14060799003)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	QjkrJkZdWF1N3ZwYcc37LCYCo0cI40QLls6Fc+BDyPdVqNI7wXy+6JJsMf9G9H7m/MJaCgvacvYjMvnKnd+6M6Xs+ZklmjW/iZrFpwT/unvql9Kk4rOgKRMhMoWu8BBjuR4Z4DRe4G2vM9oSQkTlgJCTgv80S80E22wuu+++ey3vSzsM/UlAQFgzqtMca20BV36tuTX7KdzBEgKI3gXpM/zJyQKzS7C2pFKLX9tPtTPEBZfBE+tDELig2aSM1UY6HaMaUE7O+5QLLgWASQITIWhvyEYHxbr4E17J2AWFUIDl+DgAxkOI+R07Raodxgr9m8pTITFm8Y89Ok8BD7/zZcVKNNX9jAX3cE1ua4epIKiNUO7TlbZvE+0NRwEOx28yxzPq9eUz5HsDOcMyt85O71X6pnCGDk7otREPJZFOn8ZngjNVEE8V2OtDllzRGs90
X-OriginatorOrg: loewensteinmedical.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 07:43:31.3666
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aede30d8-d48c-4dc8-74af-08de78f8910d
X-MS-Exchange-CrossTenant-Id: 4620751a-8ca3-4df9-92a7-6fb9b06279d3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=4620751a-8ca3-4df9-92a7-6fb9b06279d3;Ip=[20.93.157.195];Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B8F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR01MB7165
X-Authority-Analysis: v=2.4 cv=N4Mk1m9B c=1 sm=1 tr=0 ts=69a69127 cx=c_pps
 a=pIGp8tj/RIS55QXozgvvgQ==:117 a=468NGx6Y53H1JamArTaTuA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=447MfgfziJeggBeJePNO:22 a=vcnAYxi3yotVqAJcU5kA:22 a=pnnnEMm-AAAA:8
 a=y_xAtZZdMxpzKriSmIUA:9 a=L1VgJ4hi7dtVfwbEAIjz:22
X-Proofpoint-ORIG-GUID: DYow_K2DhA8mltTDhGD6kRNG4d4yj0k_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA1NCBTYWx0ZWRfX71oqO05tVqN4
 S0RvNh3W1OUtPiF4zQLbc4sWVupTT8Hd4wEcotDoBwMtYJbDGqyBncpmFMKKmXldNY3HTQSLrnC
 eHON7POLdkQFcLPKgyAdMnqEKjbrdDVRYHMa1SR7i4rwC1BjCjUl4mAv4mCC5fW4DimdFu4oO45
 pkHJcPyj0WxHQeupeSOhXoG+hu/+A/jaJnyHfk3kJph6ww8o19qnqB/KprOY+uXpFVBhUfbRTmT
 d+BqQr4BBWrN8sHemggzN4NpUPt162/XgyYWpn5nb2766WUXA3P3o06sm6HquB67B/R0trnkL/6
 VGNULK76UGsbiqZf3+KwQEh54gn0qfWk72vxDtUWai+oPk0q3VGr0FMhnzNVR+efTUYGKWTfTGA
 wU467Ar4zMDmWVhsUXzH7Yu0UXZ3mmPfaqAnGPxssSZViFEXKI5kJZqTW1Y+FJ+uu8n+c7Q7Hsr
 ii1vf6BkMcmwE+4TDIQ==
X-Proofpoint-GUID: DYow_K2DhA8mltTDhGD6kRNG4d4yj0k_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 spamscore=0 clxscore=1011 priorityscore=1501 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030054
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 07:43:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232264

From: "sven.kalmbach" <sven.kalmbach@loewensteinmedical.com>

Signed-off-by: sven.kalmbach <sven.kalmbach@loewensteinmedical.com>
---
 meta/recipes-core/systemd/systemd_258.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_258.1.bb b/meta/recipes-core=
/systemd/systemd_258.1.bb
index acb8af3255..1b38cc17b5 100644
--- a/meta/recipes-core/systemd/systemd_258.1.bb
+++ b/meta/recipes-core/systemd/systemd_258.1.bb
@@ -447,7 +447,7 @@ GROUPADD_PARAM:udev =3D "-r render"
 GROUPADD_PARAM:${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', 'polkit_h=
ostnamed_fallback', '-r systemd-hostname;', '', d)}"
 USERADD_PARAM:${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', 'coredump'=
, '--system -d / -M --shell /sbin/nologin systemd-coredump;', '', d)}"
 USERADD_PARAM:${PN}-networkd =3D "--system -d / -M --shell /sbin/nologin s=
ystemd-network"
-USERADD_PARAM:${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', 'polkit', =
'--system --no-create-home --user-group --home-dir ${datadir}/polkit-1 polk=
itd;', '', d)}"
+USERADD_PARAM:${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', 'polkit', =
'--system --no-create-home --user-group --shell /sbin/nologin --home-dir ${=
datadir}/polkit-1 polkitd;', '', d)}"
 USERADD_PARAM:${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', 'resolved'=
, '--system -d / -M --shell /sbin/nologin systemd-resolve;', '', d)}"
 USERADD_PARAM:${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', 'timesyncd=
', '--system -d / -M --shell /sbin/nologin systemd-timesync;', '', d)}"
 USERADD_PARAM:${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', 'oomd', '-=
-system -d / -M --shell /sbin/nologin systemd-oom;', '', d)}"

