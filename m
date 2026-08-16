Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0F4FC5DF74
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 23:11:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19643.1786921887497224925
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2026 16:11:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=iDAODULM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=26887e2f0c=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67GMFT9T889035
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 16:11:26 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=/ud+6qTwHGthzRQFY/Zq22ZvMOftx95yhtndj1FM5ws=; b=
	iDAODULM8lSspbNC7SnYP1fCt8ENGo1GpfsZ7TK9o5iqxjmXkUn0UHyw6JJDT0iV
	BylUZ9d+IdRp0BjJ7mnnfFcaW/EmlHdcjl0cC2Hc/RRCkb8XTXi0OEqLFqCQjDnf
	fqIv//oujuiW+FveV5naBzck7HNSYYFOLSMa/lfYLLe+MwgoFWO4FWSC3gMFtzyL
	KNo3VH05ondqwFd7HIKrVpFWKUYtIUmcDcEAqc0WoBOo0D9AFgI2QMkrv5IDr9Q3
	+dd+BbZj0IMkWqOAc/mlxw4sYLLX+mezgU7LoRZ7Zz9RgKja8QCfr0m0kONBU1ak
	aaZQex/jdvxA2CJ2rDaKSA==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023128.outbound.protection.outlook.com [40.107.201.128])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4g2kd11k6n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 16 Aug 2026 16:11:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YwEbKu0Fg02mH2loMaEqR3Gp74+5174ywYQnw1LSIQu8gLU+mT50q4B830fWVAFMr+3GYC1rqzjaubGln9RW6CxiMhT42qefsVG1ZE1A9PmE0N8zHjDPMqUsXITVusLh+uaWAEmaoF/SAKygMeYuvsMh+iitsYJWB8ufilwaqE0WGADW6MhBbwHgI/xxezQRJBCUFnaCzfFIedmNUhfT/YyDSZ7Ocy1OXGijFbZy3oGNXRJyRJ3T1zjerfnSPwZ2/+ySS61vN1AVwdByF8KmMS1TN1R5c0Yo7XpwXMt0lu9dUDsSig6548QZyRaKyHO1/NTBw2sf0mnGMPSOWXSi/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ud+6qTwHGthzRQFY/Zq22ZvMOftx95yhtndj1FM5ws=;
 b=EvS9fGG2WmpwFasda6QXLDftd0ZzJrICa+qjHRIVjq6SNmzk6ycosWbj+CSYlBvtoLjrY3vujQ9Yq72Cn030yDwzgoek5Ecn0ZyrG9AUpsrxbV8tVhQuF3kQdTMTkcYjrcCmjaKwNiMydpRdgAnRBpnjEnixvuMQYmX/PO5rhZvmjfxUpbNlH/vzm8hWAkDcFeXEDKo2dC2ql3BE3EIoVBD31hHF45/PrkAe67nbAJ44NZM3cG1DluxVysnMuRMtMRydqLbNkDN8F9Hnd3sOxzAy3Cp7KbrlROO4fXR+thCU0R/ta29uRVR9vBoX0qsKLv/R/CZtDI9+hrORWgzN5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by IA3PR11MB9158.namprd11.prod.outlook.com (2603:10b6:208:57d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Sun, 16 Aug
 2026 23:11:24 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0315.014; Sun, 16 Aug 2026
 23:11:24 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v15 05/12] target-sdk-provides-dummy: Add pkg-config to DUMMYPROVIDES
Date: Sun, 16 Aug 2026 16:10:57 -0700
Message-ID: <20260816231104.3871015-6-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260816231104.3871015-1-sumanth.gavini@windriver.com>
References: <20260816231104.3871015-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0084.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::29) To IA3PR11MB9256.namprd11.prod.outlook.com
 (2603:10b6:208:57f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|IA3PR11MB9158:EE_
X-MS-Office365-Filtering-Correlation-Id: eb5efefa-7784-49ef-de46-08defbebb132
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|23010399003|1800799024|376014|366016|38350700014|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	A5cw/p/1JFZitH54I39yqHw8lK6ujAWU5FJhneTMeiHv/j1yqS6YW7AFDheZtD0igDNrgH+Bfzt3d6/Nv+4u0HOC3sE6BeNpYObW+F2sqTXWYMOqSO4p8qGBRxDVTH5U4GeveXHjlOIhJKh58kLZJQTOJjqxN4ufO6gRlWSieLKImoMlsD/iIrkrngPVanQAB+8nmamnTRhthPjGSGtfUlrWuIMui+dC4aBQFM+rpeswSaRVAxVenpYpkpKfPK8oHSYlGLj2nmRTA225oa3dpcBhpka+KF0zSEs7RUmYv4w0b8U6ZYGsdj4zmXuABhL0A6kndCPStWLOxxZMR0foFL/Jf7Mtsb3aYtkH+0X2jmRElqZWEstpucGDbGtZE0emq5dlkpXZNSsgEHtPr9mD+lnVd6NwYymV3p2VTfIqZdq/lg4QgTSj8c/mzImp8rlpPOVOOmxpUBVCC6yxG6pICUs2TV14aVCGoPJJSHvpndMKdubCXqedzjjV8+ugx7V7cIICRcyKNU76Y0XpABi3MmlOySUfEJyOKUlXGsWyJyed9Q10oNTKeC0AhJtnTb0aH073itb1NHi91vhZ/63iMfe0jYLfROj8x7Mk+yB2z2T8X2EeMjNpnEV6POtAsTxEl/dcy1QAYy4yJ7tntHIdssItJSjxhGyoiFWuBSBjR2NYIhtO8gCyeK8M8x31ZObuUAomefxo5v2DFS6W1w+oX/RqtlDFmK2M2tH2HHqvo5o=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(23010399003)(1800799024)(376014)(366016)(38350700014)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?f3/jb+kf7EbE/VA30CcPxClW9yCHCDb3BydigfXB97dM9FmdI2xWeblG9Fmv?=
 =?us-ascii?Q?EDZ9ec/dTDbtRA/fFUaw/NSbpzH9gOq6D1cp/+5Jc2VQcM05OUd44dKA8a+E?=
 =?us-ascii?Q?TdFTR23p+0Frk+xqL5ZURAGZ1aueBOnJ9AeGlmKn+DYr2uQDOQF8hYW2sBfK?=
 =?us-ascii?Q?tnCDfC+7K/uDAIkI4uN1J2dQfAKoEStqd/REl40x8RvDoZ8BMPlJPbFtwF48?=
 =?us-ascii?Q?H4OJ/rE6tvBXift0Hw0dmIcdaoXjgEERbCyAj20TUcH7KOhsvy/aj2hdBQ1c?=
 =?us-ascii?Q?wBabdMYLKLfsCJrNPZrbSUDk3X0eD6CHj5VNkzDaT2v7rjhGitZb9/CZnULB?=
 =?us-ascii?Q?YMGMNp4/voDKB4EcuA8Fv7QEz7Wu60GXXip3z6ZdHIoidgdcg0SJgrBk1iHw?=
 =?us-ascii?Q?nyL94pHjZyvJFBDqX7NJbub3p+sfE1ZAD9PeYmFabWVsmAwKu6tRiFvLsJ20?=
 =?us-ascii?Q?EGzQNxa01qOJNrHi2onaEzcutX+MRm/c3d+D0QkQoFQuKBXuA5yXbSAttbq2?=
 =?us-ascii?Q?bdTGvFLl8EWfmUmJO6l/Gz2/WHSO54zOvQE67l0w0/Zku30mPqs2GitaaqB/?=
 =?us-ascii?Q?yLu1ow1oBja/A56JhopdJLA0Jkaw5Tt4a75L9QpYdCkogfXYQB6UpQ1OHTBQ?=
 =?us-ascii?Q?HXlfQG1+TfWE0LpPLLvi172UxjUZNFq8xp5cJW/oCBxJYHc3D0A5kp95hqr+?=
 =?us-ascii?Q?vAe2gfhJ4T64yS5xbTnoADWkSa7dMcyapWcsLfdGAT6RewHugRstpruji3vI?=
 =?us-ascii?Q?oSEO+qtduuFzC8LUrrnS13k5BVpO5ko3G82+Ey4kuLrDhewTUPYiVlG0HuFh?=
 =?us-ascii?Q?brN4nlBODl/sTDt08t9H+fNTs5kh8xBCRaTrqBlD7trEnUBWnbPdPzdR9DM3?=
 =?us-ascii?Q?RsiPlTNx7mB/EGPKAFck60cUAmNe1NSMsbT331f1mzutnNi8xeYeltDhXmdy?=
 =?us-ascii?Q?oY6QdQj+pnSduXDIwhFhBil2vjVzzajeAckvAo/b3trYBYJ7ZnKKYNJOAq4Z?=
 =?us-ascii?Q?Eyomuh0SFybQyEOSnp6gBkR3kf+1y7zdDg/j7841KnWzR/pubWGE815LTGGV?=
 =?us-ascii?Q?DM2E4RNfVNcVzPjdwrZvqjxu1eMa8gIaTRr2ens2an+qkF5a0kWLERgVedLv?=
 =?us-ascii?Q?90I4yfQftMvDOPDMYaAVIlIjc3uEjb1Q4eLFzW3qxiGBKH08BxKzmL2ho42F?=
 =?us-ascii?Q?2OgZ2lRIvlILsfrQ8/uWc8ZqXZrntIBocieX3N0Kwxs0Bc2IuZr3y2uex53O?=
 =?us-ascii?Q?Qf28qrrbB6t0+XUuPGeuwgisReZm0MF7YIpJ0njT1TngFGNB/7ZpDAgGdNNN?=
 =?us-ascii?Q?N/3jHPLYDNwnrFAMTq1H5d3l9PZojB6LpCaRoWvatmp+p/0Q+kpE1STycUl+?=
 =?us-ascii?Q?JL7XIzW69u9qtheSMorsYq5R+HogKr2eklWKcJLcBLvSVsub+wCYCK5xMc/u?=
 =?us-ascii?Q?C2tHWiD8ZSFr/iziAUvYXoOmIQ/pIpZOb1K5H/8CGJDzqdG5nn6p90jp7qx+?=
 =?us-ascii?Q?cWUjqCvcMnjR+CDMnDcu1G00WZFi9RBsL0rwcjDInE4xB58xOONbpqef6lAR?=
 =?us-ascii?Q?PNbVWruRf2jW8R+UBrMxjGoGPm6kcHa9DjiUurEddGE1KEZRwNUl3D07oDvE?=
 =?us-ascii?Q?ewNc6aDA2An8tMDTrhki5D+bHOfu8ZlyxqY2sKhPvTKrQqfkmpMLHSPRmhyC?=
 =?us-ascii?Q?hzb9Po6a9VWgB3gb6+cCpZMp5d1arbR3tM0eKlecVA6kBrPEBgyN7diZEWkK?=
 =?us-ascii?Q?QSSdT2lB6aLfv+AtW0IZaJYoz0QnfGw=3D?=
X-Exchange-RoutingPolicyChecked: 
	sfccGzFp/NFXVow/Ktzi7w27BZwj8VLoi8wg+58CyH/GFeWOnRTnYeOO2+oHsD7Qc1GEdJRn8Tl56p1tPhRLTOS9u8hRNRKoNE+xWxqU0ftuHf0AJ4JdOETw4FXcR4ncPQJouPi7M83Gw4J6z7FVcMfoclg/uQGhJvkLg34OJaWQDlQYDeywOa0t4D6kUJ33o5k+UR+Wuoxev7XQQbS8pZZtqRhumr8OOPcjvtU4cGbZrutYhWRcYkmFa79TcKfcVWzTqUKgdfojEVMoSsfT/fPEKhmOycipbfwD9K/c+ehG8jpAQVTjPHqlC/xwpLPG1AcCiutHBe7d5+EV7quAPA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb5efefa-7784-49ef-de46-08defbebb132
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2026 23:11:24.3295
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EPIsCAUNm29DCybNx99XZV59kjdEEDtMOMk4NupYnrgxQ0txqWkrebrxUnENB1XVmbVsegld568jYclm56n9dw4gQqI1P4PYnp/HpSIg7es=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9158
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=dqfrzVg4 c=1 sm=1 tr=0 ts=6a82439e cx=c_pps
 a=oKUGrOEB3UyG4cVvJxNfUA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=lZurfIDJcIjVqGklx3sA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: nAh386BUl0GSgVC_-rTVvR5-ykf63IWZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE2MDE4OCBTYWx0ZWRfX6kS0yhqNxXeh
 rdtYtxtF/OnO+oYrbBOFxbqXUWsNAYMZHcUY7Y0b+FRLCufiTgbxNqVNBzb/6/D8qG1jVcG1Xjr
 B1zdZUqcDSCN29f9k1NqH9DhdtnUFovbAJSDZaySczp5Ry6WKI2S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE2MDE4OCBTYWx0ZWRfXyGYAhBXvrfiL
 8786RwzQf3ATQq04gDFCElVWW6dbs4JnF3TGJTSMe3v83WBEhzsIziiUU9K0DZjSPmrj61IYOAZ
 h9ONvU5j5zQC/eAQAEScd+ryT557cohieAk/2SWMfU8wbMO38SBAQDdo7IKYZm124L7cMtw8rc9
 pwUskKggphy4pZgEfjq8Ei9bQuMq8QWObqeLIIxU3cjLthaXxTyVv2Br/UvRwmHE/rvj65qWK+Q
 ELyLMSEHhmuzdaj/iIkTnHDKllBd/bS+/yr2ltVn6yZNw8J8aLHWzAG0QzHhfseUJrzh1EkNCQk
 /CHJbkKYxDk4+hH6d6AE4AMGC+54sGl9H6O/cQuwxcwwJc6xO8QM7JHhXGpRNYZiDyVKYsa/ViA
 VpCzcJtAQ/79ThgbK/RLKlFPXz6PYO97vIOk2ueHgCTfB4Ojzwnx6FrJcx1dM/P/PkFEnUHWTDY
 QAUWRbPnsJ43BG1eIkg==
X-Proofpoint-ORIG-GUID: gq2bV3qiCWQj3Z4QBLwUr1FAyU0UqoQg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608160188
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 23:11:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243571

The rpm package requires /usr/bin/pkg-config when it has .pc files.
Fixed:
1) target-sdk-provides-dummy.bb:
  - package acl-dev-2.3.2-r0.core2_64 from oe-repo requires
    /usr/bin/pkg-config, but none of the providers can be installed

2) nativesdk-sdk-provides-dummy.bb:
  - package nativesdk-wayland-dev-1.24.0-r0.x86_64_nativesdk from
    oe-repo requires /usr/bin/pkg-config, but none of the providers can be installed

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb | 1 +
 meta/recipes-core/meta/target-sdk-provides-dummy.bb    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb b/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
index 37dad54409..6075770bf0 100644
--- a/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
+++ b/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
@@ -11,6 +11,7 @@ DUMMYPROVIDES = "\
     /bin/sh \
     /bin/bash \
     /usr/bin/env \
+    /usr/bin/pkg-config \
     libGL.so()(64bit) \
     libGL.so \
 "
diff --git a/meta/recipes-core/meta/target-sdk-provides-dummy.bb b/meta/recipes-core/meta/target-sdk-provides-dummy.bb
index 65b87fd97d..ca155d0705 100644
--- a/meta/recipes-core/meta/target-sdk-provides-dummy.bb
+++ b/meta/recipes-core/meta/target-sdk-provides-dummy.bb
@@ -54,6 +54,7 @@ DUMMYPROVIDES = "\
     /bin/bash \
     /usr/bin/env \
     /usr/bin/perl \
+    /usr/bin/pkg-config \
     libperl.so.5 \
     libperl.so.5()(64bit) \
 "

