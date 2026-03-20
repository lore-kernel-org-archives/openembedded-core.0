Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ACD31093180
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 07:16:01 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7243.1773990958136034183
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Mar 2026 00:15:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=iq2s/miY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7539c51d7b=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62K6UxvJ733044
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 00:15:57 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=7ap49pqxXlBy03FRuChH6EdvAfAnmcIY5R3x5iIFmTc=; b=iq2s/miYUA58
	cclc/cogHpYdOcsQ1bCVuGRcmoKrvGKRm9VYABqvDdSB6h0u8ubU56H+6HFFNISL
	UYoh1etR/M/Wh/gC7ru+EtKBlbY/IkhzCwWoub26lp8ad3Cs5IjWgBlPQLn/688W
	8p59QRX+cvhBKyZTIWg/Hh72jCQCxCo5kz2u8dydg1XPsJdFK8z4Bhb4WGiA3Ki3
	NGzP7QNFvDvzn++F6YO1JB6rONAzRaMlgoXV+X221UpdtJZy0ibViR134L9d9+As
	6T0DTOrgcH/OizDinhTl0U0eo7XCPX72nVfm4m10DqSHvJMZS8SZ1e/LiBSiq4M8
	g/F4Mo4QkQ==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010031.outbound.protection.outlook.com [52.101.56.31])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cw2y17n2p-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 00:15:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SZ4Cw71SkHMuywbHtZLBxKcBxjhbPNsoTF70ncGAjvWKx1G9xNzWHBQIOTQu9CwYbduZ4l7zEZk3qkjJf9pC62Z0PA8nVohmcJrpnCo1VZBOS1EbkXWA4TkAFGI+QBm2Bl5TXJDaynbUyqIOkTXDloSLm8FW62JhtPAm7xnA7NA77D38SmSdDScDbX+fl9BJ7gbjUDrUIEIJiguazSTIR8WPc2lxRGB3wTsQo5fi4bLSFIsBoSrGxAazQUz9pp2oPQ/s/nbuE/DCiaSmHUSM0QEV92ZLBT6WuOLQSsK4gvZQRGVRiOQ181XXWXL26hGTLbd/nhOZ2jNpfKIxr3InIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ap49pqxXlBy03FRuChH6EdvAfAnmcIY5R3x5iIFmTc=;
 b=gB8GddFleyR1Cq0v61nTw5SeBsq8FkwkHGOQySCify74Tjy/HIRvYlMqON5WWC2Zg0V6Rue7ITbzKz0MtNnELO6HxHbDp0MF9lhc64VbS7UhKM7cgfz7fmxkBUyFKL3I6ZliWdunatxP3XfJWOmOvRKwfTHWVZKuJ1XX4UHOJL722nSFSalmQmL0C2/6hSKjMHQ+yFvMPMi2yJ4y29RIinbYS5FiytekN8E119YDbuHNnyePywOb8+jPKRLkhUVYIIFCJ5HM4P7BGO0m4A37BeKxhBygsYoMRKw2mJdJx4s76M3hlHqfjzJaPjS6qtdC+xHK/8Zaaj9D/HsKv49f9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CY8PR11MB7945.namprd11.prod.outlook.com (2603:10b6:930:7b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Fri, 20 Mar
 2026 07:15:54 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9745.012; Fri, 20 Mar 2026
 07:15:54 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH V2] runqemu: fix the checking of STAGING_BINDIR_NATIVE
Date: Fri, 20 Mar 2026 00:15:48 -0700
Message-ID: <20260320071548.859091-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260319043625.3641522-1-Qi.Chen@windriver.com>
References: <20260319043625.3641522-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0058.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::33) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CY8PR11MB7945:EE_
X-MS-Office365-Filtering-Correlation-Id: 18cfdd4e-ca1d-4a5f-ae33-08de86508632
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	Baqq29QEWeXfMEMrnwQqPXCNVPVQQ4ifJHBthtOs0SvfcO2LOZ4mNUhqXiol0o9aGO2FdAXK56lkSy4SCxrxqVwL08kEYEk4fnOfFKd46UK0VgS0tC55dHNqyFVJynDhUNockukNXpCA2KWHbfI7IOGouiztGXBMuQDnumKDvwtRLf3Tkg5eCfk53dpba8BHc5LrR/9oW+C1hCjmdW9uo8eLcK8iKoLy89j5OEw+QnSaa7NcKNbQ0ifGZPvLAIR2kjeXV7gcmOS6rtawy7MM2WoJfIdO+It9isQkZjC5Ftw97tCq6CEAgC9LeUg+9nQ2VAU+ospQ0xsES2XSPMGTuRiYz3m3pV2Gu2z+lE8l5bOP+aw34nXyWhFshCGSBsEZGOK5L5t+rzXu72EqwMd0bSI/8X8PgMkgbqBUpujV3ivWanWclD37mKNeoxFWWxEKysKu2MwORf9OjfnnihoguJyUjSY4nHVlaHlbE1cvQZ554WkIWsbdpKidYCPljLRLXUzyv7M5wVuAPsxtYqmBFixrex4h7Om1kHu0Nliz1hNhmhvDvBZ2p/CYk4Cx5VlkXu09rp+f2XBRHvawpjHaVOWplMX8hWFoBYbDMIP7D1+5a1LDdRuYfyR0dK6l9FDbq9S9ZsYksvpPkn7n4ixbhNNlRHasJ5mXf311H7Kn7veLoDOAoFcMTiWHP50jWcAeMkpRTOOw8DpcF9z/xUw+oNPuTaWadx5SYbzHsH8UmPBu2oeExpVwVdjouXIOYT9etZLAKos9Viu8oJUo6GHxYNJu+0JJkNzbIU4Vrhdgn8Q=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WmfsE46Lhv4Zg+q7K28vlkZvwCp3b+GfJ2n/uSyNcgpiYC6ykZQ/wE/GSPeb?=
 =?us-ascii?Q?vTvWsX5rvh5im8t95Ohrj3lU9XSrBbe7KM+z9ZMWmN+URlO/stsg4r9sb5U3?=
 =?us-ascii?Q?EPU6zlfR7+soWiH34KiNT/ArPUP7pssGNtZ0cjzip3fiuxPLzGZBlfLN/Lrb?=
 =?us-ascii?Q?Uu3Nq0AnGVSeppTA6Esfhoiuv7qAm7FCyG8VQyn/rSsEf1dlvUInI4020nHd?=
 =?us-ascii?Q?aP6idzbNx/EwkA0kNlo3TRNkfe9OR/Q2z5Ql8BHFEm0IAmt4zg4uCr12xUUq?=
 =?us-ascii?Q?7pkBr9OOj+loxlLKp9eVSDCf9UAkEuzd6tQ+FCJYoew6SXlx/+XkC61AAWwV?=
 =?us-ascii?Q?0+kZpUbfuRv9WE820/iMgFt8h+DkSjJbjdOH1bLaulZ/2x+R3FJGkc7l0B7k?=
 =?us-ascii?Q?EHt+IxL8atgYwMkPkIuSOQcs6DuGVm2WdbRKShwwvaWu28zMK6Sl7v7fEAID?=
 =?us-ascii?Q?jxcifzdYm/LahbYPuWLaYeKUAVs1HfYCjErQ0o8sbZHOLyWlYw3K0ar7N90b?=
 =?us-ascii?Q?Krt4w3sXLq8WUwCV3pcMQp12Dfvwli3wbUS6bgLwgy9qXalx3bdhZU2CcKuN?=
 =?us-ascii?Q?hAnfsQDWgfX2ct/LGDcWNbhKsq3S3XIGY1SdL4fKP5PLFLVKibaswPYFzuFL?=
 =?us-ascii?Q?Z5lWfRJIl7XcpXCpzAPvmUVibOUPa9sTLgkmpO0pwQs7ic8sBeHTM/jA9eBW?=
 =?us-ascii?Q?99C0JHJbOx3apTWFKGkkh61jTXYn51vimoZnQ71YgR88qVi1zK66f284vS20?=
 =?us-ascii?Q?FDo6PukO2kMS019MvgnRlCP3UQbboKLvv4jSTmV0KXxeS6OUxV1h/GWMEnH6?=
 =?us-ascii?Q?kKURFVtsp8Ze7RR218jvOIBMJHPvYRa96U72ovh+7K/+f+/1V+Jh+EFCPF2A?=
 =?us-ascii?Q?LZRvgqovEvboTmt4FdTWb6rmNEfRHpquNmga2ksgaw9VFh7Kuna7GFBUBu67?=
 =?us-ascii?Q?9JYgSvL0jO49VtteGb/M1rQnhsD69gVJlJOM/X8DrlZXM34lRzME/g8BOb23?=
 =?us-ascii?Q?aOn/Sa7dX+TEoFNRlBO6yCaCFCjSsfbiB0Ptds+y9NcvHwTVXRRK8ZxQygi5?=
 =?us-ascii?Q?/MIw6IRfZIH4y2ATYrfLM2kqAsrm7LUI89ojN5PvP0eDPWevw3DGXs7Zu7yh?=
 =?us-ascii?Q?fa5lDjBcrYq8npvpN99qxaJ0V0282ezO/+7VsHyiwCnpcQY4fYzhccakazuF?=
 =?us-ascii?Q?ClxN8uGqn5yc5RO+xbySR5D0VXrd+96Y/lkcUjGGxgEvppMxDiwkwzw6hP8T?=
 =?us-ascii?Q?TdQnsYjpzU0XHlw8jBk0ivq8Ukug/uiI6rMC6G1P3BsHZf09mEMa4/6/k1vE?=
 =?us-ascii?Q?XzyU+2JW0aY20+8tUeENFB9ubH6IW0KEGEUr70ADhViirA8Y3nylMsanSskG?=
 =?us-ascii?Q?1l3pZeS0iU778wAiY4gGsrnck6Gs+Qpky0TQCVPhxcCaq9d/9NlGvOxgue5D?=
 =?us-ascii?Q?SJLUEikgqXN+8nGuFqqWccaY0IURDYfMOnt4RhqsLwk5PMPqnKDNrx9y3nbg?=
 =?us-ascii?Q?k6s59S40r8nzGdATwaL5/em+EZE+iYiaObWUepqlK1aN7fhwTkOhlzkP777S?=
 =?us-ascii?Q?vNqwD98Gz/+EVnlYb0cWjGqDuU1RtXJc8DbsN7ToVag9gZySQNIEceURIRO2?=
 =?us-ascii?Q?NxDqztnPyZ6GKdjR/HafaQfZwdg2SblCLDgzyjaTrelhbU/Ih9YaJTo3xrLV?=
 =?us-ascii?Q?bzMGtzHgn0tIRwVI/otTInzpnhDwS9qnWYR+TPBCY/v8a6GyYOj5DWFvxxjV?=
 =?us-ascii?Q?md31jKrZrg=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	SLaodcb/oLc9eUwz68WQ6dUIgzAU4H+KYiEdkk0UUXHBwn0AvzqyehbA2/JyyMXtADlT+AezLXZt55eMNGs2YZXObfshUHAky46cR361dHH4P5bnrFWbyacVy4oIJajdZ9MkMMafX08wdf2VAHWqV6WhonF12KDEInA4Qyoy4pHyKS76IPQrSAz6TAa7CElS28Dg2KcnOcPLLqSiClajgcupb+wIbptXAutS64SoIws8DxWgpr/jZpJ3vngdeZE+6zzFxNuzJ2koP4j5MQ7ejtPzGKOFMgNLKLaJObjQB7zwbpyxf3+x5vn+DF1Scl+fNMfAqIJRf/5BuMmv18qdEg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18cfdd4e-ca1d-4a5f-ae33-08de86508632
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 07:15:54.1764
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o6FkCbfUsCh0ZRR3zgtNbyG4NqboBG1xSLXbHBynonIn85kXfbEEwV2xPk/ES/8vTDVZ1MHY2KF0/nJCv8kpWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7945
X-Authority-Analysis: v=2.4 cv=CekFJbrl c=1 sm=1 tr=0 ts=69bcf42d cx=c_pps
 a=QQ0Rro+ZityDt3mHPSrFtQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=qTdl-SqEKb-V9jfSsi0A:9 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDA1MiBTYWx0ZWRfX1eYVqyPMPwUM
 raeJNtqF2LmHAJA0Qa0qaZMkRq0im5MJRVGlV43nWSn7fNdJG6LXtVHuVvsx+s1f7HLOYKbFmj6
 sSppjg6GpyyjyZqS31Ef/Qd2AMS4Qef45ohHO404rIHv9kMlrWTv5bCXVvCbbcwH5VUySFoUuBG
 +qxggEnTFAH8SHW4Y27fyqXdwnCNavihxZJ3L58fnADP1UVpFqRX1C+nhNx0BaEm009EGvy/e8b
 xDn3ePjscJu8E65w7g+9hr5LKTcEehGm16r3fFcN13kj6oTMdTRyQ4NrC31OiaYystfIzgm+Pxd
 kKPyajQ2rLqRKZ6Fiq1Q7ubCxeSRcUIQV51EXV1FvcP3p741tKbiRRbsM2SXflsB+A3YrRm4yBB
 LVikUkg+dAX0E4UI0+hsQqSt2PO92W3TaE2/Hh6SCEThk6HRyYo1oM89qTgn+6yn9DQ9pF3sXyB
 8HT3/QlFe/LiVEGa6eg==
X-Proofpoint-GUID: GwBk5apZ4m9GIDpqa0e-EI9clhfzPcJ-
X-Proofpoint-ORIG-GUID: GwBk5apZ4m9GIDpqa0e-EI9clhfzPcJ-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_04,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 adultscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603200052
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 07:16:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233581

From: Chen Qi <Qi.Chen@windriver.com>

In previous patch[1], the os.path.exists was accidently called twice.
This is incorrect.

[1] https://git.openembedded.org/openembedded-core/commit/?id=972155bbee02dd8061fee9c07a40f8e9034b9a3c

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 scripts/runqemu | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 00ff77a0ed..2c126e7f54 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1004,7 +1004,7 @@ to your build configuration.
         # If the STAGING_BINDIR_NATIVE directories from the config file don't exist
         # and we're in a sourced OE build directory try to extract the paths
         # from `bitbake -e`
-        havenative = os.path.exists(os.path.exists(self.get('STAGING_BINDIR_NATIVE')))
+        havenative = os.path.exists(self.get('STAGING_BINDIR_NATIVE'))
 
         if not havenative:
             if not self.bitbake_e:
-- 
2.49.0


