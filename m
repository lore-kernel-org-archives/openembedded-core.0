Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E39DCD37AA
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 17:32:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1560.1778175159391063403
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2026 10:32:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=HmWQPa2y;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9587ffd4f1=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6476c09q3134176
	for <openembedded-core@lists.openembedded.org>; Thu, 7 May 2026 17:32:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=xwHh/Dz0SqsAsRdxkk7lSqpMx9ZGEyNO5Z7SPcAOKf0=; b=
	HmWQPa2yizB24H1RxoDy/lewjCH0zfzRmxAd5TakDGR0xOdI19G3NoPf2VMwerBf
	PsmXP8grFhIuk90RlOoBcpjeB8y+Mr57fYqXySdy77HPttgcieuQS3Tsp9ERdFzg
	+rxdPz6kvz1H5ABG/a0+1Mtd3yV2RAdbcbzopu+YvMwszL7N5F8/FYxDTxr02Xwl
	FvbsNpSmNHs2ezI1bfbLIEb9hAKvgR2oCBGb2GM1bc2OCjJT69gZXPurZbP1djmV
	VwuvDhtsLsE2sbDsJX3hq3RbPRODwe2BjaNrjU9Ar+A1h+OM9DGdeLDRarH3pahd
	nAnMzvmgooh9oJns9BYc3g==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011010.outbound.protection.outlook.com [40.93.194.10])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dw8pu6x72-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 07 May 2026 17:32:37 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fslfx6pWrvZmnQYm89IMZmaTGUC1h+Ssp07dTBux755siDeeTToB3Ew4iY5Yo9Fz4I7RNFwhZK5/7gM1RTJiPBSDFvzrGTnWVa53p7wDIW5KKdnsqLvj4OOcoA1KNoLcuh+lTl901DXrU6pQIYHhOaHPuSR7lWdfDz/r0MpC+jgYHEJDTfLdf+03CI5UABcL07HcLK5Jdp2XucDAiLxqr79Qgp6GS9Cky1YkvSsl3/v2Ri6XMX0XoJ799m+Mu+QmYA7YzlNbCs7pJNxOMe0GGn5bfue3ZHnEC82jnDON99IOepWGzm2wZ7uA/DOpGDNq0pINZ+BDonUqhXWCjbjFPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xwHh/Dz0SqsAsRdxkk7lSqpMx9ZGEyNO5Z7SPcAOKf0=;
 b=EsnKYdhqR/MqmGV0uhkH9g9UXFN/hD8qR8gID+ORi3zE0QOHn0r2VqQ4H6CC+SapgfW4epioTG+w/YFXVjP48bcLNo/ooFjC4Cn5I0UQQTZylRrXxYlQnN6FZ68+gUm5FmtgBw12wE5FEcauBUwiK+MIBUfT4MmI9rjbs34thXxFE30Bes5WvLtQ5+2j7Fw4cy2wLuxa2yMmwQxi8utwppJUwlWMSFGzTiCOtwNHkihHKntCGdW4Da1ipTGR/FaA5XLvfx+q71MD/oJs0Bk5+B0dosu1JYPrcaPttOP7fJVV6eiybtYZeAeN/NgRsHYpTwQt7eMzBDFnd8vB2v0+/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 DM4PR11MB6288.namprd11.prod.outlook.com (2603:10b6:8:a5::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.15; Thu, 7 May 2026 17:32:35 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%3]) with mapi id 15.20.9891.019; Thu, 7 May 2026
 17:32:35 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Randy.MacLeod@windriver.com,
        khem.raj@gmail.com
Subject: [PATCH 2/7] rxvt-unicode: backport a fix for building with gcc-16
Date: Thu,  7 May 2026 10:32:06 -0700
Message-ID: <20260507173211.672855-3-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260507173211.672855-1-Hemanth.KumarMD@windriver.com>
References: <20260507173211.672855-1-Hemanth.KumarMD@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0462.namprd03.prod.outlook.com
 (2603:10b6:408:139::17) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|DM4PR11MB6288:EE_
X-MS-Office365-Filtering-Correlation-Id: 1259c2ba-fc89-4672-cf6c-08deac5ea09a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014|13003099007|56012099003|18002099003|12006099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	/l9qpU/fQAhJ6/bGv8iCvzf9CfWUmR5sU7zV/4L4Vis/1ZkYxzeyS/hhUF/6a8mrbY7AnaWeh/rOOoPJMyFMxQR/evOgQ4S2CWkhRW9hIKm6Tfn3TPG9jdbpkv5b0x/ctHdZWVN371xw2vu8fJgffChm3M3p4+urZNUMpaRf4e/ZDR9UfdZCBmz7JeqGxYxYtSGwpPoY9ceX+vuR28XpcxM27MymeK7oDu7nho/kdMpRToLii9nztoVUEAYvwB8S6/9aE8YTKYNa+fL5xiSytDpEhHu09ICu3V6gKbC3Gl4zWHNX/MQZk3cnUdfY1jhJq9aedyMMCUXHh4z2zN+aCkZ7yIXkeL6HO3K6ZYluXIQEOJofkOqmV96FX645Hdzbgt+EzUOsuJt21MeWLc1+xhjBqGQji8MQmzRZif3yosFxISrk7ez/FPA6ocUDsVTurrbAEGzdgvjQ3eZWbwVAwTJ36CKXEokykqzJnsOquymIljuWz81OwKni2yxxKpF7IClbR7fcE78TnuDkmr2Isi6EiPtvLqB+GTBrHFlPO6QRmBOHOBHkj7aH/nFf+9h0JfvsOTmx6oRU1PxvVck86w5XG1V87RO2DKYplVrfVH0Ljsf/W8aH118f10sDSJr7Jh2CbEv8ditdXbbfE9GxClL6Dj1qFgPaIYc37zfNNnG0ScHMxTZMJrlgx1i10I7ZRpMbKHNrL4E44KSd02+QIg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014)(13003099007)(56012099003)(18002099003)(12006099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dlM6Z3iqS0fqChRzbQ4c2GTtluliTcqZ2z9rkSEVXPmoko6O7VI460ycaIq7?=
 =?us-ascii?Q?Z4G63axyw0saVWmoHJ1U9UlpsdjN2tHQSW0j9/bp2xohhCiZgkgp8VN0OUob?=
 =?us-ascii?Q?Dgvrzyhotd07aR/xuZgjEZeRqC+i4XqZqaClP7HCsgkdOwtCEurIhZuQmuw0?=
 =?us-ascii?Q?F1NvuoOL4Npwfku9eZtChjWVVWx+5hODzTbjY49AlJ+lkDf9/YnYL4ws8Pf0?=
 =?us-ascii?Q?3ChFQ6CnqXNsQD8OQD1M4EZ5+0lkrrHGOjHaNWIP1XGkEymFVjnt4zFYp0vw?=
 =?us-ascii?Q?eAEkXblrnQ01cjR4nFHF6fBkj03Ct2vy9VxVdbLYHrpVDLzsLBkuQ5exn/0q?=
 =?us-ascii?Q?Yaow0M1gN0I5E38ZMitGDeTCRhnvE4f9uPTQ2MVCiJwcDQ4vEdc/60pqJSH9?=
 =?us-ascii?Q?rPKvJyTfhZ8Mi/niEF3Ej2MbU7uHzkS+0MxdYN4vPevoY9k82znBngVcqN/c?=
 =?us-ascii?Q?lexEeOSK3bpqSdDGlfF7Z5HuXuIsEVwkTaUYkNzBc2VpNLYV4CvjYJQkgmVL?=
 =?us-ascii?Q?8IV5NcXPjjGwJfCc0+cynpubkX08u2yVuK8TSMIt4Mx+jOp4hmbvo4r4TGq8?=
 =?us-ascii?Q?RSb3xMzZcFcrGH6x9FgqiXf765AcbdZ0VXR22mCsf5kI+H2cMDtlrEW54pXH?=
 =?us-ascii?Q?kqK75ErvLRBsd31TmY2NZhivYLiBnMsQMJ7Kz0wwFXbGp3SMawvLXofvs9hh?=
 =?us-ascii?Q?6msG4FOxI3r1qycUcwoUn+7qPe35jNIjFCdNIxyUcPe/KiYIbhRKXpx8M3j9?=
 =?us-ascii?Q?9XbnqE/OibwEcht1Nsq1oZu8HmKF172twwO25rxEvQQF1qUtUFhznBcHGBCj?=
 =?us-ascii?Q?p/AgmD+tLqywc57jtCCNMi/YtqwNAechV80YbgxixZwTH+DwXj6xRgvizSxJ?=
 =?us-ascii?Q?hp6AIL9XNjW1aD0VXa+DM1U2RwAwpPqxNOZ9lvF/nxpvhHgbPBF1cd6qusOD?=
 =?us-ascii?Q?8Ith/yl/tGBxLVuWDRGwjN/2qZguIPxW9s/o4qp7e2hLnQ+280PJvYBfOcQ4?=
 =?us-ascii?Q?qKDJe08ASxBsBJwh+l7jcbUfDokGiXuq/EWQGKTrZT2RJx0sbf+k772l35tV?=
 =?us-ascii?Q?SI3E0WKJSg/gfRmTVw+w0O1MPke20n4OhNZ8yA3700rNsjWvudTXzLoDpBtF?=
 =?us-ascii?Q?AR0gE2pGOc8+uVGzNf60w72OGcRoi54BmzOcFEqrsLxPL6RoH0ALJPsbqL+T?=
 =?us-ascii?Q?+aZb215fzWvu+fjbw4XdHH/lvpk/s2oANDOj259pR4BXbBWDRsdTxQr7BlAI?=
 =?us-ascii?Q?VrceIeS+FpwpHwBc86Hq0d+eunJPitI6wjz1rrKfiu/+dSvuq+vtQnQaUFue?=
 =?us-ascii?Q?XHtKHdzTKl2QPsBaaEpak58+p6rfCCSy21dZiqOux85C5n47yVjWMg7kSh70?=
 =?us-ascii?Q?LKYfBoR6cPOuIwHBN46llrmgXEBkxeqCg3TliUE0hMDGhfk9/TFHti+tKhje?=
 =?us-ascii?Q?M0FsR4F111dFtZB/lMIgYvzAl/0ZizEFKvKvtUv/oNqEDDyXHKPP+hcWMCMs?=
 =?us-ascii?Q?xjmRbuXAAmLHdqNmhp3OrSCkgbyJkFre40+A3A+1Xs7B0jTr81tuTTEIP8Gp?=
 =?us-ascii?Q?I4vnTnHtyZLY/Kzlwf9mdby++9CtyKAG5BEu6DjLUY00Gn5BCnjfGK76W3wi?=
 =?us-ascii?Q?QQN47Jf/C/VvTQVrEEuOaIUyrDOFrCjgdKRisUf87BQGGIltH7Lnqh3FqYH7?=
 =?us-ascii?Q?+QcffrXHVrDvNYkgNJ0lPlxrExMYucP9VWuFSKizfUffHPN7lcffQiLvdXHf?=
 =?us-ascii?Q?faplZWe2dbeKazaKIZxApqInAIGXUUw=3D?=
X-Exchange-RoutingPolicyChecked: 
	EtQn/+o3iUOn5SdeQcaK1jSQJkqKRd4l7/IRO0Uzk8sTKEG9/jKK5G0DpFUO45QPlVypnsD2YsqBH3Rrv6uw2fOOpk3IyuObgMsT4l+DpCzJudaNdxU7XfBkNDj0oh1alFkGknng/5DAIZzy7obBdgziJkel8DC3vIpDPcfQs/LjZSuPV/gj9zgj14AgrsOf1C+F6qO/Lx0c8v7gZukXCR769Hv9rYGEPb9Jhlhsge7BWKbQzJINcwrWcNulkh5G6uAeD0Na6jEAm9k/C0r5yqsxv8GORmO18lk876DlV3zbqJQ58X0cBR6pi2zOYBAIBqDyCpgyKham9FDJgPQq2w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1259c2ba-fc89-4672-cf6c-08deac5ea09a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 17:32:35.5923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: poZ30/lXhHVAh3gfbTJCKeaSO4lxpymmSKU8G9SjOUBjkHOD5O3rMUtbqyBzda+j7e5KgxBAeFeHGyKdB0SXdZayON0BqtCxa46HCLCjLis=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6288
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=AdaB2XXG c=1 sm=1 tr=0 ts=69fcccb6 cx=c_pps
 a=PJn3dW4q50A9PoMJtOr6Ng==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=561Vo0wAAAAA:8
 a=t7CeM3EgAAAA:8 a=7mOBRU54AAAA:8 a=j0KEWJ7GEyusYeRizL4A:9
 a=pGV5B61SGPbAHu_EfFT_:22 a=FdTzh2GWekK77mhwV6Dw:22 a=wa9RWnbW_A1YIeRBVszw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE3NyBTYWx0ZWRfXzc9wLG170mBk
 qnkDfHoNIVAQpSg2e1NRwP/FlZOCa1uvSUMdEOYSPUwffp/HNTMOIadznpChBjfZ/2uk9PIjb52
 Ma/KnroirbW6yVcJ9VLc0emhTUCrkesugBjk/ZsbsxzjqC7wGSPo8dI+iGzpV9hhVu+Aj/MjIK7
 I0BIR71KXzogElUOISGsACmnB6dTX7ZodbsqMIortIXGh9xIp0ltqvys4zW0LYf47GXOgufufMy
 hePHwUhrODxCuSDyAZB+su/lHz42jI6Psgmac+dES2Dgd7Kh69u3JCXGKFbfrIBnKepYsNjA+Y+
 uYobpuUGH/Yvau6sm7Jihnz4PUAj/++72yK3T9B7nzT8gXJrwFdFZg+l/+/T1wsrhsFyhpclHWI
 fEcT33OJazAxzKsKWSs7rceEMFmdecJP8r/Gx/auNoUf8ljcUgsCmW9+A/sReBTcZwOQfL8IG6Z
 uz51Atn+SMgis+2+dTw==
X-Proofpoint-ORIG-GUID: 1OQkFUFMiJ8d8tUzTLaJVqnwth15Yy4u
X-Proofpoint-GUID: 0hkWSydJ29723KHm1_l35IQ7hJmOwMiR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 adultscore=0 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070177
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 17:32:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236609

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

rename lerp to avoid conflict with the non-identical function std::lerp

Upstream-Status: Submitted [https://lists.schmorp.de/pipermail/rxvt-unicode/2026q2/002707.html]

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 .../rxvt-unicode/rxvt-unicode.inc             |  3 +-
 .../0001-rxvt-unicode-fix-gcc16-c-20.patch    | 61 +++++++++++++++++++
 2 files changed, 63 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-sato/rxvt-unicode/rxvt-unicode/0001-rxvt-unicode-fix-gcc16-c-20.patch

diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc b/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
index f8c0d8ab83..80791ca511 100644
--- a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
+++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
@@ -11,7 +11,8 @@ DEPENDS = "virtual/libx11 libxt libxft gdk-pixbuf libxmu libptytty ncurses-nativ
 SRC_URI = "http://dist.schmorp.de/rxvt-unicode/Attic/rxvt-unicode-${PV}.tar.bz2 \
 	   file://xwc.patch \
 	   file://rxvt.desktop \
-	   file://rxvt.png"
+	   file://rxvt.png \
+           file://0001-rxvt-unicode-fix-gcc16-c-20.patch"
 
 inherit autotools features_check pkgconfig update-alternatives
 
diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode/0001-rxvt-unicode-fix-gcc16-c-20.patch b/meta/recipes-sato/rxvt-unicode/rxvt-unicode/0001-rxvt-unicode-fix-gcc16-c-20.patch
new file mode 100644
index 0000000000..facb574a2b
--- /dev/null
+++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode/0001-rxvt-unicode-fix-gcc16-c-20.patch
@@ -0,0 +1,61 @@
+From 4ff364c3df99b02e658ac2b3d2eec7139c494612 Mon Sep 17 00:00:00 2001
+From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
+Date: Tue, 28 Apr 2026 03:22:40 -0700
+Subject: [PATCH] rxvt-unicode: fix gcc16/c++20
+
+rename lerp to avoid conflict with the non-identical function std::lerp
+
+Upstream-Status: Submitted [https://lists.schmorp.de/pipermail/rxvt-unicode/2026q2/002707.html]
+
+Signed-off-by: Nicolas PARLANT <nicolas.parlant@parhuet.fr>
+Signed-off-by: Sam James <sam@gentoo.org>
+Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
+---
+ src/rxvttoolkit.C | 10 +++++-----
+ src/rxvtutil.h    |  2 +-
+ 2 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/src/rxvttoolkit.C b/src/rxvttoolkit.C
+index d92c5b9..343a901 100644
+--- a/src/rxvttoolkit.C
++++ b/src/rxvttoolkit.C
+@@ -834,7 +834,7 @@ rxvt_color::set (rxvt_screen *screen, const char *name)
+   // parse the nonstandard "[alphapercent]" prefix
+   if (1 <= sscanf (name, "[%hd]%n", &c.a, &skip))
+     {
+-      c.a = lerp<int, int, int> (0, rgba::MAX_CC, c.a);
++      c.a = rxlerp<int, int, int> (0, rgba::MAX_CC, c.a);
+       name += skip;
+     }
+ 
+@@ -981,10 +981,10 @@ rxvt_color::fade (rxvt_screen *screen, int percent, rxvt_color &result, const rg
+   result.set (
+     screen,
+     rgba (
+-      lerp (c.r, to.r, percent),
+-      lerp (c.g, to.g, percent),
+-      lerp (c.b, to.b, percent),
+-      lerp (c.a, to.a, percent)
++      rxlerp (c.r, to.r, percent),
++      rxlerp (c.g, to.g, percent),
++      rxlerp (c.b, to.b, percent),
++      rxlerp (c.a, to.a, percent)
+     )
+   );
+ }
+diff --git a/src/rxvtutil.h b/src/rxvtutil.h
+index d08b1bb..ec69cc1 100644
+--- a/src/rxvtutil.h
++++ b/src/rxvtutil.h
+@@ -21,7 +21,7 @@ template<typename T, typename U, typename V> static inline void clamp_it (T &v,
+ // linear interpolation
+ template<typename T, typename U, typename P>
+ static inline T
+-lerp (T a, U b, P p)
++rxlerp (T a, U b, P p)
+ {
+   return (long(a) * long(100 - p) + long(b) * long(p) + 50) / 100;
+ }
+-- 
+2.49.0
+
-- 
2.49.0


